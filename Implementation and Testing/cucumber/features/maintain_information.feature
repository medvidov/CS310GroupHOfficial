Feature: Maintain previous queries, list management, and grocery lists beyond a single session

Background:
	Given I am on the Search Page
	And I click button "chicken"
		
Scenario: Previous queries exist after session ends
	When I close the browser
	And I restart the system
	When I am on the Search Page
	When I click button "chicken"
	Then I should see a button with label "CHICKEN"
	
Scenario: List management exists after session ends
	When I click on "Lemonade"
	When I add to the "Favorite" page
	When I close the browser
	And I restart the system

Scenario: Reordered list order is maintained after session ends
    When I click on "Lemonade"
    And I add to the "Favorite" page
    And I am on the search page
    And I click button "chicken"
    And I click on "Chicken Marsala Over White Rice" 
    And I add to the "Favorite" page
    And I am on the search page
    And I click button "chicken"
    And I click on "Panda Express" 
    And I add to the "Favorite" page
    Given I am on the favorites list
    And I click the up arrow on the second item
    Then the second item will now be the first item on the list
    When I close the browser
	And I restart the system
	And I click button "chicken"
	When I am on the favorites list
	Then the second item will now be the first item on the list