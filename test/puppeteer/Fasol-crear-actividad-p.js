const puppeteer = require('puppeteer'); // v13.0.0 or later

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    const timeout = 5000;
    page.setDefaultTimeout(timeout);

    {
        const targetPage = page;
        await targetPage.setViewport({
            width: 1292,
            height: 636
        })
    }
    {
        const targetPage = page;
        const promises = [];
        promises.push(targetPage.waitForNavigation());
        await targetPage.goto('http://nodos.pasosdejesus.org:4300/fasol/si');
        await Promise.all(promises);
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
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
        ], targetPage, timeout);
        const element = await waitForSelectors([
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
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 52.421875,
            y: 23,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Usuario'
            ],
            [
                '#usuario_nusuario'
            ],
            [
                'xpath///*[@id="usuario_nusuario"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Usuario'
            ],
            [
                '#usuario_nusuario'
            ],
            [
                'xpath///*[@id="usuario_nusuario"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'sivel2')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'sivel2');
        } else {
          await changeElementValue(element, 'sivel2');
        }
    }
    {
        const targetPage = page;
        await targetPage.keyboard.down('Tab');
    }
    {
        const targetPage = page;
        await targetPage.keyboard.up('Tab');
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Clave'
            ],
            [
                '#usuario_password'
            ],
            [
                'xpath///*[@id="usuario_password"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Clave'
            ],
            [
                '#usuario_password'
            ],
            [
                'xpath///*[@id="usuario_password"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'sivel2')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'sivel2');
        } else {
          await changeElementValue(element, 'sivel2');
        }
    }
    {
        const targetPage = page;
        const promises = [];
        promises.push(targetPage.waitForNavigation());
        await targetPage.keyboard.down('Enter');
        await Promise.all(promises);
    }
    {
        const targetPage = page;
        await targetPage.keyboard.up('Enter');
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
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
        ], targetPage, timeout);
        const element = await waitForSelectors([
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
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 61.171875,
            y: 26,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Actividades'
            ],
            [
                '#navbarSupportedContent > ul.navbar-nav.me-auto > li:nth-child(3) > ul > li:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="navbarSupportedContent"]/ul[1]/li[3]/ul/li[1]/a'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Actividades'
            ],
            [
                '#navbarSupportedContent > ul.navbar-nav.me-auto > li:nth-child(3) > ul > li:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="navbarSupportedContent"]/ul[1]/li[3]/ul/li[1]/a'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 56.171875,
            y: 15,
          },
        });
    }
    {
        const targetPage = page;
        const promises = [];
        promises.push(targetPage.waitForNavigation());
        await scrollIntoViewIfNeeded([
            [
                '#div_contenido > form > div:nth-child(1) > div:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="div_contenido"]/form/div[1]/div[1]/a'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                '#div_contenido > form > div:nth-child(1) > div:nth-child(1) > a'
            ],
            [
                'xpath///*[@id="div_contenido"]/form/div[1]/div[1]/a'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 37.5,
            y: 22,
          },
        });
        await Promise.all(promises);
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 139.5,
            y: 27,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Nombre *'
            ],
            [
                '#actividad_nombre'
            ],
            [
                'xpath///*[@id="actividad_nombre"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'nombre')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'nombre');
        } else {
          await changeElementValue(element, 'nombre');
        }
    }
    {
        const targetPage = page;
        await targetPage.keyboard.down('Tab');
    }
    {
        const targetPage = page;
        await targetPage.keyboard.up('Tab');
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Lugar'
            ],
            [
                '#actividad_lugar'
            ],
            [
                'xpath///*[@id="actividad_lugar"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Lugar'
            ],
            [
                '#actividad_lugar'
            ],
            [
                'xpath///*[@id="actividad_lugar"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'lugar')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'lugar');
        } else {
          await changeElementValue(element, 'lugar');
        }
    }
    {
        const targetPage = page;
        await targetPage.keyboard.down('Tab');
    }
    {
        const targetPage = page;
        await targetPage.keyboard.up('Tab');
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > ul > li > input'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/ul/li/input'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > ul > li > input'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/ul/li/input'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 93.734375,
            y: 6.171875,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > div > ul > li.active-result.highlighted'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/div/ul/li[1]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                '#actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen > div > ul > li.active-result.highlighted'
            ],
            [
                'xpath///*[@id="actividad_actividad_proyectofinanciero_attributes_0_actividadpf_ids_chosen"]/div/ul/li[1]'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 94.734375,
            y: 23.171875,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 260.5,
            y: 45.171875,
          },
        });
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Objetivo de la actividad'
            ],
            [
                '#actividad_objetivo'
            ],
            [
                'xpath///*[@id="actividad_objetivo"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'objetivo')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'objetivo');
        } else {
          await changeElementValue(element, 'objetivo');
        }
    }
    {
        const targetPage = page;
        await targetPage.keyboard.down('Tab');
    }
    {
        const targetPage = page;
        await targetPage.keyboard.up('Tab');
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
            [
                'aria/Resultado'
            ],
            [
                '#actividad_resultado'
            ],
            [
                'xpath///*[@id="actividad_resultado"]'
            ]
        ], targetPage, timeout);
        const element = await waitForSelectors([
            [
                'aria/Resultado'
            ],
            [
                '#actividad_resultado'
            ],
            [
                'xpath///*[@id="actividad_resultado"]'
            ]
        ], targetPage, { timeout, visible: true });
        const inputType = await element.evaluate(el => el.type);
        if (inputType === 'select-one') {
          await changeSelectElement(element, 'resultado')
        } else if ([
            'textarea',
            'text',
            'url',
            'tel',
            'search',
            'password',
            'number',
            'email'
        ].includes(inputType)) {
          await typeIntoElement(element, 'resultado');
        } else {
          await changeElementValue(element, 'resultado');
        }
    }
    {
        const targetPage = page;
        const promises = [];
        promises.push(targetPage.waitForNavigation());
        await scrollIntoViewIfNeeded([
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
        ], targetPage, timeout);
        const element = await waitForSelectors([
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
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 42.5,
            y: 18.171875,
          },
        });
        await Promise.all(promises);
    }
    {
        const targetPage = page;
        await scrollIntoViewIfNeeded([
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
        ], targetPage, timeout);
        const element = await waitForSelectors([
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
        ], targetPage, { timeout, visible: true });
        await element.click({
          offset: {
            x: 48.4375,
            y: 15,
          },
        });
    }
    {
        const targetPage = page;
        await targetPage.keyboard.down('Alt');
    }

    await browser.close();

    async function waitForSelectors(selectors, frame, options) {
      for (const selector of selectors) {
        try {
          return await waitForSelector(selector, frame, options);
        } catch (err) {
          console.error(err);
        }
      }
      throw new Error('Could not find element for selectors: ' + JSON.stringify(selectors));
    }

    async function scrollIntoViewIfNeeded(selectors, frame, timeout) {
      const element = await waitForSelectors(selectors, frame, { visible: false, timeout });
      if (!element) {
        throw new Error(
          'The element could not be found.'
        );
      }
      await waitForConnected(element, timeout);
      const isInViewport = await element.isIntersectingViewport({threshold: 0});
      if (isInViewport) {
        return;
      }
      await element.evaluate(element => {
        element.scrollIntoView({
          block: 'center',
          inline: 'center',
          behavior: 'auto',
        });
      });
      await waitForInViewport(element, timeout);
    }

    async function waitForConnected(element, timeout) {
      await waitForFunction(async () => {
        return await element.getProperty('isConnected');
      }, timeout);
    }

    async function waitForInViewport(element, timeout) {
      await waitForFunction(async () => {
        return await element.isIntersectingViewport({threshold: 0});
      }, timeout);
    }

    async function waitForSelector(selector, frame, options) {
      if (!Array.isArray(selector)) {
        selector = [selector];
      }
      if (!selector.length) {
        throw new Error('Empty selector provided to waitForSelector');
      }
      let element = null;
      for (let i = 0; i < selector.length; i++) {
        const part = selector[i];
        if (element) {
          element = await element.waitForSelector(part, options);
        } else {
          element = await frame.waitForSelector(part, options);
        }
        if (!element) {
          throw new Error('Could not find element: ' + selector.join('>>'));
        }
        if (i < selector.length - 1) {
          element = (await element.evaluateHandle(el => el.shadowRoot ? el.shadowRoot : el)).asElement();
        }
      }
      if (!element) {
        throw new Error('Could not find element: ' + selector.join('|'));
      }
      return element;
    }

    async function waitForElement(step, frame, timeout) {
      const count = step.count || 1;
      const operator = step.operator || '>=';
      const comp = {
        '==': (a, b) => a === b,
        '>=': (a, b) => a >= b,
        '<=': (a, b) => a <= b,
      };
      const compFn = comp[operator];
      await waitForFunction(async () => {
        const elements = await querySelectorsAll(step.selectors, frame);
        return compFn(elements.length, count);
      }, timeout);
    }

    async function querySelectorsAll(selectors, frame) {
      for (const selector of selectors) {
        const result = await querySelectorAll(selector, frame);
        if (result.length) {
          return result;
        }
      }
      return [];
    }

    async function querySelectorAll(selector, frame) {
      if (!Array.isArray(selector)) {
        selector = [selector];
      }
      if (!selector.length) {
        throw new Error('Empty selector provided to querySelectorAll');
      }
      let elements = [];
      for (let i = 0; i < selector.length; i++) {
        const part = selector[i];
        if (i === 0) {
          elements = await frame.$$(part);
        } else {
          const tmpElements = elements;
          elements = [];
          for (const el of tmpElements) {
            elements.push(...(await el.$$(part)));
          }
        }
        if (elements.length === 0) {
          return [];
        }
        if (i < selector.length - 1) {
          const tmpElements = [];
          for (const el of elements) {
            const newEl = (await el.evaluateHandle(el => el.shadowRoot ? el.shadowRoot : el)).asElement();
            if (newEl) {
              tmpElements.push(newEl);
            }
          }
          elements = tmpElements;
        }
      }
      return elements;
    }

    async function waitForFunction(fn, timeout) {
      let isActive = true;
      const timeoutId = setTimeout(() => {
        isActive = false;
      }, timeout);
      while (isActive) {
        const result = await fn();
        if (result) {
          clearTimeout(timeoutId);
          return;
        }
        await new Promise(resolve => setTimeout(resolve, 100));
      }
      throw new Error('Timed out');
    }

    async function changeSelectElement(element, value) {
      await element.select(value);
      await element.evaluateHandle((e) => {
        e.blur();
        e.focus();
      });
    }

    async function changeElementValue(element, value) {
      await element.focus();
      await element.evaluate((input, value) => {
        input.value = value;
        input.dispatchEvent(new Event('input', { bubbles: true }));
        input.dispatchEvent(new Event('change', { bubbles: true }));
      }, value);
    }

    async function typeIntoElement(element, value) {
      const textToType = await element.evaluate((input, newValue) => {
        if (
          newValue.length <= input.value.length ||
          !newValue.startsWith(input.value)
        ) {
          input.value = '';
          return newValue;
        }
        const originalValue = input.value;
        input.value = '';
        input.value = originalValue;
        return newValue.substring(originalValue.length);
      }, value);
      await element.type(textToType);
    }
})().catch(err => {
    console.error(err);
    process.exit(1);
});
