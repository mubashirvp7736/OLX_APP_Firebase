
import 'package:firebase2/view/login_page.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterPage extends StatefulWidget {
  final  Function()? onTap;
 const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

void signUserUp()async{

  showDialog(context: context, builder: (context) =>const Center(
    child: SnackBar(content: Text('Successfully add')),
  ),);
 
  try{
   FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text);
    Navigator.pop(context);
  }on FirebaseAuthException catch (e){
    Navigator.pop(context);
    if(e.code=="user-not-found"){
      wrongEmailMessage(context);
    }else if(e.code=="wrong password"){
       wrongPasswordMessage(context);
    }

  }
  }
  void wrongEmailMessage(BuildContext  context){
  
    const snackbar= SnackBar(
          content: Text('failed email')
        ,duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,

  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void wrongPasswordMessage(BuildContext context){
   
    const snackBar= SnackBar(
          content: Text('failed Password')
        ,duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,

  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: textPoppins(data: 'Create Account'),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(onTap: (){}),));
          },  icon: Icon( Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              _buildRegisterButton(context),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Already have account :"),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(onTap: () {  },),));
                    },
                    child: textPoppins(data: "Login now",color: Colors.blue))
            
                ],
              )
            ],
                    
                    ),
          ),
      ),
       )   );
  }

  Widget _buildEmailField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Text(
        //   '@gmail.com',
        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(Icons.visibility_off),
                onPressed: () {
                  // Toggle password visibility
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
        onPressed: () {
          
          signUserUp();
          // Handle registration logic
        },
        child: textPoppins(data: "Register",color: Colors.black),
      ),
    );
  }
}