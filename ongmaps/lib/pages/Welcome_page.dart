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

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    // Navegando para a página do Google Maps
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleMapsFlutter()), // Redireciona para a classe GoogleMapsFlutter
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

class GoogleMapsFlutter extends StatelessWidget {
  const GoogleMapsFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-23.55052, -46.633309), // Exemplo: São Paulo
          zoom: 11.0,
        ),
      ),
    );
  }
}
