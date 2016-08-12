@Position_Preference_scenarios @smoke
Feature:
  I want to test if a user can successfully search for their preferable position and can compare it with their profile and
  research what areas they need suitable training in to achieve their preferred position


   Scenario: List Positions Alphabetically
      Given I Have Logged In As A Regular User
      When  I Go To The Career Positions Section
      Then  The Default Positions Should Be Returned In An Alphabetical Order

    Scenario: Search A Listed Positions
      Given I Have Logged In As A Regular User
      When  I Go To The Career Positions Section
      Then  The I Should Be Able To Search A Position By Typing The Keywords

    Scenario: Search A Position Based On Default "Show Suggested Positions" Filter
      Given I Have Logged In As A Specific User
      When  I Go To The Career Positions Section
      And   I Try To Search A Position Based On Suggested Positions
      Then  The Search Should Return The Suggested Positions Based On The Next Positions Within Two Steps

    Scenario: Search A Position Based On Default "Interested Positions" Filter
      Given I Have Logged In As A Specific User
      When  I Go To The Career Positions Section
      And   I Try To Search A Position Based On Interested Positions
      Then  The Search Should Return The Interested Position Based On My Previous Selections




