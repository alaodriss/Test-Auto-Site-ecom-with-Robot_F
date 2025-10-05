*** Settings ***
Library    SeleniumLibrary
Library    String

***Variables***
${xpath_firstname}  //input[@id="input-firstname"]

**Keywords***


Saisir formulaire d'inscription
   
    [Documentation]   remplir le formulaire d'inscription
    [Arguments]   ${firstname}    ${lastname}   ${telephone}   ${password}  ${confirm}
    ${random_string}=    Generate Random String    5    [LETTERS]
    ${email}=    Catenate    SEPARATOR=    user_    ${random_string}    @example.com
    # SeleniumLibrary.Input Text    id=input-firstname    John
    SeleniumLibrary.Input Text    locator=${xpath_firstname}      text=${firstname} 
    SeleniumLibrary.Input Text    id=input-lastname     ${lastname}
    SeleniumLibrary.Input Text    id=input-email        ${email}
    SeleniumLibrary.Input Text    id=input-telephone    ${telephone} 
    SeleniumLibrary.Input Text    id=input-password     ${password}
    SeleniumLibrary.Input Text    id=input-confirm      ${confirm}
    SeleniumLibrary.Click Element  xpath=//input[@name='agree']
    Sleep  5s