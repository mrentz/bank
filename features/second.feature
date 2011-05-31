Feature: Finance Tasks
In order to be a real bank
I should be able to add new users

Scenario: Dont Create New User
Given I am on the users list page
Then I should see "There are not any users currently in the system."
And I should see "Add new User"
When I follow "Add new User"
Then I should see "Add user"
And I should see "First Name"
And I should see "Last name:"
And I should see "Email:"
And I should see "Back"
When I follow "Back"
Then I should see "There are not any users currently in the system."
And I should see "Add new User"

Scenario: Fail to Create a new User
Given I am on the users new page
Then I should see "Add user"
When I fill in the following:
 | First Name      |  |
 | user_last_name  |  |
 | user_email      |  |
And I press "Create"
Then I should be on the users page
And I should see "There were problems with the following fields:"
#And I should see "Email can't be blank"
#And I should see "Email is invalid"
And I should see "First name can't be blank"
And I should see "First name is too short (minimum is 1 characters)"
And I should see "Last name can't be blank"

Scenario: Create New User
Given I am on the home page
Then I should see "There are not any users currently in the system."
Then I should see "Add new User"
When I follow "Add new User"
Then I should be on the users new page
Then I should see "Add user"
When I fill in the following:
 | user_first_name | good |
 | user_last_name  | bad |
 | user_email      | Ugly@fu.com|
And I press "Create"
Then I should be on the home page
And I should see "New User Successfully Created"
And I should see "These are the current users in our system"
And I should see "good bad"