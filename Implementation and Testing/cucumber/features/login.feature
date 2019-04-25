Feature: Login functionality for user specific access

Background:
	Given I am on the Search page
	And I click the login button

Scenario: Successful login credentials
	And log in with the username "Alec" and password "HelloBram123!"
	And click the Log In button
	Then I should be redirected to the search page that says Hi username
	
Scenario: Username and password do not match
	And log in with the username "Alec" and password "HelloBram12!"
	And click the Log In button
	Then I should see an error message on the login page
	
Scenario: User provides weak password during sign up
	Given I am on the search page
	And I click the sign up button
	And sign up with the username "Alec" and password "hellobram"
	And click the Sign Up button
	Then I should see an error on the sign up page saying invalid password
	
Scenario: Signing up with repeated username
	Given I am on the search page
	And I click the sign up button
	And sign up with the username "Alec" and a valid password "HelloBram123!"
	And click the Sign Up button
	Then I should see an error on the sign up page saying repeat username

Scenario: Sign up works properly with valid username and password
	Given I am on the search page
	And I click the sign up button
	And I enter a new username
	And I enter a new password and confirm password
	And I click sign up
	Then I should see the success message
	Given I am on the search page
	And I click the login button
	And I log in with my new username and password
	And I click the Log In button
	Then I should be successfully logged in
	
Scenario: Previous queries are user specific
	And log in with the username "Alec" and password "HelloBram123!"
	And click the Log In button
	Then I should be redirected to the search page that says Hi username
	And I search for chicken
	And I return to the search page
	And I log out of my account
	Given I return to the search page
	And I click the login button
	And log in with the username "Alec" and password "HelloBram123!"
	And I click the Log In button
	And I return to the search page
	And I search for chinese
	Then I should see my previous query of chicken
