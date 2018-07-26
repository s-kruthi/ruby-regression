Feature: temp file
  @twilight
  Scenario: just twilight
    Given I just try

  @dawn
  Scenario: Test the webelement by specific URL
    Given I Have Logged In as a Company Admin
    And I go to the url
#####    Add feature steps here  ###


#####    End feature steps    ###
    And I sail the page
    And I pause for debug

#    Todo:
#    Bulk enrol selected users on the page, store the name of the users by table row and column, and then
#    check the enrolled users after bulk signup | use the SQL to find users enrolled in the session
#
#
#    Bulk enrol all users and then click the cancel button after 30 secs, check the enrolled users has many in the bottom section
#
#    Bulk mark attendance

