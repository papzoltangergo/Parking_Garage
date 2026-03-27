#Bejelentkezes ellenorzese
#Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
#Sikertelen bejelentkezes hibas jelszo eseten
#Sikertelen bejelentkezes nem letezo felhasznaloval
#Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
#Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
#Kijelentkezes utan vedett oldalak eleresenek tiltasa

*** Settings ***
Library           Selenium2Library
Library           Collections

*** Test Cases ***
Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    papzotyo@gmail.com
    Input Text    //*[@id="password"]    1234
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    Üdvözöljük a Parkolóház Rendszerben!
    Page Should Contain    Üdvözöljük a Parkolóház Rendszerben!
    Sleep    1s
    Close Browser
    
Sikertelen bejelentkezes hibas jelszo eseten
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    papzotyo@gmail.com
    Input Text    //*[@id="password"]    wrong_password
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains   Invalid email or password.
    Page Should Contain   Invalid email or password.
    Sleep    1s
    Close Browser
Sikertelen bejelentkezes nem letezo felhasznaloval
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    kitalaltamvalamit123@gmail.com
    Input Text    //*[@id="password"]    nagyonjoerosjelszoehhezaletezofelhasznalohoz
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains   Invalid email or password.
    Page Should Contain   Invalid email or password.
    Sleep    1s
    Close Browser
Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    #Input Text    //*[@id="email"]    papzotyo@gmail.com
    Input Text    //*[@id="password"]    1234
    Click Button    //*[@id="login-button"]
    Sleep    1s
    ${valid}=    Execute Javascript    return document.getElementById("email").checkValidity();
    Should Not Be True    ${valid}
    Sleep    1s
    Close Browser

    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    papzotyo@gmail.com
    #Input Text    //*[@id="password"]    1234
    Click Button    //*[@id="login-button"]
    Sleep    1s
    ${valid}=    Execute Javascript    return document.getElementById("password").checkValidity();
    Should Not Be True    ${valid}
    Sleep    1s
    Close Browser
Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    papzotyo@gmail.com
    Input Text    //*[@id="password"]    wrong_password
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains   Invalid email or password.
    Page Should Contain   Invalid email or password.
    Sleep    1s
    Close Browser
Kijelentkezes utan vedett oldalak eleresenek tiltasa
    Open Browser    https://parking-garage-app.netlify.app    chrome
    Wait Until Element Is Visible    class:primary
    Click Element    class:primary
    Wait Until Element Is Visible    //*[@id="email"]
    Input Text    //*[@id="email"]    papzotyo@gmail.com
    Input Text    //*[@id="password"]    1234
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    Üdvözöljük a Parkolóház Rendszerben!
    Page Should Contain    Üdvözöljük a Parkolóház Rendszerben!
    Sleep    1s
    Click Element    class:bi-caret-down-fill
    Click Element    class:dropdown-logout-button
    Sleep    1s

    Page Should Not Contain Element    /html/body/div/main/div/div[2]/img
    Page Should Not Contain Button    /html/body/div/main/div/div[1]/button
    Page Should Not Contain    Parkolás összesítő
    Page Should Not Contain    Parkolóhelyek térképe
    Page Should Not Contain    Profil adatok
    Sleep    1s
    Close Browser