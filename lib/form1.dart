import 'package:flutter/material.dart';

class Form1 extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bütçe Gerçekleşmeleri'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2585A3), Color(0xFF172854)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BudgetCard(
                  title: 'İşletme Cari Bütçesi',
                  allocationPlaceholder: '38.105.442.272 (2022)',
                  realizationPlaceholder: '42.032.432.011 (2022)',
                  ratePlaceholder: '110% (2022)',
                ),
                SizedBox(height: 20),
                BudgetCard(
                  title: 'Yatırım Bütçesi',
                  allocationPlaceholder: '12.100.000.000 (2022)',
                  realizationPlaceholder: '10.652.502.090 (2022)',
                  ratePlaceholder: '88% (2022)',
                ),
                SizedBox(height: 20),
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
}

class BudgetCard extends StatelessWidget {
  final String title;
  final String allocationPlaceholder;
  final String realizationPlaceholder;
  final String ratePlaceholder;

  BudgetCard({
    required this.title,
    required this.allocationPlaceholder,
    required this.realizationPlaceholder,
    required this.ratePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 10),
            buildTextFormField('1. Ödenek (TL)', allocationPlaceholder),
            SizedBox(height: 10),
            buildTextFormField('2. Gerçekleşme (TL)', realizationPlaceholder),
            SizedBox(height: 10),
            buildTextFormField('3. Gerçekleşme Oranı (%)', ratePlaceholder),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(String labelText, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(),
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
