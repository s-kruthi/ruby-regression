def ClickOnLinkByText(link_text_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link_text_name))
end