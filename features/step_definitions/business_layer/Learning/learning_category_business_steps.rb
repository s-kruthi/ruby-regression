And(/^I go to the "Categories" tab$/) do
  ClickTabNameCategories(CATEGORIES_BTN)
end

When(/^I click on “New Category” button$/) do
  AddCourseCategory(NEW_CATEGORY_BTN)
end

And(/^I enter new category details$/) do
  AddCategoryName(CATEGORY_NAME_VALUE)
  AddCategoryDescription(CATEGORY_DESCRIPTION_VALUE)
end

Then(/^I should be able to save course category.$/) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
  VerifySuccessAlert(CATEGORY_SUCCESS_XPATH)
end

When(/^I click on "Edit" button for any of existing course category$/) do
  EditCategory(CATEGORY_EDIT_XPATH)
end

Then(/^I should be able to edit existing category details$/) do
  AddCategoryName(EXTRA_NAME_VALUE)
  AddCategoryDescription(EXTRA_DESCRIPTION_VALUE)
end

And(/^I click save button$/) do
  SaveCourseCategory(CATEGORY_SAVE_ID)
end

And(/^I should be able to save my changes in category$/) do
  VerifySuccessAlert(CATEGORY_SUCCESS_XPATH)
end

When(/^I click on visible button next to a category I want to hide\/unhide$/) do
  @VisibilityBeforeClick = $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title')
  ClickCategoryVisibleButton(CATEGORY_VISIBLE_XPATH)
end

Then(/^The visibility of that particular category should be changed.$/) do
  ConfirmCategoryVisibilityChangeOnClick(@VisibilityBeforeClick)
end