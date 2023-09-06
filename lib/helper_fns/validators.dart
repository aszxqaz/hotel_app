bool validateEmail(String email) =>
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$').hasMatch(email);

bool validatePhoneFormat(String phone) =>
    RegExp(r'^\+7 \([\d\*]{3}\) [\d\*]{3}-[\d\*]{2}-[\d\*]{2}$')
        .hasMatch(phone);

bool validatePhoneNumber(String phone) =>
    RegExp(r'^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$').hasMatch(phone);
