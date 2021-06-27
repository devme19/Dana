class LikeModel{
  String kcode;
  int type;
  LikeModel({this.kcode,this.type});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kcode'] = this.kcode;
    data['type'] = this.type;
    return data;
  }
}