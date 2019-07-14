When(/^I Am Viewing Dashboard$/i) do
Sleep_Until(VerifyAnElementExists('xpath', DASHBOARD_ID[:title]))
end

Then(/^I Should Be Able To Click "([^"]*)" From Left Navigation Menu/i) do |arg|
  identifier = "//span[@class='menuitem-link__label'][contains(.,'#{arg}')]"
  Sleep_Until(WaitForAnElementByXpathAndTouch(identifier))
  sleep 3 #Using explicit sleep as the page is taking longer than expected to load up
  Sleep_Until(VerifyAnElementExists('xpath', "//div[@style='font-size: 24px;'][contains(.,'#{arg}')]"))
end