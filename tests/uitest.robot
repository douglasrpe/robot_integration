*** Settings ***
Resource            ../pages/login_bdd.resource
Resource            ../pages/ui_elements.robot

Test Setup          I am on the url 'https://www.pfizerpro.com/'
Test Teardown       Close browser


*** Test Cases ***
Scenario: Navigate to Products page through header
    When I click on '${menubar_products}'
    Then The page url is 'https://www.pfizerpro.com/products'
    When I click on '${product_list_firstB_HCPSite}'
    Then There are '2' tabs currently opened
    #Then The url 'https://benefix.pfizerpro.com/' is opened in a new tab

Scenario: Navigate to Order sub menu through header
    When I hover over '${menubar_item_order}'
    And I click on '${menubar_order_materials}'
    Then The page url is 'https://www.pfizerpro.com/materials'
    When I click on '${explore_select_therapy_area}'
    And I select the value 'Acromegaly' from dropdown '${items_therapy_area}'
    And I click on '${explore_go_button}'
    Then I expect that the title is 'Materials | Acromegaly'

Scenario: Navigate to Pfizer Medical
    When I click on '${pfizer_medical_link}'
    Then The url 'https://pfizermedical.pfizerpro.com/' is opened in a new tab

Scenario: Navigate to Explore Contents -> Videos
    # When I scroll to element '${videos_page_button}'
    When I click on '${videos_page_button}'
    And I click on '${explore_select_therapy_area}'
    And I select the value 'Transthyretin Amyloid Cardiomyopathy' from dropdown '${items_therapy_area}'
    And I click on '${explore_go_button}'
    Then The page url is 'https://transthyretinamyloidcardiomyopathy.pfizerpro.com/videos'

