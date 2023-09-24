extension StringValidations on String {
  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]])[A-Za-z\d~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]{8,32}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"(0|91)?[6-9][0-9]{9}");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidEmail =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);

  bool hasValidPhoneNumber() {
    return (this.length >= 10 && this.length <= 13);
  }
}
