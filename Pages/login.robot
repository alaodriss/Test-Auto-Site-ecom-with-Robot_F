*** Settings ***
Library    SeleniumLibrary
Library    String


***Variables***
${xpath_login_email}  //input[@id="input-email"]
${xpath_login_password}  //input[@id="input-password"]



**Keywords***


Acceder Page Login
    [Documentation]   aller vers la page de login
    SeleniumLibrary.Click Element    xpath=//span[text()='My Account']
    Sleep  5s
    SeleniumLibrary.Click Element    xpath=//a[text()='Login']

Login Account
    [Documentation]   se connecter avec des identifiants valides
    [Arguments]   ${email}   ${password}
    Input Text  locator=${xpath_login_email}    text=${email}
    Input Text  locator=${xpath_login_password}    text=${password}

Click Button login
    [Documentation]   cliquer sur le bouton login
    SeleniumLibrary.Click Button    xpath=//input[@value='Login']
    Sleep  5s