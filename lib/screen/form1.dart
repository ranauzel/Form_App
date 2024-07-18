import 'package:flutter/material.dart';
import '../database/database_helper.dart'; // Bu kısmı kendi projenizin dosya yapısına göre düzenleyin
import '../styles/styles.dart';
import '../styles/card_styles.dart';
import '../feature.dart';

class Form1 extends StatefulWidget {
  final int userId;

  Form1({required this.userId});

  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _allocationController1;
  late TextEditingController _realizationController1;
  late TextEditingController _rateController1;
  late TextEditingController _allocationController2;
  late TextEditingController _realizationController2;
  late TextEditingController _rateController2;

  @override
  void initState() {
    super.initState();
    _allocationController1 = TextEditingController();
    _realizationController1 = TextEditingController();
    _rateController1 = TextEditingController();
    _allocationController2 = TextEditingController();
    _realizationController2 = TextEditingController();
    _rateController2 = TextEditingController();
  }

  @override
  void dispose() {
    _allocationController1.dispose();
    _realizationController1.dispose();
    _rateController1.dispose();
    _allocationController2.dispose();
    _realizationController2.dispose();
    _rateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bütçe Gerçekleşmeleri'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: CardStyles.gradientBackground,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormCard(
                    title: 'İşletme Cari Bütçesi',
                    allocationController: _allocationController1,
                    realizationController: _realizationController1,
                    rateController: _rateController1,
                  ),
                  SizedBox(height: 20),
                  FormCard(
                    title: 'Yatırım Bütçesi',
                    allocationController: _allocationController2,
                    realizationController: _realizationController2,
                    rateController: _rateController2,
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
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    // Veritabanına kayıt işlemi burada yapılacak
    await DatabaseHelper.instance.insertBudgetEntry(
      widget.userId,
      'İşletme Cari Bütçesi',
      _allocationController1.text,
      _realizationController1.text,
      _rateController1.text,
    );
    await DatabaseHelper.instance.insertBudgetEntry(
      widget.userId,
      'Yatırım Bütçesi',
      _allocationController2.text,
      _realizationController2.text,
      _rateController2.text,
    );

    // Kayıt işlemi tamamlandıktan sonra kullanıcı bilgilendirilebilir veya başka bir işlem yapılabilir
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bütçe girişleri başarıyla kaydedildi'),
      ),
    );
  }
}

class FormCard extends StatelessWidget {
  final String title;
  final TextEditingController allocationController;
  final TextEditingController realizationController;
  final TextEditingController rateController;

  FormCard({
    required this.title,
    required this.allocationController,
    required this.realizationController,
    required this.rateController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CardStyles.cardDecoration.color,
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
              style: AppStyles.cardTitleStyle,
            ),
            SizedBox(height: 10),
            buildTextFormField('1. Ödenek (TL)', allocationController),
            SizedBox(height: 10),
            buildTextFormField('2. Gerçekleşme (TL)', realizationController),
            SizedBox(height: 10),
            buildTextFormField('3. Gerçekleşme Oranı (%)', rateController),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: AppStyles.inputDecoration.copyWith(
          labelText: labelText,
        ),
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen bu alanı doldurun';
          }
          if (double.tryParse(value) == null) {
            return 'Lütfen geçerli bir sayı girin';
          }
          return null;
        },
      ),
    );
  }
}
