import 'package:flutter/material.dart';

class Form3 extends StatefulWidget {
  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {
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
  TextEditingController tllpgController = TextEditingController();
  TextEditingController tllngController = TextEditingController();
  TextEditingController tlmotorinController = TextEditingController();
  TextEditingController tlfueloilController = TextEditingController();
  TextEditingController tlkomurController = TextEditingController();
  TextEditingController tlsuController = TextEditingController();
  TextEditingController tlelektrikController = TextEditingController();
  TextEditingController tldogalgazController = TextEditingController();

  int get toplamTasitSayisi =>
      (int.tryParse(resmiController.text) ?? 0) +
      (int.tryParse(kiralikController.text) ?? 0);

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formCard(
                  'Resmi ve Kiralık Taşıt Kullanımı',
                  [
                    buildNumericField('Resmi Taşıt Sayısı', resmiController),
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
                    sectionNote('Not 2: Yol ve Akaryakıt Değişim Açıklaması'),
                    TextFormField(
                      controller: aciklamaController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: '%20 Artış veya Azalış Sebebi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                formCard(
                  'Cari Giderler (Elektrik, Isınma ve Su Giderleri)',
                  [
                    buildNumericField('Elektrik (kwh)', elektrikKwhController),
                    buildNumericField('Elektrik (TL)', tlelektrikController),
                    buildNumericField(
                        'Isınma (Doğal Gaz m³)', isinmaM3Controller),
                    buildNumericField(
                        'Isınma (Doğal Gaz TL)', tldogalgazController),
                    buildNumericField('Su (m³)', suM3Controller),
                    buildNumericField('Su (TL)', tlsuController),
                    sectionNote(
                        'Not: Elektrik, Isınma ve Su Değişim Açıklaması'),
                    TextFormField(
                      controller: elektrikTlController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: '%20 Artış veya Azalış Sebebi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                formCard(
                  'Doğal Gaz Haricinde Isınma Amaçlı Kullanılan Diğer Yakıt Tüketimleri',
                  [
                    buildNumericField('Kömür (ton)', komurTonController),
                    buildNumericField('Kömür (TL)', tlkomurController),
                    buildNumericField('Fuel Oil (ton)', fuelOilTonController),
                    buildNumericField('Fuel Oil (TL)', tlfueloilController),
                    buildNumericField('LNG (ton)', lngTonController),
                    buildNumericField('LNG (TL)', tllngController),
                    buildNumericField('Motorin (lt.)', motorinLtController),
                    buildNumericField('Motorin (TL)', tlmotorinController),
                    buildNumericField('LPG (kg)', lpgKgController),
                    buildNumericField('LPG (TL)', tllpgController),
                    sectionNote('Not: Metrik Bazda Yakıt Değişim Açıklaması'),
                    TextFormField(
                      controller: yakitAciklamaController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: '%20 Artış veya Azalış Sebebi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Form tamamlandı');
                      }
                    },
                    child: Text('Tamamla'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumericField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
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
    );
  }

  Widget sectionNote(String note) {
    return Text(
      note,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
    );
  }

  Widget formCard(String title, List<Widget> children) {
    return Card(
      color: Colors.transparent,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
