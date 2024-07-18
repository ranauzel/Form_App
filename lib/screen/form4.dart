import 'package:flutter/material.dart';
import '../feature.dart';

class Form4 extends StatefulWidget {
  @override
  _Form4State createState() => _Form4State();
}

class _Form4State extends State<Form4> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController merkezController = TextEditingController();
  TextEditingController tasraController = TextEditingController();
  TextEditingController kisiSayisiMController = TextEditingController();
  TextEditingController seyahatMController = TextEditingController();
  TextEditingController tutarMController = TextEditingController();
  TextEditingController kisiSayisiTController = TextEditingController();
  TextEditingController seyahatTController = TextEditingController();
  TextEditingController tutarTController = TextEditingController();
  TextEditingController merkezKurumPController = TextEditingController();
  TextEditingController tasraKurumPController = TextEditingController();
  TextEditingController izinPerSayiController = TextEditingController();
  TextEditingController izinPerGunController = TextEditingController();
  TextEditingController emeklilikPerController = TextEditingController();
  TextEditingController emeklilikPerIzinController = TextEditingController();
  TextEditingController yevmiyeController = TextEditingController();
  TextEditingController tutarMuhtemelController = TextEditingController();
  TextEditingController perSayiController = TextEditingController();
  TextEditingController tutarFiilController = TextEditingController();
  TextEditingController mesaiSaatController = TextEditingController();
  TextEditingController mesaiSaatTutarController = TextEditingController();
  TextEditingController mesaiGunController = TextEditingController();
  TextEditingController mesaiGunTutarController = TextEditingController();
  TextEditingController mesaiLimitController = TextEditingController();

  List<Map<String, TextEditingController>> personnelList = [];

  int toplamTL = 0;
  int toplamMesai = 0;

  @override
  void initState() {
    super.initState();
    merkezController.addListener(_updateToplamSayisi);
    tasraController.addListener(_updateToplamSayisi);
    mesaiGunController.addListener(_updateToplamMesai);
    mesaiGunTutarController.addListener(_updateToplamMesai);
  }

  @override
  void dispose() {
    merkezController.dispose();
    tasraController.dispose();
    kisiSayisiMController.dispose();
    seyahatMController.dispose();
    tutarMController.dispose();
    kisiSayisiTController.dispose();
    seyahatTController.dispose();
    tutarTController.dispose();
    merkezKurumPController.dispose();
    tasraKurumPController.dispose();
    izinPerSayiController.dispose();
    izinPerGunController.dispose();
    emeklilikPerController.dispose();
    emeklilikPerIzinController.dispose();
    yevmiyeController.dispose();
    tutarMuhtemelController.dispose();
    perSayiController.dispose();
    tutarFiilController.dispose();
    mesaiSaatController.dispose();
    mesaiSaatTutarController.dispose();
    mesaiGunController.dispose();
    mesaiGunTutarController.dispose();
    mesaiLimitController.dispose();
    personnelList.forEach((personnel) {
      personnel['sicilNo']!.dispose();
      personnel['adSoyad']!.dispose();
      personnel['geciciGorev']!.dispose();
    });
    super.dispose();
  }

  void _updateToplamSayisi() {
    setState(() {
      int merkezTL = int.tryParse(merkezController.text) ?? 0;
      int tasraTL = int.tryParse(tasraController.text) ?? 0;
      toplamTL = merkezTL + tasraTL;
    });
  }

  void _updateToplamMesai() {
    setState(() {
      int mesaiSaat = int.tryParse(mesaiSaatTutarController.text) ?? 0;
      int mesaiGun = int.tryParse(mesaiGunTutarController.text) ?? 0;
      toplamMesai = mesaiSaat + mesaiGun;
    });
  }

  void _addPersonnelFields() {
    setState(() {
      personnelList.add({
        'sicilNo': TextEditingController(),
        'adSoyad': TextEditingController(),
        'geciciGorev': TextEditingController(),
      });
    });
  }

  void _removePersonnelFields(int index) {
    setState(() {
      personnelList[index]['sicilNo']!.dispose();
      personnelList[index]['adSoyad']!.dispose();
      personnelList[index]['geciciGorev']!.dispose();
      personnelList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Geçici Görevlendirmeler Formu'),
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
                    title: 'Geçici Görevlendirmeler',
                    children: [
                      buildNumericField('Merkez (TL)', merkezController),
                      buildNumericField('Taşra (TL)', tasraController),
                      buildReadOnlyField(
                          'Toplam Taşıt Sayısı', toplamTL.toString()),
                      SizedBox(height: 20),
                      Text(
                        'Not: Tutar; ulaşım ve konaklama bedellerinin toplamı olmalı, eğer tutar içerisinde ulaşım veya konaklama bedelleri yoksa belirtilmelidir.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  formCard(
                    title: 'Yurtdışı Geçici Görev Yollukları',
                    children: [
                      buildNumericField(
                          'Kişi Sayısı (Merkez)', kisiSayisiMController),
                      buildNumericField(
                          'Seyahat Gün Sayısı (Merkez)', seyahatMController),
                      buildNumericField(
                          'Tutar (TL) (Merkez)', tutarMController),
                      SizedBox(height: 20),
                      buildNumericField(
                          'Kişi Sayısı (Taşra)', kisiSayisiTController),
                      buildNumericField(
                          'Seyahat Gün Sayısı (Taşra)', seyahatTController),
                      buildNumericField('Tutar (TL) (Taşra)', tutarTController),
                      SizedBox(height: 20),
                      Text(
                        'Not 1: Toplu seyahatlerde; kişi sayısı ile seyahat süresinin çarpımı Seyahat Gün Sayısı sütununa yazılacaktır. (Ör: Kişi sayısı 3, seyahatin süresi 4 gün ise Seyahat Gün Sayısı=3X4=12)',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Not 2: Tutar; yevmiye, ulaşım ve konaklama bedellerinin toplamı olmalı, eğer tutar içerisinde ulaşım veya konaklama bedelleri yoksa belirtilmelidir.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  formCard(
                    title: 'Personel',
                    children: [
                      Text(
                        'Personel Sayısı',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildNumericField('Merkez Kurum Personeli Sayısı',
                          merkezKurumPController),
                      buildNumericField('Taşra Kurum Personeli Sayısı',
                          tasraKurumPController),
                      SizedBox(height: 10),
                      Text(
                        'Personel İzinleri',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildNumericField(
                          '60 Günden Fazla İzni Olan Personel Sayısı',
                          izinPerSayiController),
                      buildNumericField(
                          '60 Günden Fazla İzni Olan Personelin Toplam İzin Günü',
                          izinPerGunController),
                    ],
                  ),
                  formCard(
                    title:
                        'ETKB’de Geçici Görevli Olup 60 Gün Üzeri İzni Olan KURUM KADROLU Personel Bilgileri',
                    children: [
                      buildNumericField(
                          'Emeklilik Per(son) Sayılar', emeklilikPerController),
                      buildNumericField(
                          'Emeklilik Per(son) İzni Olan Personel Sayısı',
                          emeklilikPerIzinController),
                      buildNumericField('Yevmiye (TL)', yevmiyeController),
                      buildNumericField(
                          'Yevmiye İle Tahsil Edilmiş Olabilecek Tutar (TL)',
                          tutarMuhtemelController),
                      buildNumericField(
                          'Şef ve Zabit Teminlerine İlişkin Türkiye’de 4 Yıldan Fazla Hizmeti Olan Personel Sayısı',
                          perSayiController),
                      buildNumericField(
                          'Şef ve Zabit Teminlerine İlişkin Türkiye’de 4 Yıldan Fazla Hizmeti Olan Personelin Yevmiye Karşılığı Tutar (TL)',
                          tutarFiilController),
                    ],
                  ),
                  formCard(
                    title: 'Mesai Hesabı',
                    children: [
                      buildNumericField(
                          'Mesai Saati Sayısı', mesaiSaatController),
                      buildNumericField('Mesai Saati ile Tutar (TL)',
                          mesaiSaatTutarController),
                      buildNumericField(
                          'Mesai Günü Sayısı', mesaiGunController),
                      buildNumericField(
                          'Mesai Günü ile Tutar (TL)', mesaiGunTutarController),
                      buildReadOnlyField(
                          'Mesai Limiti', mesaiLimitController.text),
                      SizedBox(height: 10),
                      Text(
                        'Mesai Hesaplaması; buraya İzin Guni ile 4 Gun olabilir.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  formCard(
                    title: 'Personel Geçici',
                    children: [
                      ElevatedButton(
                        onPressed: _addPersonnelFields,
                        child: Text('Personel Ekle'),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: personnelList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              buildPersonnelField(
                                  'Sicil No', personnelList[index]['sicilNo']!),
                              buildPersonnelField(
                                  'Ad Soyad', personnelList[index]['adSoyad']!),
                              buildPersonnelField('Gecici Gorev',
                                  personnelList[index]['geciciGorev']!),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => _removePersonnelFields(index),
                                child: Text('Personel Kaldır'),
                              ),
                              Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validate succeeded, perform necessary actions
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Validation successful')),
                          );
                        }
                      },
                      child: Text('Tamamla'),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumericField(String labelText, TextEditingController controller,
      {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Bu alan boş bırakılamaz';
          }
          return null;
        },
        controller: controller,
        readOnly: readOnly,
      ),
    );
  }

  Widget buildReadOnlyField(String labelText, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        initialValue: value,
      ),
    );
  }

  Widget formCard({required String title, required List<Widget> children}) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget buildPersonnelField(
      String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        controller: controller,
      ),
    );
  }
}
