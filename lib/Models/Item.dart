class ProductModel {
  ProductModel({
    this.id,
    this.descricao,
  });

  final int id;
  final String descricao;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descricao": descricao,
      };
}
