Given(/^I Log In As A (.*)$/i) do |pr_login_name|
  startWebDriver
  GoToSite()

  case pr_login_name
  when "Prod Payroll Admin"
    begin
      Sleep_Until(ProvideUsername(PAYROLL_USER, PAYROLL_PROD_ADMIN_USER))
      Sleep_Until(ProvidePassword(PAYROLL_PSWD, PAYROLL_PROD_ADMIN_PWD))
      Sleep_Until(LoginToPayroll(PAYROLL_LOGIN))
    end
  when "Staging Payroll Admin"
    begin
      $driver.navigate.refresh
      sleep(5)
      Sleep_Until(ProvideUsername(PAYROLL_USER, PAYROLL_STAG_ADMIN_USER))
      Sleep_Until(ProvidePassword(PAYROLL_PSWD, PAYROLL_STAG_ADMIN_PWD))
      Sleep_Until(LoginToPayroll(PAYROLL_LOGIN))
    end
  end
end


And(/^I Navigate To The Dashboard Menu And Select ([^"]*)$/) do |menu|

  begin
    sleep(7)
    Sleep_Until(NavigateMenu(DASHBOARD_MENU))
    case menu
    when "Main Dashboard"
      begin
        Sleep_Until(NavigateMenu(MAIN_DASHBOARD))
      end
    when "Adhoc Dashboard"
      Sleep_Until(NavigateMenu(ADHOC_DASHBOARD))
    end
  end
end


And(/^I Navigate To The Workforce Menu And Select (.*)$/) do |submenu|
  sleep(3)
  puts $driver.title
  begin
    Sleep_Until(NavigateMenu(WORKFORCE_MENU))
    submenu_name = "//a[contains(.,'#{submenu}')]"
    case submenu
    when "Add Member"
      begin
        sleep(3)
        Sleep_Until(GoToAMenu(submenu_name))
      end
    when "Member Details"
      begin
        sleep(5)
        Sleep_Until(GoToAMenu(submenu_name))
      end
    end
  end
end