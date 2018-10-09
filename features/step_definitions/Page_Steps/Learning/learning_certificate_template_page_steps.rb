def EachRowIncludeValue(rows, search_value)
  result = true
  rows.each do |row|
    unless row.text.include?(search_value)
      result =  false
      break row
    end
  end
  return result
end


def SearchItemNoSelect2(search_box_css, search_value, search_btn_css)
  Sleep_Until(WaitForAnElementByCSSAndInputValue(search_box_css, search_value))
  Sleep_Until(WaitForAnElementByCSSAndTouch(search_btn_css))
end


def FillFieldsCreateCertTemp(cert_temp_name, edit='')
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_TITLE_FIELD_CSS, cert_temp_name + edit)
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_DESCRIPTION_CSS, 'description' + edit)
  WaitForAnElementByCSSAndTouch(TEMPLATE_LAYOUT_PORTRAIT_CSS)
  Sleep_Until(WaitForAnElementByIdAndTouch(SELECT_FILE_ID))
  Sleep_Until(WaitForSelectFileButtonAndUploadFile(PNG_FILE_NAME))
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_BACKGROUND_COLOUR_CSS, '#9bcbe5')
end


def FillFieldsEditCertTemp(cert_temp_name, edit='')
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_TITLE_FIELD_CSS, cert_temp_name + edit)
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_DESCRIPTION_CSS, 'description' + edit)
  WaitForAnElementByCSSAndTouch(TEMPLATE_LAYOUT_PORTRAIT_CSS)
  Sleep_Until(WaitForAnElementByCSSAndTouch(GLYPHICON_DELETE))
  Sleep_Until(PressEnterConfirm())
  Sleep_Until(WaitForAnElementByIdAndTouch(SELECT_FILE_ID))
  Sleep_Until(WaitForSelectFileButtonAndUploadFile(PNG_FILE_NAME))
  WaitForAnElementByCSSAndInputValue(CERT_TEMP_BACKGROUND_COLOUR_CSS, '#9bcbe5')
end


def CheckItemsInListAndSorted(table_title_array, sort)
  CheckTableHeader(expected_header_array,header_css)
  CheckArraySorted(sort)
end


def GetValuesByColumnFromTableByCSS(table_body_css, column_number)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element_rows = wait.until {$driver.find_element(:css, table_body_css).find_elements(:css, 'tr')}
  column_value_array = Array.new
  for i in 1..element_rows.size do
    column_cell_css =  "#elmo-table tbody tr:nth-child(#{i}) td:nth-child(#{column_number})"
    column_value = $driver.find_element(:css, column_cell_css).text
    column_value_array.push(column_value)
  end
  return column_value_array
end


def SortArray(arr, sort, datatype)
  if datatype.downcase.include?('time')
    arr = arr.map{|value| DateTime.strptime(value, '%d/%m/%Y %I:%M:%S %P')}
  end
  if sort.downcase.include?('asc')
    arr.sort
  elsif sort.downcase.include?('desc')
    arr.sort.reverse!
  end
  arr.map!{|value| value.strftime('%d/%m/%Y %I:%M:%S %P')}
end


def CreateCertTemplateWhenLess(item_to_create, number)
  templatenumber =  $daos.count_certificate_template
  jmeter_file = item_to_create.to_s.downcase.gsub(/\s/,'_') + '.jmx'
  # ToDo will use parameters in JMeter non-GUI mode for the loop count
  if templatenumber < number
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/#{jmeter_file} -Jserver=#{ENV['URL'] || ENV['url'] || 'tmsfull'}.dev.elmodev.com)
  end
end


def CheckTableHeader(expected_header_array,table_header_css)
  page_list_title = GetValidHeaderTitlesFromTableByCSS(table_header_css)
  if page_list_title.eql? expected_header_array
    puts COLOR_GREEN + "MATCHED: Table header as expected"
  else
    puts COLOR_RED + "Table header not as expected"
  end
end


def GetValidHeaderTitlesFromTableByCSS(table_header_css)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  element_columns = wait.until {$driver.find_element(:css, table_header_css).find_elements(:css, 'th')}
  header_array_raw = element_columns.map(&:text)
  return header_array_raw.select {|value| not value.empty?}
end