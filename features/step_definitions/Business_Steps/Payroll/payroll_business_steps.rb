When(/^I Make Changes To Legal Entity$/i) do
  steps %{
    And   I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Can Edit A Legal Entity
    Then  I Should See That Legal Entity Is Updated Successfully
    And   I Have Logged Out as a Company Admin
  }
end


And(/^I Send (Company|Employee) Data To Elmo Payroll$/i) do |data_type|
  steps %{
    And   I Go To The Menu Payroll Section
  }

  sleep(1)

  if data_type == 'Employee'
      Sleep_Until(ClickOnASubTab(PAYROLL_EMPDATA_TAB))
  end
end


Then(/^The (Company|Employee) Data Should Be Sent Successfully$/i) do |data_type|
  #Click the Send Data button to send data to Elmo Payroll
  Sleep_Until(WaitForAnElementByXpathAndTouch("//button[@ng-click='listVm.executeJob()']"))

  export_date_epoch = Time.now.to_i

  #cpaturing the export date and time to check the log file
  export_date = Time.at(export_date_epoch).strftime('%d/%m/%Y %H:%M')

  puts COLOR_BLUE + "Check Record/Log file manually for the Exported Date: " + export_date
end


And(/^All The Necessary Details Of The Employee Required For Payroll Are Added$/i) do
  SetEmployeeProfileDetails()
  sleep(1)

  steps %{
    And   I Click On "Users" Breadcrumb Menu
    And   I Search For A Specific User named #{@@user_name}
    And   I Edit The User's Employment Details Section
  }

  SetEmployeeEmploymentDetails()

  sleep(4)
  SetSuperDetails()

  sleep(4)
  SetContactDetails()

  #need to activate the user to send user data to Payroll
  steps %{
          And   I Click On "Users" Breadcrumb Menu
        And   I Click On "Notify Users" Button
        And   I Click On "Activate All Users" Button
        Then  I Should Be Able to Activate All Users
  }
end


Given(/^Non-default Legal Entity Exists$/i) do
  steps %Q{
      Given I Have Logged In as a Company Admin
  }
  #check non-default legal entity exists
  @legal_entity = $daos.get_legal_entity_details_for_edit()

  unless @legal_entity
    puts COLOR_YELLOW + "no non-default legal entities to edit".upcase
    steps %Q{
      When  I go to Admin Settings
      And   I Go To Legal Entities under General section
      And   I Can Add A Legal Entity
      Then  I Should See That Legal Entity Is Successfully Added
    }
    puts COLOR_YELLOW + "non-default legal entity created".upcase
  end

  steps %Q{
          And   I Have Logged Out as a Company Admin
  }
end



