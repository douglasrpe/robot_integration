*** Settings ***
Library     Browser
Library     String
Resource    ../utils/browser_extended.robot


*** Keywords ***
I am on the url '${page_url}'
    Set Browser Timeout    40s
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${page_url}
    Set Strict Mode    False
    Set Browser Timeout    10s
    Sleep    5

I click on '${selector}'
    # It tries to click using the virtual mouse, if fails, tries to click using javascript
    TRY
        Click    ${selector}
    EXCEPT
        Click Javascript    ${selector}
    END
    TRY
        Wait Until Network Is Idle    timeout=10s
    EXCEPT
        Log    The page is still loading in background even after 10s.
        ...    WARN    console=True
    END

I hover over '${selector}'
    Hover    ${selector}

I expect that the title is '${page_title}'
    Get Title    equal    ${page_title}

I scroll to element '${selector}'
    Scroll To Element    ${selector}

The page url is '${page_url}'
    Get Url    equal    ${page_url}

The url '${page_url}' is opened in a new tab
    #Wait New Tab to Appear
    Switch Page    NEW
    Get Url    equal    ${page_url}

There are '${number_tabs}' tabs currently opened
    #Wait New Tab to Appear
    #Sleep 2
    #Switch page    NEW
    ${current_tabs}=    Get Page Ids
    ${current_tabs_no}=    Get Length    ${current_tabs}
    Should be True    '${current_tabs_no}'=='${number_tabs}'

I select the value '${dropdown_value}' from dropdown '${list_selector}'
    #This keyword below cannot be used because the element is not <select> tag. It is helix-dropdown-item
    #Select options by    ${list_selector}    text    ${dropdown_value}
    Click    ${list_selector} >> text=${dropdown_value}

I type text '${text}' in the input field '${selector}'
    I set text '${text}' to field '${selector}'
I set text '${text}' to field '${selector}'
    Fill Text    ${selector}    ${text}

I press '${key:[^']+}'
    Keyboard Key    press    ${key}

The element '${selector}' text is '${expected_text}'
    #Set Assertion Formatters    {"Get Text": ["strip", "normalize spaces"]}
    ${selector_text}=    Get Text    ${selector}
    # It was detected that there are special character in the get text
    ${selector_text}=    Replace String    ${selector_text}    \u200b    ${EMPTY}
    Should Be Equal    ${selector_text}    ${expected_text}

I press '${key}' focused over '${selector}'
    Press Keys    ${selector}    ${key}

