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
      | ezselection          | Selection                    | value     | Test-value                |            |                       |         |          | Test-value                |
      | ezgmaplocation       | Map location                 | latitude  | 32                        | longitude  | 132                   | address | Acapulco | Acapulco                  |
      | ezauthor             | Authors                      | name      | Test Name                 | email      | email@example.com     |         |          | Test Name                 |
      | ezboolean            | Checkbox                     | value     | true                      |            |                       |         |          | 1                         |
      | ezobjectrelation     | Content relation (single)    | value     | Media/Images              |            |                       |         |          | Images                    |
      | ezobjectrelationlist | Content relations (multiple) | firstItem | Media/Images              | secondItem | Media/Files           |         |          | Images Files              |
      | ezcountry            | Country                      | value     | Poland                    |            |                       |         |          | Poland                    |

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
      | Selection                    | value     | Bielefeld                    |            |                          |         |          | Test-value                | Bielefeld                    |
      | Map location                 | latitude  | 56                           | longitude  | 101                      | address | Ohio     | Acapulco                  | Ohio                         |
      | Authors                      | name      | Test Name Edited             | email      | edited.email@example.com |         |          | Test Name                 | Test Name Edited             |
      | Checkbox                     | value     | false                        |            |                          |         |          | 1                         | 0                            |
      | Content relation (single)    | value     | Media/Files                  |            |                          |         |          | Images                    | Files                        |
      | Content relations (multiple) | firstItem | Users/Editors                | secondItem | Media/Multimedia         |         |          | Images Files              | Editors Multimedia           |
      | Country                      | value     | Sweden                       |            |                          |         |          | Poland                    | Sweden                       |
