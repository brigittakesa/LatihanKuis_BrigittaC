import 'package:flutter/material.dart';
import 'package:latian_kuis/main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;

  _navigatePage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainPage(
        username: username,
      );
    }));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page",
              style: TextStyle(
                  color: Colors.white)), //mengganti warna tulisan title
          centerTitle: true, //meletakkan title di center
          backgroundColor: const Color.fromARGB(219, 6, 31, 142),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 26, 55, 180))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            password = value;
          },
          obscureText: true, //untuk menyamarkan inputan pake tanda bintang
          decoration: InputDecoration(
            hintText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 26, 55, 180))),
          ),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context)
          .size
          .width, //harus didefinisikan dulu di dalam widgetnya BuildContext
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
          ),
          onPressed: () {
            String text = "";
            if (username == "Brigi" && password == "1111") {
              _navigatePage(); //hanya dikondisi sukses agar bisa melanjutkan halaman berikutnya
              setState(() {
                text = "Login Sukses";
                isLoginSuccess = true;
              });
              text = "Login Sukses";
            } else {
              setState(() {
                text = "Login Gagal";
                isLoginSuccess = false;
              });
              text = "Login Gagal";
            }
            SnackBar snackBar = SnackBar(
              content: Text(text),
              duration: Duration(seconds: 2), //memberikan waktu durasi
              backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Login Now!')),
    );
  }
}
