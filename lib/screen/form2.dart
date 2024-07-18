import 'package:flutter/material.dart';
import '../feature.dart';
import '../styles/card_styles.dart';
import '../styles/form_card_styles.dart';
import '../database/database_helper.dart';

class Form2 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

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
  TextEditingController tasraController1 = TextEditingController();
  TextEditingController tasraController2 = TextEditingController();
  TextEditingController tlsuController = TextEditingController();
  TextEditingController tlelektrikController = TextEditingController();
  TextEditingController tldogalgazController = TextEditingController();
  TextEditingController tllpgController = TextEditingController();
  TextEditingController tllngController = TextEditingController();
  TextEditingController tlmotorinController = TextEditingController();
  TextEditingController tlfueloilController = TextEditingController();
  TextEditingController tlkomurController = TextEditingController();
  TextEditingController giyimyardimController = TextEditingController();

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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      int userId = 1; // Kullanıcı ID'sini güncelle

      await dbHelper.insertVehicleUsageEntry(
        userId,
        int.tryParse(resmiController.text) ?? 0,
        int.tryParse(kiralikController.text) ?? 0,
        toplamTasitSayisi,
        int.tryParse(yolController.text) ?? 0,
        int.tryParse(akaryakitController.text) ?? 0,
        int.tryParse(tutarController.text) ?? 0,
        aciklamaController.text,
        int.tryParse(elektrikKwhController.text) ?? 0,
        int.tryParse(isinmaM3Controller.text) ?? 0,
        int.tryParse(suM3Controller.text) ?? 0,
        int.tryParse(elektrikTlController.text) ?? 0,
        int.tryParse(gazTlController.text) ?? 0,
        int.tryParse(suTlController.text) ?? 0,
        int.tryParse(komurTonController.text) ?? 0,
        int.tryParse(fuelOilTonController.text) ?? 0,
        int.tryParse(lngTonController.text) ?? 0,
        int.tryParse(motorinLtController.text) ?? 0,
        int.tryParse(lpgKgController.text) ?? 0,
        int.tryParse(komurTlController.text) ?? 0,
        int.tryParse(fuelOilTlController.text) ?? 0,
        int.tryParse(lngTlController.text) ?? 0,
        int.tryParse(motorinTlController.text) ?? 0,
        int.tryParse(lpgTlController.text) ?? 0,
        yakitAciklamaController.text,
        int.tryParse(tasraController1.text) ?? 0,
        int.tryParse(tasraController2.text) ?? 0,
        int.tryParse(tlsuController.text) ?? 0,
        int.tryParse(tlelektrikController.text) ?? 0,
        int.tryParse(tldogalgazController.text) ?? 0,
        int.tryParse(tllpgController.text) ?? 0,
        int.tryParse(tllngController.text) ?? 0,
        int.tryParse(tlmotorinController.text) ?? 0,
        int.tryParse(tlfueloilController.text) ?? 0,
        int.tryParse(tlkomurController.text) ?? 0,
        int.tryParse(giyimyardimController.text) ?? 0,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form başarıyla kaydedildi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Taşıt Kullanımı ve Yönetimi Formu'),
        ),
        body: Container(
          decoration: CardStyles.gradientBackground,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormCard(
                        title: 'Resmi ve Kiralık Taşıt Kullanımı',
                        children: [
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
                      FormCard(
                        title: 'Yol ve Akaryakıt Bilgileri',
                        children: [
                          buildNumericField('Yol (km)', yolController),
                          buildNumericField(
                              'Akaryakıt Tüketimi (lt)', akaryakitController),
                          buildNumericField('Tutar (TL)', tutarController),
                          sectionNote(
                              'Not 1 : Merkez ve taşrada kullanılan resmi ve kiralık hizmet araçlarına ait yol ve akaryakıt tüketim bilgileri yazılacak (iş makinaları hariç).'),
                          sectionNote(
                              'Not 2 : Yol (km) ve/veya akaryakıt tüketiminde bir önceki yıla göre %20 ve üzerinde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                          buildTextField(
                              'Açıklama: %20 Artış veya Azalış Sebebi',
                              aciklamaController,
                              maxLines: 3),
                        ],
                      ),
                      FormCard(
                        title: 'Personel',
                        children: [
                          buildNumericField(
                              'Merkez Hizmet Alımı(Taşeron)', tasraController1),
                          buildNumericField('Taşra Hizmet', tasraController2),
                        ],
                      ),
                      FormCard(
                        title:
                            'Cari Giderler (Elektrik, Isınma ve Su Giderleri)',
                        children: [
                          buildNumericField(
                              'Elektrik (kwh)', elektrikKwhController),
                          buildNumericField(
                              'Elektrik (TL)', tlelektrikController),
                          buildNumericField(
                              'Isınma (Doğal Gaz m³)', isinmaM3Controller),
                          buildNumericField(
                              'Isınma Doğalgaz (TL)', tldogalgazController),
                          buildNumericField('Su (m³)', suM3Controller),
                          buildNumericField('Su (TL)', tlsuController),
                          sectionNote(
                              'Not: Elektrik, Isınma ve Su tüketimlerinde bir önceki yıla göre %20 ve üstünde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                          buildTextField('%20 Artış veya Azalış Sebebi',
                              elektrikTlController,
                              maxLines: 3),
                        ],
                      ),
                      FormCard(
                        title:
                            'Doğal Gaz Haricinde Isınma Amaçlı Kullanılan Diğer Yakıt Tüketimleri',
                        children: [
                          buildNumericField('Kömür (ton)', komurTonController),
                          buildNumericField('Kömür (TL)', tlkomurController),
                          buildNumericField(
                              'Fuel Oil (ton)', fuelOilTonController),
                          buildNumericField(
                              'Fuel Oil (TL)', tlfueloilController),
                          buildNumericField('LNG (ton)', lngTonController),
                          buildNumericField('LNG (TL)', tllngController),
                          buildNumericField(
                              'Motorin (lt.)', motorinLtController),
                          buildNumericField(
                              'Motorin (TL.)', tlmotorinController),
                          buildNumericField('LPG (kg)', lpgKgController),
                          buildNumericField('LPG (TL)', tllpgController),
                          sectionNote(
                              'Not : Metrik bazda bir önceki yıla göre %20 ve üstünde değişim olması (artış yada azalış) durumunda artış yada azalışın sebepleri nelerdir? Açıklama yazılacak.'),
                          buildTextField(
                              'Açıklama: %20 Artış veya Azalış Sebebi',
                              yakitAciklamaController,
                              maxLines: 3),
                        ],
                      ),
                      FormCard(
                        title: 'Giyim Yardımı Tutarı(TL)',
                        children: [
                          buildNumericField('2023 Yılı Giyim Yardımı Tutarı',
                              giyimyardimController),
                          sectionNote(
                              'Not: Giyim yardımı olarak beyan edilen tutar içerisinde sağlık, yemek, yol vb. yardım kalemleri bulunması halinde, her bir kalemin tutarı ayrı verilecektir.')
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
}
