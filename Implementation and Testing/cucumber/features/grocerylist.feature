Feature: Grocery List

Background: 
	Given I am on the search page
	And I search for chicken
	And I want 5 results per page
	And I want a radius of 10
	And I clicked the "Feed Me!" button
	Given I visit previous query "chicken-5-10.0"
	
Scenario: No food is in the grocery list
	When I click the grocery list button
	Then the page should be blank
	
Scenario: Add food to grocery list
	When I click a recipe
	Then I should be on that recipe's page
	And I should see the button to add to the grocery list
	When I click Return to Results
	Then I should be on the results page
	And I should see the grocery list button
	When I click the grocery list button
	Then I should see a recipe's groceries