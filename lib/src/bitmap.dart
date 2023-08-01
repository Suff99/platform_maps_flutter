part of platform_maps_flutter;

class BitmapDescriptor {
  final dynamic bitmapDescriptor;

  BitmapDescriptor._(this.bitmapDescriptor);

  static BitmapDescriptor? get defaultMarker {
    switch (getPlatformType()) {
      case PlatformType.web:
      case PlatformType.android:
        return BitmapDescriptor._(googleMaps.BitmapDescriptor.defaultMarker);
      case PlatformType.ios:
        return BitmapDescriptor._(appleMaps.BitmapDescriptor.defaultAnnotation);
      default:
        return null;
    }
  }

  static Future<BitmapDescriptor> fromAssetImage(
    ImageConfiguration configuration,
    String assetName, {
    AssetBundle? bundle,
    String? package,
  }) async {
    dynamic bitmap;

    switch (getPlatformType()) {
      case PlatformType.web:
      case PlatformType.android:
        bitmap = await googleMaps.BitmapDescriptor.fromAssetImage(
          configuration,
          assetName,
          bundle: bundle,
          package: package,
        );
        break;
      case PlatformType.ios:
        bitmap = await appleMaps.BitmapDescriptor.fromAssetImage(
          configuration,
          assetName,
          bundle: bundle,
          package: package,
        );
        break;
    }
    return BitmapDescriptor._(bitmap);
  }

  static BitmapDescriptor fromBytes(Uint8List byteData) {
    dynamic bitmap;
    switch (getPlatformType()) {
      case PlatformType.web:
      case PlatformType.android:
        bitmap = googleMaps.BitmapDescriptor.fromBytes(byteData);
        break;
      case PlatformType.ios:
        bitmap = appleMaps.BitmapDescriptor.fromBytes(byteData);
        break;
    }
    return BitmapDescriptor._(bitmap);
  }
}
