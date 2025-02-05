class Student {
  int? id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String department;
  Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.department,
  });
  // Convert a Student into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'department': department,
    };
  }

  // Convert a Map into a Student
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      phone: map['phone'],
      department: map['department'],
    );
  }
}
