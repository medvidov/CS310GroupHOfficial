Feature: Previous Query

Background: 
	Given I am on the Search Page
	And I search for "Chicken"
	And I clicked the Feed Me! button
	
Scenario: I should see a certain set of restaurants and recipes
	When I am on the results page
	And I should see "Panda Express"
	And I should see "Lemonade"
	And I should see "Seeds Marketplace"
	
Scenario: Previous queries have correct appearance and function
	When I go to Results
	Then I should see previous queries in a scroll menu at the bottom
	And I should see a button with label "Chicken"
	And I should see image for search "Chicken"
	When I click on "Chicken"
	Then I should go to the results page
	And I should see "Panda Express"
	And I should see "Lemonade"
	And I should see "Seeds Marketplace"
	And I should see previous queries in a scroll menu at the bottom