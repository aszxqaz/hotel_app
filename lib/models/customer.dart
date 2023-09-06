class Customer {
  Customer({required this.phone, required this.email});

  factory Customer.empty() {
    return Customer(phone: '', email: '');
  }

  factory Customer.fromMap(Map<String, String> customer) {
    return Customer(
      phone: customer['phone']!,
      email: customer['email']!,
    );
  }
  final String phone;
  final String email;

  Map<String, String> toMap([Map<String, String>? mapping]) {
    final Map<String, String> map = {};
    map[mapping?['phone'] ?? 'phone'] = phone;
    map[mapping?['email'] ?? 'email'] = email;
    return map;
  }
}
