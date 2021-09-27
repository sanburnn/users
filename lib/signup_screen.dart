import 'package:flutter/material.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/login_screen.dart';
import 'package:users/theme.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final con = HomeController();

  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final jurusanController = TextEditingController();
  final noHpController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();

  regsiter() async {
    String nim = nimController.text;
    String nama = namaController.text;
    String alamat = alamatController.text;
    String jurusan = jurusanController.text;
    String noHp = noHpController.text;
    String email = emailController.text;
    String role = roleController.text;
    String pass = passwordController.text;

    if (nim == '' ||
        nama == '' ||
        alamat == '' ||
        jurusan == '' ||
        noHp == '' ||
        email == '' ||
        pass == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.register(
          context, nim, nama, alamat, jurusan, noHp, email, role, pass);
      nimController.text = '';
      namaController.text = '';
      alamatController.text = '';
      jurusanController.text = '';
      noHpController.text = '';
      emailController.text = '';
      roleController.text = '';
      passwordController.text = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.asset('assets/images/logo1.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: nimController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Masukkan nim",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: namaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Masukkan nama",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: alamatController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Masukkan alamat",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: jurusanController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Masukkan jurusan",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: noHpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Masukkan noHp",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Masukkan email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: "Masukkan Passowrd",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () => regsiter(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
