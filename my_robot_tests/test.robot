*** Settings ***
Library     Browser


*** Test Cases ***
Test
    [Documentation]    ae
    New Page    https://playwright.dev
    Take Screenshot
    Sleep    1

    Log TO CONSOLE    Testing
    FOR    ${i}    IN RANGE    1    10
        IF    ${i}==20
            LOG TO CONSOLE    ${i}
            LOG    AE
        END
    END


Test 2
    [Documentation]    This is another test case
    Fail    falhei!