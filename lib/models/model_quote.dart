class DataModel{
  int limit;
  int total;
  int skip;
  List <subListModel> quotes ;
  DataModel({ required this.limit, required this.total, required this.skip, required this.quotes });

  factory DataModel.fromJson(Map<String,dynamic> json ){
    List<subListModel> listQuotes = [];

    for(Map<String,dynamic> eachMap in json['quotes']){
      var eachMapdata = subListModel.fromJson(eachMap);
      listQuotes.add(eachMapdata);
    }
    return DataModel(
      limit : json['limit'],
      quotes  : listQuotes,
      total : json['total'],
      skip  : json['skip']);
  }
}

class subListModel{
  int id;
  String quote;
  String author;
  subListModel({required this.id, required this.quote, required this.author});

  factory subListModel.fromJson(Map<String,dynamic> json){
    return subListModel(id: json['id'], quote: json['quote'], author: json['author']);
  }
}