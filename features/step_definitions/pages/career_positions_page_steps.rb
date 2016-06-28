
def GoToPositionsUnderCareersTab(careers_tab,positions_link)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(careers_tab)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(positions_link)
end

def WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
  #get the element list of positions on the first page
  pos_items = $driver.find_elements(:tag_name, "tr")[1..10]
  #get the text for actual positions in that list
  compare_pos_items = pos_items.map { |list| list.text.split("\nCompare")}
  #compare the listed positions with the sorted positions
  new_pos_items = compare_pos_items.sort
  if
         (compare_pos_items == new_pos_items) == true
      puts "PASSED,SORTED ALPHABETICALLY!"

  else
       #doing this just to fail this scenario as ruby wont fail , need to find a long term solution
       puts "FAILED  Because the list is not sorted alphabetically"
       $driver.find_element()
  end
end


def SearchForAPositionAndVerifyTheResult(search_field,search_value,search_btn,search_result)
  sleep(1)
  WaitForAnElementByIdAndInputValue(search_field,search_value)
  Wait_For(3)
  WaitForAnElementByIdAndTouch(search_btn)
  VerifyAnElementExistByXPath(search_result,search_value)
end

