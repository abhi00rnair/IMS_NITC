class Studentdash {
  final String name;
  final String rollno;
  final String email;
  final String phone;
  final String DOB;
  final String DOJ;
  final String Degree;
  final String Gender;
  final String Specialisation;
  final double cgpa;
  final String APAAR_ID;
  final String Admission_scheme;
  final int Credit_earned;
  final int Min_credits;
  final String Year_of_admission;
  final String Father_Email;
  final String Father_Name;
  final String Mother_Name;
  final String Father_Phone;
  final String Mother_Email;
  final String Mother_Phone;

  Studentdash({
    required this.name,
    required this.rollno,
    required this.email,
    required this.phone,
    required this.DOB,
    required this.DOJ,
    required this.Degree,
    required this.Gender,
    required this.Specialisation,
    required this.cgpa,
    required this.APAAR_ID,
    required this.Admission_scheme,
    required this.Credit_earned,
    required this.Min_credits,
    required this.Year_of_admission,
    required this.Father_Email,
    required this.Father_Name,
    required this.Mother_Name,
    required this.Father_Phone,
    required this.Mother_Email,
    required this.Mother_Phone,
  });

  factory Studentdash.fromJson(Map<String, dynamic> json) {
    return Studentdash(
      name: json['name'] ?? '',
      rollno: json['rollno'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      DOB: json['DOB'] ?? '',
      DOJ: json['DOJ'] ?? '',
      Degree: json['Degree'] ?? '',
      Gender: json['Gender'] ?? '',
      Specialisation: json['Specialisation'] ?? '',
      cgpa: json['cgpa'] != null
          ? double.tryParse(json['cgpa']['\$numberDecimal'] ?? '') ?? 0.0
          : 0.0,
      APAAR_ID: json['APAAR_ID'] ?? '',
      Admission_scheme: json['Admission_scheme'] ?? '',
      Credit_earned: json['Credit_earned'] ?? 0,
      Min_credits: json['Min_credits'] ?? 0,
      Year_of_admission: json['Year_of_admission'] ?? '',
      Father_Email: json['Father_Email'] ?? '',
      Father_Name: json['Father_Name'] ?? '',
      Mother_Name: json['Mother_Name'] ?? '',
      Father_Phone: json['Father_Phone'] ?? '',
      Mother_Email: json['Mother_Email'] ?? '',
      Mother_Phone: json['Mother_Phone'] ?? '',
    );
  }
}
