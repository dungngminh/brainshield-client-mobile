import 'package:brainshield/account/account_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Obx(() => Text(controller.address.value)),
              Obx(() {
                final status = controller.status.value;
                if (status == Status.loading) {
                  return CircularProgressIndicator();
                } else {
                  return Text(controller.pictureCount.value);
                }
              }),
              TextButton(
                onPressed: () => controller.getPictureCount(),
                child: Text("Get picture count"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Decription'),
              ),
              GestureDetector(
                onTap: () => controller.selectFile(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    color: Colors.blue.shade400,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50.withOpacity(.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.folder_open,
                            color: Colors.blue,
                            size: 40,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Select your file',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<AccountController>(builder: (controller) {
                return controller.platformFile != null
                    ? Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected File',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0, 1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          controller.file!,
                                          width: 70,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.platformFile!.name,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${(controller.platformFile!.size / 1024).ceil()} KB',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            // MaterialButton(
                            //   minWidth: double.infinity,
                            //   height: 45,
                            //   onPressed: () {},
                            //   color: Colors.black,
                            //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                            // )
                          ],
                        ),
                      )
                    : Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
