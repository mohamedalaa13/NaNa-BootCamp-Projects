var express = require('express');
const pino = require('pino');

var app = express();

// pino constructor takes config object as param
const logger = pino({ level: 'info' });

logger.info('hello world');
logger.info('hello elastic');
logger.info('This is some great logging');
logger.info('Some new entries in my-index');
logger.info('another line');
logger.info('index management');
logger.info('Update your Elasticsearch indices');
logger.info('you should see all these in Kibana');

app.listen(3000, function () {
    logger.info("app listening on port 3000!");
});
