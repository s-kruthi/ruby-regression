And(/^I go to the "Categories" tab$/i) do
  ClickTabNameCategories(CATEGORIES_BTN)
end

When(/^I click on “New Category” button$/i) do
  AddCourseCategory(NEW_CATEGORY_BTN)
end

And(/^I enter new category details$/i) do
  AddCategoryName(CATEGORY_NAME_VALUE)
  AddCategoryDescription(CATEGORY_DESCRIPTION_VALUE)
end

Then(/^I should be able to save course category$/i) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CATEGORY_SUCCESS_VALUE)
end

When(/^I click on "Edit" button for any of existing course category$/i) do
  EditCategory(CATEGORY_EDIT_XPATH)
end

Then(/^I should be able to edit existing category details$/i) do
  AddCategoryName(EXTRA_NAME_VALUE)
  AddCategoryDescription(EXTRA_DESCRIPTION_VALUE)
end

And(/^I click save button$/i) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
end

And(/^I should be able to save my changes in category$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CATEGORY_SUCCESS_VALUE)
end

When(/^I click on visible button next to a category I want to hide\/unhide$/i) do
  @VisibilityBeforeClick = $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title')
  ClickCategoryVisibleButton(CATEGORY_VISIBLE_XPATH)
end

Then(/^The visibility of that particular category should be changed$/i) do
  ConfirmCategoryVisibilityWithAlertChangeOnClick(@VisibilityBeforeClick)
end

When("I Create A Cost Category With {runtime name}") do |name|
  AdminCreateItemTroughNewLink("New Category")
  CompleteFieldWithRuntimeName(COST_CATEGORY_NAME_ID, name)
  ClickButtonWithName('Save')
end

Then(/^I Should Be Able To Create The Learning Cost Category$/) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_COST_CATEGORY_SAVE_SUCCESSFUL_VALUE)
end

Then(/^I Can Toggle The Visibility State Of Existing Cost Category$/) do
  unless TableItemExistingOnPage(CATEGORY_SECTION_CLASS)
    steps %{ When I Create A Cost Category With A Unique Name }
  end
  @VisibilityBeforeClick = $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title')
  Sleep_Until(ClickCategoryVisibleButton(CATEGORY_VISIBLE_XPATH))
  ConfirmCategoryVisibilityNoAlertChangeOnClick(@VisibilityBeforeClick)
end

When(/^I Edit The Cost Category$/) do
  Sleep_Until(ClickLinkButtonWithName("Edit"))
end

Then("I Can Edit The Learning Cost Category With {runtime content}") do |content|
  EditTextInCKEContent(content)
  ClickButtonWithName('Save')
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_COST_CATEGORY_SAVE_SUCCESSFUL_VALUE)
end