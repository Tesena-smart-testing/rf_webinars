
*** Settings ***
Library  Collections
Variables  var.yaml
Variables  var_module.py


*** Variables ***
&{USER}    name=Marie    password=user1234  address=Prague
@{USER}    name     password

*** Test Cases ***
List example
# example for array
    List example    @{USER} 
Dictionary example
# example for object
   Dictionary example    &{USER}
Show Value of Element
    ${name}  Set Variable   ${USER.name}
    Log To Console    Name - ${name}
Add item into dictionary
    Append To Dictionary    &{USER}   item=new_item
Module Variable
# example for export from py file
   Log To Console    Module variable - ${mapping}
Yaml Variable
# example for export from yaml file
   Log To Console    Yaml variable - ${string}


*** Keywords ***
List example
    [Arguments]       @{credentials}
    Log To Console    ${credentials}   
Dictionary example
    [Arguments]       &{credentials}
    Log To Console    ${credentials} 
Append To Dictionary
    [Arguments]       &{credentials}
    Log To Console    Dictionary with new item - ${credentials}