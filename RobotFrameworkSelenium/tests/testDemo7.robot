*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
&{data}
${base_url}     https://fake-json-api.mock.beeceptor.com


*** Test Cases ***
Play around the Dictionary
    &{data}=   Create Dictionary   name=rahulshetty    course=robot    website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key   ${data}     name
    log     ${data}[name]
    ${url}=     Get From Dictionary    ${data}    website
    log     ${url}


Add book into Library Database
    &{data_2}=  Create Dictionary   build=0     isbn=12354  id=0   manufacturer=CAT     model=BLK
    ${response}=    POST    ${base_url}/companies    json=${data_2}      expected_status=200
    Status Should Be    200  ${response}
#    log     ${response}
#    Dictionary Should Contain Key   ${response}   ID
#    ${book_id} =     Get From Dictionary    ${response}    ID
#    log     ${book_id}
#
#Get the book details which got added
#    GET     ${base_url}/companies       params=ID=