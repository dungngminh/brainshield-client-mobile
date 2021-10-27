import 'package:brainshield/modules/account/account_controller.dart';
import 'package:brainshield/core/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Obx(() => Text(controller.address.value)),
              
              Obx(() {
                final status = controller.status.value;
                if (status == Status.loading) {
                  return CircularProgressIndicator();
                } else {
                  return Text(controller.balance.value);
                }
              }),
              TextButton(
                onPressed: () {
                  controller.getBalance();
     
                },
                child: Text("Get picture count"),
              ),

              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.nameController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Tên sản phẩm',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.descriptionController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Mô tả',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<AccountController>(builder: (controller) {
                  return DropdownButton<String>(
                    hint: Text("Thể loại"),
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.category,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: kColor4,
                    ),
                    onChanged: (String? newValue) =>
                        controller.categorySelected(newValue!),
                    items: <String>['Art', 'Blog', 'Music']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: GoogleFonts.openSans()),
                      );
                    }).toList(),
                  );
                }),
              ),
              GetBuilder<AccountController>(builder: (controller) {
                return controller.platformFile == null
                    ? GestureDetector(
                        onTap: () => controller.selectFile(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
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
                                    'Chọn ảnh của bạn',
                                    style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ảnh được chọn',
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
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          controller.file!,
                                          width: 70,
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.platformFile!.name,
                                            style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${(controller.platformFile!.size / 1024).ceil()} KB',
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                color: Colors.grey.shade500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => controller.removeFile(),
                                      icon: Icon(
                                        Icons.close,
                                        color: kColor4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              }),
              TextButton(
                onPressed: () => controller.createPicture(context),
                child: Text("Upload"),
              ),
              // RoundedLoadingButton(
              //   borderRadius: 35,
              //   height: 55,
              //   width: double.infinity,
              //   color: kColor4,
              //   successColor: kColor4,
              //   controller: controller.btnController,
              //   onPressed: () => controller.uploadImage(),
              //   child: Text(
              //     "Submit".toUpperCase(),
              //     style: GoogleFonts.openSans(
              //       color: Colors.white,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
