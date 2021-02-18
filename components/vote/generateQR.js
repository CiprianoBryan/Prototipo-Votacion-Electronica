const fs = require('fs');
const crypted = require('../../utils/crypted');
const fetch = require('node-fetch');
const qrcode = require('qrcode');

const codUniCandidatos = ["19910102M", "19901062B"];

async function generateQr(req) {
    codUniCandidatos.forEach(dni => {
        let hash = crypted.encrypt(dni.concat(' ').concat(req.codUni));
        console.log(hash);
        let urls = [];
        qrcode.toDataURL(hash.iv.concat(' ').concat(hash.content), function(err, url) {
            urls.push(url);
            console.log(urls);
        });
    });
}

module.exports = generateQr;