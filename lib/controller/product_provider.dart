import 'dart:developer';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase2/service/auth_service.dart';
import 'package:flutter/material.dart';

class ProductProvid extends ChangeNotifier{
  List<ProductModel> allProduct = [];
  List<ProductModel> searchedList = [];
  String downloadURL = '';
  bool? isEdit;
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();

  final DatabaseService databaseService=DatabaseService();
 Future<void> getAllProducts() async {
    allProduct = await databaseService.getAllProduct();
    notifyListeners();
  }
// my product functions

  Future<void> deleteMyProduct(productId) async {
    await databaseService.deleteMyProduct(productId);
    notifyListeners();
    getAllProducts();
  }

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
    clearControllers();
    getAllProducts();
  }

  updateMyProduct(productId, ProductModel data) async {
    await databaseService.updateMyProudct(productId, data);
    clearControllers();
    notifyListeners();
  }

  idSold(String id) async {
    await databaseService.IsSold(id);
    getAllProducts();
  }

  // serach function
  searchFilter(String value) {
    searchedList = allProduct
        .where((product) =>
            product.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

// image funtion
  uploadImage(image) async {
    try {
      if (image != null) {
        downloadURL = await databaseService.uploadImage(imageName, image);

        notifyListeners();
      } else {
        log('image is null');
      }
    } catch (e) {
      log("$e");
      throw e;
    }
  }

  clearControllers() {
    // titleController.clear();
    // brandController.clear();
    // priceController.clear();
    // locationController.clear();
    // descriptionController.clear();
    notifyListeners();
  }
}