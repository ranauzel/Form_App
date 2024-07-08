import 'package:flutter/material.dart';

class Form2 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController resmiController = TextEditingController();
  TextEditingController kiralikController = TextEditingController();
  TextEditingController yolController = TextEditingController();
  TextEditingController akaryakitController = TextEditingController();
  TextEditingController tutarController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  TextEditingController elektrikKwhController = TextEditingController();
  TextEditingController isinmaM3Controller = TextEditingController();
  TextEditingController suM3Controller = TextEditingController();
  TextEditingController elektrikTlController = TextEditingController();
  TextEditingController gazTlController = TextEditingController();
  TextEditingController suTlController = TextEditingController();
  TextEditingController komurTonController = TextEditingController();
  TextEditingController fuelOilTonController = TextEditingController();
  TextEditingController lngTonController = TextEditingController();
  TextEditingController motorinLtController = TextEditingController();
  TextEditingController lpgKgController = TextEditingController();
  TextEditingController komurTlController = TextEditingController();
  TextEditingController fuelOilTlController = TextEditingController();
  TextEditingController lngTlController = TextEditingController();
  TextEditingController motorinTlController = TextEditingController();
  TextEditingController lpgTlController = TextEditingController();
  TextEditingController yakitAciklamaController = TextEditingController();

  int toplamTasitSayisi = 0;

  @override
  void initState() {
    super.initState();
    resmiController.addListener(_updateToplamTasitSayisi);
    kiralikController.addListener(_updateToplamTasitSayisi);
  }

  void _updateToplamTasitSayisi() {
    setState(() {
      int resmiTasit = int.tryParse(resmiController.text) ?? 0;
      int kiralikTasit = int.tryParse(kiralikController.text) ?? 0;
      toplamTasitSayisi = resmiTasit + kiralikTasit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taşıt Kullanımı ve Yönetimi Formu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2585A3), Color(0xFF172854)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formCard(
                      'Resmi ve Kiralık Taşıt Kullanımı',
                      [
                        buildNumericField(
                            'Resmi Taşıt Sayısı', resmiController),
                        buildNumericField(
                            'Kiralık Taşıt Sayısı', kiralikController),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Toplam Taşıt Sayısı',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                            controller: TextEditingController(
                              text: toplamTasitSayisi.toString(),
                            ),
                          ),
                        ),
                        sectionNote(
                            'Not: Merkez ve taşrada kullanılan resmi ve kiralık hizmet araç sayıları yazılacak (iş makinaları hariç).'),
                      ],
                    ),
                    formCard(
                      'Yol ve Akaryakıt Bilgileri',
                      [
                        buildNumericField('Yol (km)', yolController),
                        buildNumericField(
                            'Akaryakıt Tüketimi (lt)', akaryakitController),
                        buildNumericField('Tutar (TL)', tutarController),
                        sectionNote(
                            'Not 1 : Merkez ve taşrada kullanılan resmi ve kiralık hizmet araçlarına ait yol ve akaryakıt tüketim bilgileri yazılacak (iş makinaları hariç).'),
                        sectionNote(
                            'Not 2 : Yol (km) ve/veya akaryakıt tüketiminde bir önceki yıla göre %20 ve üzerinde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                        buildTextField('Açıklama: %20 Artış veya Azalış Sebebi',
                            aciklamaController,
                            maxLines: 3),
                      ],
                    ),
                    formCard(
                      'Cari Giderler (Elektrik, Isınma ve Su Giderleri)',
                      [
                        buildNumericField(
                            'Elektrik (kwh)', elektrikKwhController),
                        buildNumericField(
                            'Isınma (Doğal Gaz m³)', isinmaM3Controller),
                        buildNumericField('Su (m³)', suM3Controller),
                        sectionNote(
                            'Not: Elektrik, Isınma ve Su tüketimlerinde bir önceki yıla göre %20 ve üstünde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                        buildTextField('%20 Artış veya Azalış Sebebi',
                            elektrikTlController,
                            maxLines: 3),
                      ],
                    ),
                    formCard(
                      'Doğal Gaz Haricinde Isınma Amaçlı Kullanılan Diğer Yakıt Tüketimleri',
                      [
                        buildNumericField('Kömür (ton)', komurTonController),
                        buildNumericField(
                            'Fuel Oil (ton)', fuelOilTonController),
                        buildNumericField('LNG (ton)', lngTonController),
                        buildNumericField('Motorin (lt.)', motorinLtController),
                        buildNumericField('LPG (kg)', lpgKgController),
                        sectionNote(
                            'Not : Metrik bazda bir önceki yıla göre %20 ve üstünde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                        buildTextField('Açıklama: %20 Artış veya Azalış Sebebi',
                            yakitAciklamaController,
                            maxLines: 3),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _submitForm();
                          }
                        },
                        child: Text('Tamamla'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget sectionNote(String note) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        note,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen bu alanı doldurun';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildNumericField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen bu alanı doldurun';
          }
          if (double.tryParse(value) == null) {
            return 'Lütfen sadece sayı girin';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget formCard(String title, List<Widget> children) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(title),
            ...children,
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    // Handle form submission logic here
    print('Form tamamlandı');
  }
}
