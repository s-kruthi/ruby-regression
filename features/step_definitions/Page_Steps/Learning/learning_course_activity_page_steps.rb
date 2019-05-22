def ClickOnLinkByText(link_text_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link_text_name))
end

def EnterInputFieldText(arg1, arg2)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(arg1, arg2))
end

def EnterDescriptionText(arg1, arg2)
  Sleep_Until(UseCkeditorToEnterText(arg1, arg2))
end