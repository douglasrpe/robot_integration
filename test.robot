*** Settings ***
Library     Browser


*** Test Cases ***
Test
    [Documentation]    ae
    New Page    https://playwright.dev
    Take Screenshot
    Sleep    5

    Log TO CONSOLE    Testing
    FOR    ${i}    IN RANGE    1    10
        IF    ${i}==20
            LOG TO CONSOLE    ${i}
            LOG    AE
        END
    END
