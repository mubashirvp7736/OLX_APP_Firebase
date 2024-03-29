import 'dart:developer';
import 'dart:io';
import 'package:firebase2/model/product_model.dart';
import 'package:firebase2/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductProvid extends ChangeNotifier{
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedItem;
  final List<String> listProducts = ["cycle", "Bike", "car", "books", "scooter", "mobile", "charger", "laptop", "dress"];

   File? pickedImage;
    String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;
  List<ProductModel> allProduct = [];
  List<ProductModel> searchedList = [];
   final TextEditingController searchController = TextEditingController();

  bool isLoading=false;
   final ImagePicker imagePicker = ImagePicker();
    bool isDataAdd=false;

  final DatabaseService databaseService=DatabaseService();
 Future<void> getAllProducts() async {
    isLoading=true;
    allProduct = await databaseService.getAllProduct();
    isLoading=false;
    notifyListeners();
  }
// my product functions
 void isDtaAdd(bool value){
  isDataAdd=value;
  notifyListeners();
 }
  Future<void> deleteMyProduct(productId) async {
    await databaseService.deleteMyProduct(productId);
    notifyListeners();
    getAllProducts();
    
  }
   DatabaseService dataBaseService= DatabaseService();
       
       
  addcategory (String? value) {
     selectedItem = value;
     notifyListeners();
     }
     
  Future<void> addProduct(ProductModel data) async {
    try {
      await dataBaseService.addProduct(data);
      log('controller add working');
      notifyListeners();
      getAllProducts();
    } catch (e) {
      print('Error adding product: $e');
      log('controller add not working');
    }
  }

  // addProduct(ProductModel data) async {
  //   await databaseService.addProduct(data);
  //   clearControllers();
  //   getAllProducts();
  //   notifyListeners();
  // }

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
  uploadImage(image,imageName) async {
    try {
      if (image != null) {
       String downloadUrl = await databaseService.uploadImage(imageName, image);

        notifyListeners();
        return downloadUrl;
      } else {
        log('image is null');
      }
    } catch (e) {
      log("$e");
      throw e;
    }
    notifyListeners();
  }

  clearControllers() {
    // titleController.clear();
    // brandController.clear();
    // priceController.clear();
    // locationController.clear();
    // descriptionController.clear();
    notifyListeners();
  }

  
  
  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
}