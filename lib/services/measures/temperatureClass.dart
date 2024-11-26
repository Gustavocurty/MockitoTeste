// ignore: file_names
class Temperature {
  final int id;
  final String data;
  final String horario;
  final String valor;

  Temperature({
    required this.id,
    required this.data,
    required this.horario,
    required this.valor,
  });
}

class MockDatabase {
  static List<Temperature> getTemperature() {
    return [
      Temperature(
        id: 1,
        data: "29/10/2001",
        horario: "15h12",
        valor: "17°C"
      ),
      Temperature(
        id: 2,
        data: "27/10/2001",
        horario: "11h54",
        valor: "56°C"
      ),
      Temperature(
        id: 3,
        data: "27/08/1999",
        horario: "10h15",
        valor: "32°C"
      ),
      Temperature(
        id: 4,
        data: "14/06/1976",
        horario: "07h20",
        valor: "22°C"
      ),
    ];
  }
}