Feature: Homepage
@javascript
Scenario: Login
When I visit home page
When I follow "Log in"
Then I should see "Email"
Then I should see "Password"
Then I fill in "session_email" with "chef-0@example.com"
Then I fill in "session_password" with "testpassword"
Then I press "Log in"
Then I should see "You have successfully logged in"
Then I should see "Chef chef 0's profile"


@s1
Scenario: Nonlogged in user
When I visit home page
When I follow "Chefs"
Then I should see "Showing all chefs"