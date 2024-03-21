// import 'package:firebase2/widget/login.dart';
// import 'package:firebase2/widget/textstyle_widget.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {

//   final emailController=TextEditingController();
//   final passwordController=TextEditingController();
//    LoginScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     Size mediaquery=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height:mediaquery.height*0.3,
//             width: mediaquery.width*1,
//              decoration:const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//            child: Image.asset('assets/login.jpg',fit: BoxFit.cover,),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   //obscureText: true,
//                   controller: emailController,
//                    decoration:const InputDecoration(
//                   //  border: OutlineInputBorder(),
//                     labelText: "email"  
//                    ),  
//                 ),
//               const  SizedBox(height: 20,),
//                 TextFormField(
//                   obscureText: true,
//                   controller: passwordController,
//                    decoration:const InputDecoration(
//                     //border: OutlineInputBorder(),
//                     labelText: "Password"  
//                    ),  
//                 ),const SizedBox(height: 20,),
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     textPoppins(data: 'Sign in'),
//                     GestureDetector(
//                       onTap: (){
                
//                       },
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundColor:Color(0xFF2F3C7E),
//                         child: textPoppins(data: "->",color: Colors.white),
                        
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(child: Divider( )),
//                     Text('or login with'),
//                      Flexible(child: Divider( )),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
// LoginWidgets().loginIcons(context)
//                 ],)
//               ],
            
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  final  Function()? onTap;
 const LoginScreen({super.key,required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

void signIn()async{

  showDialog(context: context, builder: (context) =>const Center(
    child: CircularProgressIndicator(),
  ),);

  try{
   FirebaseAuth.instance.signInWithEmailAndPassword(
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
    Size mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: mediaquery.height * 0.3,
                width: mediaquery.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/login.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      //obscureText: true,
                      controller: emailController,
                      decoration: const InputDecoration(
                        //  border: OutlineInputBorder(),
                        labelText: "email",
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       textPoppins(data: "Sign in"),
                        GestureDetector(
                          onTap: () {
                            signIn();
                            // Sign in action
                          },
                          child:const CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF2F3C7E),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        const Text('or login with'),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildIcon(            
                          imageUrl:
                              'https://cdn.iconscout.com/icon/free/png-256/free-google-1772223-1507807.png',
                        ),
                        const SizedBox(width: 20),
                        buildIcons(
                          imageUrl:
                              'https://cdn-icons-png.freepik.com/256/100/100313.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
          
                        Text('dont have an accont  :'),
                    // SizedBox(width: 10,),
                    
                    GestureDetector(
                      onTap: widget.onTap,
                      child: textPoppins(data: "Register here?",color: Colors.blue,))
                  ],
              )] ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}