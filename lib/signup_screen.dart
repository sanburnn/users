import 'package:flutter/material.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/login_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
  bool isHiddenPassword = true;

  regsiter() async {
    String nim = nimController.text;
    String nama = namaController.text;
    String alamat = alamatController.text;
    String jurusan = jurusanController.text;
    String noHp = noHpController.text;
    String email = emailController.text;
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
      con.register(context, nim, nama, alamat, jurusan, noHp, email, pass);
      con.resResgiter.listen((value) {
        if (value.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
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
                          suffixIcon: Icon(Icons.person),
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
                          suffixIcon: Icon(Icons.person),
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
                          suffixIcon: Icon(Icons.home),
                          labelText: "Masukkan alamat",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: DropdownSearch<String>.multiSelection(
                    mode: Mode.MENU,
                    showClearButton: true,
                    showSelectedItems: true,
                    items: [
                      "Teknik Informatika",
                      "Teknik Industri",
                      "Teknik Sipil",
                      "Teknik Mesin"
                    ],
                    label: "Jurusan",
                    hint: "Pilih Jurusan",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      controller: noHpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone),
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
                          suffixIcon: Icon(Icons.email),
                          labelText: "Masukkan email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      obscureText: isHiddenPassword,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: toggelPassword,
                              child: Icon(Icons.visibility)),
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

  void toggelPassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
