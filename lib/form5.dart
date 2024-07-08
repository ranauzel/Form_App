import 'package:flutter/material.dart';

class Form5 extends StatefulWidget {
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form5> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taşıt Kullanımı ve Yönetimi Formu'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resmi ve Kiralık Taşıt Kullanımı',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildTextField('Resmi Taşıt Sayısı', resmiController),
              SizedBox(height: 10),
              buildTextField('Kiralık Taşıt Sayısı', kiralikController),
              SizedBox(height: 20),
              Text(
                'Yol ve Akaryakıt Bilgileri',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildNumericField('Yol (km)', yolController),
              SizedBox(height: 10),
              buildNumericField('Akaryakıt Tüketimi (lt)', akaryakitController),
              SizedBox(height: 10),
              buildNumericField('Tutar (TL)', tutarController),
              SizedBox(height: 20),
              Text(
                'Not 2: Yol ve Akaryakıt Değişim Açıklaması',
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: aciklamaController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '%20 Artış veya Azalış Sebebi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Cari Giderler (Elektrik, Isınma ve Su Giderleri)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildNumericField('Elektrik (kwh)', elektrikKwhController),
              SizedBox(height: 10),
              buildNumericField('Isınma (Doğal Gaz m³)', isinmaM3Controller),
              SizedBox(height: 10),
              buildNumericField('Su (m³)', suM3Controller),
              SizedBox(height: 10),
              Text(
                'Not: Elektrik, Isınma ve Su Değişim Açıklaması',
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: elektrikTlController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '%20 Artış veya Azalış Sebebi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Doğal Gaz Haricinde Isınma Amaçlı Kullanılan Diğer Yakıt Tüketimleri',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildNumericField('Kömür (ton)', komurTonController),
              SizedBox(height: 10),
              buildNumericField('Fuel Oil (ton)', fuelOilTonController),
              SizedBox(height: 10),
              buildNumericField('LNG (ton)', lngTonController),
              SizedBox(height: 10),
              buildNumericField('Motorin (lt.)', motorinLtController),
              SizedBox(height: 10),
              buildNumericField('LPG (kg)', lpgKgController),
              SizedBox(height: 10),
              Text(
                'Not: Metrik Bazda Yakıt Değişim Açıklaması',
                style: TextStyle(fontSize: 14),
              ),
              TextFormField(
                controller: yakitAciklamaController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: '%20 Artış veya Azalış Sebebi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form validation successful, process data
                    _submitForm();
                  }
                },
                child: Text('Tamamla'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bu alanı doldurun';
        }
        return null;
      },
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

  void _submitForm() {
    // Handle form submission logic here
    // Example: Save data to database or API call
    print('Form tamamlandı');
    // Reset controllers after submission if needed
    // resmiController.clear();
    // kiralikController.clear();
    // ...
  }
}
