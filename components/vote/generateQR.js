const fs = require('fs');
const crypted = require('../../utils/crypted');
const fetch = require('node-fetch');
const qrcode = require('qrcode');

const dniCandidatos = ["07768359", "02754399", "02458710"];

async function generateQr(req) {
    dniCandidatos.forEach(dni => {
        let hash = crypted.encrypt(dni.concat(' ').concat(req.dni));
        console.log(hash);
        let urls = [];
        qrcode.toDataURL(hash.iv.concat(' ').concat(hash.content), function(err, url) {
            urls.push(url);
            console.log(urls);
        });
    });
}

module.exports = generateQr;