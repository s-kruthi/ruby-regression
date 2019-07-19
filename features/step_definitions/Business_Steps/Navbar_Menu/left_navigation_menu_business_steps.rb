When(/^I Am Viewing The Dashboard$/i) do
Sleep_Until(VerifyAnElementExists('xpath', DASHBOARD_ID[:title]))
end

Then(/^I Should Be Able To Click "([^"]*)" From Left Navigation Menu/i) do |arg|
  identifier = "//span[@class='menuitem-link__label'][contains(.,'#{arg}')]"
  Sleep_Until(WaitForAnElementByXpathAndTouch(identifier))
  #Using explicit sleep as the page is taking longer than expected to load up
  sleep 3
  Sleep_Until(VerifyAnElementExists('xpath', "//div[@style='font-size: 24px;'][contains(.,'#{arg}')]"))
end