Feature: Load VideoList Cards
    Scenario:  Load VideoList Cards
        Given The app is running
        When I look at the video tile
        Then I should see the video name "S3"
        And I should see a progress bar with 50% completion
        And I should see a play {Icons.play_circle_fill} button

