import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey <FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey2,
      backgroundColor: Color(0xFF003942),
      appBar: AppBar(
        title: Text('Crypto App'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
            Expanded(
              flex:2,
              child: Container(),
            ),
              Expanded(
                child: Container(
                    height: 7,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
                    decoration: new BoxDecoration(
                      color: Color(0x60FFFFFF),
                      borderRadius: new BorderRadius.all(Radius.circular(10)),
                    ),
                    child:TextFormField(
                      controller: _nameController,
                      validator: (String val){
                        if(val.isEmpty){
                          return "Please enter a name";
                        }
                        return null;
                      },
                      obscureText: false,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),

                      ),
                    ) ),
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                flex:1,
                 child:Container(
                  height: 7,
                     padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                     margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child:TextFormField(
                    controller: _emailController,
                    validator: (String val){
                      if(val.isEmpty){
                        return "Please enter an e-mail";
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),


                  ) ),
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                flex:1,
                child:Container(
                  height: 7,
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
                  decoration: new BoxDecoration(
                    color: Color(0x60FFFFFF),
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (String val){
                      if(val.isEmpty){
                        return "Please enter a password";
                      }
                        return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: " Password ",
                        hintStyle:TextStyle(
                          color: Colors.white60,
                        )

                    ),
                  )),),
            Expanded(
              flex: 1,
              child: Container(),
            ),
               Expanded(
                 flex:1,
                child:Container(
                height: 7,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(20, 8, 15, 0),
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: new BoxDecoration(
                  color: Color(0xFFE19600),
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                ),
                child: FlatButton(
                  child: Text('REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () async{
                    await _registerAccount();
                  },
                ),
              ),
        ),
            Expanded(
              flex:3,
              child: Container(

              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
  void _registerAccount() async {
    try{final User user = (await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
    if(user!=null){
      if(!user.emailVerified){
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _nameController.text);
      final user1 = _auth.currentUser;
      Navigator.of(context).pushNamed('/login').then((value) {
        setState(() {});
      });
    }}
    catch(e){
      _scaffoldKey2.currentState.showSnackBar(SnackBar(content: Text("Failed to register")));
    }

    }
}
