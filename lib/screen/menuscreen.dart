import 'package:flutter/material.dart';
import '../feature.dart';
import 'form1.dart';
import 'form2.dart';
import 'form3.dart';
import 'form4.dart';
import 'form5.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menü'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            buildCard(
              context,
              title: '1. Bütçe',
              editPage: Form1(userId: 2),
              previewImage:
                  'assets/MenuG.jpg', // Form 1 için ön izleme fotoğrafı
            ),
            buildCard(
              context,
              title: '2. Giderler',
              editPage: Form2(),
              previewImage:
                  'assets/MenuG.jpg', // Form 2 için ön izleme fotoğrafı
            ),
            buildCard(
              context,
              title: '3. Cari Giderler',
              editPage: Form3(),
              previewImage:
                  'assets/MenuG.jpg', // Form 3 için ön izleme fotoğrafı
            ),
            buildCard(
              context,
              title: '4. Geçici Görevlendirmeler',
              editPage: Form4(),
              previewImage:
                  'assets/MenuG.jpg', // Form 4 için ön izleme fotoğrafı
            ),
            buildCard(
              context,
              title: '5. Aidatlar',
              editPage: Form5(),
              previewImage:
                  'assets/MenuG.jpg', // Form 5 için ön izleme fotoğrafı
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String title,
      required Widget editPage,
      required String previewImage}) {
    return Card(
      color: Colors.transparent,
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
