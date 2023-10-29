
const String emptyEmailField = 'Email field cannot be empty!';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password field cannot be empty';
const String invalidEmailField =
    "Email provided isn\'t valid";
const String passwordLengthError = 'Password must be 8 characters or more';
const String invalidPassword = 'Password must be 8 characters or more and include at least 1 uppercase, digit and special character';
const String emptyUsernameField = 'Username  cannot be empty';
const String usernameLengthError = 'Username length must be greater than 6';
const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';
const String passwordRegex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
const String upperCaseRegex = r'^(?=.*?[A-Z]).{1,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{1,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{1,}$';
const String digitRegex = r'^(?=.*?[0-9]).{1,}$';

const String countryListData = r"""[
    {
        "id": 43,
        "name": "Canada",
        "alpha2code": "CA",
        "alpha3code": "CAN",
        "currency_name": "Canadian dollar",
        "currency_code": "CAD",
        "currency_symbol": "$",
        "calling_code": "1",
        "flag_link": "https://restcountries.eu/data/can.svg",
        "active": true
    },
    {
        "id": 163,
        "name": "Nigeria",
        "alpha2code": "NG",
        "alpha3code": "NGA",
        "currency_name": "Nigerian naira",
        "currency_code": "NGN",
        "currency_symbol": "₦",
        "calling_code": "234",
        "flag_link": "https://restcountries.eu/data/nga.svg",
        "active": true
    },
    {
        "id": 240,
        "name": "United States of America",
        "alpha2code": "US",
        "alpha3code": "USA",
        "currency_name": "United States dollar",
        "currency_code": "USD",
        "currency_symbol": "$",
        "calling_code": "1",
        "flag_link": "https://restcountries.eu/data/usa.svg",
        "active": true
    }
]""";

const String phoneNumberRegex = r'0[789][01]\d{8}';

const String phoneNumberLengthError = 'Phone number must be 11 digits';

const String invalidPhoneNumberField =
    "Number provided isn\'t valid.";
