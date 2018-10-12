When(/^I Make Changes To Legal Entity$/i) do
  steps %{
    And   I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Can Edit A Legal Entity
    Then  I Should See That Legal Entity Is Updated Successfully
  }
end


And(/^I Send Company Data To Elmo Payroll$/i) do
  steps %{
  And   I Go To The Menu Payroll Section}
end


Then(/^The Company Data Should Be Sent Successfully$/i) do

  #Click the Send Data button to send data to Elmo Payroll
  Sleep_Until(WaitForAnElementByXpathAndTouch("//button[@ng-click='listVm.executeJob()']"))

  export_date_epoch = Time.now.to_i

  #cpaturing the export date and time to check the log file
  export_date = Time.at(export_date_epoch).strftime('%d/%m/%Y %H:%M')

  puts COLOR_BLUE + "Check Record/Log file for Exported Date: " + export_date

  sleep(10)

  Sleep_Until(VerifyAnElementExists('xpath','//a[@title="Dismiss"]'))
end


And(/^All The Necessary Details Of The Employee Required For Payroll Are Added$/i) do
  SetEmployeeProfileDetails()
  steps %{
    And   I Click On "Users" Breadcrumb Menu
    And   I Search For A Specific User named #{@@user_name}
    And   I Edit The User's Employment Details Section}
  SetEmployeeEmploymentDetails()
  SetSuperDetails()
end



