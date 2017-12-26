Feature: Announcement User creates new announcement and event
    As an announcement user
    In order to push a new event to mobile app users
    I want to create a new event on this app

    Background:
        Given I am a new, authenticated user
        Given I have an announcement with title "Title1" and event "Event1"
        Given I have an announcement with title "Title2" and body "Body2"
        Given I am on the announcement_index page

    Scenario: Announcement User successfully edits announcement with Event attached
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with "Title1-changed"
        When I fill in "Body" with "Body1-changed"
        When I check "Is Event?"
        When I press "Update Announcement"
        Then I should be on the announcement_index page
        Then I should see "Title1-changed"
        Then I should see "Body1-changed"
        Then "Event1" should be a saved event

    Scenario: Announcement User successfully edits announcement and event
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with "Title1-changed"
        When I fill in "Body" with "Body1-changed"
        When I check "Is Event?"
        When I fill in "event_title" with "Sample Event-changed"
        When I fill in "event_location" with "Sample Location-changed"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        When I press "Update Announcement"
        Then I should be on the announcement_index page
        Then I should see "Title1-changed"
        Then I should see "Body1-changed"
        Then "Sample Event-changed" should be a saved event

    Scenario: Announcement User successfully adds an event to an existing announcement
        Then I should see "Title2"
        When I click edit on announcement "Title2"
        Then I should see "Title2" in an input box
        Then I should not see "Title1" in an input box
        When I check "Is Event?"
        When I fill in "event_title" with "Sample Event-changed"
        When I fill in "event_location" with "Sample Location-changed"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        When I press "Update Announcement"
        Then I should be on the announcement_index page
        Then I should see "Title2"
        Then I should see "Title1"
        Then "Sample Event-changed" should be a saved event

    Scenario: Announcement User successfully edits announcement with Event attached and destroys event
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with "Title1-changed"
        When I fill in "Body" with "Body1-changed"
        When I uncheck "Is Event?"
        When I press "Update Announcement"
        Then I should be on the announcement_index page
        Then I should see "Title1-changed"
        Then I should see "Body1-changed"
        Then "Event1" should not be a saved event


    Scenario: Announcement User unsuccessfully tries to edit an announcement with complete Event, incomplete Announcement
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with ""
        When I fill in "Body" with "Body1-changed"
        When I check "Is Event?"
        When I fill in "event_title" with "Sample Event-changed"
        When I fill in "event_location" with "Sample Location-changed"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        And I press "Update Announcement"
        And I should see "Announcement Form is invalid"

    Scenario: Announcement User unsuccessfully tries to edit an announcement with incomplete Event, incomplete Announcement
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with ""
        When I fill in "Body" with "Body1-changed"
        When I check "Is Event?"
        When I fill in "event_title" with ""
        When I fill in "event_location" with "Sample Location-changed"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        And I press "Update Announcement"
        And I should see "Event Form is invalid"

     Scenario: Announcement User unsuccessfully tries to edit an announcement with incomplete Event, complete Announcement
        Then I should see "Title1"
        When I click edit on announcement "Title1"
        Then I should see "Title1" in an input box
        Then I should not see "Title2" in an input box
        When I fill in "Title" with "Title1-changed"
        When I fill in "Body" with "Body1-changed"
        When I check "Is Event?"
        When I fill in "event_title" with ""
        When I fill in "event_location" with "Sample Location-changed"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        And I press "Update Announcement"
        And I should see "Event Form is invalid"
