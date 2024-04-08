# frozen_string_literal: true

class Ability < Cor1440Gen::Ability

  ROLES_CA = [
    'Administrar casos. ' +
    'Administrar actividades y proyectos. ' +
    'Administrar usuarios. ' +
    'Administrar documentos en nube. ' +
    'Administrar tablas básicas. ', #ROLADMIN
    '.',
    'Lo mismo que el administrador. ', #ROLDIR
    '.',
    'Crear actividades, editar y borrar las que cree. ' +
    'Si es del grupo Analista de caso administrar casos. ' +
    'Administrar documentos en nube', #ROLOP
    '.',
    '.'
  ]


  GRUPO_DESAPARICION_CASOS = 25
  BASICAS_PROPIAS = [
    ['', 'cargoestado'],
    ['', 'regionpago'],
    ['', 'tipoaliado'],
  ]

  def tablasbasicas
    r = (Msip::Ability::BASICAS_PROPIAS -
         [["Msip", "oficina"]]
        ) +
      Heb412Gen::Ability::BASICAS_PROPIAS +
      Sivel2Gen::Ability::BASICAS_PROPIAS - [
        ["Sivel2Gen", "actividadoficio"],
        ["Sivel2Gen", "escolaridad"],
        ["Sivel2Gen", "estadocivil"],
        ["Sivel2Gen", "maternidad"],
      ] + Cor1440Gen::Ability::BASICAS_PROPIAS - [
        ["Cor1440Gen", "actividadarea"],
        ["Cor1440Gen", "proyecto"],
      ] +
      BASICAS_PROPIAS

    r
  end

  BASICAS_ID_NOAUTO = []

  def basicas_id_noauto
    Msip::Ability::BASICAS_ID_NOAUTO +
      Heb412Gen::Ability::BASICAS_ID_NOAUTO +
      Cor1440Gen::Ability::BASICAS_ID_NOAUTO +
      Sivel2Gen::Ability::BASICAS_ID_NOAUTO +
      BASICAS_ID_NOAUTO
  end

  NOBASICAS_INDSEQID = [
    ["cor1440_gen", "asistencia_opcioncaracterizacion"],
  ]

  def nobasicas_indice_seq_con_id
    Msip::Ability::NOBASICAS_INDSEQID +
      Mr519Gen::Ability::NOBASICAS_INDSEQID +
      Heb412Gen::Ability::NOBASICAS_INDSEQID +
      Cor1440Gen::Ability::NOBASICAS_INDSEQID +
      Sivel2Gen::Ability::NOBASICAS_INDSEQID +
      NOBASICAS_INDSEQID
  end

  BASICAS_PRIO = []

  def tablasbasicas_prio
    Msip::Ability::BASICAS_PRIO +
      Heb412Gen::Ability::BASICAS_PRIO +
      Sivel2Gen::Ability::BASICAS_PRIO +
      Cor1440Gen::Ability::BASICAS_PRIO +
      BASICAS_PRIO
  end

  CAMPOS_PLANTILLAS_PROPIAS = {
    "Persona" => {
      campos: [
        "actualizado_en",
        "apellidos",
        "anioactual",
        "anionac",
        "aporte_enero_anioactual",
        "aporte_febrero_anioactual",
        "aporte_marzo_anioactual",
        "aporte_abril_anioactual",
        "aporte_mayo_anioactual",
        "aporte_junio_anioactual",
        "aporte_julio_anioactual",
        "aporte_agosto_anioactual",
        "aporte_septiembre_anioactual",
        "aporte_octubre_anioactual",
        "aporte_noviembre_anioactual",
        "aporte_diciembre_anioactual",
        "aporte_total_anioactual",
        "centro_poblado",
        "creado_en",
        "departamento",
        "dianac",
        "fechaactual",
        "fechanac_localizada",
        "fechanac",
        "id",
        "mesnac",
        "municipio",
        "nacionalde",
        "numerodocumento",
        "nombres",
        "nombres_y_apellidos",
        "pais",
        "sexo",
        "tdoc",
        "tdocumento",
      ],
      controlador: "Msip::PersonasController",
      ruta: "/personas",
    }
  }

  def campos_plantillas
    c=Heb412Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.clone
      .merge(Cor1440Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.clone)
      .merge(Sivel2Gen::Ability::CAMPOS_PLANTILLAS_PROPIAS.clone)
      .merge(CAMPOS_PLANTILLAS_PROPIAS.clone)
    return c
  end

  # Establece autorizaciones con CanCanCan
  def initialize(usuario = nil)
    Sivel2Gen::Ability.initialize_sivel2_gen(self, usuario)
    Cor1440Gen::Ability.initialize_cor1440_gen(self, usuario)

    can(:contar, Sivel2Gen::Caso)
    can(:numcasos, Sivel2Gen::Caso)
    can(
      [
        :fasol_banco,
        :fasol_banco_regionales,
        :fasol_banco_detalle,
        :fasol_banco_detreg,
      ],
      Sivel2Gen::Caso,
    )

    if usuario && usuario.rol
      can([:read, :update], Mr519Gen::Encuestausuario)
      can([:read], Msip::Homonimo)
      can :manage, Sivel2Gen::Acto
      can :manage, ::Aporte
      can :read, ::Consaportante

      if usuario && usuario.grupo.pluck(:id).include?(
        GRUPO_DESAPARICION_CASOS,
      )
        can(:pestanadesaparicion, Sivel2Gen::Caso)
        cannot(:solocambiaretiquetas, Sivel2Gen::Caso)
      end
      case usuario.rol
      when Ability::ROLADMIN
        can(:manage, Mr519Gen::Encuestausuario)
        can(:manage, Msip::Homonimo)
      end
    end
  end
end
