// ignore: file_names
class Preciptation {
  final int id;
  final String data;
  final String horario;
  final String valor;

  Preciptation({
    required this.id,
    required this.data,
    required this.horario,
    required this.valor,
  });
}

class MockDatabase {
  static List<Preciptation> getPreciptation() {
    return [
      Preciptation(
        id: 1,
        data: "27/10/2001",
        horario: "12h15",
        valor: "12 chuvas"
      ),
      Preciptation(
        id: 2,
        data: "25/01/1970",
        horario: "20h",
        valor: "60 chuvas"
      ),
      Preciptation(
        id: 4,
        data: "25/01/1970",
        horario: "20h",
        valor: "60 chuvas"
      ),
      Preciptation(
        id: 5,
        data: "16/06/1976",
        horario: "10h",
        valor: "62 chuvas"
      ),
    ];
  }
}