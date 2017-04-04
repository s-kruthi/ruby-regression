
def GoToLeaveTypeUnderLeaveManagement(leave_management_sec_id)
  WaitForAnElementByIdAndTouch(leave_management_sec_id)
end

def CreateANewLeaveType(leave_type_path,add_new_leave_type)
  WaitForAnElementByXpathAndTouch(leave_type_path)
  sleep(3)
  WaitForAnElementByClassAndTouch(add_new_leave_type)
  sleep(3)
end

def FillTheLeaveTypeAndSave(leave_type_title_cs,leave_type_title_val,leave_type_entitl_cs)
  WaitForAnElementByCSSAndInputValue(leave_type_title_cs,leave_type_title_val)
  sleep(1)
  $driver.find_elements( :tag_name => "option")[1].click #selects Accrual type prorata
  sleep(1)
  WaitForAnElementByCSSAndTouch(leave_type_entitl_cs)
  sleep(1)
  $driver.find_elements( :tag_name => "option")[5].click #selects entitlement type annual
  sleep(3)
  $driver.find_element(:css, 'button[ng-click="lt.postLeaveType()"]').click
  sleep(3)
end
def SearchTheCreatedLeaveTypeAndDeleteIt(search_leav_typ,leave_type_val)
  WaitForAnElementByCSSAndInputValue(search_leav_typ,leave_type_val)
  $driver.find_element(:css, 'button[ng-click="lt.getLeaveTypes()"]').click
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(LEAVE_REQUEST_DROPDOWN,3)
  $driver.find_element(:css, 'a[ng-click="lt.deleteLeaveType(leaveType.id)"]').click
  sleep(2)
  PressEnterConfirm()
  sleep(2)
  $driver.quit
end
def GoToLeavePolicyUnderLeaveManagement(leave_management_sec_id)
  WaitForAnElementByIdAndTouch(leave_management_sec_id)
end

def CreateANewLeavePolicy(leave_policy_path,add_new_leave_policy)
  WaitForAnElementByXpathAndTouch(leave_policy_path)
  sleep(3)
  WaitForAnElementByClassAndTouch(add_new_leave_policy)
  sleep(3)
end

def FillTheLeavePolicyAndSave(leave_policy_title_cs,leave_policy_title_val)
  WaitForAnElementByCSSAndInputValue(leave_policy_title_cs,leave_policy_title_val)
  sleep(1)
  $driver.find_element(:id, 's2id_autogen4').click #selects leave type annual
  sleep(1)
  $driver.find_elements(:class, 'select2-result-label')[1].click
  sleep(1)
  $driver.find_element(:id, 's2id_autogen4').click #selects personal type annual
  sleep(1)
  $driver.find_elements(:class, 'select2-result-label')[2].click
  sleep(1)
  $driver.find_element(:id, 'annualEntitlements').send_keys "4"
  $driver.find_element(:id, 'personalEntitlements').send_keys "2"
  $driver.find_elements( :tag_name => "option")[1].click #select work days as 5 days
  sleep(3)
  $driver.find_element(:css, 'button[ng-click="lp.postLeavePolicy()"]').click
  sleep(3)
end

def SearchTheCreatedLeavePolicyAndDeleteIt(search_leav_pol,leave_pol_val)
  $driver.find_element(:link_text, 'Leave Policy').click
  sleep(3)
  WaitForAnElementByCSSAndInputValue(search_leav_pol,leave_pol_val)
  $driver.find_element(:css, 'button[ng-click="lp.getLeavePolicies()"]').click
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(LEAVE_REQUEST_DROPDOWN,3)
  $driver.find_element(:class, 'delete-leave-policy').click
  sleep(2)
  PressEnterConfirm()
end

def GoToHolidayMgntUnderLeaveManagement(leave_management_sec_id)
  WaitForAnElementByIdAndTouch(leave_management_sec_id)
end
def CreateANewCompanyHoliday(holiday_mgmt_path,add_new_company_hol)
  WaitForAnElementByXpathAndTouch(holiday_mgmt_path)
  sleep(3)
  WaitForAnElementByXpathAndTouch(add_new_company_hol)
  sleep(3)
end

def FillTheNewCompanyHolidayAndSave()
  sleep(1)
  $driver.find_element(:xpath, "//input[@id='holiday_title']").send_keys "Automation Leave Data"
  $driver.find_element(:id, 'holiday_startDate').send_keys "19/07/2017"
  $driver.find_element(:id, 'holiday_endDate').send_keys "19/07/2017"
  sleep(1)
  $driver.find_element(:id, 'holiday_save').click
  sleep(3)
  hol_url = $driver.current_url
  hol_id = hol_url.split('/')[-2]
  $current_hol_id = "#{hol_id}"
  puts $current_hol_id
end

