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
  // List<String> jurusanController = ['Teknik Informatika', 'Teknik Mesin'];

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
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -70,
              left: -50,
              child: Container(
                  height: 200,
                  width: 200,
                  child: Transform.translate(
                      offset: Offset(-5.0, 60.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          'assets/images/elipse.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ))),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 70,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 32,
                          color: Color(0xff85d0757),
                        )),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 155,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text(
                      'Daftar Akun Sarpras',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      'Silahkan Isi Form Dibawah ini',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 280),
                    child: Text(
                      'Nim',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          controller: nimController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              suffixIcon: Icon(Icons.person),
                              hintText: "Masukkan nim",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Nama',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          controller: namaController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              hintText: "Masukkan nama",
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Alamat',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          controller: alamatController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              suffixIcon: Icon(Icons.home),
                              labelText: "Masukkan alamat",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Jurusan',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: Container(
                      width: 400,
                      child: StreamBuilder(
                          stream: con.resJurusan,
                          builder:
                              (context, AsyncSnapshot<JurusanModel> snapshot) {
                            if (snapshot.hasData) {
                              return new DropdownButtonFormField<Datum>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffE5E5E5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
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
                                          style: TextStyle(fontSize: 12.5),
                                        )),
                                  );
                                }).toList(),
                                value: jurusan == null
                                    ? null
                                    : snapshot.data.data[jurusan],
                                hint: Text(
                                  "Pilih Jurusan",
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
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'No Hp',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          controller: noHpController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              suffixIcon: Icon(Icons.phone),
                              hintText: "Masukkan noHp",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              suffixIcon: Icon(Icons.email),
                              hintText: "Masukkan email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please a Enter';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 260),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ThemeData()
                                .colorScheme
                                .copyWith(primary: Color(0xff665588))),
                        child: TextFormField(
                          obscureText: _isHidden,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE5E5E5),
                              suffixIcon: InkWell(
                                  onTap: toggelPassword,
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  )),
                              hintText: "Masukkan Passowrd",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please a Enter Password';
                            }
                            return null;
                          },
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff665588), shape: StadiumBorder()),
                      onPressed: () => regsiter(),
                      child: Text("Register"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
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
