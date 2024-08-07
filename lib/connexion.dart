import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testememo/signin.dart';
import 'package:testememo/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_auth_implementation/firebase_auth_service.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _obscurePassword = true;
  @override

  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 398,
          height: 447,
          decoration: BoxDecoration(
            color: Color(0x07FF18BE),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text("Connexion",style: TextStyle(color: Color(0xFFF68B73), fontSize: 40),),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 37,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Color(0x75FF18BE)),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFF554E4E),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 37,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Color(0x75FF18BE)),
                      ),
                      labelText: 'Mot de Passe',
                      labelStyle: TextStyle(
                        color: Color(0xFF554E4E),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 37,
                  child: ElevatedButton(
                    onPressed: () {
                      _signIn(_emailController.text, _passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF68B73),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: GestureDetector(

                      child: Text(
                        'Se Connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Mot de Passe oublié ?',
                  style: TextStyle(
                    color: Color(0xFFF68B73),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {

                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Signin(),
                        ),
                            (Route<dynamic> route) => true,
                      );
                    },
                    child: Text(
                      'Vous n’avez pas de compte? S’inscrire',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "client") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  accueil(),
            ),
          );
        }else{
          print('Erreur au niveau du role');
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

/*  void _signIn() async{
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user != null){
      print("user is successful created");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => accueil()), // Assurez-vous de créer une classe Accueil() pour représenter la page d'accueil.
      );

    }else{
      print("some error happaned");
    }
  }*/

  void _signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
