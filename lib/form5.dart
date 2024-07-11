import 'package:flutter/material.dart';

class Form5 extends StatefulWidget {
  @override
  _Form5State createState() => _Form5State();
}

class _Form5State extends State<Form5> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController tuhisController = TextEditingController();
  final TextEditingController tideController = TextEditingController();
  final TextEditingController sanayiController = TextEditingController();
  final TextEditingController ticaretController = TextEditingController();
  final TextEditingController uluslararasiGazController =
      TextEditingController();
  final TextEditingController tasinabilirPilController =
      TextEditingController();
  final TextEditingController riskYonetimiController = TextEditingController();
  final TextEditingController kalderController = TextEditingController();
  final TextEditingController enerjiKonseyiController = TextEditingController();
  final TextEditingController kamuIsletmeleriController =
      TextEditingController();
  final TextEditingController ihracatcilarBirligiController =
      TextEditingController();
  final TextEditingController diger1Controller = TextEditingController();
  final TextEditingController diger2Controller = TextEditingController();
  final TextEditingController diger3Controller = TextEditingController();

  final TextEditingController digerKurum1Controller = TextEditingController();
  final TextEditingController digerKurum2Controller = TextEditingController();
  final TextEditingController digerKurum3Controller = TextEditingController();

  int totalAidat = 0;

  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  void _addListeners() {
    tuhisController.addListener(_updateTotal);
    tideController.addListener(_updateTotal);
    sanayiController.addListener(_updateTotal);
    ticaretController.addListener(_updateTotal);
    uluslararasiGazController.addListener(_updateTotal);
    tasinabilirPilController.addListener(_updateTotal);
    riskYonetimiController.addListener(_updateTotal);
    kalderController.addListener(_updateTotal);
    enerjiKonseyiController.addListener(_updateTotal);
    kamuIsletmeleriController.addListener(_updateTotal);
    ihracatcilarBirligiController.addListener(_updateTotal);
    diger1Controller.addListener(_updateTotal);
    diger2Controller.addListener(_updateTotal);
    diger3Controller.addListener(_updateTotal);
  }

  void _updateTotal() {
    setState(() {
      totalAidat = _calculateTotalAidat();
    });
  }

  int _calculateTotalAidat() {
    int total = 0;
    total += int.tryParse(tuhisController.text) ?? 0;
    total += int.tryParse(tideController.text) ?? 0;
    total += int.tryParse(sanayiController.text) ?? 0;
    total += int.tryParse(ticaretController.text) ?? 0;
    total += int.tryParse(uluslararasiGazController.text) ?? 0;
    total += int.tryParse(tasinabilirPilController.text) ?? 0;
    total += int.tryParse(riskYonetimiController.text) ?? 0;
    total += int.tryParse(kalderController.text) ?? 0;
    total += int.tryParse(enerjiKonseyiController.text) ?? 0;
    total += int.tryParse(kamuIsletmeleriController.text) ?? 0;
    total += int.tryParse(ihracatcilarBirligiController.text) ?? 0;
    total += int.tryParse(diger1Controller.text) ?? 0;
    total += int.tryParse(diger2Controller.text) ?? 0;
    total += int.tryParse(diger3Controller.text) ?? 0;
    return total;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data
      // You can save the data or send it to a server here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üyelik Aidatları Formu'),
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
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white
                    .withOpacity(0.1), // Adjust opacity or color as desired
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionHeader(
                            'Üye Olunan Ulusal ve Uluslararası Kurum ve Kuruluşlara Üyelik Aidatları'),
                        buildNumericField(
                            'Türk Ağır Sanayii Ve Hizmet Sektörü Kamu İşverenleri Sendikası Aidatı (TÜHİS)',
                            tuhisController,
                            placeholder: "62.000 (2022)"),
                        buildNumericField(
                            'Türkiye İç Denetim Enstitüsü Derneği (TİDE)',
                            tideController,
                            placeholder: "8.640 (2022)"),
                        buildNumericField('Sanayi Odası', sanayiController,
                            placeholder: "6.906 (2022)"),
                        buildNumericField('Ticaret Odası', ticaretController,
                            placeholder: "21.051 (2022)"),
                        buildNumericField('Uluslararası Gaz Birliği',
                            uluslararasiGazController),
                        buildNumericField(
                            'Taşınabilir Pil Üret. Ve İth. Derneği',
                            tasinabilirPilController),
                        buildNumericField('Kurumsal Risk Yönetimi Derneği',
                            riskYonetimiController,
                            placeholder: "6.000 (2022)"),
                        buildNumericField(
                            'Kalite Derneği (KALDER)', kalderController,
                            placeholder: "3.600 (2022)"),
                        buildNumericField(
                            'Dünya Enerji Konseyi', enerjiKonseyiController,
                            placeholder: "12.850 (2022)"),
                        buildNumericField('Türk Kamu İşletmeleri Birliği',
                            kamuIsletmeleriController,
                            placeholder: "20.000 (2022)"),
                        buildNumericField('İhracatçılar Birliği',
                            ihracatcilarBirligiController),
                        buildNumericField('Diğer 1', diger1Controller),
                        buildNumericField('Diğer 2', diger2Controller),
                        buildNumericField('Diğer 3', diger3Controller),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Toplam Aidat',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                            controller: TextEditingController(
                              text: totalAidat.toString(),
                            ),
                          ),
                        ),
                        sectionNote(
                            'Not: Yabancı para cinsinden yapılan ödemeler, ödemenin yapıldığı tarihteki döviz kuru üzerinden TL’ye çevrilip yazılacaktır.'),
                        buildTextField(
                            'Diğer Kuruluş 1 Adı', digerKurum1Controller),
                        buildTextField(
                            'Diğer Kuruluş 2 Adı', digerKurum2Controller),
                        buildTextField(
                            'Diğer Kuruluş 3 Adı', digerKurum3Controller),
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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

  Widget buildNumericField(String label, TextEditingController controller,
      {String? placeholder}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen bu alanı doldurun';
          }
          if (double.tryParse(value) == null) {
            return 'Lütfen geçerli bir sayı girin';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
