*** Settings ***
Resource        ../pages/login_bdd.resource
Resource        ../pages/ui_elements.robot

Suite Setup     I am on the url 'https://www.pfizerpro.com/'


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
    When I click on '${materials_select_therapy_area}'
    And I select the value 'Acromegaly' from dropdown '${items_therapy_area}'
    And I click on '${materials_go_button}'
    Then I expect that the title is 'Materials | Acromegaly'
    
