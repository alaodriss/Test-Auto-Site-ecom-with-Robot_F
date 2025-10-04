*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   //chemin-fihcier
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

***Variables***

***Test Cases***
Inscription d'un nouvel utilisateur
    [Documentation]    Test d'inscription d'un nouvel utilisateur

    Given L'utilisateur est sur la page d'inscription

    When il remplit tous les champs du formulaire

    And il clique sur le bouton "continuer"

    Then le compte de l'utilisateur est créé avec succès

***Keywords***

Open Chrome Browser 
    [Documentation]   Ouvre le site dans le navigateur Chrome
    SeleniumLibrary.Open Browser  url=https://tutorialsninja.com/demo  browser=Chrome
    SeleniumLibrary.Maximize Browser Window
    
L'utilisateur est sur la page d'inscription
    [Documentation]   aller vers la page d'inscription
    SeleniumLibrary.Click Element    xpath=//span[text()='My Account']
    Sleep  5s
    SeleniumLibrary.Click Element    xpath=//a[text()='Register']
    # SeleniumLibrary.Capture Page Screenshot  filename=selenium-screenshot-{index.png}
    SeleniumLibrary.Wait Until Page Contains Element  locator=//*[@id="content"]/h1  timeout=5s  error=None

il remplit tous les champs du formulaire
    [Documentation]   remplir le formulaire d'inscription
    ${random_string}=    Generate Random String    5    [LETTERS]
    ${email}=    Catenate    SEPARATOR=    user_    ${random_string}    @example.com
    # SeleniumLibrary.Input Text    id=input-firstname    John
    SeleniumLibrary.Input Text    locator=//input[@id="input-firstname"]  text=John
    SeleniumLibrary.Input Text    id=input-lastname     Doe
    SeleniumLibrary.Input Text    id=input-email        ${email}
    SeleniumLibrary.Input Text    id=input-telephone    1234567890
    SeleniumLibrary.Input Text    id=input-password     Password123
    SeleniumLibrary.Input Text    id=input-confirm      Password123
    SeleniumLibrary.Click Element  xpath=//input[@name='agree']
    Sleep  5s

il clique sur le bouton "continuer"
    [Documentation]   cliquer sur le bouton continuer
    SeleniumLibrary.Click Button    xpath=//input[@value='Continue']
    Sleep  5s
    # SeleniumLibrary.Capture Page Screenshot  filename=selenium-screenshot-{index}.png
    # SeleniumLibrary.Wait Until Page Contains Element  locator=//*[@id="content"]/h1  timeout=5s  error=None
    


le compte de l'utilisateur est créé avec succès
    # [Documentation]   vérifier que le compte est créé avec succès  
    # ${Url_register_succes}  SeleniumLibrary.Get Location
    # BuiltIn.Should Contain  container=${Url_register_succes}  item=success  msg=Le compte n'a pas été créé avec succès

    ${Url_register_succes}=    Get Location
    Should Contain    ${Url_register_succes}    success    Le compte n'a pas été créé avec succès


Close Browser
    [Documentation]   Ferme le navigateur
    Capture Page Screenshot  selenium-screenshot-{index}.png
    SeleniumLibrary.Close Browser
    # Capture Page Screenshot    selenium-screenshot-{index}.png
    # Close Browser