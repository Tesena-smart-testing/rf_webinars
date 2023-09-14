
///// Scalar variables $ /////

*** Variables ***
${GREET}  Hello 
${NAME}  Anna!! 
${AGE}  30 
${HEIGHT}  1.67 
${IS_LOGGED}  true 


*** Test Cases ***
Constants
    Set Variables and Log

*** Keywords ***
Set Variables and Log
    Log To Console    ${GREET}
    Log To Console    ${GREET}, ${NAME} ${HEIGHT}!!


