import 'package:flutter/material.dart';
import "../database/database_helper.dart";
import "../feature.dart";
import "menuscreen.dart";

Future<void> addInitialUsers() async {
  // Bu kullanıcıları doğrudan veritabanına ekleyeceğiz
  await DatabaseHelper.instance.insertUser('admin', 'admin123');
  await DatabaseHelper.instance.insertUser('user', 'user123');
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Giriş Yap'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/LoginP.jpg'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF2585A3), Color(0xFF172854)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Card(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Formlar uygulamasına giriş yapın.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Adamina',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Kendiniz, biriminiz ya da tüm kurum için formlar ve anketler oluşturabilir, paylaşabilirsiniz.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'OFL Sorts Mill Goudy TT',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: 0.5,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 20),
                            buildTextFormField('Kullanıcı Adı', 'Kullanıcı Adı',
                                _usernameController),
                            SizedBox(height: 10),
                            buildTextFormField(
                                'Şifre', 'Şifre', _passwordController,
                                isPassword: true),
                            SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final username =
                                            _usernameController.text;
                                        final password =
                                            _passwordController.text;

                                        final user = await DatabaseHelper
                                            .instance
                                            .getUser(username);

                                        if (user != null &&
                                            user['password'] == password) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuScreen(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Kullanıcı adı veya şifre yanlış')),
                                          );
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color(0xFFB23A3A), // kırmızı renk
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                    ),
                                    child: Text(
                                      'Giriş Yap',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // BOTAŞ ID ile giriş yap işlemi
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color(0xFF2A4487), // mavi renk
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                    ),
                                    child: Text(
                                      'BOTAŞ ID ile Giriş Yap',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        hintStyle: TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bu alanı doldurun';
        }
        return null;
      },
    );
  }
}
