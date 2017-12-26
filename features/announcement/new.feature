Feature: Announcement User creates new announcement
    As an announcement user
    In order to push a new announcement to mobile apps
    I want to create a new announcement on this app

    Background:
        Given I am a new, authenticated user
        Given I am on the new_announcement page

    Scenario: Announcement User successfully adds an announcement without Event
        When I fill in "announcement_title" with "Sample Title"
        When I fill in "Body" with "Sample Body"
        And I press "Add Announcement"
        Then I should see "Insert More Announcements?"

    Scenario: Announcement User unsuccessfully tries to add an announcement
        When I fill in "Body" with "Sample Body"
        And I press "Add Announcement"
        And I should see "Form is invalid"

    Scenario: Announcement User uses fast insert to add multiple announcements without Event
        When I fill in "announcement_title" with "Sample Title"
        When I fill in "Body" with "Sample Body"
        And I press "Add Announcement"
        Then I should see "Insert More Announcements?"
        When I follow "Add More Announcements"
        When I fill in "announcement_title" with "Sample Title2"
        When I fill in "Body" with "Sample Body2"
        And I press "Add Announcement"
        Then I should see "Insert More Announcements?"
        When I follow "Go to All Announcements"
        Then I should see "Sample Title"
        Then I should see "Sample Title2"