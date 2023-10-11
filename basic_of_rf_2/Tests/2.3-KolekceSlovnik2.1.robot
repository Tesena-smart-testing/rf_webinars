*** Settings ***
Documentation  Moznost otestovani vicejazycne aplikace se slovnikem na mutace.
...            Podporovane jazyky 'cs' a 'en'.
...            Ukazka spusteni testu s arugmentem
...            Druha moznost napsani slovniku

# robot --variable C:\RF-webinar\Tests\2.5-StringySlovnik2.1.robot    
# robot --variable lang:cs C:\RF-webinar\Tests\2.5-StringySlovnik2.1.robot    
# robot --variable lang:en C:\RF-webinar\Tests\2.5-StringySlovnik2.1.robot 

Library  DebugLibrary
Library  SeleniumLibrary
Library  Dialogs

Resource  ../Resources/Slovnik2.robot

Suite Setup     open browser       ${url}    chrome
Suite Teardown  Close All Browsers

*** Variables ***
${lang}          cs
&{d}             &{${lang}}   #dynamicka definice
${url}           https://www.tesena.com/${lang}
${contact_xpath}  //*[@id="menu-19"]
${name_xpath}     //*[@id="field-name"]
${email_xpath}    //*[@id="field-email"]
${text_xpath}     //*[@id="field-message"]
${send_xpath}     //*[@id="field-field_form_1_3_0_0"]

*** Test Cases ***
Check main page
    Wait Until Element Is Visible   ${contact_xpath}
    ${a} =  Get text                ${contact_xpath}
    Should Be Equal                 ${a}  ${d}[contact]

Go to Contact Us
    Click element                   ${contact_xpath}
    Wait until element is visible   ${name_xpath} 

Check header 
    ${a} =  Get text                //h1
    Should Be Equal  ${a}           ${d}[header]

Check Name Placeholder
    ${a} =  Get Element Attribute    ${name_xpath}  placeholder
    Should Be Equal  ${a}            ${d}[name_placeholder]

Check Message Placeholder 
    ${a} =  Get Element Attribute    ${text_xpath}     placeholder
    Should Be Equal  ${a}            ${d}[message_placeholder]

Pause
    Pause Execution  pause to see results
