class SignUpData {
  String email = "";
  String password = "";
  String gender = "Masculino"; // Valor padrão
  DateTime? birthDate;

  SignUpData({required this.email, required this.password});
}
