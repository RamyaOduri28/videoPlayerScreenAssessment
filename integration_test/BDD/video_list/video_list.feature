Feature: Load VideoList Cards
    Scenario: Load all videoList cards
        Given The app is running
        Then I see header title
        And I see loader
        Then I see VideoList cards
