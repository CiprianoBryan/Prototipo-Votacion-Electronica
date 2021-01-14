const express = require('express');
const response = require('../../network/response');
const vote = require('./vote');
const generateQr = require('./generateQR');
const router = express.Router();

router.post('/vote', async (req, res) => {
    const data = await vote(req.body);
    try {
        response.success(req, res, '[response accepted]', 200)
    } catch(error) {
        response.error(req, res, error, 500, 'error');
    }
});

router.post('/generateQr', async (req, res) => {
    const data = await generateQr(req.body);
    try {
        response.success(req, res, '[response accepted]', 200);
    } catch(error) {
        response.error(req, res, error, 500, 'error');
    }
});

module.exports = router;