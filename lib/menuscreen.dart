import 'package:flutter/material.dart';
import 'form1.dart'; // Form1 sayfasını içeri aktarıyoruz.
import 'form2.dart'; // Form2 sayfasını içeri aktarıyoruz.
import 'form3.dart'; // Form3 sayfasını içeri aktarıyoruz.
import 'form4.dart'; // Form4 sayfasını içeri aktarıyoruz.
import 'form5.dart'; // Form5 sayfasını içeri aktarıyoruz.

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Menu Screen!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Buton ile metin arasına boşluk ekleyelim.
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Form1()),
                );
              },
              child: Text('Go to Form1'),
            ),
            SizedBox(height: 10), // Diğer butonlar arasına boşluk ekleyelim.
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Form2()),
                );
              },
              child: Text('Go to Form2'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Form3()),
                );
              },
              child: Text('Go to Form3'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Form4()),
                );
              },
              child: Text('Go to Form4'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Form5()),
                );
              },
              child: Text('Go to Form5'),
            ),
          ],
        ),
      ),
    );
  }
}
