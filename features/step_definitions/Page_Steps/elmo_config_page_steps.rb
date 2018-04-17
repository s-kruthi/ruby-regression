
def click_on_side_bar_item(config_section_item, config_section_name)
  Sleep_Until($driver.find_elements(:id, "#{config_section_item}-#{config_section_name}-button").first.click)
end

def click_on_side_bar_item_custom(config_section_item, config_section_name)
 $driver.find_element(:id, user_config_selection[:config_section_item])
end


def click_on_toggle_button(module_name, toggle_btn_name)
  Sleep_Until($driver.find_element(:id, module_name).find_element(:class, toggle_btn_name).click)
  sleep (1)
end

