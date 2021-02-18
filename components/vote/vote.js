const QRReader = require('qrcode-reader');
const jimp = require('jimp');
const crypted = require('../../utils/crypted');

async function run() {
    const img = await jimp.read('./elecciones/public/img/qr/default.png');
    const qr = new QRReader();
    const value = await new Promise((resolve, reject) => {
        qr.callback = (err, v) => err != null ? reject(err) : resolve(v);
        qr.decode(img.bitmap);
    });
    hashs = value.result.split('\n');
    decrypted = crypted.decrypt({
        iv: hashs[0],
        content: hashs[1]
    }).split(' ');
    console.log({
        codUniCandidato: decrypted[0],
        codUniVotante: decrypted[1]
    });
}

function vote(input) {
    run().catch(error => console.error(error.stack));
}

module.exports = vote;