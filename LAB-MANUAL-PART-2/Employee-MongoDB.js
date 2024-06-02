// 1. Display all the documents in the collection Employee.
db.Employee.find();

// 2. Display the fields EID, Name, Gender, and salary for all the documents in the collection employee.
db.Employee.find({}, { EID: 1, EName: 1, Gender: 1, Salary: 1 });

// 3. Display the fields EID, Name, Gender, and City, but exclude the field _id for all the documents in the collection employee.
db.Employee.find({}, { _id: 0, EID: 1, EName: 1, Gender: 1, City: 1 });

// 4. Display the fields salary, but exclude the field _id for all the documents in the collection employee.
db.Employee.find({}, { _id: 0, Salary: 1 });

// 5. Display all the Employees which are in the city London.
db.Employee.find({ City: "London" });

// 6. Display the first 5 EID which are in the city Sydney.
db.Employee.find({ City: "Sydney" }, { EID: 1 }).limit(5);

// 7. Display the next 2 Employees after skipping the first 2 which are in the city New York.
db.Employee.find({ City: "New York" }).skip(2).limit(2);

// 8. Display the count of documents in your collection.
db.Employee.count();

// 9. Display the sum of salary in your collection.
db.Employee.aggregate([{ $group: { _id: null, totalSalary: { $sum: "$Salary" } } }]);

// 10. Display the documents whose employee name starts with S or M in your collection.
db.Employee.find({ EName: /^S|^M/ });

// 11. Find the employee Id, name, city, and salary for those employees which contain ‘Phi’ as the first three letters of their name.
db.Employee.find({ EName: /^Phi/ }, { EID: 1, EName: 1, City: 1, Salary: 1 });

// 12. Find the employee Id, name, city, and gender for those employees which contain ‘ael’ as the last three letters of their name.
db.Employee.find({ EName: /ael$/ }, { EID: 1, EName: 1, City: 1, Gender: 1 });

// 13. Find the name, joining date, and city for those restaurants which contain ‘dne’ as three letters somewhere in their city name.
db.Employee.find({ City: /dne/ }, { EName: 1, JoiningDate: 1, City: 1 });

// 14. Find the employee Id, name, city, and joining date for those employees which do not belong to the city London or Sydney.
db.Employee.find({ City: { $nin: ["London", "Sydney"] } }, { EID: 1, EName: 1, City: 1, JoiningDate: 1 });

// 15. Find the name and city for those employees whose salary is more than 10000.
db.Employee.find({ Salary: { $gt: 10000 } }, { EName: 1, City: 1 });

// 16. Arrange the name of the employees in ascending order along with all the columns.
db.Employee.find().sort({ EName: 1 });

// 17. Arrange the city of the employees in descending order along with all the columns.
db.Employee.find().sort({ City: -1 });

// 18. Arrange the name of the employees in ascending order and the city should be in descending order.
db.Employee.find().sort({ EName: 1, City: -1 });

// 19. Display city wise sum of salary from employee collection.
db.Employee.aggregate([{ $group: { _id: "$City", totalSalary: { $sum: "$Salary" } } }]);

// 20. Delete the document whose city name is London.
db.Employee.deleteOne({ City: "London" });
