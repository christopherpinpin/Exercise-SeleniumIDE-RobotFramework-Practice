*** Settings ***
Documentation   SeleniumIDE & RobotFramework Practice
...
...             This test follows the example using keywords from
...             the Selenium Library
Library         SeleniumLibrary


*** Test Cases ***
1 Successful User Login
    # Open Browser
    Open Browser    https://www.saucedemo.com/      chrome
    # Set window size
    Maximize Browser Window
    # Check if in login page
    Page Should Contain Element     login-button
    # Type username
    Input Text      user-name       standard_user
    # Type password
    Input Text      password        secret_sauce
    # Click login
    Click Button    login-button
    # Assert text   
    Element Text Should Be      class:title     PRODUCTS
    # Close browser
    [Teardown]      Close Browser

2 Unsuccessful user log in by a locked out user
    # Open Browser
    Open Browser    https://www.saucedemo.com/      chrome
    # Set window size
    Maximize Browser Window
    # Check if in login page
    Page Should Contain Element     login-button
    # Type username
    Input Text      user-name       locked_out_user
    # Type password
    Input Text      password        secret_sauce
    # Click login
    Click Button    login-button
    # Assert text   
    Page Should Contain     Epic sadface: Sorry, this user has been locked out.
    # Close browser
    [Teardown]      Close Browser

3 Typed wrong password
    # Open Browser
    Open Browser    https://www.saucedemo.com/      chrome
    # Set window size
    Maximize Browser Window
    # Check if in login page
    Page Should Contain Element     login-button
    # Type username
    Input Text      user-name       standard_user
    # Type password
    Input Text      password        wrong_password
    # Click login
    Click Button    login-button
    # Assert text   
    Page Should Contain     Epic sadface: Username and password do not match any user in this service
    # Close browser
    [Teardown]      Close Browser

4 Logged in as problem user and sees a broken inventory page
    # Open Browser
    Open Browser    https://www.saucedemo.com/      chrome
    # Set window size
    Maximize Browser Window
    # Check if in login page
    Page Should Contain Element     login-button
    # Type username
    Input Text      user-name       problem_user
    # Type password
    Input Text      password        secret_sauce
    # Click login
    Click Button    login-button
    # Click Text
    Click Element    item_4_title_link
    # Assert Not Text
    Element Text Should Not Be      class:inventory_details_name    Sauce Labs Backpack
    

    # Close browser
    [Teardown]      Close Browser

    

