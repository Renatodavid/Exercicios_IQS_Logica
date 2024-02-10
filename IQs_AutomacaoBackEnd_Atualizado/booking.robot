*** Settings ***
Resource    common.resource

*** Test Cases ***
TC 2: obter reservas
    ${response}    GET /booking

    Status Should Be    200
    Validate Json    ${response}    GetBooking.json

TC 3: obter reserva por ID
    ${response}    GET /booking
    ${id}    Select Random BookingId From Json    ${response}

    ${response}    GET /booking/${id}s

    Status Should Be    200
    Validate Json    ${response}    GetBookingIds.json

TC 4: substituir reserva
    [Setup]    Wrapper POST /auth

    ${response}    POST /auth    PostAuthValid.json
    ${token}    Set Variable    ${response.json()}[token]

    ${response}    GET /booking
    ${id}    Select Random BookingId From Json    ${response}

    ${newResponse}    PUT /booking/${id}    PutBooking.json

    Status Should Be    200
    Validate Json    ${newResponse}    UpdateBooking.json

    ${response}       GET /booking/${id}

    Status Should Be    200
    Dictionaries Should Be Equal    ${response.json()}    ${newResponse.json()}

TC 5: criar reserva
    ${response}    POST /booking    PostBooking.json

    Status Should Be    200
    Validate Json    ${response}    CreateBooking.json

    ${id}         Set Variable    ${response.json()}[bookingid]
    ${booking}    Set Variable    ${response.json()}[booking]

    ${response}    GET /booking/${id}

    Status Should Be    200
    Dictionaries Should Be Equal    ${booking}    ${response.json()}

TC 6: editar reserva
    [Setup]    Wrapper POST /auth

    ${response}       GET /booking
    ${id}             Select Random BookingId From Json    ${response}
    ${response}       GET /booking/${id}

    ${body}    Change DepositPaid    ${response}
    PATCH /booking/${id}    ${body}

    Status Should Be    200
    Validate Json    ${response}    PartialUpdateBooking.json

    ${response}       GET /booking/${id}

    Status Should Be    200
    Dictionary Should Contain Sub Dictionary    ${response.json()}    ${body}

TC 7: deletar reserva
    [Setup]    Wrapper POST /auth

    ${response}    GET /booking
    ${id}          Select Random BookingId From Json    ${response}

    ${response}    DELETE /booking/${id}

    #Status Should Be    201     # bug    https://www.rfc-editor.org/rfc/rfc9110#name-delete

    ${response}       GET /booking/${id}    ignore404=${True}

    Status Should Be    404

    ${response}    GET /booking

    Should Not Have Value In Json    ${response.json()}    json_path=$[?(@.bookingid == ${id})].bookingid 
    