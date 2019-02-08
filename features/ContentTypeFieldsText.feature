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
      | ezrichtext           | Rich text                    | value     | Lorem ipsum dolor sit     |            |                       |         |          | Lorem ipsum dolor sit     |
      | eztext               | Text block                   | value     | Lorem ipsum dolor         |            |                       |         |          | Lorem ipsum dolor         |
      | ezstring             | Text line                    | value     | Lorem ipsum               |            |                       |         |          | Lorem ipsum               |

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
      | Rich text                    | value     | Edited Lorem ipsum dolor sit |            |                          |         |          | Lorem ipsum dolor sit     | Edited Lorem ipsum dolor sit |
      | Text block                   | value     | Edited Lorem ipsum dolor     |            |                          |         |          | Lorem ipsum dolor         | Edited Lorem ipsum dolor     |
      | Text line                    | value     | Edited Lorem ipsum           |            |                          |         |          | Lorem ipsum               | Edited Lorem ipsum           |
      