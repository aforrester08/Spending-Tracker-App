# Spending-Tracker-App

This is a solo project set by Codeclan whicj was completed in 4 days. 
It is using Ruby (specifically Sinatra library) as well as SQL databases.

The brief was to create an app that a user could log monetary transactions. 
The total of all these transactions should be displayed and each transaction could have an attached merchant 
(Tesco, B&Q etc) and tag (grocceries, eating out, bills etc).
Extensions I included were the ability for the user to set a budget for the month and for a message to display when this 
budget was surpassed. Finally I added a timestamp that automatically added a date and time when a new transaction was added.

If given more time I would have liked to move onto a filter for the tranasction table as well as refactoring the code to make 
it more readable and neater. CSS was a last priority so more time to polish that would also be nice.

# Running the app:

Firstly install sinatra using "gem install sinatra", then simply run "ruby app.rb" in the main directory to start the server.
The app will now be viewable on localhost:4567/tracker
