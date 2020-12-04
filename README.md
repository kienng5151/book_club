# Project 2 - Book Club App

App in Brief:
- An app that allows users to sign up to join this book club
- A free trial signup 
- Once signed up, users can add, edit and delete books in their account 
- Logged in users can only add, edit and delete their own book records 

Work in Progress:
- Logged in users can view other users' book shelf and they can't add or delete other users' book records
- Users can subscribe on monthly or annual basis by making payment - to use stripe or paypal
- Link a user's book records via user_id - to create a new user_id column in "books" table

Approach taken when building this App:
- This app is very similar to food truck app we did in code alongs from one of ruby, sinatra and postgresql tutorials
- Challenging part is when trying to re-write the code from scratch without referring to food app code alongs - unfortunately, didn't manage to get very far
- So, first step was to declare methods in server file which is main.erb
- Then create folders that contain erb files of main page, users signing up and log in
- Finally, css to style the homepage
