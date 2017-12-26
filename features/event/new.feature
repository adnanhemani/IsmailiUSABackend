Feature: Announcement User creates new announcement and event
    As an announcement user
    In order to push a new event to mobile app users
    I want to create a new event on this app

    Background:
        Given I am a new, authenticated user
        Given I am on the new_announcement page

    Scenario: Announcement User successfully adds an announcement with Event
        When I fill in "announcement_title" with "Sample Title"
        When I fill in "Body" with "Sample Body"
        When I check "Is Event?"
        When I fill in "event_title" with "Sample Event"
        When I fill in "event_location" with "Sample Location"
        When I select "URL" from "registration"
        When I fill in the first "event_details" with "google.com"
        And I press "Add Announcement"
        Then I should see "Insert More Announcements?"

    Scenario: Announcement User unsuccessfully tries to add an announcement with complete Event, incomplete Announcement
        When I fill in "Body" with "Sample Body"
        When I check "Is Event?"
        When I fill in "event_title" with "Sample Event"
        When I fill in "event_location" with "Sample Location"
        And I press "Add Announcement"
        And I should see "Announcement Form is invalid"

    Scenario: Announcement User unsuccessfully tries to add an announcement with incomplete Event, incomplete Announcement
        When I fill in "Body" with "Sample Body"
        When I check "Is Event?"
        When I fill in "event_location" with "Sample Location"
        And I press "Add Announcement"
        And I should see "Event Form is invalid"

     Scenario: Announcement User unsuccessfully tries to add an announcement with incomplete Event, complete Announcement
        When I fill in "announcement_title" with "Sample Title"
        When I fill in "Body" with "Sample Body"
        When I check "Is Event?"
        When I fill in "event_location" with "Sample Location"
        When I select "Person or Location" from "registration"
        When I fill in the first "event_details" with "See council corner."
        And I press "Add Announcement"
        And I should see "Event Form is invalid"