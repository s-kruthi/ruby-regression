@Recruitment @admin_setups

Feature:
  I want to be able to setup recruitment related flows as an Admin


  @interviewguideSetup
  Scenario: SetUp A New Interview guide With Question Weightage And Publish It
  Given I Am Under A Recruitment Interview Guide Section
  And  I Create Up A New Interview Guide
  When I Add Sections And Questions With Proper Weightage
  Then I Should Be Able To Publish It