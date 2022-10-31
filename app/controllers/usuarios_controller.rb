require 'sip/concerns/controllers/usuarios_controller'
require 'sivel2_gen/concerns/controllers/usuarios_controller'

class UsuariosController < Heb412Gen::ModelosController

  include Sip::Concerns::Controllers::UsuariosController
  include Sivel2Gen::Concerns::Controllers::UsuariosController

  def atributos_index
    [
      :id,
      :nusuario,
      :nombre,
      :fechanac,
      :sexonac,
      :tdocumento_id,
      :numerodocumento,
      :email,
      :rol,
      :sip_grupo,
      :descripcion,
      :created_at_localizada,
      :habilitado
    ]
  end

  def atributos_form
    [
      :nusuario,
      :nombre,
      :fechanac,
      :sexonac,
      :tdocumento_id,
      :numerodocumento,
      :email,
      :rol,
      :sip_grupo,
      :descripcion,
      :tema,
      :idioma,
      :encrypted_password,
      :fechacreacion_localizada,
      :fechadeshabilitacion_localizada,
      :failed_attempts,
      :unlock_token,
      :locked_at
    ]
  end

  private

  def lista_params
    lista_params_sip + [
      :fechanac,
      :sexonac,
      :tdocumento_id,
      :numerodocumento
    ]
  end

  def usuario_params
    p = params.require(:usuario).permit(lista_params)
    return p
  end


end

