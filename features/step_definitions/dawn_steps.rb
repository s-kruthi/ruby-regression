Given("I just try") do
  $daos.get_face_to_face_session_signup_first_last_name('Automation test section2018-07-20 12:00:33 +1000')
  binding.pry
end

Given(/^I am a (\w+)$/) do |person|
  binding.pry
end

And('I pause for debug') do
  binding.pry
end

Given("I go to the url") do

  cucumber_cmd_url = ENV["path"]
  Sleep_Until($driver.navigate.to(cucumber_cmd_url))
end

And("I sail the page") do
  SailThePage()
end

def SailThePage()
#Use Methods here
  WaitForAnElementByClassAndTouch(BULK_SIGN_UP_BUTTON_CSS)
  WaitForAnElementByCSSAndTouch(CANCEL_BULK_SESSION_SIGNUP_BUTTON_CSS)
  # todo   'signups.each {|su| name = su[:first_name] + su[:last_name]; puts name }'
end



# ManualSignupFaceToFaceSession('Company Admin Omar', 0, &SelectIndexFromSelect2SearchResult())
#Create methods and data etc all in this page
# def   ManualSignupFaceToFaceSession(first_last_name, index, &proc_select_indexfrom_select)
#   WaitForAnElementByPartialLinkTextAndTouch("Manual Sign Up")
#   yield(first_last_name, index)
#   WaitForAnElementByIdAndTouch(SIGN_UP_SELECTED_USERS_ID)
#   PressConfirm()
# end
#
# def SelectIndexFromSelect2SearchResult
#   lambda do |search_value, index|
#     # Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
#     Sleep_Until($driver.find_element(:id, "s2id_autogen1").send_keys(search_value))
#     VerifyAnElementExistById('select2-results-1', search_value)
#     $driver.find_elements(:class, "select2-result")[index].click
#   end
# end

#
#
# def method_lambda_params
#   lambda {|x, y| puts "haha" + x.to_s + 'yaya' + y.to_s}
# end
# def yield_lambda_with_values(x,y,&block)
#   yield(x, y)
# end



BULK_SIGN_UP_BUTTON_CSS = 'facetoface-session-bulk-signup'
CANCEL_BULK_SESSION_SIGNUP_BUTTON_CSS = 'button[data-action="cancel"]'