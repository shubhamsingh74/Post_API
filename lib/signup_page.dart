import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  void login(String email, password)async{
    try{
      Response response= await post(
        Uri.parse('https://reqres.in/api/register'),
        body:{
          'email' : email,
          'password' : password,

        }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('account created succesfully dear');
      }else{
        print('Failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),

            const SizedBox(height: 20,),

            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),

            const SizedBox(height: 30,),

            GestureDetector(
              onTap: (){
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text('SignUp',style: TextStyle(fontSize: 30,color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
