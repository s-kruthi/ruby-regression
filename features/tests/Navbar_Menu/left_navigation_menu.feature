@general @navigation_menu

Feature:
As An Authenticated User, I want To Be Able to Successfully Navigate The New Left Navigation Menu

  @navigation_menu_left
   Scenario Outline: As A User, I Want To Be Able To Use Left Navigation Menu
      Given I Have Logged In As A Company Admin
      When  I Am Viewing Dashboard
      Then  I Should Be Able To Click "<left_navigation_menu_item>" From Left Navigation Menu

    Examples:
    |left_navigation_menu_item  |
    |Home                       |
    |Profile                    |
    |My Team                    |
    |Learning                   |
    |Leave                      |
    |Documents                  |
    |Performance                |
    |Recruitment                |
    |Careers                    |
    |Calender                   |
    |Reports                    |