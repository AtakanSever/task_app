// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 0;

  @override
  CartItem read(BinaryReader reader) {
    return CartItem(
      id: reader.readString(),
      imageUrl: reader.readString(),
      name: reader.readString(),
      weight: reader.readString(),
      price: reader.readDouble(),
      amount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.imageUrl);
    writer.writeString(obj.name);
    writer.writeString(obj.weight);
    writer.writeDouble(obj.price);
    writer.writeInt(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
