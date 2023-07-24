import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qizo_quizzapp/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  

  @override
  State<Login> createState() => _LoginState();

  
}

class _LoginState extends State<Login> {

  

  
TextEditingController userctr=TextEditingController();
TextEditingController passCtr=TextEditingController();


  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:400 ,
                height: 230,
                color: Colors.white,
                child: Lottie.asset("assets/animation_lkh5glbg.json"),
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 30.17,top: 50),
                child: Container(
                  width: 162,
                  height: 50,
                  child: Text("Log in \nyour account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1
                  ),),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 22),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  width: 320,
                  height:45,
                  child: TextField(
                    controller: userctr,
                    decoration: InputDecoration(
                      hintText: "user name",
                      
                      border: OutlineInputBorder(borderSide: BorderSide(width: 0.5,color: Colors.red,),borderRadius: BorderRadius.circular(7))
                    ),
                  ),
                ),
              ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30,),
                   child: Container(
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                               width: 320,
                               height:45,
                               child: TextField(
                    controller: passCtr,
                    decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(borderSide: BorderSide(width: 0.5,color: Colors.red,),borderRadius: BorderRadius.circular(7))
                    ),
                               ),
                             ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Row(
                    
                    children: [
                      Checkbox(
                        
                        activeColor: Colors.white,
                        checkColor: Colors.green,
                        
                        value: ischecked, 
                        onChanged:(newBool){
                        setState(() {
                          ischecked =newBool;
                          
                        });
                      }),
        
                      Text("Remember me",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff3D3E48)),),
                      Spacer(),
                      Text("Forgot password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff023B69)),)
        
                    ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 30,right: 30,top: 75),
                   child: InkWell(
                    onTap: () {
                      if(userctr.text.isNotEmpty&&passCtr.text.isNotEmpty){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizScreen(),));
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("please enter valid details")),
      );

                        

                      }
                    },
                     child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color.fromARGB(255, 120, 142, 194),
                      ),
                      width: 320,
                      height: 45,
                      child: Center(child: Text("Login",style: TextStyle(
                        fontSize: 15,fontWeight: FontWeight.w700,
                        color: Color(0xffffffff)
                      ),)),
                                    
                     ),
                   ),
                 )
            ],
          ),
        ),
    
      ),
    );
  }
}