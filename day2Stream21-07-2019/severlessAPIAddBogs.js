const escape = require('escape-html');
const mysql = require('mysql');

const connectionName =
  process.env.INSTANCE_CONNECTION_NAME || 'boglogger:asia-northeast1:boglogger-prod';
const dbUser = process.env.SQL_USER || 'addBogs';
const dbPassword = process.env.SQL_PASSWORD || '********';
const dbName = process.env.SQL_NAME || 'bog_logger';

const mysqlConfig = {
  connectionLimit: 1,
  user: dbUser,
  password: dbPassword,
  database: dbName,
};
if (process.env.NODE_ENV === 'production') {
  mysqlConfig.socketPath = `/cloudsql/${connectionName}`;
}

let mysqlPool;

exports.addBog = (req, res) => {
  let device_id;
  let type;

  if (!mysqlPool) {
    mysqlPool = mysql.createPool(mysqlConfig);
  }

  switch (req.get('content-type')) {
    // '{"device_id":"123", "type": 2}'
    case 'application/json':
      device_id = req.body.device_id;
      type = req.body.type;
      break;
  }

  res.status(200).send(`BogLogged ${escape(device_id || '123')}!`);
    mysqlPool.query(`INSERT INTO bogs_logged(time, device_uuid, type) VALUES(NOW(), "${escape(device_id)}", ${escape(type)})`, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send(err);
    } else {
      res.send(JSON.stringify(results));
    }
  });

};
