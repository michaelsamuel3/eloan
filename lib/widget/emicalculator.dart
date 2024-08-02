import 'dart:math';

// ignore: non_constant_identifier_names
dynamic emiCalculator({double amount_eligible=0,double tenure=0,double interest_rate=0}){
  double emi=0.0;
  double interest=(interest_rate/100)/tenure;
  emi=(amount_eligible*pow((1+interest),tenure))/((pow(1+interest, tenure))-1);
return emi;
}