*** Settings ***
Resource            ../pages/login_bdd.resource
Resource            ../pages/ui_elements.robot

Test Setup          I am on the url 'https://www.pfizerpro.com/'
Test Teardown       Close browser


*** Variables ***
${PFIZERPRO_USER}                   testpfizer@pfizer.com
${PFIZERPRO_INVALID_PASSWORD}       this_is_an_invalid_password
${PFIZERPRO_PASSWORD}               Password@1


*** Test Cases ***
Scenario: Navigate to Products page through header
    When I click on '${menubar_products}'
    Then The page url is 'https://www.pfizerpro.com/products'
    When I click on '${product_list_firstB_HCPSite}'
    Then The url 'https://benefix.pfizerpro.com/' is opened in a new tab
    And There are '2' tabs currently opened

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

Scenario: Scroll to footer and check any text
    When I scroll to element '${footer_patient_link}'
    Then The element '${footer_patient_link}' text is 'Patient Assistance Programs'

Scenario: Navigate to link at the footer
    When I scroll to element '${footer_terms_of_use}'
    And I click on '${footer_terms_of_use}'
    Then The url 'https://www.pfizer.com/general/terms' is opened in a new tab
    Then There are '2' tabs currently opened

Scenario: Invalid User Login flow
    When I click on '${menubar_login}'
    And I set text '${PFIZERPRO_USER}' to field '${login_email_input}'
    And I set text '${PFIZERPRO_INVALID_PASSWORD}' to field '${login_password_input}'
    And I click on '${login_button}'
    Then The element '${login_invalid_msg}' text is 'Username and password doesnt match. Try again.'

Scenario: Login and logout flow
    When I click on '${menubar_login}'
    And I type text '${PFIZERPRO_USER}' in the input field '${login_email_input}'
    And I press 'Tab'
    And I type text '${PFIZERPRO_PASSWORD}' in the input field '${login_password_input}'
    And I press 'Tab'
    And I press 'Enter' focused over '${login_button}'
    Then The page is redirect to homepage
    And I expect that the title is 'Home | Pfizer For Professionals'
    When I click on '${logout_button}'
    Then The page url is 'https://www.pfizerpro.com/'



*** Keywords ***
The page is redirect to homepage
    Wait For Elements State    ${text_welcome_pfizer_pro}    visible
    