
import 'package:firebase2/view/login_page.dart';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textPoppins(data: "UserRegister",color: Colors.black),
        leading: 
        //Icon(Icons.arrow_back_ios_new),
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon( Icons.arrow_back_ios_new) )
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
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
                Text("Already have login :"),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: textPoppins(data: "login ?",color: Colors.blue))

              ],
            )
          ],
        
        ),
      ),
    );
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
          // Handle registration logic
        },
        child: textPoppins(data: "Register",color: Colors.black),
      ),
    );
  }
}
