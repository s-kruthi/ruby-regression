@Position_Preference_scenarios
Feature:
  I want to test if a user can successfully search for their preferable position and can compare it with their profile and
  research what areas they need suitable training in to achieve their preferred position


   Scenario: List Positions Alphabetically
      Given I Have Logged In As A Regular User
      When  I Go To The Career Positions Section
      Then  The Default Positions Should Be Returned In An Alphabetical Order
  @WIP
    Scenario: Search A Listed Positions
      Given I Have Logged In As A Regular User
      When  I Go To The Career Positions Section
      Then  The I Should Be Able To Search A Position By Typing The Keywords

    Scenario: Search A Position Based On Default "Show Suggested Positions" Filter
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Try To Search A Position Based On Suggested Positions
      Then  The Search Should Return The Suggested Positions Based On The Next Positions Within Two Steps

    Scenario: Search A Position Based On Default "Interested Positions" Filter
      Given I Have Logged In As A Specific User
      When  I Go To The Career Positions Section
      And   I Try To Search A Position Based On Interested Positions
      And   The Detail Matches With The Employee Profile Page's Own Position Link Details

    Scenario: Compare User Position To A Preferred Position
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Click Compare From A Particular Position
      Then  A Modal Is Displayed With The Details Of That Particular Position Alongside With The Details Of My Current Position
      And   The Details Should Be Juxtapositioned Alphabetically

    Scenario: Compare Overview
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Click Compare From A Particular Position
      Then  A Modal Is Displayed With The Details Of That Particular Position Alongside With The Details Of My Current Position
      And   The Compare Section Should have Default Overview

    Scenario: Compare Skills And Add To Profile
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Click Compare From A Particular Position
      Then  A Modal Is Displayed With The Details Of That Particular Position Alongside With The Details Of My Current Position
      And   The Compare Section Should have The Assigned Skills Under Users Position With Add Skill Option
      And   The Compare Section Should have The Preferred Position Skills With An Option To Add Them Back To User Profile

    Scenario: Compare Goals And Star Them
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Click Compare From A Particular Position
      Then  A Modal Is Displayed With The Details Of That Particular Position Alongside With The Details Of My Current Position
      And   The Compare Section Should have The Assigned Goals Under Users Position
      And   The Compare Section Should have The Preferred Position Goals With An Option To Star Them

    Scenario: Compare Competencies And Star Them
      Given I Am Under Positions Tab After Logging In As A Regular User
      When  I Click Compare From A Particular Position
      Then  A Modal Is Displayed With The Details Of That Particular Position Alongside With The Details Of My Current Position
      And   The Compare Section Should have The Assigned Competencies Under Users Position
      And   The Compare Section Should have The Preferred Position Competencies With An Option To Star Them



