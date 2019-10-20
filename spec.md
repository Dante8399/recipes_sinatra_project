# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database: ActiveRecord Migrations were used to create and manage the database
- [X] Include more than one model class (e.g. User, Post, Category): There are a User, Recipe, and Ingredients model
- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts) User has many recipes
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Recipes belongs to a User
- [X] Include user accounts with unique login attribute (username or email) There is a login page that requires and stores email/password
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: User's recipes have all CRUD actions available
- [X] Ensure that users can't modify content created by other users: User sessions only alllow access to that users database
- [X] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message