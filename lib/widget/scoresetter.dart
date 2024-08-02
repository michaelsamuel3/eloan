// ignore: non_constant_identifier_names
int score_setter(
    {int age = 0,
    int cibil = 0,
    double income = 0,
    String jobType = "",
    double exp = 0}) {
  if (age >= 21 &&
      cibil >= 750 && cibil<850 &&
      jobType == "salaried" &&
      income >= 15000 &&
      exp >= 1) {
    return 6;
  }
  if (age >= 21 &&
      cibil >=850 &&
      jobType == "salaried" &&
      income >= 30000 &&
      exp >= 1) {
    return 8;
  }
  if (age >= 21 &&
      cibil >= 750 && cibil<850 &&  
      jobType == "self employed" &&
      income >= 15000 &&
      exp >= 1) {
    return 5;
  }
  if (age >= 21 &&
      cibil >= 850 &&
      jobType == "self employed" &&
      income >= 30000 &&
      exp >= 1) {
    return 7;
  }
  return 0;
}
