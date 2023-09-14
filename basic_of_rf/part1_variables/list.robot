//////////    List @  Array ////////
*** Settings ***
Library    Collections


*** Variables ***
@{USER}    user   34   false   @{INFO} 
@{INFO}  password   123456  

*** Test Cases ***
List Variable
    Login    @{USER}
Length Of List
    Select list    @{USER}
Add item into list
    Append To List    @{USER}    new_item
Remove item from list
    ${x}=   Remove From List    ${USER}   0
    Log To Console   Original list =${USER}
    Log To Console   Removed item =${x}


*** Keywords ***
Login
    [Arguments]    @{credentials}
    Log To Console    List - ${credentials}
    Log To Console    First element - ${credentials}[1]
Select List
    [Arguments]    @{input}
    ${cnt}=    Get length    ${input}
    Log To Console    Length of list - ${cnt}
    should be equal as numbers  ${cnt}  5
Append To List
    [Arguments]    @{credentials}
    Log To Console    List with new item - ${credentials}
