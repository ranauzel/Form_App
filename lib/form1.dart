import 'package:flutter/material.dart';

class Form1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bütçe Gerçekleşmeleri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('İşletme Cari Bütçesi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            BudgetForm(
              allocationPlaceholder: '38.105.442.272 (2022)',
              realizationPlaceholder: '42.032.432.011 (2022)',
              ratePlaceholder: '110% (2022)',
            ),
            SizedBox(height: 20),
            Text('Yatırım Bütçesi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            BudgetForm(
              allocationPlaceholder: '12.100.000.000 (2022)',
              realizationPlaceholder: '10.652.502.090 (2022)',
              ratePlaceholder: '88% (2022)',
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tamamla butonuna basıldığında yapılacak işlemler buraya yazılır.
                  print('Form tamamlandı');
                },
                child: Text('Tamamla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetForm extends StatelessWidget {
  final String allocationPlaceholder;
  final String realizationPlaceholder;
  final String ratePlaceholder;

  BudgetForm({
    required this.allocationPlaceholder,
    required this.realizationPlaceholder,
    required this.ratePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: '1. Ödenek (TL)',
            hintText: allocationPlaceholder,
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: '2. Gerçekleşme (TL)',
            hintText: realizationPlaceholder,
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: '3. Gerçekleşme Oranı (%)',
            hintText: ratePlaceholder,
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
