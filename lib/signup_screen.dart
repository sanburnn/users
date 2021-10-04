import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/login_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:users/model/jurusanModel.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final con = HomeController();

  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final noHpController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHiddenPassword = true;
  bool _isHidden = true;
  int jurusan;
  String selectedJurusan;
  List<String> jurusanController = ['Teknik Informatika', 'Teknik Mesin'];

  Future regsiter() async {
    String nim = nimController.text;
    String nama = namaController.text;
    String alamat = alamatController.text;
    String noHp = noHpController.text;
    String email = emailController.text;
    String pass = passwordController.text;

    if (nim == '' ||
        nama == '' ||
        alamat == '' ||
        selectedJurusan == null ||
        noHp == '' ||
        email == '' ||
        pass == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.register(
          context, nim, nama, alamat, selectedJurusan, noHp, email, pass);
      con.resResgiter.listen((value) {
        if (value.status == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
      // nimController.text = '';
      // namaController.text = '';
      // alamatController.text = '';
      // noHpController.text = '';
      // emailController.text = '';
      // roleController.text = '';
      // passwordController.text = '';
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    con.getJurusan();
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
                  child: Container(
                    width: 330,
                    child: StreamBuilder(
                        stream: con.resJurusan,
                        builder:
                            (context, AsyncSnapshot<JurusanModel> snapshot) {
                          if (snapshot.hasData) {
                            return new DropdownButtonFormField<Datum>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              isExpanded: true,
                              items: snapshot.data.data.map((Datum value) {
                                return new DropdownMenuItem<Datum>(
                                  value: value,
                                  child: Container(
                                      width: 130.0,
                                      child: new Text(
                                        value.namaJurusan,
                                        style: TextStyle(fontSize: 14.0),
                                      )),
                                );
                              }).toList(),
                              value: jurusan == null
                                  ? null
                                  : snapshot.data.data[jurusan],
                              hint: Text(
                                "pilih Jurusan",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  jurusan = snapshot.data.data.indexOf(value);
                                  selectedJurusan = value.idJurusan;
                                });
                              },
                            );
                          }
                          return Container(
                            child: Text("loading.."),
                          );
                        }),
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
                      obscureText: _isHidden,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: toggelPassword,
                              child: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          labelText: "Masukkan Passowrd",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    )),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => regsiter(),
                    child: Text("Register"),
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
      _isHidden = !_isHidden;
    });
  }
}
