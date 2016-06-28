def GoToPositionsUnderCareersTab(careers_tab,positions_link)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(careers_tab)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(positions_link)
end

class SortingException < Exception;
end

def WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
    pos_items = $driver.find_elements(:tag_name, "tr")[1..10]
  compare_pos_items = pos_items.map { |list| list.text.split("\nCompare")}
  new_pos_items = compare_pos_items.sort
  if
      (compare_pos_items == new_pos_items) == true
  else
    raise SortingException.new("Sorting does not exist!")
   end


end
