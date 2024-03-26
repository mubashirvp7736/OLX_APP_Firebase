// import 'dart:io';

// import 'package:firebase2/controller/product_provider.dart';
// import 'package:firebase2/model/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class AddProduction extends StatefulWidget {
//   const AddProduction({super.key});

//   @override
//   State<AddProduction> createState() => _AddProductionState();
// }
// class _AddProductionState extends State<AddProduction> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController ccategoryProduct = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   String? selectedItem;
//   final List<String>listProducts=["cycle","Bike","car","books","scooter","mobile","charger","laptop","dress"];
//   final formKey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(title:const Text('Add Product'),
//       centerTitle: true,
//       ),
//      body:SingleChildScrollView(
//        child: Padding(
//         padding: EdgeInsets.all(20),
//          child: Form(
//           key: formKey,
//            child: Column(
//             children: [  
//               Consumer<ProductProvid>(builder: (context, value, child) => 
//                  GestureDetector(
//                   onTap: (){  pickImage(context);},
//                    child: Container(
//                                     height: size.height * .2,
//                                     width: size.width * .9,
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(10)),
//                                       border:
//                                           Border.all(color: Colors.black, width: 2),
//                                       image: value.pickedImage != null
//                                           ? DecorationImage(
//                                               image: FileImage(value.pickedImage!),
//                                               fit: BoxFit.contain,
//                                             )
//                                           : null,
//                                     ),),
//                  ),
//               ),
//               TextFormField(
//                 maxLength: 10,
//                 controller: titleController,
//                 decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'title'),
//                validator: (value) {
//                  if(value==null||value.isEmpty){
//                   return 'please enter the title';
//                  }else{
//                   return null;
//                  }
//                }, 
//               ),
//              const SizedBox(height:10),
//               TextFormField(
//                 maxLength: 7,
//                 controller: priceController,
//                 decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'Enter the price'),
//                validator: (value) {
//                  if(value==null||value.isEmpty){
//                   return 'please enter the price';
//                  }else{
//                   return null;
//                  }
//                }, 
//               ),
//               const SizedBox(height:10),
//               DropdownButtonFormField(
//                 decoration:const InputDecoration(labelText: 'choose Product'),
//                 value: selectedItem,
//                 items: listProducts.map((String value) =>DropdownMenuItem(
//                   value: value,
//                   child: Text(value)) ).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedItem=value;
//                   });
//                 },
//                  validator: (value) {
//                  if(value==null||value.isEmpty){
//                   return 'please enter the price';
//                  }else{
//                   return null;
//                  }
//                }, 
//               ),        
//              const SizedBox(height:10),
           
//                  TextFormField(
//                   maxLength: 20,
//                 controller: locationController,
//                 decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'Enter place'),
//                validator: (value) {
//                  if(value==null||value.isEmpty){
//                   return 'please enter place';
//                  }else{
//                   return null;
//                  }
//                }, 
//               ),        
//               SizedBox(height:15),
           
//                TextFormField(
//                 controller: descriptionController,
//                 decoration:const InputDecoration(labelText: 'Enter the description',
//                 contentPadding: EdgeInsets.symmetric(vertical: 20.0), // Adjust the vertical padding as needed
//                     ),
//                     keyboardType: TextInputType.streetAddress,
//                     maxLines: 3, 
//                validator: (value) {
//                  if(value==null||value.isEmpty){
//                   return 'please enter the price';
//                  }else{
//                   return null;
//                  }
//                }, 
//               ),       
//               const SizedBox(height:10),
//              SizedBox(
//               child: 
//                 Positioned(
//                   bottom: 0,
//                   child: ElevatedButton(
                    
//                     onPressed: ()async{
//                     if (formKey.currentState!.validate()){
//                       // Navigator.push(context, MaterialPageRoute(builder: (context) =>const WishList(),));
//                     await addProducts(context);
//                     }
//                   }, child:const Text("ADD PRODUCT")),
//                 )
//             ) ],
//              ),
//          ),
//        ),
//      )
      
//      );
//   }
//   addProducts( context)async {
//   final picked=Provider.of<ProductProvid>(context,listen: false).pickedImage;
//   final product=Provider.of<ProductProvid>(context,listen: false);
//   final title = titleController.text;
//   final price = priceController.text;
//   final category = selectedItem;
//   final location = locationController.text;
//   final description = descriptionController.text;
//   // if(picked!=null){
//     product.isDtaAdd(true);
//     final image= product.uploadImage(File(picked!.path),product.imageName);
  
  
//   // Create the new product object
//   ProductModel newProduct = ProductModel(
//     title: title,
//     price: price,
//     category: category,
//     location: location,
//     description: description,
//     image: image
//   );
//    Provider.of<ProductProvid>(context, listen: false).addProduct(newProduct);
 
//   // Access the provider and add the new product
 
// }
//   Future<void> pickImage(BuildContext context) async {
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
import 'dart:developer';
import 'dart:io';
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
    final product=Provider.of<ProductProvid>(context,listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Consumer<ProductProvid>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      pickImage(context);
                    },
                    child: Container(
                      height: size.height * .2,
                      width: size.width * .9,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: 2),
                        image: value.pickedImage != null
                            ? DecorationImage(
                                image: FileImage(value.pickedImage!),
                                fit: BoxFit.contain,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  maxLength: 10,
                  controller:product. titleController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the title';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLength: 7,
                  controller:product. priceController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Enter the price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Choose Product'),
                  value:product. selectedItem,
                  items:product. listProducts
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
                const SizedBox(height: 10),
                TextFormField(
                  maxLength: 20,
                  controller: product. locationController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Enter place'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter place';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller:product. descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Enter the description',
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0), // Adjust the vertical padding as needed
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
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await addData(context,product);
                      }
                    },
                    child: const Text("ADD PRODUCT"),
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
        final product=Provider.of<ProductProvid>(context,listen: false);

    final pickedImage = product.pickedImage;
    if (pickedImage != null) {
      carProvider.isDtaAdd(true);
      final image = await carProvider.uploadImage(
          File(pickedImage.path), carProvider.imageName);

      final cars = ProductModel(
        title: carProvider.titleController.text,
        place: carProvider.locationController.text,
        description: carProvider.descriptionController.text,
        price:carProvider. priceController.text,
        category: carProvider.selectedItem,
        image: image,
        wishList: [],
      );

      carProvider.addProduct(cars);
       
     // carProvider.clearCarControllers();

    } else {
     
    }
    carProvider.isDtaAdd(false);
  }  Future<void> pickImage(BuildContext context) async {
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
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
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
