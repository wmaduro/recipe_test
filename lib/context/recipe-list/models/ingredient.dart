class Ingredient {
  String? quantity;
  String? name;
  String? type;

  Ingredient({this.quantity, this.name, this.type});

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        quantity: json['quantity'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'name': name,
        'type': type,
      };
}
