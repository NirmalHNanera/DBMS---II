// Create Database with Name: BANK_INFO (MongoDB doesn't require explicit database creation)
// Insert data into the collection
db.Deposite.insertMany([
    { ACTNO: 101, CNAME: "ANIL", BNAME: "VRCE", AMOUNT: 1000.00, ADATE: "1-3-95" },
    { ACTNO: 102, CNAME: "SUNIL", BNAME: "AJNI", AMOUNT: 5000.00, ADATE: "4-1-96" },
    { ACTNO: 103, CNAME: "MEHUL", BNAME: "KAROLBAGH", AMOUNT: 3500.00, ADATE: "17-11-95" },
    { ACTNO: 104, CNAME: "MADHURI", BNAME: "CHANDI", AMOUNT: 1200.00, ADATE: "17-12-95" },
    { ACTNO: 105, CNAME: "PRMOD", BNAME: "M.G. ROAD", AMOUNT: 3000.00, ADATE: "27-3-96" },
    { ACTNO: 106, CNAME: "SANDIP", BNAME: "ANDHERI", AMOUNT: 2000.00, ADATE: "31-3-96" },
    { ACTNO: 107, CNAME: "SHIVANI", BNAME: "VIRAR", AMOUNT: 1000.00, ADATE: "5-9-95" },
    { ACTNO: 108, CNAME: "KRANTI", BNAME: "NEHRU PLACE", AMOUNT: 5000.00, ADATE: "2-7-95" }
]);

// Perform the queries:
// 1. Retrieve/Display every document of your collection.
db.Deposite.find();

// 2. Retrieve/Display every document of your collection. (Use option pretty)
db.Deposite.find().pretty();

// 3. Display only one document of your collection. (Use findOne)
db.Deposite.findOne();

// 4. Display documents whose Account Number is 101.
db.Deposite.find({ ACTNO: 101 });

// 5. Display documents whose Account Number is less than 103.
db.Deposite.find({ ACTNO: { $lt: 103 } });

// 6. Display documents whose Account Number is greater than 102 and Customer Name is Arjun.
db.Deposite.find({ ACTNO: { $gt: 102 }, CNAME: "Arjun" });

// 7. Display documents whose Account Number is 105 or 108 using IN.
db.Deposite.find({ ACTNO: { $in: [105, 108] } });

// 8. Display documents whose Account Number is not greater than 105.
db.Deposite.find({ ACTNO: { $not: { $gt: 105 } } });

// 9. Display documents with CNAME, CCITY, BNAME, and AMOUNT fields.
db.Deposite.find({}, { CNAME: 1, CCITY: 1, BNAME: 1, AMOUNT: 1 });

// 10. Display Nagpur city branch’s documents with CNAME, CCITY, BNAME, and AMOUNT fields.
db.Deposite.find({ "BNAME": "NAGPUR" }, { CNAME: 1, CCITY: 1, BNAME: 1, AMOUNT: 1 });

// 11. Display every document of your collection on ascending order by CNAME and descending order by AMOUNT.
db.Deposite.find().sort({ CNAME: 1, AMOUNT: -1 });

// 12. Display only two documents of your collection. (Use LIMIT | Use Customer Collection)
db.Customer.find().limit(2);

// 13. Display from 3rd document of your collection. (Use SKIP | Use Borrow Collection)
db.Borrow.find().skip(2);

// 14. Display the count of documents in your collection. (Use Deposite Collection)
db.Deposite.count();

// 15. Display the documents whose name starts with S in your collection.
db.Deposite.find({ CNAME: /^S/ });

// 16. Display the documents whose name starts with S or M in your collection.
db.Deposite.find({ CNAME: { $in: [/^S/, /^M/] } });

// 17. Display the documents whose name starts with A and having 5 characters in your collection.
db.Deposite.find({ CNAME: /^A.{4}$/ });

// 18. Display the documents whose name starts with A to M in your collection.
db.Deposite.find({ CNAME: { $gte: "A", $lte: "M" } });

// 19. Display the sum of amount in your collection. (Use Deposite Collection)
db.Deposite.aggregate([{ $group: { _id: null, totalAmount: { $sum: "$AMOUNT" } } }]);

// 20. Display branch wise sum of amount in your collection. (Use Deposite Collection)
db.Deposite.aggregate([{ $group: { _id: "$BNAME", totalAmount: { $sum: "$AMOUNT" } } }]);

// 21. Update name of Anil to Arjun and also Branch Name to “DPS”.
db.Deposite.updateMany({ CNAME: "ANIL" }, { $set: { CNAME: "ARJUN", BNAME: "DPS" } });

// 22. Delete the document whose Branch Name is DPS.
db.Deposite.deleteOne({ BNAME: "DPS" });

// 23. Drop BANK_INFO database. (Dropping database in MongoDB)
db.dropDatabase();
