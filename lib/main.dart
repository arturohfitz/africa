import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const AprendeApp());
}

class AprendeApp extends StatelessWidget {
  const AprendeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprende Números y Colores',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AprendeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AprendeHomePage extends StatefulWidget {
  const AprendeHomePage({super.key});

  @override
  State<AprendeHomePage> createState() => _AprendeHomePageState();
}

class _AprendeHomePageState extends State<AprendeHomePage> {
  final FlutterTts _tts = FlutterTts();
  final PageController _pageController = PageController();

  final List<NumeroColor> _items = const [
    NumeroColor(numero: 1, colorName: 'Rojo', color: Colors.red, songLine: 'Rojo, rojo, como un corazón.'),
    NumeroColor(numero: 2, colorName: 'Azul', color: Colors.blue, songLine: 'Azul, azul, como el cielo y el mar.'),
    NumeroColor(numero: 3, colorName: 'Amarillo', color: Colors.yellow, songLine: 'Amarillo, amarillo, como el sol brillante.'),
    NumeroColor(numero: 4, colorName: 'Verde', color: Colors.green, songLine: 'Verde, verde, como las hojas al bailar.'),
    NumeroColor(numero: 5, colorName: 'Rosa', color: Colors.pink, songLine: 'Rosa, rosa, como una flor feliz.'),
    NumeroColor(numero: 6, colorName: 'Naranja', color: Colors.orange, songLine: 'Naranja, naranja, como un jugo dulce.'),
    NumeroColor(numero: 7, colorName: 'Morado', color: Colors.deepPurple, songLine: 'Morado, morado, color de imaginación.'),
    NumeroColor(numero: 8, colorName: 'Blanco', color: Colors.white, songLine: 'Blanco, blanco, como la nube en el cielo.'),
    NumeroColor(numero: 9, colorName: 'Negro', color: Colors.black, songLine: 'Negro, negro, como la noche serena.'),
    NumeroColor(numero: 10, colorName: 'Café', color: Color(0xFF8B5A2B), songLine: 'Café, café, como la tierra al jugar.'),
  ];

  @override
  void dispose() {
    _tts.stop();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _speak(NumeroColor item) async {
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.1);
    await _tts.speak('Número ${item.numero}. Color ${item.colorName}. ${item.songLine}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprende Números y Colores'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          final textColor = item.color.computeLuminance() > 0.5 ? Colors.black : Colors.white;

          return Container(
            color: item.color,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${item.numero}',
                  style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item.colorName,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.songLine,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => _speak(item),
                  icon: const Icon(Icons.volume_up),
                  label: const Text('Escuchar'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Desliza para el siguiente número',
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NumeroColor {
  final int numero;
  final String colorName;
  final Color color;
  final String songLine;

  const NumeroColor({
    required this.numero,
    required this.colorName,
    required this.color,
    required this.songLine,
  });
}
