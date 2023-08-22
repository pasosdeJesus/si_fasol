import puppeteer from "puppeteer-core"
import {
  changeSelectElement,
  changeElementValue,
  prepararYAutenticarDeAmbiente,
  querySelectorsAll,
  querySelectorAll,
  scrollIntoViewIfNeeded,
  typeIntoElement,
  waitForConnected,
  waitForElement,
  waitForInViewport,
  waitForSelector,
  waitForSelectors,
  waitForFunction,
} from "@pasosdeJesus/pruebas_puppeteer";

import fs from 'fs/promises'



async function preparar(timeout = 5000) {
  let sincabeza = false;
  console.log("sincabeza=", sincabeza);
  let browser = null;
  console.log("Corriendo en OpenBSD")
  browser = await puppeteer.launch({
        executablePath: '/usr/local/bin/chrome',
        defaultViewport: { width: 1240, height: 800},
        headless: sincabeza 
      });
  console.log("browser=", browser);

  const page = await browser.newPage();
  page.setDefaultTimeout(timeout);
  {
    const targetPage = page;
    await targetPage.setViewport({
      width: 1292,
      height: 636
    })
  }
  console.log("page=", page);
  return [browser, page];
}

// From
// https://stackoverflow.com/questions/46948489/puppeteer-wait-page-load-after-form-submit
async function loadUrl(page, url, timeout) {
  console.log("Cargando url=",url) 
  try {
    await page.goto(url, {
      timeout: timeout,
      waitUntil: ['load', 'domcontentloaded', 'networkidle0', 'networkidle2']
    })
  } catch (error) {
    throw new Error("url " + url + " url not loaded -> " + error)
  }
}

(async () => {

  let timeout = 1500000;
  let browser, page;
  [browser, page] = await preparar(timeout);

  let manija = await fs.open('raspa2.csv', 'w');
  let grupos = [ 
    [13491, 13500],
    [13571, 13580],
    [13751, 13760],
    [13751, 13760],
    [13861, 13870],
    [14271, 14280],
    [14331, 14340],
    [14531, 14540],
    [14591, 14600],
    [14621, 14630],
  ];

  let numgrupo = 0;
  let numreg = grupos[numgrupo][0];
  let targetPage = page;
  let datos2 = [];
  let ids1 = [];
  do {
    if (numreg > grupos[numgrupo][1]) {
      numgrupo++;
      numreg = grupos[numgrupo][0];
    }
    datos2 = [];
    console.log("numgrupo=",numgrupo,", numreg=", numreg);
    let url = "https://www.minjusticia.gov.co/programas-co/LegalApp/Paginas/Instituciones.aspx#k=#s=" + numreg + "#l=9226";
    loadUrl(targetPage, url, timeout);
    console.log("tras loadUrl");
    await new Promise(r => setTimeout(r, 2*1000));
    //await targetPage.waitFor(1*1000);
    console.log("espera 2 seg");
    /*let promises = [];
    promises.push(targetPage.waitForNavigation({waitUntil: 'networkidle2'}));
    await targetPage.goto(url);
    console.log("tras goto");
    await Promise.all(promises);
    console.log("tras await promise"); */
    const datos1 = await targetPage.waitForSelector('.px-2');//.
    console.log("datos1=", datos1);
    datos2 = await targetPage.evaluate( (sel) => {
      // Aqui no puede usarse debugger y no puede retornarse DOM
      let elementos = Array.from(document.querySelectorAll(sel));
      let registros = elementos.map(elemento => {
	let nombre = elemento.children[0].title;
	let id1 = elemento.children[0].href.split("=")[1];
	let tipo = elemento.children[1].textContent.split("Tipo de institución: ")[1].trim();
	let direccion = elemento.children[2].textContent.split("Dirección: ")[1].trim();
	let horario = elemento.children[3].textContent.split("Horario: ")[1].trim();
	return {
	  nombre: nombre, 
	  id1: id1,
	  tipo: tipo,
	  direccion: direccion,
	  horario: horario
	}
      })
      return registros;
    }, '.px-2');
    if (typeof ids1[datos2[0].id1] == 'undefined') {
      let i = 0;
      datos2.forEach((reg) => {
        let ni = numreg + i;
        manija.write(ni.toString());
        manija.write(",");
        manija.write("\"" + 
  	reg.nombre + "\",\"" +
          reg.id1 + "\",\"" +
  	reg.tipo + "\",\"" +
  	reg.direccion + "\",\"" +
  	reg.horario + "\"\n"
        );
        i++;
	ids1[reg.id1] = ni
      });
      await manija.sync();
      numreg += datos2.length; 
    } else {
      await new Promise(r => setTimeout(r, 2*1000));
      console.log("espera 2 seg más");
    }
  } while (numgrupo < grupos.length);
  manija.close();

  await browser.close();

})().catch(err => {
    console.error(err);
    process.exit(1);
});
