def GoToPositionsUnderCareersTab(careers_tab,index_value,positions_link)
  sleep(3)
  WaitForAnElementByIdAndTouchTheIndex(careers_tab,index_value)
  sleep(3)
  WaitForAnElementByPartialLinkTextAndTouch(positions_link)
end

class SortingException < Exception;

end

def WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
  sleep(2)
  #get the element list of positions on the first page
  pos_items = $driver.find_elements(:tag_name, "tr")[1..10]
  sleep(2)
  #get the text for actual positions in that list
  compare_pos_items = pos_items.map { |list| list.text.split("\nCompare")}
  #compare the listed positions with the sorted positions
  new_pos_items = compare_pos_items.sort
  if
         (compare_pos_items == new_pos_items) == true
      puts "PASSED,SORTED ALPHABETICALLY!"

  else
    raise SortingException.new("FAILED! Not sorting alphabetically")

  end
end


def SearchForAPositionAndVerifyTheResult(search_field,search_value,search_btn,search_result)
  sleep(1)
  WaitForAnElementByIdAndInputValue(search_field,search_value)
  Wait_For(3)
  WaitForAnElementByIdAndTouch(search_btn)
  VerifyAnElementExistByXPath(search_result,search_value)
end

def SelectAndSearchInterestedPositionsFromTheDropdown(positions_dropdown_ID,dropdown_result_class, index_value)
  sleep(1)
  WaitForAnElementByIdAndTouch(positions_dropdown_ID)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_result_class, index_value)
end


def SelectAndSearchSuggestedPositionsFromTheDropdown(positions_dropdown_ID,dropdown_result_class, index_value)
  sleep(1)
  WaitForAnElementByIdAndTouch(positions_dropdown_ID)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_result_class, index_value)
end

def ValidateTheSearchResultReturnsTheInterestedPosition(interested_pos_path, interested_pos_value)
  VerifyAnElementExistByXPath(interested_pos_path, interested_pos_value)
end

def ValidateTheSearchReturnsNextTwoSuggestedPositions(suggested_pos_path1,suggested_pos_value1,suggested_pos_path2,suggested_pos_value2)
  VerifyAnElementExistByXPath(suggested_pos_path1, suggested_pos_value1)
  VerifyAnElementExistByXPath(suggested_pos_path2, suggested_pos_value2)
end

