

*** Settings ***
Library  jsonLibrary.py
Library  json_to_excel_convertor.py
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
@{hotel}  name  location  url


*** Test Cases ***
# Iterate through JSON
#     ${json_obj} =   Load JSON From File     part3_parsing/output_json/output_data.json
#     ${hotels} =  Get Value From Json     ${json_obj}     $..hotel
#     @{hotels} =  Convert To List         ${hotels}
#     FOR     ${hotel}     IN      @{hotels}
#         Log To Console      ${hotel}
#     END

Convert JSON to Excel
    # Specify the paths to the JSON file and output Excel file
    ${json_file}  Set Variable  part3_parsing/output_json/output_data.json
    ${output_file}  Set Variable  part3_parsing/output_excel/output_excel.xlsx
    # Call the json_to_excel_convertor function with the file paths
    Json To Excel Convertor  ${json_file}  ${output_file}

