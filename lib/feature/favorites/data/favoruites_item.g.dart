// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesItemAdapter extends TypeAdapter<FavoritesItem> {
  @override
  final int typeId = 1;

  @override
  FavoritesItem read(BinaryReader reader) {
    return FavoritesItem(
      id: reader.readString(),
      imageUrl: reader.readString(),
      name: reader.readString(),
      weight: reader.readString(),
      price: reader.readDouble(),
      amount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesItem obj) {
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
      other is FavoritesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
