Feature: Announcement User deletes announcement
    As an announcement user
    In order to remove an outdated announcement
    I want to delete a announcement on this app

    Background:
        Given I am a new, authenticated user
        Given I have an announcement with title "Title-test" and body "Body"
        Given I am on the announcement_index page

    Scenario: Announcement User successfully deletes an announcement
        Then I should see "Title-test"
        When I follow "Delete"
        Then I should be on the announcement_index page
        And I should not see "Title-test"
