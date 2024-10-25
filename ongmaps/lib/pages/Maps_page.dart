import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para widgets e temas.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa o Google Maps para Flutter.
import 'package:custom_info_window/custom_info_window.dart'; // Importa a biblioteca para janelas de informações personalizadas.
import 'package:ongmaps/pages/Descricacao_page.dart'; // Não se esqueça de importar as páginas de descrição.

class GoogleMapsFlutter extends StatefulWidget {
  const GoogleMapsFlutter({super.key}); // Construtor da classe GoogleMapsFlutter.

  @override
  State<GoogleMapsFlutter> createState() => _GoogleMapsFlutterState(); // Cria o estado para o widget.
}

class _GoogleMapsFlutterState extends State<GoogleMapsFlutter> {
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController(); // Controlador da janela.
  Set<Marker> markers = {}; // Marcadores.

  final List<LatLng> latlongPoint = [
    const LatLng(-22.858249818019033, -47.04822860807837), // ABRAES
    const LatLng(-22.900747199053033, -47.061201838471305), // IAPI
  ];

  final List<String> locationNames = ["ABRAES", "IAPI"];
  final List<Widget> locationDescriptions = [const DISCRIPTION_ABRAES(), const DISCRIPTION_IAPI()]; // Atualização para usar widgets

  final List<String> locationImages = [
    "https://imgs.search.brave.com/hMgEspYNZw3vsej4ugzJB227HNaFwErw1XZNDCE3O1Q/rs:fit:860:0:0:0/g:ce/aHR0cDovL3d3dy5v/bmdzYnJhc2lsLmNv/bS5ici9pbWFnZXMv/b25ncy1kZS1jcmlh/bmNhcy5qcGc",
    "https://imgs.search.brave.com/Q5LwmAOVKZb7mNtX7haSs1tvohCHVC7vSHH5d3XxTKA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbGFz/c2ljLmV4YW1lLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8xMC9Gb3RvLTNf/T2ZpY2luYS1jb20t/Y3JpYW5jYXMtbmEt/UGluYWNvdGVjYV9E/aXZ1bGdhY2FvLmpw/Zz9xdWFsaXR5PTcw/JnN0cmlwPWluZm8m/dz0xMDI0dW5kZWZp/bmVk",
  ];

  @override
  void initState() {
    super.initState();
    displayInfo(); // Inicializa e exibe os marcadores com janelas de informações personalizadas.
  }

  void displayInfo() {
    for (int i = 0; i < latlongPoint.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: latlongPoint[i],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              _buildInfoWindow(locationNames[i], locationImages[i], i),
              latlongPoint[i],
            );
          },
        ),
      );
    }
    setState(() {}); // Atualiza a interface.
  }

  // Função para construir a janela de informações com um botão
  Widget _buildInfoWindow(String name, String imageUrl, int index) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.network(
              imageUrl,
              height: 125,
              width: 250,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'Erro ao carregar imagem',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espaçamento entre o texto e o botão
                ElevatedButton(
                  onPressed: () {
                    // Use o índice para acessar a descrição correta
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => locationDescriptions[index]), // Navegar para a página correta
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Cor de fundo do botão
                    side: const BorderSide(color: Colors.black), // Cor da borda
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas
                    ),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.black), // Ícone da seta
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ONGMaps",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 68, 107), // Cor de fundo escura e levemente transparente
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-22.912847283240453, -47.041346547261014),
              zoom: 12,
            ),
            markers: markers,
            onTap: (LatLng position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 190,
            width: 250,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
