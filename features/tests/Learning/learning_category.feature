@learning @courses
  #@learningTestRailTags
  #C819	C820 C821
  #@learningTestRailTags
Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @smoke_learning5 @course_new_category @learning_high_risk
  Scenario: [Learning]Create a new category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Go To The "Categories" Tab
    When  I Click On “New Category” Button
    And   I Enter New Category Details
    Then  I Should Be Able To Save Course Category

  @smoke_learning5 @course_edit_category @learning_high_risk
  Scenario: [Learning]Edit an existing category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Go To The "Categories" Tab
    When  I Click On "Edit" Button For Any Of Existing Course Category
    Then  I Should Be Able To Edit Existing Category Details
    And   I Click Save Button
    And   I Should Be Able To Save My Changes In Category

  @smoke_learning5 @manage_visibility @learning_low_risk
  Scenario: [Learning]Manage visibility of course category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Go To The "Categories" Tab
    When  I Click On Visible Button Next To A Category I Want To Hide/unhide
    Then  The Visibility Of That Particular Category Should Be Changed