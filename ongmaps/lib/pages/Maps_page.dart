import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para widgets e temas.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa o Google Maps para Flutter.
import 'package:custom_info_window/custom_info_window.dart'; // Importa a biblioteca para janelas de informações personalizadas.

class GoogleMapsFlutter extends StatefulWidget {
  const GoogleMapsFlutter({super.key}); // Construtor da classe GoogleMapsFlutter.

  @override
  State<GoogleMapsFlutter> createState() => _GoogleMapsFlutterState(); // Cria o estado para o widget.
}

class _GoogleMapsFlutterState extends State<GoogleMapsFlutter> {
  // Controlador para gerenciar o comportamento da janela de informações personalizadas
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  // Conjunto de marcadores a serem exibidos no mapa
  Set<Marker> markers = {};

  // Lista de coordenadas (LatLng) onde os marcadores serão colocados
  final List<LatLng> latlongPoint = [
    const LatLng(-22.858249818019033, -47.04822860807837), // Coordenada para ABRAES
    const LatLng(-22.900747199053033, -47.061201838471305), // Coordenada para IAPI
  ];

  // Nomes correspondentes para as localizações
  final List<String> locationNames = [
    "  ABRAES",
    "  IAPI",
  ];

  // URLs de imagens correspondentes para as localizações
  final List<String> locationImages = [
    "https://imgs.search.brave.com/hMgEspYNZw3vsej4ugzJB227HNaFwErw1XZNDCE3O1Q/rs:fit:860:0:0:0/g:ce/aHR0cDovL3d3dy5v/bmdzYnJhc2lsLmNv/bS5ici9pbWFnZXMv/b25ncy1kZS1jcmlh/bmNhcy5qcGc",
    "https://imgs.search.brave.com/Q5LwmAOVKZb7mNtX7haSs1tvohCHVC7vSHH5d3XxTKA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbGFz/c2ljLmV4YW1lLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8xMC9Gb3RvLTNf/T2ZpY2luYS1jb20t/Y3JpYW5jYXMtbmEt/UGluYWNvdGVjYV9E/aXZ1bGdhY2FvLmpw/Zz9xdWFsaXR5PTcw/JnN0cmlwPWluZm8m/dz0xMDI0dW5kZWZp/bmVk",
  ];

  @override
  void initState() {
    super.initState(); // Chama o método initState da classe pai.
    displayInfo(); // Inicializa e exibe os marcadores com janelas de informações personalizadas.
  }

  // Função para adicionar marcadores e janelas de informações personalizadas no mapa
  void displayInfo() {
    for (int i = 0; i < latlongPoint.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()), // Identificador único para cada marcador.
          icon: BitmapDescriptor.defaultMarker, // Ícone padrão do marcador.
          position: latlongPoint[i], // Posição do marcador.
          onTap: () {
            // Quando o marcador é clicado, exibe a janela de informações personalizada.
            _customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Cor de fundo da janela de informações.
                  borderRadius: BorderRadius.circular(15.0), // Raio de arredondamento geral
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Exibe a imagem correspondente à localização com bordas arredondadas nas pontas superiores.
                    ClipRRect(
                      borderRadius: const BorderRadius.only( // Arredonda apenas as pontas superiores
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        locationImages[i],
                        height: 125,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Exibe o nome correspondente à localização.
                    Text(
                      locationNames[i],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    // Exibe estrelas e avaliação.
                    Row(
                      children: List.generate(5, (index) {
                        return const Icon(Icons.star, color: Colors.amber, size: 20);
                      })..add(const Text("(5)")), // Adiciona a avaliação após as estrelas.
                    ),
                  ],
                ),
              ),
              latlongPoint[i], // Posição onde a janela de informações deve ser exibida.
            );
          },
        ),
      );
    }
    setState(() {}); // Atualiza a interface para refletir os marcadores adicionados.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Widget GoogleMap para exibir o mapa.
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-22.912847283240453, -47.041346547261014), // Posição inicial da câmera.
              zoom: 12  , // Nível de zoom inicial.
            ),
            markers: markers, // Conjunto de marcadores a serem exibidos no mapa.
            onTap: (argument) {
              // Esconde a janela de informações personalizada quando o mapa é clicado.
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              // Atualiza a posição da janela de informações personalizada quando a câmera se move.
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              // Atribui o controlador do mapa ao controlador da janela de informações personalizada.
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          // Widget que gerencia as janelas de informações personalizadas.
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 171, // Altura da janela de informações personalizada.
            width: 250, // Largura da janela de informações personalizada.
            offset: 35, // Deslocamento para posicionar a janela de informações acima do marcador.
          ),
        ],
      ),
    );
  }
}
