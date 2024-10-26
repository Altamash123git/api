import 'dart:io';

import 'package:api/model/image_provider.dart';
import 'package:api/model/second_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class imagepicker extends StatelessWidget {
  TextEditingController nameController=TextEditingController();


   ImagePicker _picker = ImagePicker();


  Future<void> pickimage(BuildContext context) async{
    final XFile? pickedImage= await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!= null){
      Provider.of<imageprovider>(context,listen: false).setImage(File(pickedImage.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final File? image= Provider.of<imageprovider>(context).image;
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GestureDetector(
                onTap: ()=>pickimage(context),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: image != null ? FileImage(image!) : null,
                    child: image == null
                        ? Icon(Icons.person, size: 60) // Placeholder icon when no image
                        : null,
                ),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text("name"),
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),

            ),
            ElevatedButton(onPressed: (){
              if(nameController.text.isNotEmpty &&image!=null){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondPage(name: nameController.text, img:image)));

              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please fill all the details")));
              }

              }, child:Text("Submit"))

          ],
        ),
      ),
    );
  }
}
