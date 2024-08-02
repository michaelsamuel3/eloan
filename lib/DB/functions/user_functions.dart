import 'package:eloan/DB/models/user_detail_model.dart';
import 'package:eloan/DB/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void addUser(User user) async{
  final userDB= await Hive.openBox<User>("userBox");

  await userDB.add(user);
}

Future<Iterable<User>> getUsers()async{
  final userDB= await Hive.openBox<User>("userBox");

  return userDB.values;
}

void addUserDetails(User user,UserDetails details)async{
  final userDB= await Hive.openBox<User>("userBox");

  User updatedUser=User(
    email:user.email,
    firstName: user.firstName,
    lastName: user.lastName,
    password: user.password,
    age: details.age,
    exp: details.exp,
    income: details.income,
    jobType: details.jobType,
    cibil: details.cibil, 
     );

  await userDB.put(user.key, updatedUser);
}

dynamic getUser(key)async{
final userDB= await Hive.openBox<User>("userBox");
return userDB.getAt(key);
}