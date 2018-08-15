Given(/^I Log In As A (.*)$/i) do |pr_login_name|
  startWebDriver
  GoToSite()

  case pr_login_name
  when "Prod Payroll Admin"
    begin
      ProvideUsername(PAYROLL_USER, PAYROLL_PROD_ADMIN_USER)
      ProvidePassword(PAYROLL_PSWD, PAYROLL_PROD_ADMIN_PWD)
      LoginToPayroll(PAYROLL_LOGIN)
    end
  when "Staging Payroll Admin"
    begin
      ProvideUsername(PAYROLL_USER, PAYROLL_STAG_ADMIN_USER)
      ProvidePassword(PAYROLL_PSWD, PAYROLL_STAG_ADMIN_PWD)
      LoginToPayroll(PAYROLL_LOGIN)
    end
  end
end


And(/^I Navigate To The Dashboard Menu and select "([^"]*)"$/) do |menu|

  begin
    Sleep_Until(NavigateMenu(DASHBOARD_MENU))
    case menu
    when "Main Dashboard"
      begin
        Sleep_Until(NavigateMenu(MAIN_DASHBOARD))
      end
    when "Adhoc Dashboard"
      NavigateMenu(ADHOC_DASHBOARD)
    end
  end
end


And(/^I navigate To the Workforce Menu and select "([^"]*)"$/) do |submenu|
  Wait_For(5)
  puts $driver.title
  begin
    NavigateMenu(WORKFORCE_MENU)
    case submenu
    when "Add Member"
      begin
        Wait_For(5)
        submenu_name = "//a[contains(.,'#{submenu}')]"
        GoToAMenu(submenu_name)
      end
    when "Member Details"
      begin
        Wait_For(3)
        submenu_name = "//a[contains(.,'#{submenu}')]"
        GoToAMenu(submenu_name)
      end
    end
  end
end