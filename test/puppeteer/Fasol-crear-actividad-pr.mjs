import url from 'url';
import { createRunner } from '@puppeteer/replay';

export async function run(extension) {
    const runner = await createRunner(extension);

    await runner.runBeforeAllSteps();

    await runner.runStep({
        type: 'setViewport',
        width: 1292,
        height: 636,
        deviceScaleFactor: 1,
        isMobile: false,
        hasTouch: false,
        isLandscape: false
    });
    await runner.runStep({
        type: 'navigate',
        url: 'http://nodos.pasosdejesus.org:4300/fasol/si',
        assertedEvents: [
            {
                type: 'navigation',
                url: 'http://nodos.pasosdejesus.org:4300/fasol/si',
                title: 'SISFASOL 2.2.0.beta1'
            }
        ]
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Iniciar Sesión'
            ],
            [
                '#navbarSupportedContent > ul.navbar-nav.ms-auto > li:nth-child(2) > a'
            ],
            [
                'xpath///*[@id="navbarSupportedContent"]/ul[2]/li[2]/a'
            ],
            [
                'text/Iniciar Sesión'
            ]
        ],
        offsetY: 23,
        offsetX: 52.421875,
    });
    await runner.runStep({
        type: 'change',
        value: 'sivel2',
        selectors: [
            [
                'aria/Usuario'
            ],
            [
                '#usuario_nusuario'
            ],
            [
                'xpath///*[@id="usuario_nusuario"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Tab'
    });
    await runner.runStep({
        type: 'keyUp',
        key: 'Tab',
        target: 'main'
    });
    await runner.runStep({
        type: 'change',
        value: 'sivel2',
        selectors: [
            [
                'aria/Clave'
            ],
            [
                '#usuario_password'
            ],
            [
                'xpath///*[@id="usuario_password"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Enter',
        assertedEvents: [
            {
                type: 'navigation',
                url: 'http://nodos.pasosdejesus.org:4300/fasol/si',
                title: 'SISFASOL 2.2.0.beta1'
            }
        ]
    });
    await runner.runStep({
        type: 'keyUp',
        key: 'Enter',
        target: 'main'
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Proyectos y Actividades'
            ],
            [
                '#navbarDropdownProyectos_y_Actividades'
            ],
            [
                'xpath///*[@id="navbarDropdownProyectos_y_Actividades"]'
            ],
            [
                'text/Proyectos y Actividades'
            ]
        ],
        offsetY: 26,
        offsetX: 61.171875,
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Actividades'
            ],
            [
                '#navbarSupportedContent > ul.navbar-nav.me-auto > li:nth-child(3) > ul > li:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="navbarSupportedContent"]/ul[1]/li[3]/ul/li[1]/a'
            ]
        ],
        offsetY: 15,
        offsetX: 56.171875,
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                '#div_contenido > form > div:nth-child(1) > div:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="div_contenido"]/form/div[1]/div[1]/a'
            ]
        ],
        offsetY: 22,
        offsetX: 37.5,
        assertedEvents: [
            {
                type: 'navigation',
                url: 'http://nodos.pasosdejesus.org:4300/fasol/si/actividades/123/edita',
                title: ''
            }
        ]
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ],
        offsetY: 27,
        offsetX: 139.5,
    });
    await runner.runStep({
        type: 'change',
        value: 'nombre',
        selectors: [
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Tab'
    });
    await runner.runStep({
        type: 'keyUp',
        key: 'Tab',
        target: 'main'
    });
    await runner.runStep({
        type: 'change',
        value: 'lugar',
        selectors: [
            [
                'aria/Lugar'
            ],
            [
                '#actividad_lugar'
            ],
            [
                'xpath///*[@id="actividad_lugar"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Tab'
    });
    await runner.runStep({
        type: 'keyUp',
        key: 'Tab',
        target: 'main'
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > ul > li > input'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/ul/li/input'
            ]
        ],
        offsetY: 6.171875,
        offsetX: 93.734375,
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > div > ul > li.active-result.highlighted'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/div/ul/li[1]'
            ]
        ],
        offsetY: 23.171875,
        offsetX: 94.734375,
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ],
        offsetY: 45.171875,
        offsetX: 260.5,
    });
    await runner.runStep({
        type: 'change',
        value: 'objetivo',
        selectors: [
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Tab'
    });
    await runner.runStep({
        type: 'keyUp',
        key: 'Tab',
        target: 'main'
    });
    await runner.runStep({
        type: 'change',
        value: 'resultado',
        selectors: [
            [
                'aria/Resultado'
            ],
            [
                '#actividad_resultado'
            ],
            [
                'xpath///*[@id="actividad_resultado"]'
            ]
        ],
        target: 'main'
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Actualizar'
            ],
            [
                '#edit_actividad_123 > div.form-actions > input'
            ],
            [
                'xpath///*[@id="edit_actividad_123"]/div[13]/input'
            ],
            [
                'text/Actualizar'
            ]
        ],
        offsetY: 18.171875,
        offsetX: 42.5,
        assertedEvents: [
            {
                type: 'navigation',
                url: 'http://nodos.pasosdejesus.org:4300/fasol/si/actividades/123',
                title: ''
            }
        ]
    });
    await runner.runStep({
        type: 'click',
        target: 'main',
        selectors: [
            [
                'aria/Salir sivel2'
            ],
            [
                '#navbarSupportedContent > ul.navbar-nav.ms-auto > li:nth-child(3) > a'
            ],
            [
                'xpath///*[@id="navbarSupportedContent"]/ul[2]/li[3]/a'
            ],
            [
                'text/Salir sivel2'
            ]
        ],
        offsetY: 15,
        offsetX: 48.4375,
    });
    await runner.runStep({
        type: 'keyDown',
        target: 'main',
        key: 'Alt'
    });

    await runner.runAfterAllSteps();
}

if (process && import.meta.url === url.pathToFileURL(process.argv[1]).href) {
    run()
}
