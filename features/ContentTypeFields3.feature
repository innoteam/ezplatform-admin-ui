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
      | eztext               | Text block                   | value     | Lorem ipsum dolor         |            |                       |         |          | Lorem ipsum dolor         |
      | ezstring             | Text line                    | value     | Lorem ipsum               |            |                       |         |          | Lorem ipsum               |
      | eztime               | Time                         | value     | 14:45                     |            |                       |         |          | 2:45:00 pm                |
      | ezurl                | URL                          | text      | Test URL                  | url        | http://www.google.com |         |          | Test URL                  |
      | ezmedia              | Media                        | value     | video1.mp4.zip            |            |                       |         |          | video1.mp4                |
      | ezimage              | Image                        | value     | image1.png.zip            |            |                       |         |          | image1.png                |
      | ezbinaryfile         | File                         | value     | binary1.txt.zip           |            |                       |         |          | binary1.txt               |

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
      | Text block                   | value     | Edited Lorem ipsum dolor     |            |                          |         |          | Lorem ipsum dolor         | Edited Lorem ipsum dolor     |
      | Text line                    | value     | Edited Lorem ipsum           |            |                          |         |          | Lorem ipsum               | Edited Lorem ipsum           |
      | Time                         | value     | 15:15                        |            |                          |         |          | 2:45:00 pm                | 3:15:00 pm                   |
      | URL                          | text      | Edited Test URL              | url        | http://www.ez.no         |         |          | Test URL                  | Edited Test URL              |
      | Media                        | value     | video2.mp4.zip                   |            |                          |         |          | video1.mp4                | video2.mp4                   |
      | Image                        | value     | image2.png.zip                   |            |                          |         |          | image1.png                | image2.png                   |
      | File                         | value     | binary2.txt.zip                  |            |                          |         |          | binary1.txt               | binary2.txt                  |
