Feature: VideoList Detail
    Scenario: Video Player Screen Details
        Given The app is running
        Then I should see loader
        And I see VideoList
        And I see first video list card
        And I tap on first video list card
        Then I navigated to Video player screen