import '../core.dart';

class ItemSpritesApiModel extends ApiModel {
  static var mapper = ItemSpritesApiModelMapper();

  final String defaultValue;

  const ItemSpritesApiModel({
    required this.defaultValue,
  });
}

class ItemSpritesApiModelMapper extends Mapper<ItemSpritesApiModel> {
  @override
  ItemSpritesApiModel fromMap(Map<String, dynamic>? map) {
    return ItemSpritesApiModel(
      defaultValue: map?['default'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap(ItemSpritesApiModel value) {
    return {
      'default': value.defaultValue,
    };
  }
}
