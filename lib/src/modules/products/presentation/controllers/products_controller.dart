import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../core/constants.dart';
import '../../../../core/navigator_service.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase_impl.dart';
import '../vos/address_vo.dart';
import '../vos/product_vo.dart';

class ProductsController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  AddressVO address = AddressVO();
  List<ProductVO> listProducts = <ProductVO>[];
  ProductVO? productSelected = ProductVO();
  late GoogleMapController _mapsController;
  get mapsController => _mapsController;
  final GetProductsUsecaseImpl getProductsUsecase;

  ProductsController({
    required this.getProductsUsecase,
  });

  Future<void> init() async {
    cleanCacheImage();
    final response = await getProductsUsecase();
    listProducts = parseEntityToVO(response: response);
    notifyListeners();
  }

  List<ProductVO> parseEntityToVO({List<ProductEntity>? response}) {
    List<ProductVO>? listProducts = <ProductVO>[];

    listProducts = response?.map((e) {
      return ProductVO(
        description: e.description,
        id: e.id,
        product: e.product,
        thumbnail: e.thumbnail,
      );
    }).toList();

    return listProducts ?? [];
  }

  Future<void> onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    await getPosition();
    await latLongDecode();
    address = await latLongDecode();
    notifyListeners();
  }

  Future<AddressVO> latLongDecode() async {
    List<Placemark> listPlacemark = await placemarkFromCoordinates(lat, long);
    Placemark placeMark = listPlacemark.first;
    address = AddressVO(
      name: placeMark.name,
      administrativeArea: placeMark.administrativeArea,
      country: placeMark.country,
      locality: placeMark.locality,
      postalCode: placeMark.postalCode,
      subLocality: placeMark.subLocality,
      street: placeMark.street,
      fullAddress:
          '${address.street}, ${address.name}, ${address.subLocality}, ${address.locality}, ${address.administrativeArea} ${address.postalCode}, ${address.country}',
    );
    return address;
  }

  Future<void> getPosition() async {
    try {
      Position position = await _getCurrentPosition();
      lat = position.latitude;
      long = position.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
  }

  Future<Position> _getCurrentPosition() async {
    LocationPermission permission;

    bool enable = await Geolocator.isLocationServiceEnabled();

    if (!enable) {
      return Future.error(Constants.pleaseEnableDeviceTracking);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(Constants.youNeedToAuthorizeLocationAccess);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(Constants.youNeedToAuthorizeLocationAccess);
    }

    return await Geolocator.getCurrentPosition();
  }

  void setProduSelected({ProductVO? product}) {
    productSelected = product;
    notifyListeners();
  }

  void cleanCacheImage() {
    DefaultCacheManager manager = DefaultCacheManager();
    manager.emptyCache();
  }

  void popToPage() {
    NavigatorService.instance.key.currentState?.pop();
  }

  void navigateTo({required String route}) {
    NavigatorService.instance.key.currentState?.pushNamed(route);
  }
}
