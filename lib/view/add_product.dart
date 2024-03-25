import 'package:firebase2/view/wishlist_page.dart';
import 'package:flutter/material.dart';

class AddProduction extends StatefulWidget {
  const AddProduction({super.key});

  @override
  State<AddProduction> createState() => _AddProductionState();
}

class _AddProductionState extends State<AddProduction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ccategoryProduct = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedItem;
  final List<String>listProducts=["cycle","Bike","car","books","scooter","mobile","charger","laptop","dress"];
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Add Product'),
      centerTitle: true,
      ),
     body:SingleChildScrollView(
       child: Padding(
        padding: EdgeInsets.all(20),
         child: Form(
          key: formKey,
           child: Column(
            children: [  
              TextFormField(
                maxLength: 10,
                controller: titleController,
                decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'title'),
               validator: (value) {
                 if(value==null||value.isEmpty){
                  return 'please enter the title';
                 }else{
                  return null;
                 }
               }, 
              ),
              SizedBox(height:10),
              TextFormField(
                maxLength: 7,
                controller: priceController,
                decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'Enter the price'),
               validator: (value) {
                 if(value==null||value.isEmpty){
                  return 'please enter the price';
                 }else{
                  return null;
                 }
               }, 
              ),
                      SizedBox(height:10),
           
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'choose Product'),
                value: selectedItem,
                items: listProducts.map((String value) =>DropdownMenuItem(
                  value: value,
                  child: Text(value)) ).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedItem=value;
                  });
                },
                 validator: (value) {
                 if(value==null||value.isEmpty){
                  return 'please enter the price';
                 }else{
                  return null;
                 }
               }, 
              ),        SizedBox(height:10),
           
                 TextFormField(
                  maxLength: 20,
                controller: locationController,
                decoration:const InputDecoration(border: OutlineInputBorder(),labelText: 'Enter place'),
               validator: (value) {
                 if(value==null||value.isEmpty){
                  return 'please enter place';
                 }else{
                  return null;
                 }
               }, 
              ),        SizedBox(height:15),
           
               TextFormField(
                controller: descriptionController,
                decoration:const InputDecoration(labelText: 'Enter the description',
                contentPadding: EdgeInsets.symmetric(vertical: 20.0), // Adjust the vertical padding as needed
                    ),
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 3, 
               validator: (value) {
                 if(value==null||value.isEmpty){
                  return 'please enter the price';
                 }else{
                  return null;
                 }
               }, 
              ),       
               SizedBox(height:10),
           
             SizedBox(
              child: 
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    
                    onPressed: (){
                    if ((formKey.currentState!.validate())) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WishList(),));
                      
                    }
                  }, child:const Text("ADD PRODUCT")),
                )
            ) ],
             ),
         ),
       ),
     )
      
     );
  }
}