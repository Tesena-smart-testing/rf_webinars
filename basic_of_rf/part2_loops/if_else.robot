
#This is a new feuture of RF

*** Test Cases ***
If-Else Example
    ${num}    Set Variable    5
    IF    ${num} > 5
        Log To Console    Number is greater than 5
    ELSE IF    ${num} < 5
        Log To Console    Number is less than 5
    ELSE
        Log To Console    Number is equal to 5
    END





