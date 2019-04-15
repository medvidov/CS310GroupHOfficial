Feature: Reorder list elements within the list management pages

Background:
    Given I am on the search page
    And I search for "chicken"
    And I click the "Feed Me!" button
    And I add "Chicken Marsala Over White Rice" to the "Favorite" page
    And I add "San Diego Grilled Chicken" to the "Favorite" page

Scenario: Move the bottom item upward
    Given I am on the favorites list
    And I click the up arrow on the second item
    Then the second item will now be the first item on the list

Scenario: Move the top item downwards
    Given I am on the favorites list
    And I click the down arrow on the first item
    Then the first item will now be the second item on the list