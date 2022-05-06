*** Settings ***
Library     Browser


*** Keywords ***
Wait New Tab to Appear
    ${initial_tabs}=    Get Page Ids
    ${initial_tabs_no}=    Get Length    ${initial_tabs}
    ${diff_tabs_no}=    Set Variable    ${initial_tabs_no}
    WHILE    '${initial_tabs_no}'=='${diff_tabs_no}'    limit=2 seconds
        ${current_tabs}=    Get Page Ids
        ${diff_tabs_no}=    Get Length    ${current_tabs}
        Sleep    0.2s
    END

Click Javascript
    [Arguments]    ${css_selector}
    Evaluate javascript    ${css_selector}
    ...    (elem) => {
    ...        elem.click();
    ...    }
