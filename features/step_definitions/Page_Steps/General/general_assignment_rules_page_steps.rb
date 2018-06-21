def SearchTheAssignmentRule(enrolment_rule_id,enrolment_rule_value,search_enter)
  WaitForAnElementByIdAndInputValue(enrolment_rule_id,enrolment_rule_value)
  WaitForAnElementByCSSAndTouch(search_enter)
  sleep(2)
end


def DeactivateTheSearchedAssignment()
  Sleep_Until($driver.find_elements(:css, 'button[data-toggle="dropdown"]' )[0].click)
  Sleep_Until($driver.find_elements(:css, 'a[title="Deactivate"]' )[0].click)
  Sleep_Until($driver.find_element(:id, 'confirm-button').click)
  sleep(6)
end


def ReActivateTheSearchedAssignment()
  $driver.find_element(:css, 'option[value="2"]').click
  Sleep_Until($driver.find_elements(:css, 'button[data-toggle="dropdown"]' )[0].click)
  sleep(1)
  Sleep_Until($driver.find_elements(:css, 'a[title="Activate"]' )[0].click)
  sleep(1)
  Sleep_Until($driver.find_element(:id, 'confirm-button').click)
  sleep(6)
end


def ClickOnAButtonByLastIndex(button_id)
  $driver.find_elements(:xpath, button_id).last.click
end


def ClickOnSelect2MultiSelectDropDownAndInputValue(first_element_id, element_input_value)
  Sleep_Until($driver.find_element(:class, first_element_id).find_element(:class, SELECT2_DROPDOWN_ID).send_keys(element_input_value))
  Sleep_Until($driver.find_elements(:class, SELECT2_DROPDOWN_RESULT_CLASS).last.click)
end
