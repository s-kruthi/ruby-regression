
def GoToPositionsUnderCareersTab(careers_tab,positions_link)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(careers_tab)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(positions_link)
end

def WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
  #get the element list of positions
    pos_items = $driver.find_elements(:tag_name, "tr")[1..10]
#get the text for actual positions i that list
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