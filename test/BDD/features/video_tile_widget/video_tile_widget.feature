Feature: VideoList
    Scenario: video List Card
       Given The app is running
       When I see Header Title
       Then I see ListView
       Then I see videoName text
       Then I see progressbar
       Then I see {Icons.Play} icon

