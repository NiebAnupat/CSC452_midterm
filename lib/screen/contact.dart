import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late var _profile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      login();
    });
  }

  Future<void> login() async {
    final url = Uri.parse('https://www.melivecode.com/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
        {'username': "ivy.cal@melivecode.com", 'password': "melivecode"});

    final res = await http.post(url, headers: headers, body: body);
    final jsonRes = jsonDecode(res.body);
    // _profile = jsonRes;
    setState(() {
      _profile = jsonRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            CircleAvatar(
                radius: 70,
                backgroundImage:
                    // AssetImage('assets/ABC0336A-37BA-4B6A-B438-41158B38E42B.jpg'),
                    NetworkImage(_profile['user']['avatar'])),
            const SizedBox(
              height: 20,
            ),
            Text(
              // "อนุภัทร แก้วมี",
              // "$_profile['user']['fname'] $_profile['user']['lname']",
              _profile['user']['fname'] + " " + _profile['user']['lname'],
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
            Text(
              // "6400922",
              _profile['user']['username'],
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.red.shade900,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "066-112-8806",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.red.shade900,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  // "anupat.k64@rsu.ac.th",
                  _profile['user']['username'],
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.red.shade900,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "มหาวิทยาลัยรังสิต เลขที่ 52/347 หมู่บ้านเมืองเอก ถ.พหลโยธิน ต.หลักหก อ.เมือง จ.ปทุมธานี 12000",
                    style: GoogleFonts.notoSansThaiLooped(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