def FindTheCreatedHolidayAndDeleteIt()
  $driver.find_element(:link_text, 'Holiday Management').click
  sleep(5)
  $driver.find_elements(:xpath, "//button[@aria-expanded='true']").last.click
  $driver.find_element(:css, %(a[ng-click="chl.deleteCompanyEvent(#{$current_hol_id})"])).click
  sleep(2)
  $driver.find_element(:css, "[data-bb-handler='success']").click
end

def GoToLeaveRequestUnderLeaveManagement(leave_management_sec_id,leave_requests_path)
  WaitForAnElementByIdAndTouch(leave_management_sec_id)
  WaitForAnElementByXpathAndTouch(leave_requests_path)
  sleep(2)
end
def GoToLeaveBalanceUnderLeaveManagement(leave_management_sec_id)
  WaitForAnElementByIdAndTouch(leave_management_sec_id)
end

def ApproveTheSubmittedLeaveRequest(approval_reason)
  sleep(2)
  $driver.find_element(:xpath, %(//a[@ng-href='/admin/leave/leave-request/#{RQST_PATH_ID}'])).click
  sleep(3)
  $driver.find_element(:css, 'textarea[ng-model="data.leaveRequest.comment"]').send_keys "#{approval_reason}"
  $driver.find_element(:css, 'button[ng-click="approveLeaveRequest()"]').click
  sleep(3)
  $driver.navigate.back
  sleep(2)
  $driver.find_element(:xpath, "//a[contains(.,'Approved Request')]").click
end

def ModifyLeaveHrAndProcessTheLeaveRequest()
  $driver.find_element(:xpath, "//a[contains(.,'Approved Request')]").click
  sleep(2)
  $driver.find_element(:xpath, "//input[@ng-model='lr.data.criteria.searchText']").send_keys("Donald Trump", :return)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(LEAVE_REQUEST_DROPDOWN,3)
  sleep(1)
  $driver.find_element(:css, 'a[ng-click="lr.openLeaveRequestHrModification(request)"]').click #click modify hrs
  sleep(2)
  $driver.find_element(:css, 'input[ng-model="data.modification.totalHours"]').clear    #clear hrs
  $driver.find_element(:css, 'input[ng-model="data.modification.totalHours"]').send_keys "0.5"    #enter new hrs
  $driver.find_element(:css, 'textarea[ng-model="data.modification.comment"]').send_keys "automation hrs modified" #enter comment
  $driver.find_element(:css, 'button[ng-click="postLeaveRequestModification()"]').click
  sleep(3)
  WaitForDropdownByClassAndTouchTheIndex(LEAVE_REQUEST_DROPDOWN,3)
  sleep(2)
  $driver.find_element(:css, 'a[ng-click="lr.hrApproveLeaveRequest(request)"]').click #click approve to process
  sleep(2)
  PressEnterConfirm()
  sleep(2)
  $driver.find_element(:xpath, "//a[contains(.,'Processing Request')]").click #go to processing request tab
  sleep(2)
end

def UnderProcessingTabCancelTheLeaveRequest()
  WaitForDropdownByClassAndTouchTheIndex(LEAVE_REQUEST_DROPDOWN,3)
  sleep(2)
  $driver.find_element(:css, 'a[ng-click="lr.openLeaveRequestCancellation(request)"]').click #cancel the processing request
  sleep(2)
  $driver.find_element(:css, 'textarea[ng-model="data.cancellation.comment"]').send_keys "automation processing leave cancelled"
  $driver.find_element(:css, 'button[ng-click="postLeaveRequestCancellation()"]').click
  sleep(2)
end
def GoToLeaveBalanceAndSearchTheEmployee()
  sleep(2)
  $driver.find_element(:xpath, "//span[contains(.,'Leave Balance & Import')]").click
  sleep(2)
  $driver.find_element(:xpath, "//input[@ng-model='lb.data.criteria.searchText']").send_keys("Donald Trump", :return)
  sleep(1)
end
def CheckTheLeaveBucketReturnsTheExpectedAccruals()
  FetchTheLeaveBucketForThatEmployee()
  MatchTheExpectedLeaveBucketFromDatabase()
end

# module Leave
#   def Leave.annual_leave()
#     puts $driver.find_elements(:class, "ng-binding")[8].text
#   end
#   def Leave.personal_leave()
#    puts $driver.find_elements(:class, "ng-binding")[11].text
#   end
#   def Leave.limit_leave()
#   puts $driver.find_elements(:class, "ng-binding")[14].text
#   end
# end


def FetchTheLeaveBucketForThatEmployee()
  $annual_leave = $driver.find_elements(:class, "ng-binding")[8].text
  puts "#{$annual_leave}"
  $personal_leave = $driver.find_elements(:class, "ng-binding")[11].text
  puts "#{$personal_leave}"
  $limit_based = $driver.find_elements(:class, "ng-binding")[14].text
  puts "#{$limit_based}"
end

