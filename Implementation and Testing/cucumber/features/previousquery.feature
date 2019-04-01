Feature: Previous Query

Background: 
	Given I am on the Search Page
	And I search for "Chicken"
	And I want 5 results
	And I want radius 10
	And I clicked the Feed Me! button
	
Scenario: I should see a certain set of restaurants and recipes
	When I am on the results page
	And I should see "Panda Express"
	And I should see "Lemonade"
	And I should see "Seeds Marketplace"
	
Scenario: I search again and I should see my previous query
	When I search again
	Then I should see my previous queries
	When I click on "Chicken-5-10.0"
	Then I should go to the results page
	And I should see "Panda Express"
	And I should see "Lemonade"
	And I should see "Seeds Marketplace"