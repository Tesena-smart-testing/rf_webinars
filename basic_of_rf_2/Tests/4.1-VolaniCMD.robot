*** Settings ***
Documentation  Robot framework muze v testu volat primo CMD prikazy

Library  DebugLibrary
Library  OperatingSystem  # Run

*** Variables ***
${cesta}      .
${file_name}  Kirby.txt

*** Test Cases ***
Volani vlastnich CMD a Python
    Run   echo "Ahojky" > ${cesta}\${file_name}
    ${a} =  Run   type ${cesta}\${file_name}
    log to console  ${a}
  

