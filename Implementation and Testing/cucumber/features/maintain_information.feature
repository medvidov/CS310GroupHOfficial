Feature: System will maintain grocery list and list management pages (user specific) and previous queries beyond a single session

Background:
	Given I am on the search page
	And I search for "chicken"
	
Scenario: User grocery lists will remain beyond a single session
	Given I log a user
	And I add the first chicken recipe to my grocery list
	And I log the user out
	And I close the browser
	And I restart the system
	And I log the same user back in
	And I go to the results page
	And I go to the grocery list page
	Then I should see the ingredients for the first chicken recipe
	
Scenario: User favorite, do not show, and explore lists will remain beyond a single session

Scenario: Previous queries will remain beyond a session regardless of what user searched them
	Given I close the browser
	And I restart the system
	And I go to the results page
	Then I should see chicken under the previous queries at the bottom of the results page