@learning @courses
  #@learningTestRailTags
  #C819	C820 C821
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @new_category @learning_high_risk
  Scenario: [Learning]Create a new category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I go to the "Categories" tab
    When  I click on “New Category” button
    And   I enter new category details
    Then  I should be able to save course category.

  @edit_category @learning_high_risk
  Scenario: [Learning]Edit an existing category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I go to the "Categories" tab
    When  I click on "Edit" button for any of existing course category
    Then  I should be able to edit existing category details
    And   I click save button
    And   I should be able to save my changes in category

  @manage_visibility @learning_low_risk
  Scenario: [Learning]Manage visibility of course category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I go to the "Categories" tab
    When  I click on visible button next to a category I want to hide/unhide
    Then  The visibility of that particular category should be changed.