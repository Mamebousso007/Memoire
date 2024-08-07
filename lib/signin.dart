import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'connexion.dart';
import 'firebase_auth_implementation/firebase_auth_service.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  TextEditingController _adresseController = TextEditingController();

  String userRole = "client";
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telephoneController.dispose();
    _adresseController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 398,
          height: 558,
          decoration: BoxDecoration(color: Color(0x07FF18BE)),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Création de Compte',
                      style: TextStyle(
                        color: Color(0xFFF68B73),
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 37,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Color(0x75FF18BE)),
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Color(0xFF554E4E),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 37,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      controller: _telephoneController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Color(0x75FF18BE)),
                        ),
                        labelText: 'Téléphone',
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
                      controller: _adresseController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Color(0x75FF18BE)),
                        ),
                        labelText: 'Adresse',
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
                    child: DropdownButtonFormField<String>(
                      value: userRole,
                      onChanged: (value) {
                        setState(() {
                          userRole = value!;
                        });
                      },
                      items: ["client", "gerant"]
                          .map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      })
                          .toList(),
                    ),
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
                      onPressed: () => _signUp(
                        _emailController.text,
                        _passwordController.text,
                        userRole,
                        _usernameController.text,
                          _telephoneController.text,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF68B73),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Créer un Compte',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Naviguer vers la page de connexion
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => Connexion(),
                          ),
                              (Route<dynamic> route) => true,
                        );
                      },
                      child: Text(
                        'Vous avez déjà un compte? Se connecter',
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
      ),
    );
  }

  void _signUp(String email, String password, String rool, String username, String telephone) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          postDetailsToFirestore(email, rool, username, telephone, password);
        } else {
          print("Failed to create user.");
        }
      } catch (e) {
        print("Error creating user: $e");
      }
    }
  }

  Future<void> postDetailsToFirestore(String email, String rool, String username, String telephone, String password) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    // Utilisez l'ID de l'utilisateur Firebase comme clé du document dans Firestore
    DocumentReference ref = firebaseFirestore.collection('users').doc(user!.uid);

    await ref.set({
      'id': user.uid,
      'email': email,
      'role': rool,
      'username': username,
      'Mot de pass': password,
      'Telephone': telephone,
      'Adresse': _adresseController.text, // Assurez-vous que cette ligne est ajoutée
    });

    // Après la mise à jour, redirigez l'utilisateur vers la page de connexion ou une autre page appropriée
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Connexion()));
  }


}
