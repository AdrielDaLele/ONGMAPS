import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importando o Google Maps
import 'package:ongmaps/pages/Maps_page.dart'; // Ou a página que você tem para o Google Maps

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  // Controlador para a animação
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) async {
    _controller.reverse();

    // Exibe uma tela de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Simula um atraso para o carregamento (por exemplo, 2 segundos)
    await Future.delayed(const Duration(seconds: 2));

    // Fecha a tela de carregamento
    Navigator.of(context).pop();

    // Navega para a página do Google Maps
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleMapsFlutter()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Fundo azul escuro
      body: Center(
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 1.1).animate(_animation),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Text(
                'ONGMaps',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Color(0xFF0A0A0A), // Azul muito escuro quase preto
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
