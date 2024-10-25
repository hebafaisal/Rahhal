import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: double.infinity, 
            
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage("images\logo.png")
                    )
                  ,),
                  Container(
                      
                      width: 300, 
                      margin: EdgeInsets.only(top: 30),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle:
                                TextStyle(fontSize: 15), 
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(70)), 
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Container(
                      width: 300, 
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle:
                                TextStyle(fontSize: 15), 
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(70)), 
                            prefixIcon: Icon(Icons.phone)),
                      )),
                  Container(
                      width: 300, 
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle:
                                TextStyle(fontSize: 15), 
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(70)), 
                            prefixIcon: Icon(Icons.email)),
                      )),
                  Container(
                      width: 300, 
                      margin: EdgeInsets.only(top: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                TextStyle(fontSize: 15), 
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(70)), 
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: Icon(Icons.visibility_off)),
                      )),
                  Container(
                      width: 300, 
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle:
                              TextStyle(fontSize: 15), 
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70)), 
                          prefixIcon: Icon(Icons.password),
                        ),
                      )),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Color.fromARGB(255, 99, 136, 137)),
                      padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 120, vertical: 13)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70))),
                    ),
                    child: Text("SignUp",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                 
                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Color.fromARGB(255, 203, 203, 203)),
                      padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70))),
                    ),
                    child: Text("SignUp with Google",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF638889))),
                  ),
                  SizedBox(height: 10),

                  Row(
                   mainAxisAlignment: MainAxisAlignment.center, 
                   children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 100, 94, 94), 
                      ),
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF638889),
                      ),
                    ),
                   ] 
                  )
                
                ]  
                
                )
                
                )
                
                );
 
  }

}
