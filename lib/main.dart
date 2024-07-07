import 'package:flutter/material.dart';
import 'menuscreen.dart'; // MenuScreen dosyasını import edin

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Group2(),
          ],
        ),
      ),
    );
  }
}

class Group2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          height: 751,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 132,
                child: Container(
                  width: 330,
                  height: 619,
                  decoration: ShapeDecoration(
                    color: Color(0xFFDDCECE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 330,
                          height: 619,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF2585A3), Color(0xFF172854)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 48,
                        child: Container(
                          width: 269,
                          child: Text(
                            'Formlar uygulamasına giriş yapın.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Adamina',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 132,
                        child: Container(
                          width: 274,
                          child: Text(
                            'Kendiniz, biriminiz ya da tüm kurum için formlar ve anketler oluşturabilir, paylaşabilirsiniz.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'OFL Sorts Mill Goudy TT',
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 390,
                child: Container(
                  width: 300,
                  height: 149,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 77,
                        child: Container(
                          width: 300,
                          height: 72,
                          decoration: ShapeDecoration(
                            color: Colors.black.withOpacity(0.18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 300,
                          height: 72,
                          decoration: ShapeDecoration(
                            color: Colors.black.withOpacity(0.18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 296,
                          height: 68,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, 0.00),
                              end: Alignment(-1, 0),
                              colors: [Colors.white, Colors.white],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 77,
                        child: Container(
                          width: 296,
                          height: 68,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 24,
                        child: SizedBox(
                          width: 195,
                          height: 19,
                          child: Text(
                            'Kullanıcı Adı:',
                            style: TextStyle(
                              color: Color(0xFF7E8180),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 97,
                        child: SizedBox(
                          width: 195,
                          height: 19,
                          child: Text(
                            'Şifre:',
                            style: TextStyle(
                              color: Color(0xFF7E8180),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 589,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuScreen()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 44,
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFB23A3A),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFFDE8E7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Giriş Yap',
                          style: TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 654,
                child: Container(
                  width: 300,
                  height: 44,
                  padding: const EdgeInsets.all(12),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2A4487),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFDE8E7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Botaş ID İle Giriş Yap',
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 119,
                top: 0,
                child: Container(
                  width: 88,
                  height: 115,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Botas1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
