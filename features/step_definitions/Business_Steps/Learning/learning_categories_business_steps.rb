And(/^I go to the "Categories" tab$/i) do
  ClickTabNameCategories(CATEGORIES_BTN)
end

And(/^I Enter New Category Details$/i) do
  AddCategoryName(CATEGORY_NAME_VALUE)
  AddCategoryDescription(CATEGORY_DESCRIPTION_VALUE)
end

Then(/^I Should Be Able To Save Course Category$/i) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CATEGORY_SUCCESS_VALUE)
end

When(/^I Click On Edit Button For Any Of Existing Course Category$/i) do
  EditCategory(CATEGORY_EDIT_XPATH)
end

Then(/^I Should Be Able To Edit Existing Category Details$/i) do
  AddCategoryName(EXTRA_NAME_VALUE)
  AddCategoryDescription(EXTRA_DESCRIPTION_VALUE)
end

And(/^I Click Save Button$/i) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
end

And(/^I Should Be Able To Save My Changes In Category$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CATEGORY_SUCCESS_VALUE)
end

When(/^I Click On Visible Button Next To A Category I Want To Hide\/Unhide$/i) do
  @VisibilityBeforeClick = $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title')
  ClickCategoryVisibleButton(CATEGORY_VISIBLE_XPATH)
end

Then(/^The Visibility Of That Particular Category Should Be Changed$/i) do
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