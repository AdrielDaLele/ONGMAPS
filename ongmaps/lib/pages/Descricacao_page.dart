import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DISCRIPTION_ABRAES extends StatelessWidget {
  const DISCRIPTION_ABRAES({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Descrição ABRAES",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 68, 107), // Cor de fundo escura
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network( "https://imgs.search.brave.com/hMgEspYNZw3vsej4ugzJB227HNaFwErw1XZNDCE3O1Q/rs:fit:860:0:0:0/g:ce/aHR0cDovL3d3dy5v/bmdzYnJhc2lsLmNv/bS5ici9pbWFnZXMv/b25ncy1kZS1jcmlh/bmNhcy5qcGc", // Substitua pela imagem da ABRAES
              fit: BoxFit.cover,
              height: 190, // Ajuste a altura conforme necessário
              width: 280,
            ),
            const SizedBox(height: 16),
            const Text(
              "ABRAES - Associação Brasileira de Educação Social",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center, // Título centralizado
            ),
            const SizedBox(height: 16),
            const Text(
              "Fundação: 2010",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Sede: R. das Orquídeas, 500 - Chácara Primavera, Campinas - SP, 13087-430",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Atividades: Programas de reforço escolar, atividades culturais e esportivas.",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Foco: Desenvolvimento integral de crianças e adolescentes em situação de vulnerabilidade.",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 75, 120), // Cor de fundo clara
    );
  }
}


/////////////////////////////////////////////////////IAPI/////////////////////////////////////////////////////

class DISCRIPTION_IAPI extends StatelessWidget {
  const DISCRIPTION_IAPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Descrição IAPI",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Fonte em negrito
            color: Colors.white, // Cor branca
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 68, 107), // Cor de fundo escura
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://imgs.search.brave.com/Q5LwmAOVKZb7mNtX7haSs1tvohCHVC7vSHH5d3XxTKA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jbGFz/c2ljLmV4YW1lLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8xMC9Gb3RvLTNf/T2ZpY2luYS1jb20t/Y3JpYW5jYXMtbmEt/UGluYWNvdGVjYV9E/aXZ1bGdhY2FvLmpw/Zz9xdWFsaXR5PTcw/JnN0cmlwPWluZm8m/dz0xMDI0dW5kZWZp/bmVk", // URL da imagem
              fit: BoxFit.cover,
              height: 190, // Ajuste a altura conforme necessário
              width: 280,
            ),
            const SizedBox(height: 16),
            const Text(
              "Instituto de Assistência e Proteção à Infância (IAPI)",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center, // Título centralizado
            ),
            const SizedBox(height: 16),
            const Text(
              "Fundação: 2011",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Sede: Av. 1, 9 - Vila Itapura, Campinas - SP, 13012-970",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Atividades: Programas de assistência social, educação e esportes.",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Foco: Desenvolvimento integral de crianças e adolescentes em situação de vulnerabilidade.",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 75, 120), // Cor de fundo clara
    );
  }
}
