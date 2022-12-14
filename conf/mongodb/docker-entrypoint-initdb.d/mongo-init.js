

db = new Mongo().getDB("testDb");

db.createUser({
    user: 'test_user',
    pwd: 'test1234',
    roles: [{ role: 'readWrite', db: 'testDb' }],
});

db.createCollection('tickets');
db.tickets.createIndex({ "id": 1 }, { unique: true });

db.tickets.insert({ "price": 10, "description": "1-Day ticket", "id": "1D" });
db.tickets.insert({ "price": 20, "description": "2-Day ticket", "id": "2D" });


// JUNGTO_LOG DATA DB
db = new Mongo().getDB("JungtoLogData");

db.createUser({
    user: 'jungto_log_user',
    pwd: 'jungto2389e[233wp',
    roles: [{ role: 'readWrite', db: 'JungtoData' }],
});

// db.createCollection('JungtoUser');
//
