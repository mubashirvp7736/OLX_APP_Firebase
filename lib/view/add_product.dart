
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase2/controller/product_provider.dart';
// import 'package:firebase2/model/product_model.dart';

// class AddProduction extends StatefulWidget {
//   const AddProduction({Key? key}) : super(key: key);

//   @override
//   State<AddProduction> createState() => _AddProductionState();
// }

// class _AddProductionState extends State<AddProduction> {
//     final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final product=Provider.of<ProductProvid>(context,listen: false);

//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Consumer<ProductProvid>(
//                   builder: (context, value, child) => GestureDetector(
//                     onTap: () {
//                       pickImage(context);
//                     },
//                     child: Container(
//                       height: size.height * .2,
//                       width: size.width * .9,
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                         border: Border.all(color: Colors.black, width: 2),
//                         image: value.pickedImage != null
//                             ? DecorationImage(
//                                 image: FileImage(value.pickedImage!),
//                                 fit: BoxFit.contain,
//                               )
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ),
//                 TextFormField(
//                   maxLength: 10,
//                   controller:product. titleController,
//                   decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the title';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   maxLength: 7,
//                   controller:product. priceController,
//                   decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Enter the price'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the price';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 DropdownButtonFormField(
//                   decoration: const InputDecoration(labelText: 'Choose Product'),
//                   value:product. selectedItem,
//                   items:product. listProducts
//                       .map((String value) => DropdownMenuItem(value: value, child: Text(value)))
//                       .toList(),
//                   onChanged: (String? value) {
//                     product.addcategory(value);
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a product';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   maxLength: 20,
//                   controller: product. locationController,
//                   decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Enter place'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter place';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 SizedBox(height: 15),
//                 TextFormField(
//                   controller:product. descriptionController,
//                   decoration: const InputDecoration(
//                     labelText: 'Enter the description',
//                     contentPadding: EdgeInsets.symmetric(vertical: 20.0), // Adjust the vertical padding as needed
//                   ),
//                   keyboardType: TextInputType.streetAddress,
//                   maxLines: 3,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the description';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         await addData(context,product);
//                       }
//                     },
//                     child: const Text("ADD PRODUCT"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//    Future<void> addData(BuildContext context, ProductProvid carProvider) async {
//         final product=Provider.of<ProductProvid>(context,listen: false);

//     final pickedImage = product.pickedImage;
//     if (pickedImage != null) {
//       carProvider.isDtaAdd(true);
//       final image = await carProvider.uploadImage(
//           File(pickedImage.path), carProvider.imageName);

//       final cars = ProductModel(
//         title: carProvider.titleController.text,
//         place: carProvider.locationController.text,
//         description: carProvider.descriptionController.text,
//         price:carProvider. priceController.text,
//         category: carProvider.selectedItem,
//         image: image,
//         wishList: [],
//       );

//       carProvider.addProduct(cars);
       
//      // carProvider.clearCarControllers();

//     } else {
     
//     }
//     carProvider.isDtaAdd(false);
//   }  Future<void> pickImage(BuildContext context) async {
//     final pro = Provider.of<ProductProvid>(context, listen: false);
//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 150,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pro.getImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.image),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pro.getImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'dart:io';
import 'package:firebase2/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/model/product_model.dart';

class AddProduction extends StatefulWidget {
  const AddProduction({Key? key}) : super(key: key);

  @override
  State<AddProduction> createState() => _AddProductionState();
}

class _AddProductionState extends State<AddProduction> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvid>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
     backgroundColor: const Color(0xFF00246B),

        title:  textPoppins(name: 'Add Product',color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
                  child: Container(
                    height: size.height * .2,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 2),
                       image: product.pickedImage != null
          ? DecorationImage(
              image: FileImage(product.pickedImage!),
              fit: BoxFit.contain,
            )
          : null,
    ),
    child: product.pickedImage == null
        ? Center(
            child: Icon(
              Icons.add_a_photo,
              size: 50,
            ),
          )
        : null,
  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLength: 10,
                    controller: product.titleController,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the title';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 7,
                    controller: product.priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the price',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the price';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Choose Product',
                      border: OutlineInputBorder(),
                    ),
                    value: product.selectedItem,
                    items: product.listProducts
                        .map((String value) => DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (String? value) {
                      product.addcategory(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a product';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLength: 20,
                    controller: product.locationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter place',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter place';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: product.descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Enter the description',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    ),
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the description';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await addData(context, product);
                      }
                    },
                    child: Text("ADD PRODUCT"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addData(BuildContext context, ProductProvid carProvider) async {
    final product = Provider.of<ProductProvid>(context, listen: false);

    final pickedImage = product.pickedImage;
    if (pickedImage != null) {
      carProvider.isDtaAdd(true);
      final image =
          await carProvider.uploadImage(File(pickedImage.path), carProvider.imageName);

      final cars = ProductModel(
        title: carProvider.titleController.text,
        place: carProvider.locationController.text,
        description: carProvider.descriptionController.text,
        price: carProvider.priceController.text,
        category: carProvider.selectedItem,
        image: image,
        wishList: [],
      );

      carProvider.addProduct(cars);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an image'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    carProvider.isDtaAdd(false);
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<ProductProvid>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
