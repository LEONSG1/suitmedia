// SecondPage
import 'package:flutter/material.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  final String initialName; // Menyimpan nama dari input FirstPage

  const SecondPage(this.initialName, {Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String selectedUserName = ''; // Menyimpan nilai user yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.initialName, // Menampilkan input dari FirstPage
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  selectedUserName.isNotEmpty
                      ? selectedUserName // Menampilkan nama user yang dipilih dari ThirdPage
                      : 'Selected User Name', // Teks default jika belum ada yang dipilih
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdPage()),
                    );

                    if (result != null) {
                      setState(() {
                        selectedUserName =
                            result; // Perbarui nilai yang dipilih
                      });
                    }
                  },
                  child: const Text('Choose a User'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
