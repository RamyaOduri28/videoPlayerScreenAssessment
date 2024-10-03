Feature: Video Tile Widget
  As a user
  I want to see video information and progress
  So that I can easily manage my video watching

  Scenario: Displaying video information
    Given I have a video with name "S3" and progress 0.5
    When I look at the video tile
    Then I should see the video name "S3"
    And I should see a progress bar with 50% completion
    And I should see a {Icons.play_circle_fill} button

  Scenario: Completed video display
    Given I have a video with name "YT" and progress 1.0
    When I look at the video tile
    Then I should see the video name "YT"
    And I should see a progress bar with 100% completion
    And I should see a {Icons.replay} button

  Scenario: Tapping the play button
    Given I have a video with name "Flutter Widgets" and progress 0.3
    When I tap the play button
    Then the video should start playing