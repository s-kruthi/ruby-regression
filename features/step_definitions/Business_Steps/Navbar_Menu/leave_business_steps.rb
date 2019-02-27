And(/^I Can Select (.*) Leave Type$/i) do | leave_type |
  sleep (4)
  SelectFromDropdown(LEAVE_REQUEST_LEAVETYPE_ID, leave_type)

  if @bank_leave == true
    #saying you worked on a Saturday
    date_val = (DateTime.now + (rand * 7))
    date_val = date_val.beginning_of_week(:saturday).strftime "%d/%m/%Y"
    puts (COLOR_BLUE + "banking leave on " + date_val).upcase

  else
    date_val = (DateTime.now + (rand * 7)).strftime "%d/%m/%Y"
    puts (COLOR_BLUE + "taking leave on " + date_val).upcase
  end

  SelectLeaveDate(date_val)

  EnterLeaveHours(LEAVE_REQUEST_HOURS_VALUE)
  byebug
end


And(/^I Choose To (Bank|Take) The Request$/i) do | leave_action |
  if leave_action == 'Bank'
    JavascriptClick(LEAVE_REQUEST_TOGGLE_ID)
    @bank_leave = true
  else
    puts COLOR_BLUE + "toggle is by default set to take".upcase
    @bank_leave = false
  end
end


Then(/^I Should Be Able To See That My Leave Request Was Successfully Submitted$/i) do
  ClickElement('xpath', LEAVE_REQUEST_SUBMIT_ID)
  byebug

  clicked_at = (Time.now).strftime "%d/%m/%Y %I:%M:%S %p"
  puts COLOR_BLUE + ("submitted leave request at " + clicked_at).upcase

  sleep (8)

  submitted = GetTextAssociatedToElement('xpath', LEAVE_REQUEST_STATUS_ID)

  #comparing that the submitted request has pending status
  expect(submitted).to eq("Pending Approval")
end


And(/^I Search For The User With (.*) Balance$/i) do | leave_type_bucket_balance |
  @user_search = $daos.get_user_with_leave_balance(leave_type_bucket_balance)

  if !@user_search.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(@user_search[:first_name]+ ' ' + @user_search[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end
end


And(/^I Use The Log in as this user Option To Login$/i) do
  #ensuring that the searched user's actions dropdown is clicked
  element_id = '//a[@href="/controlpanel/edit-user/'+ @user_search[:user_id].to_s + '"]/following-sibling::button'
  Sleep_Until(ClickElement('xpath', element_id))

  ClickElement('xpath', USER_LOGINAS_ACTION_ID)

  puts COLOR_BLUE + ("logging in as the user with user id: " + @user_search[:user_id].to_s).upcase
end


And(/^I Search For The User Having Insufficient (.*) Leave Balance$/i) do | leave_type_bucket_balance |
  @user_search = $daos.get_user_with_insufficient_leave_balance(leave_type_bucket_balance)

  if !@user_search.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(@user_search[:first_name]+ ' ' + @user_search[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end
end


Then(/^I Should Be Able To See That My Leave Request Cannot Be Submitted$/i) do

  ClickElement('xpath', LEAVE_REQUEST_SUBMIT_ID)
  pending 'Because of a bug PR-2114'

  sleep(2)
  err_msg_text = $driver.find_elements(:xpath,'//div[contains(@class, "alert-danger")]//span[contains(@class, "ng-binding")]')[1].text

  expect(err_msg_text).to eq('Leave request hours cannot exceed the leave balance.')
  puts COLOR_GREEN + "insufficient leave balance error is displayed".upcase
end

