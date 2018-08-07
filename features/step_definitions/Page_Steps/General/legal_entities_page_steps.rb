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
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ABN_ID, @abn_num))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_BUS_NAME_ID, LEGAL_ENTITY_BUS_NAME + Time.now.strftime("%Y%m%d%H%M%S")))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ADDR1_ID, LEGAL_ENTITY_ADDR1))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_SUBURB_ID, LEGAL_ENTITY_ADDR1))
  Sleep_Until(SelectFromDropDown(LEGAL_ENTITY_STATE_DROPDOWN_ID, 'Victoria'))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_POSTCODE_ID, '3003'))
  Sleep_Until(SelectFromDropDown(LEGAL_ENTITY_COUNTRY_DROPDOWN_ID, 'India'))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_CONTACTNAME_ID, '3003'))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_EMAIL_ID, 'test@test.com'))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_PHONE_ID, '0123456789'))
  # $driver.find_element(:id,LEGAL_ENTITY_ISACTIVE_ID).selected?
  # $driver.find_element(:id,LEGAL_ENTITY_ISDEF_ID).selected?
  # identifier = LEGAL_ENTITY_ISACTIVE_ID
  #
  # $driver.execute_script("$(#{identifier}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
end


def EditLegalEntity()
  @legal_entity = $daos.get_legal_entity_details()
  Sleep_Until(WaitForAnElementByIdAndInputValue(SEARCH_FIELD_ID, @legal_entity[:business_name]))
  Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  id = @legal_entity[:id]
  byebug
  $driver.find_element(:xpath, '//a[@href="/admin/legal-entity/edit/#{id}"]')
  byebug

end
