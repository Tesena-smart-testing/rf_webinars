# FOR item IN and While loops
*** Variables ***
${counter}    0
@{USER}    first   second  third
&{SHOP}    cake=butter  soup=carrot


*** Test Cases ***
While Loop Example
    WHILE    ${counter} < 5
        Log To Console    Counter value: ${counter}
        ${counter}    Evaluate    ${counter} + 1
    END

Login
# example for list
    FOR    ${user}    IN    @{user}
        Log To Console   user - ${user}
        Log To Console   Repeat
    END
Shopping
#example for dictionary
        FOR    ${key}    IN    @{shop.keys()}
        Log To Console    keys- ${shop["${key}"]}
    END


    # nested loops
Nested Loop Example
    FOR    ${i}    IN RANGE    1    4
        Log To Console    Outer Loop - Iteration ${i}
        FOR    ${j}    IN RANGE    5    7
            Log To Console    Inner Loop - Iteration ${j}
        END
    END
Nested Loop Example2
    FOR    ${i}    IN    1    2    3
        FOR    ${j}    IN    A    B    C
            Log To Console    Outer Loop - Iteration ${i} - Inner Loop - Iteration ${j}
        END
    END

  
    
