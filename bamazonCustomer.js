console.log("start");

//dependency for inquirer npm package
var inquirer = require("inquirer");
var mysql = require("mysql");

console.log("modules loaded successfully");

var connection = mysql.createConnection({
 host: "localhost",
 port: 3306,

 // Your username
 user: "root",

 // Your password
 password: "root",
 database: "bamazon"
});

 function queryAllProducts() {
 	connection.query("SELECT * FROM PRODUCTS", function(err, res) {
		console.log("id | product name | price | stock_quantity");
		for (var i = 0; i < res.length; i++) {
			console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].price + " | " + res[i].stock_quantity);
		}
		console.log("-----------------------------------");
		userInput();
 	});
}

function checkIfCustomerCanBuy(desiredItemID, desiredItemQuant){
	tempID = parseInt(desiredItemID);
	tempQuant = desiredItemQuant;

	connection.query("SELECT * FROM PRODUCTS WHERE item_id = ?",  [tempID], function(err, result) {

		if(result[0].stock_quantity < tempQuant){
			console.log("we dont have enough bro");
			connection.end();
		} else {
			console.log("We've got enough your purchase went through bro!");
			purchaseTotal = result[0].price * desiredItemQuant;
			newQuant = result[0].stock_quantity - desiredItemQuant;

			//display the total for their order.
			console.log("Your order total: " + purchaseTotal);

			// update new quantity
			connection.query("UPDATE PRODUCTS SET stock_quantity = ? WHERE item_id = ?", [newQuant, desiredItemID], function(err, result){
				console.log("update complete successfully!");
				connection.end();
			});
		}
	});
}

function userInput(){
	inquirer.prompt([
		 {
		   name: "product",
		   message: "Input the product ID"
		 }, {
		   name: "quantity",
		   message: "How many would you like to buy?"
		 }
		]).then(function(answers) {
			 checkIfCustomerCanBuy(answers.product, parseInt(answers.quantity));
		});
}

function mainDriver(){
	queryAllProducts();
}

mainDriver();
