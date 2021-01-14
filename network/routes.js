const vote = require('../components/vote/network');

const routes = (server) => {
    server.use('/elecciones', vote);
};

module.exports = routes;