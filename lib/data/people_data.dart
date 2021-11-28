class PeopleData {
  final List<IndividualPeopleData> data;
  PeopleData({required this.data});
  factory PeopleData.fromJson(List<dynamic> parsedJson) {
    List<IndividualPeopleData> _data;
    _data = parsedJson.map((i) => IndividualPeopleData.fromJson(i)).toList();
    return PeopleData(data: _data);
  }
}

class IndividualPeopleData {
  String name;
  int id;
  String company;
  int orderId;
  int invoicePaid;
  int invoicePending;

  IndividualPeopleData(
      {required this.name,
      required this.id,
      required this.company,
      required this.orderId,
      required this.invoicePaid,
      required this.invoicePending});
  factory IndividualPeopleData.fromJson(Map<String, dynamic> parsedJson) {
    return IndividualPeopleData(
        name: parsedJson['name'],
        id: int.parse(parsedJson['id']),
        company: parsedJson['company'],
        orderId: int.parse(parsedJson['orderId']),
        invoicePaid: int.parse(parsedJson['invoicepaid']),
        invoicePending: int.parse(parsedJson['invoicePending']));
  }
}
