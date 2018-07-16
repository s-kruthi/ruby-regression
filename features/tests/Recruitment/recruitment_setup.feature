@recruitment @requisition

#@RecruitmentTestRailTags
#
#@RecruitmentTestRailTags
Feature:
  I want to be able to create a New Requisition Request

  @add_requisition @recruitment_high_risk
  Scenario: [Recruitment]Create a Requisition
    Given I Have Logged In as a Recruitment Admin
    And I Go To The Menu Recruitment Section
    When  I Click on New Requisition Button
    And   I Enter New Requisition Details
    Then  I Should Be Able To Create A New Requisition Request

  @add_candidate @recruitment_high_risk
  Scenario: [Recruitment]Create a New Candidate for Recruitment
    Given I Have Logged In as a Recruitment Admin
    And I Go To The Recruitment Candidates Section
    When I Click on New Candidate Button
    And I Enter New Candidate Details
    And I Click on The Save Button
    Then I Should Be Able To Create A New Candidate

  @CreateJobAdd @recruitment_high_risk
  Scenario: [Recruitment]Add A Job Ad
    Given I Am Under A Recruitment Requisition
    And  I Try To Create A New Job Ad
    When I Fill The Details Of A New Job Ad
    Then I Should be Able To Post The New Job

 @movecandidate @recruitment_high_risk
  Scenario: [Recruitment]Move Candidate To Not Suitable category
    Given I Am Under A Recruitment Requisition
    And I Have A New candidate Applied for A Position
   When I Move The Candidate From New To Notsuitable Category
   Then I Should Be Able To View The Candidate Under Unsuccessful Category


  #Currently can be run only on ningning01
  @recruitment_low_risk @candidate_email_vendor_cc @C16610
  Scenario: [Recruitment]Vendor Emailid In CCfield Of Email To Candidate
   Given I Have Logged In as a Recruitment Admin
   And I Go To The Menu Recruitment Section
   And I Click On "Open Requisitions" Tab
   And I Search For A Specific Requisition Having Vendor Added Candidates
   And I Click On The Specific Requisition
   When I Search For The Vendor Submitted Candidate
   And I Choose To Send Email To The Candidate
   Then I Can See The Vendor EmailId In The CC Field By Default


  #Currently can be run only on ningning01
  @recruitment_low_risk @candidate_offer_vendor_cc @C16612
  Scenario: [Recruitment]Vendor Emailid In CCfield Of Offer To Candidate
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Specific Requisition Having Vendor Added Candidates
    And   I Click On The Specific Requisition
    When  I Search For The Vendor Submitted Candidate
    And   I Choose To Make an Offer To The Candidate
    And   I Can See The Vendor EmailId In The CC Field By Default


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_add_note
  Scenario: [Recruitment]Ability To Add Notes To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Requisition Having No Notes
    And   I Click On The Specific Requisition
    And   I Go To The Requisition Overview Page
    When  I Click On Add New Requisition Note Button
    And   I Enter The Requisition Note
    Then  I Should See The Note In The Requisition


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note
  Scenario: [Recruitment]Ability To Add Notes To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Requisition Having Notes
    And   I Click On The Specific Requisition
    When   I Go To The Requisition Overview Page
    Then  I Should See The Edit Button For The Note
    And   I Should See The Delete Button For The Note
    And   I Should Not See The Add Note Button For The Note
    And   I Should See The Last Updated Details


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note_edit
  Scenario: [Recruitment]Ability To Edit Notes Added To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Requisition Having Notes
    And   I Click On The Specific Requisition
    When  I Go To The Requisition Overview Page
    And   I Click On Edit Requisition Note Button
    And   I Should Be Able To Edit The Requisition Note
    Then  I Should See The Last Updated Details


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note_delete
  Scenario: [Recruitment]Ability To Delete Notes Added To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Requisition Having Notes
    And   I Click On The Specific Requisition
    When  I Go To The Requisition Overview Page
    And   I Click On Delete Requisition Note Button
    And   I Confirm The Deletion Of The Requisition Note
    Then  I Should See The Deletion Success Message


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note_view_only
  Scenario: [Recruitment]Ability To Only View Notes Added To A Finalised/Withdrawn Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Finalised Requisition Having Notes
    And   I Click On The Specific Requisition
    When  I Go To The Requisition Overview Page
    Then  I Should Be Able To Only View The Requisition Note


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note_view
  Scenario: [Recruitment]Ability To View Notes Added To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Open Requisitions" Tab
    And   I Search For A Finalised Requisition Having Notes
    When  I Choose To View Requisition Details For The Requisition
    Then  I Should Be Able To View The Requisition Note In the Modal


  #Currently can be run only on ningning01
  @recruitment_low_risk @requisition_note_view
  Scenario: [Recruitment]Ability To View Notes Added To A Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I Go To The Menu Recruitment Section
    And   I Click On "Approval" Tab
    When  I Search For A Pending Requisition Having Notes
    And   I View The Requisition For Approval
    Then  I Should Be Able To View The Requisition Note In The Page






