class ListaPrestadorMod {
  String razao;
  String idSeverino;
  String img;

  ListaPrestadorMod(String razao, String idSeverino, String img) {
    this.razao = razao;
    this.idSeverino = idSeverino;
    this.img = img;
  }

  ListaPrestadorMod.fromJson(Map json)
      : razao = json['razaoSocial'],
        idSeverino = json['seqColaborador'].toString(),
        img = json['imgLogo'];

  Map toJson() {
    return {'razaoSocial': razao, 'seqColaborador': idSeverino, 'imgLogo': img};
  }
}
