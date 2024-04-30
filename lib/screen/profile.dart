import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              "เข้าสู่ระบบ",
              style: GoogleFonts.notoSansThaiLooped(
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้',
                    labelStyle: GoogleFonts.notoSansThaiLooped(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade900,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.red.shade900),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    labelStyle: GoogleFonts.notoSansThaiLooped(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade900,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 15, bottom: 0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.red.shade900),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red.shade900,
                      value: _isCheck,
                      onChanged: (value) {
                        setState(() {
                          _isCheck = value!;
                        });
                      },
                    ),
                    Text(
                      'จดจำรหัสผ่าน',
                      style: GoogleFonts.notoSansThaiLooped(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            // padding: EdgeInsets.zero,
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            "ลืมรหัสผ่าน",
                            style: GoogleFonts.notoSansThaiLooped(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade900.withOpacity(0.7)),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red.shade900,
                            // padding: const EdgeInsets.symmetric(
                            //     horizontal: 20, vertical: 10),
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                          ),
                          child: Text(
                            "เข้าสู่ระบบ",
                            style: GoogleFonts.notoSansThaiLooped(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ยังไม่มีบัญชีผู้ใช้?",
                      style: GoogleFonts.notoSansThaiLooped(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "สมัครสมาชิก",
                          style: GoogleFonts.notoSansThaiLooped(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade900),
                          ),
                        )),
                  ],
                ),
              ],
            )),
          ],
        ));
  }
}
