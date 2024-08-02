
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject{
   
   @HiveField(0)
   String firstName;

   @HiveField(1)
   String lastName;

   @HiveField(2)
   String email;

   @HiveField(3)
   String password;

   @HiveField(4)
   int? age;

   @HiveField(5)
   double? exp;

   @HiveField(6)
   String? jobType;

   @HiveField(7)
   double? income;

   @HiveField(8)
   int? cibil;

   User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.age,
    this.cibil,
    this.exp,
    this.income,
    this.jobType, 
    });

}