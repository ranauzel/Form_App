import 'package:flutter/material.dart';
import 'form1.dart';
import 'form2.dart';
import 'form3.dart';
import 'form4.dart';
import 'form5.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menü'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          buildCard(
            context,
            title: '1. Bütçe',
            editPage: Form1(),
            previewImage:
                'assets/kapak1.jpg', // Form 1 için ön izleme fotoğrafı
          ),
          buildCard(
            context,
            title: '2. Giderler',
            editPage: Form2(),
            previewImage:
                'assets/kapak2.jpg', // Form 2 için ön izleme fotoğrafı
          ),
          buildCard(
            context,
            title: '3. Geçici Görevlendirmeler',
            editPage: Form3(),
            previewImage:
                'assets/kapak3.jpg', // Form 3 için ön izleme fotoğrafı
          ),
          buildCard(
            context,
            title: '4. Kurum ve Kuruluş Aidatları',
            editPage: Form4(),
            previewImage:
                'assets/kapak4.jpg', // Form 4 için ön izleme fotoğrafı
          ),
          buildCard(
            context,
            title: '5. Cari Giderler',
            editPage: Form5(),
            previewImage:
                'assets/kapak5.png', // Form 5 için ön izleme fotoğrafı
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String title,
      required Widget editPage,
      required String previewImage}) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editPage),
              );
            },
            child: Container(
              height: 200, // Ön izleme alanının yüksekliği
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8.0), // Ön izleme alanının köşe yuvarlaklığı
                image: DecorationImage(
                  image: AssetImage(previewImage), // Ön izleme fotoğrafı
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editPage),
                  );
                },
                child: Text('DÜZENLE'),
              ),
              TextButton(
                onPressed: () {
                  // Rapor butonu işlemi
                },
                child: Text('RAPOR'),
              ),
              TextButton(
                onPressed: () {
                  // Yayın adresi butonu işlemi
                },
                child: Text('YAYIN ADRESİ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
