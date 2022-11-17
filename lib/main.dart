import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_method/model.dart';
import 'package:get_method/secondpage.dart';

void main() {
  //Step 1: Add "Get" before your MaterialApp, turning it into GetMaterialApp
  runApp(GetMaterialApp(
    home: demo(),
  ));
}

class demo extends StatelessWidget {

  //Step 2: Create your business logic class and place all variables, methods and controllers inside it
  model m=Get.put(model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Get Method"),),

    body: Column(children: [
      TextField(controller: m.t1,),
      TextField(controller: m.t2,),
      ElevatedButton(onPressed: () {
        
        m.total(m.t1.text, m.t2.text);
        Get.snackbar("Hey", "Sum is Successfully");
        //Get.defaultDialog(title: "Sum is Successfully",);

      }, child: Text("Sum")),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => Text("Sum=${m.sum}"),

        ),
      ),
      ElevatedButton(onPressed: () {
        Get.to(secondpage());
      }, child: Text("Go to Second Page")),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {
          Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
        }, child: Text("Change Theme")),
      ),

    ],),
    );
  }
}

/*class demo2 extends StatelessWidget {
  model m = Get.put(model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Obx(() => Slider(
          min: 1,
          max: 10,
          value: m.v.value,
          onChanged: (value) {

            m.change(value);
          },
        )),
        Obx(() => Text("Value=${m.v}"))
      ]),
    );
  }
}*/
