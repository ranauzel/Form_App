import 'package:flutter/material.dart';
import 'form1.dart'; // Form1 sayfasını içeri aktarıyoruz.

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
          ],
        ),
      ),
    );
  }
}
