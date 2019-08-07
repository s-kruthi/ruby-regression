Given(/^I Create A New Course With A Unique Name$/) do
  @unique_course_name = "Automation test section" + Time.now.to_s
  AddACoursesAndGoToCourseSection(CREATE_NEW_COURSE_BTN)
  course_code_value = COURSE_CODE_ID + Time.now.to_s
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID, @unique_course_name, COURSE_CODE_ID, course_code_value, SAVE_COURSE_ID)
end

Then(/^I Should Be Able To Create A Section$/) do
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  AddANewSection(COURSE_ADD_A_SECTION_BTN_ID)
  VerifySectionName(COURSE_SECTION_CSS, NEW_SECTION_VALUE)
end

When(/^I Edit The Section Name Of Course Unique Name$/) do
  ClickSectionButton("Edit")
  EditSectionNameValue(SECTION_NAME_EDIT_INPUT_CSS, SECTION_EDIT_VALUE)
  Sleep_Until(ClickSectionButton("Done"))
end

Then(/^I Should Be Able To Modify The Section Name$/) do
  Sleep_Until(VerifySectionName(SECTION_NAME_VISIBLE_CSS, SECTION_EDIT_VALUE))
end

When(/^I Delete The Section Name Of Course Unique Name$/) do
  Sleep_Until(ClickSectionButton("Delete"))
  Sleep_Until(WaitForAnElementByCSSAndTouch(DELETE_SECTION_CONFIRM_CSS))
end

Then(/^I Should Be Able To Delete The Section Name$/) do
  Sleep_Until(VerifyCourseSectionNotExist(COURSE_SECTION_CSS))
end