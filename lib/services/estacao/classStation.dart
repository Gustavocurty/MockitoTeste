// ignore: file_names
class Measures {
  final int id;
  final String name;
  final String logo;
  final String location;
  final Set<String> sensors;
  final String infoUrl;

  Measures({
    required this.id,
    required this.name,
    required this.logo,
    required this.location,
    required this.sensors,
    required this.infoUrl,
  });
}

class MockDatabase {
  static List<Measures> getStations() {
    return [
      Measures(
        id: 1, 
        name: "Estação Sul", 
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe2aH24tnJ35O5EjUzNRb_W946TMcpKczO5g&s",
        location: 'Minas Gerais, MG', 
        sensors: {"temperature", "preciptation", "photo"}, 
        infoUrl: "https://www.youtube.com/watch?v=UGJe1lEQrSg"
      ),
      Measures(
        id: 2, 
        name: "Estação Norte", 
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4VZ7cod-WKzncO1pw_P5klwDaKBG-ncF7VQ&s",
        location: 'Rio de Janeiro, RJ', 
        sensors: {"temperature", "preciptation"}, 
        infoUrl: "https://www.youtube.com/watch?v=UGJe1lEQrSg"
      ),
      Measures(
        id: 3,
        name: "Estação Oeste",
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPRBIBkNVeJMwxWCflYgTzjHVzj-S7H91P2A&s",
        location: "São Paulo, SP",
        sensors: {"temperature", "photo"},
        infoUrl: "https://www.youtube.com/watch?v=ugw3s8plVDk",
      ),
      Measures(
        id: 4,
        name: "Estação Leste",
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTBRp76PaB046iybc_0BbniiATDpRjYEwjhA&s",
        location: "Rio de Janeiro, RJ",
        sensors: {"temperature"},
        infoUrl: "https://www.dio.me/articles/trabalhando-com-mocks-em-dart-um-guia-completo",
      ),
    ];
  }
}