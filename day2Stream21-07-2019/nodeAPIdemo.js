const mysql = require('mysql');

/**
 * TODO(developer): specify SQL connection details
 */
const connectionName =
  process.env.INSTANCE_CONNECTION_NAME || 'boglogger:australia-southeast1:boglogger2';
const dbUser = process.env.SQL_USER || 'DEMOUSER';
const dbPassword = process.env.SQL_PASSWORD || 'DEMOPASSWORD';
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

// Connection pools reuse connections between invocations,
// and handle dropped or expired connections automatically.
let mysqlPool;

exports.logBog = (req, res) => {
  // Initialize the pool lazily, in case SQL access isn't needed for this
  // GCF instance. Doing so minimizes the number of active SQL connections,
  // which helps keep your GCF instances under SQL connection limits.
  if (!mysqlPool) {
    mysqlPool = mysql.createPool(mysqlConfig);
  }

  mysqlPool.query('SELECT NOW() AS now', (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send(err);
    } else {
      res.send(JSON.stringify(results));
    }
  });
  
    mysqlPool.query('INSERT INTO bogs_logged(time, device_uuid, type, amount, floater) VALUES(NOW(), "e5c15033-42b3-487d-b6c8-17a1b592e9bd", 2, "S", TRUE)', (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send(err);
    } else {
      res.send(JSON.stringify(results));
    }
  });

  // Close any SQL resources that were declared inside this function.
  // Keep any declared in global scope (e.g. mysqlPool) for later reuse.
};

