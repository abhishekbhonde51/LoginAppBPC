import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginApp(),
      );
  }
}
class LoginApp extends StatefulWidget{
    const LoginApp({super.key});
    @override
    State createState()=> _LoginAppState();
}
class _LoginAppState extends State{
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    // GlobalKey<FormFieldState> usernameKey = GlobalKey<FormFieldState>();
    //  GlobalKey<FormFieldState> passnameKey = GlobalKey<FormFieldState>();

    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: Text("LoginApp", style: GoogleFonts.quicksand(
                fontWeight:FontWeight.bold,
                fontSize:25
              ),
              ),
              backgroundColor: Colors.blue,
          ),
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMYoHcOPS-yV_FWtuRwCJIWXUQmxDfUCQSDAAidGEt98UQUo3PGbFO2upoF6m1LBJgVF0&usqp=CAU',
                    height:200,
                    width: 200,
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                      TextFormField(
                        controller: _userNameController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Password";
                          }
                          else{
                            return null;
                          }
                        },
                        keyboardType:TextInputType.emailAddress,
                        decoration:const InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                        ),
                      
                    
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: _passwordController,
                      validator:(value){
                        if(value==null || value.isEmpty){
                            return "Please Enter password";
                        }
                        else{
                            return null;
                        }
                      },
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration:const InputDecoration(
                        hintText: "Enter your password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password_sharp),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                    ),
                    const SizedBox(
                        height: 20,
                    ),
                    ElevatedButton(onPressed: (){
                      // bool userNameValidated = usernameKey.currentState!.validate();
                      // bool formkey = passnameKey.currentState!.validate();
                      bool loginValidated = formkey.currentState!.validate();
                      if(loginValidated){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:Text("Login Successful"))
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:Text("Login failed"))
                        );
                      }
                    }, child:const Text("Submit"))
            
                ],
              ),
            ),
          ),
        ),
        );
    }
}