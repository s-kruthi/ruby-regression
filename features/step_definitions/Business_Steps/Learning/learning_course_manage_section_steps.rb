Given("I create a new course with a Unique Name") do
  UNIQUE_COURSE_NAME = "Automation test section" + Time.now.to_s
  AddACoursesAndGoToCourseSection(ADD_COURSE_BTN)
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID, UNIQUE_COURSE_NAME, COURSE_CODE_ID, COURSE_CODE_VAL, SAVE_COURSE_ID)
end

Given("I go to section tab") do
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
end

When("I click on “Add a Section” button") do
  add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
end

Then("A new section is added") do
  VerifySectionName(COURSE_SECTION_CSS, NEW_SECTION_VALUE)
end

Given("I Edit the course created in @240") do
  EditCourseCreatedLastScenario(UNIQUE_COURSE_NAME)
end

Given(/^I see existing course sections ([\w\s]+)$/) do |course_name|
  VerifySectionName(SECTION_NAME_VISIBLE_CSS, course_name)
end

When(/^I press (\w+) button$/) do |button_name|
  PressSectionButton(button_name)
end

Then("I edit section name") do
  EditSectionNameValue(SECTION_NAME_EDIT_INPUT_CSS, SECTION_EDIT_VALUE)
end

Then("I should be able to save new section name") do
  VerifySectionName(SECTION_NAME_VISIBLE_CSS, SECTION_EDIT_VALUE)
end

Then("I should able to delete that particular section") do
  WaitForAnElementByCSSAndTouch(DELETE_SECTION_CONFIRM_CSS)
  sleep(2)
  VerifyCourseSectionNotExist(COURSE_SECTION_CSS)
end