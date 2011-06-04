
Feature: TasksCreating New Users
In order to keep track of users
People should be able to
Create a new user

Scenario: Dont Create New User
Given I am on the users list page
Then I should see "Add new User"
When I follow "Add new User"
Then I should see "Add user"
And I should see "First Name:"
And I should see "Last Name:"
And I should see "Email:"
And I should see "Back"
When I follow "Back"
Then I should see "There are not any users currently in the system."
And I should see "Add new User"

Scenario: Create New User
Given I am on the users list page
Then I should see "Add new User"
When I follow "Add new User"
Then I should see "Add user"
And I should see "First Name:"
And I should see "Last Name:"
And I should see "Email:"
And I should see "Back"
When I fill in "user_first_name" with "tom"
When I fill in "Last name:" with "thumb"
#When I fill in "email:" with "tom@foo.gu"
#And I press "Create"
#Then I should be on the users list page
#And I should see "These are the current users in our system"
#And I should see "tom thumb"