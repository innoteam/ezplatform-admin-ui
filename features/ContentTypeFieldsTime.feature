Feature: Content fields setting and editing
  As an administrator
  In order to manage content on my site
  I want to set, edit, copy and move content items.

  @javascript @common @EZP-29291-excluded @fieldTypes
  Scenario Outline: Create content item with given field
    Given a Content Type "<fieldName> CT" with an "<fieldInternalName>" field definition
    And I am logged as "admin"
    And I go to "Content structure" in "Content" tab
    When I start creating a new content "<fieldName> CT"
    And I set content fields
      | label    | <label1> | <label2> | <label3> |
      | Field    | <value1> | <value2> | <value3> |
    And I click on the edit action bar button "Publish"
    Then I should be on content item page "<contentItemName>" of type "<fieldName> CT" in root path
    And success notification that "Content published." appears
    And content attributes equal
      | label    | <label1> | <label2> | <label3> |
      | Field    | <value1> | <value2> | <value3> |

    Examples:
      | fieldInternalName    | fieldName                    | label1    | value1                    | label2     | value2                | label3  | value3   | contentItemName           |
      | ezdate               | Date                         | value     | 11/23/2019                |            |                       |         |          | Saturday 23 November 2019 |
      | ezdatetime           | Date and time                | date      | 11/23/2019                | time       | 14:45                 |         |          | Sat 2019-23-11 14:45:00   |
      | eztime               | Time                         | value     | 14:45                     |            |                       |         |          | 2:45:00 pm                |

  @javascript @common @EZP-29291-excluded @fieldTypes
  Scenario Outline: Edit content item with given field
    Given I am logged as "admin"
    And I navigate to content "<oldContentItemName>" of type "<fieldName> CT" in root path
    When I click on the edit action bar button "Edit"
    And I set content fields
      | label    | <label1> | <label2> | <label3> |
      | Field    | <value1> | <value2> | <value3> |
    And I click on the edit action bar button "Publish"
    Then I should be on content item page "<newContentItemName>" of type "<fieldName> CT" in root path
    And success notification that "Content published." appears
    And content attributes equal
      | label    | <label1> | <label2> | <label3> |
      | Field    | <value1> | <value2> | <value3> |

    Examples:
      | fieldName                    | label1    | value1                       | label2     | value2                   | label3  | value3   | oldContentItemName        | newContentItemName           |
      | Date                         | value     | 12/30/2019                   |            |                          |         |          | Saturday 23 November 2019 | Monday 30 December 2019      |
      | Date and time                | date      | 12/30/2019                   | time       | 15:15                    |         |          | Sat 2019-23-11 14:45:00   | Mon 2019-30-12 15:15:00      |
      | Time                         | value     | 15:15                        |            |                          |         |          | 2:45:00 pm                | 3:15:00 pm                   |
