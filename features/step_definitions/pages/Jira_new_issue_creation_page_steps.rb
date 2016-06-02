
def GoToTheLoginPage(jira_login_page)
  $driver.navigate.to(jira_login_page)
end

def EnterUsername(username)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  select_username = wait.until {
    element = $driver.find_element(:id, 'username')
    element if element.displayed?
  }
  select_username.send_keys username
end

def EnterPassword(password)
  element = $driver.find_element(:id, 'password')
  element.send_keys password
end

def LogInAndWaitForTheDashboard()
  element = $driver.find_element(:id, 'login-submit')
  element.click
  puts $driver.title
end

def GoToCreateNewIssueScreenByClickingOnCreateTab(create)
  WaitForAnElementByIdAndTouch(create)
  puts"shan"
end

def CreateNewIssueWithATitle(title)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  select_menu = wait.until {
    element = $driver.find_element(:id, 'summary')
    element if element.displayed?
  }
  select_menu.send_keys title
  element = $driver.find_element(:id, 'create-issue-submit')
  element.click
  puts "New issue Created"
end

def WaitForAToastUponSuccessfulCreation()
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  select_menu = wait.until {
    element = $driver.find_element(:id, 'create_link')
    element if element.displayed?
  }
  select_menu.send_keys ""
  toast = $driver.find_elements(:xpath, '/html/body/div[1]/div/div').size == 0
end

def GoToIssuesTabFromToolBar()
  $driver.navigate.refresh
  element = $driver.find_element(:id, 'find_link').click
end

def TouchSearchForIssuesOption()
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  select_menu = wait.until {
    element = $driver.find_element(:id, 'issues_new_search_link_lnk')
    element if element.displayed?
  }
  select_menu.click
end

def SearchForAllIssuesByClickingOnTheLinkText()
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  select_link = wait.until {
    element = $driver.find_element(:link_text, 'All Issues')
    element if element.displayed?
  }
  select_link.click
  $driver.navigate.refresh
end

def VerifyCreatedIssueAppearsOnTheTopOfTheList(expected_text)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element = wait.until {element = $driver.find_element(:id, 'summary-val').text.include? expected_text }
end

def ClickOnTheNewIssueAndGoToTheSummaryScreen()
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  select_link = wait.until {
    element = $driver.find_element(:xpath, '/html/body/div[1]/section/div[1]/div[4]/div/div/div/div/div/div[2]/div/div/header/div/header/div/div[2]/ol/li[2]/a')
    element if element.displayed?
  }
  select_link.click
end

def PrintTheNewlyCreatedIssueTitleAndLogout()
  #this will print the created issue no.
  puts $driver.title

  element = $driver.find_element(:id, 'header-details-user-fullname').click
  element = $driver.find_element(:id, 'log_out').click
  $driver.quit

end

