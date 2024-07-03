# alusqlchallenge

## Requirements
Users: For each user, the database should store their name, email (which should be unique), and password.

Products: Each product should have a name, description, price, and the ID of the user who listed the product.

Transactions: Each transaction should record the ID of the buyer, the ID of the product, the date of the transaction, and the quantity purchased.

Constraints: Apply appropriate constraints to your tables. For example, all IDs should be primary keys, emails should be unique, etc.

Indexes: Create an index on the Name column of the Users table to speed up queries.

Views: Create a view that shows the product name, description, and the name of the user who listed the product.

Stored Procedures and Functions: Create a stored procedure that gets the count of products and a function that gets the total number of users.

Triggers: Create a trigger that updates the TransactionDate field to the current date before any insert operation on the Transactions table.

Advanced Queries: Write SQL queries to:

Find all products listed by a specific user.
Find the total amount spent by a specific user.
Find the top 5 most popular products (i.e., products with the most transactions).