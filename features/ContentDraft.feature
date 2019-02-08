Feature: Content items creation
  As an administrator
  In order to menage content to my site
  I want to create, edit, copy and move content items.

  Background:
    Given I am logged as "admin"
    And I go to "Content structure" in "Content" tab

  @javascript @common
  Scenario: Content draft can be saved
    When I start creating a new content "Article"
    And I set content fields
      | label | value              |
      | Title | Test Article Draft |
    And I set article main content field to "Test article draft intro"
    And I click on the edit action bar button "Save"
    Then success notification that "Content draft saved." appears
    And I should be on "Content Update" "Test Article Draft" page
    And going to dashboard we see there's draft "Test Article Draft" on list

  @javascript @common
  Scenario: Content draft can be deleted
    Given going to dashboard we see there's draft "Test Article Draft" on list
    When I start editing content draft "Test Article Draft"
    And I set content fields
      | label | value                     |
      | Title | Test Article Draft edited       |
    And I set article main content field to "Test article draft intro edited"
    And I click on the edit action bar button "Delete draft"
    Then I should be on root container page in Content View
    And going to dashboard we see there's no draft "Test Article Draft edited" on list


  @javascript @common
  Scenario: Content draft can be published
    When I start creating a new content "Article"
    And I set content fields
      | label | value              |
      | Title | Test Article Draft |
    And I set article main content field to "Test article draft intro"
    And I click on the edit action bar button "Save"
    And I click on the edit action bar button "Publish"
    Then I should be on content container page "Test Article Draft" of type "Article" in root path
    And going to dashboard we see there's no draft "Test Article Draft" on list

  @javascript @common
  Scenario: Content edit draft can be deleted
    Given I navigate to content "Test Article Draft" of type "Article" in root path
    When I click on the edit action bar button "Edit"
    And I set content fields
      | label | value                     |
      | Title | Test Article Draft edited       |
    And I set article main content field to "Test article draft intro edited"
    And I click on the edit action bar button "Delete draft"
    Then I should be on content container page "Test Article Draft" of type "Article" in root path
    And going to dashboard we see there's no draft "Test Article Draft edited" on list

  @javascript @common
  Scenario: Content draft can be edited from dashboard
    Given I navigate to content "Test Article Draft" of type "Article" in root path
    And I click on the edit action bar button "Edit"
    And I set content fields
      | label | value                     |
      | Title | Test Article Draft edited       |
    And I set article main content field to "Test article draft intro edited"
    And I click on the edit action bar button "Save"
    And I click on the close button
    And going to dashboard we see there's draft "Test Article Draft edited" on list
    When I start editing content draft "Test Article Draft edited"
    Then I should be on "Content Update" "Test Article Draft edited" page

  @javascript @common
  Scenario: Content draft edition can be closed
    Given going to dashboard we see there's draft "Test Article Draft edited" on list
    When I start editing content draft "Test Article Draft edited"
    And I set content fields
      | label | value                      |
      | Title | Test Article Draft edited2       |
    And I set article main content field to "Test article draft intro edited2"
    And I click on the close button
    Then I should be on content container page "Test Article Draft" of type "Article" in root path

  @javascript @common
  Scenario: Content edit draft can be saved
    Given going to dashboard we see there's draft "Test Article Draft edited" on list
    When I start editing content draft "Test Article Draft edited"
    And I set content fields
      | label | value                      |
      | Title | Test Article Draft edited2       |
    And I set article main content field to "Test article draft intro edited2"
    And I click on the edit action bar button "Save"
    Then success notification that "Content draft saved." appears
    And I should be on "Content Update" "Test Article Draft edited2" page
    And going to dashboard we see there's draft "Test Article Draft edited2" on list

  @javascript @common
  Scenario: Content draft can be created and published through draft list modal
    Given I navigate to content "Test Article Draft" of type "Article" in root path
    When I click on the edit action bar button "Edit"
    And I start creating new draft from draft conflict modal
    And I set content fields
      | label | value                      |
      | Title | Test Article Draft edited3       |
    And I click on the edit action bar button "Publish"
    Then success notification that "Content published." appears
    And I should be on content container page "Test Article Draft edited3" of type "Article" in root path
    And content attributes equal
      | label | value                |
      | Title | Test Article Draft edited3 |
    And article main content field equals "Test article draft intro"

  @javascript @common
  Scenario: Content draft from draft list modal can be published
    Given I navigate to content "Test Article Draft edited3" of type "Article" in root path
    When I click on the edit action bar button "Edit"
    And I start editing draft with ID "4" from draft conflict modal
    And I set content fields
      | label | value                      |
      | Title | Test Article Draft edited4       |
    And I click on the edit action bar button "Publish"
    Then success notification that "Content published." appears
    And I should be on content container page "Test Article Draft edited4" of type "Article" in root path
    And content attributes equal
      | label | value                |
      | Title | Test Article Draft edited4 |
    And article main content field equals "Test article draft intro"
