def CheckLegalEntityEnabled()

  enabled = $daos.get_epms_config_enabled('legalEntityEnable')

  if !enabled.nil?
    expect(enabled[:value]).to eq('1')
  else
    puts COLOR_BLUE + 'Legal Entity is not enabled for this site'
    skip_this_scenario
  end
end

def random_abn()
    weights = [10,1,3,5,7,9,11,13,15,17,19]
    reversed_weights = weights.reverse
    initial_numbers = []
    final_numbers = []
    9.times {initial_numbers << rand(9)+1}
    initial_numbers = [rand(8)+1, rand(7)+2] + initial_numbers
    products = []
    weights.each_with_index do |weight, index|
      products << weight * initial_numbers[index]
    end
    product_sum = products.inject(0){|sum, value| sum + value}
    remainder = product_sum % 89
    if remainder == 0
      final_numbers = initial_numbers
    else
      current_remainder = remainder
      reversed_numbers = initial_numbers.reverse
      reversed_weights.each_with_index do |weight, index|
        next if weight > current_remainder
        if reversed_numbers[index] > 0
          reversed_numbers[index] -= 1
          current_remainder -= weight
          if current_remainder < reversed_weights[index+1]
            redo
          end
        end
      end
      final_numbers = reversed_numbers.reverse
    end
    final_numbers[0] += 1
    final_numbers.join
    return final_numbers.join.to_i
end


def AddLegalEntity()
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEGAL_ENTITY_ADD_ID))

  #check db for abn is not in use
  begin
    @abn_num = random_abn()
    exists = $daos.check_legal_entity_exists(@abn_num)
  end until exists[:presence] == 0

  #Entering mandatory details
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ABN_ID, @abn_num))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_BUS_NAME_ID, LEGAL_ENTITY_BUS_NAME + Time.now.strftime("%Y%m%d%H%M%S")))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ADDR1_ID, LEGAL_ENTITY_ADDR1))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_SUBURB_ID, LEGAL_ENTITY_SUBURB))

  Sleep_Until(SelectFromDropdown(LEGAL_ENTITY_STATE_DROPDOWN_ID, LEGAL_ENTITY_STATE))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_POSTCODE_ID, LEGAL_ENTITY_POSTCODE))

  Sleep_Until(SelectFromDropdown(LEGAL_ENTITY_COUNTRY_DROPDOWN_ID, LEGAL_ENTITY_COUNTRY))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_CONTACTNAME_ID, LEGAL_ENTITY_CONTACTNAME))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_EMAIL_ID, LEGAL_ENTITY_EMAIL))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_PHONE_ID, LEGAL_ENTITY_TEL))

  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
end


def EditLegalEntity()
  #get non-default legal entity to edit
  @legal_entity = $daos.get_legal_entity_details_for_edit()

  puts COLOR_BLUE + "Editing entity "+ @legal_entity[:business_name]

  SearchToEdit(@legal_entity)

  #edit contact name and save
  ClearField('id', LEGAL_ENTITY_CONTACTNAME_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_CONTACTNAME_ID, 'Automated Edit'))
  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
end

def SearchToEdit(legal_entity)
  #search and click to edit
  Sleep_Until(WaitForAnElementByIdAndInputValue(SEARCH_FIELD_ID, legal_entity[:business_name]))
  Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  $driver.find_element(:xpath, '//a[@href="/admin/legal-entity/edit/'+legal_entity[:id].to_s+'"]').click
end


def CheckAndSetDefault(identifier)
  default = $driver.find_element(:id, identifier).selected?

  if default == true
    puts COLOR_BLUE + "Entity is set to Default".upcase
  else
    JavascriptClick(identifier)
    puts COLOR_BLUE + "Entity has now been set to Default".upcase
  end
end


def CheckPageDisplay()
  @legal_entity = $daos.get_legal_entity_details()

  puts @legal_entity

  #search and click to edit
  Sleep_Until(WaitForAnElementByIdAndInputValue(SEARCH_FIELD_ID, @legal_entity[:business_name]))
  Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))

  #checks business name is displayed correctly
  expect($driver.find_element(:xpath, '//a[@href="/admin/legal-entity/edit/'+@legal_entity[:id].to_s+'"]').text).to eq(@legal_entity[:business_name])

  #checks ABN is displayed correctly
  expect($driver.find_element(:xpath, '//span[contains(.,"'+@legal_entity[:business_name]+'")]//../following-sibling::td[1]').text).to eq(@legal_entity[:abn])

  #Check for Default on page
  if @legal_entity[:is_default] == 1
    puts COLOR_BLUE + "Entity is set as default".upcase
    #check for tick mark
    expect($driver.find_element(:xpath, '//span[contains(.,"'+@legal_entity[:business_name]+'")]//../following-sibling::td[2]/span').attribute('class')).to eq('glyphicon glyphicon-ok')
  else
    puts COLOR_BLUE + "Entity is not set as default".upcase

    #checks that no tick mark
    VerifyAnElementNotExist('xpath', '//span[contains(.,"'+@legal_entity[:business_name]+'")]//../following-sibling::td[2]/span')
  end

  #Check for Active on page
  if @legal_entity[:is_active] == 1
    puts COLOR_BLUE + "Entity is active".upcase

    #check for tick mark
    expect($driver.find_element(:xpath, '//span[contains(.,"'+@legal_entity[:business_name]+'")]//../following-sibling::td[3]/span').attribute('class')).to eq('glyphicon glyphicon-ok')
  else
    puts COLOR_BLUE + "Entity is inactive".upcase

    #checks that no tick mark
    VerifyAnElementNotExist('xpath', '//span[contains(.,"'+@legal_entity[:business_name]+'")]//../following-sibling::td[3]/span')
  end
end


def VerifyABNLookup()
  sleep(4)
  field_value = $driver.find_element(:id, 'legal_entity_businessName').attribute('value')
  expect(field_value).to eq('SCIENTIFIC INSTRUMENT MANUFACTURING & REPAIR CO')
end


def EnterExisitingEntityDetails()
  @legal_entity = $daos.get_legal_entity_details()

  #Entering mandatory details
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ABN_ID, @legal_entity[:abn]))

  # #clear field as abn lookup will populate the field
  # ClearField('id', LEGAL_ENTITY_BUS_NAME_ID)
  # Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_BUS_NAME_ID, LEGAL_ENTITY_BUS_NAME + Time.now.strftime("%Y%m%d%H%M%S")))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ADDR1_ID, LEGAL_ENTITY_ADDR1))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_SUBURB_ID, LEGAL_ENTITY_SUBURB))

  Sleep_Until(SelectFromDropdown(LEGAL_ENTITY_STATE_DROPDOWN_ID, LEGAL_ENTITY_STATE))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_POSTCODE_ID, LEGAL_ENTITY_POSTCODE))

  Sleep_Until(SelectFromDropdown(LEGAL_ENTITY_COUNTRY_DROPDOWN_ID, LEGAL_ENTITY_COUNTRY))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_CONTACTNAME_ID, LEGAL_ENTITY_CONTACTNAME))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_EMAIL_ID, LEGAL_ENTITY_EMAIL))

  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_PHONE_ID, LEGAL_ENTITY_TEL))

  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
end


def EditLegalEntityLinkedToUser()
  @legal_entity = $daos.get_legal_entity_details_linked_to_user()

  SearchToEdit(@legal_entity)

  #set active toggle to No
  JavascriptClick(LEGAL_ENTITY_ISACTIVE_ID)

  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
end

