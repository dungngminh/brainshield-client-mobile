import 'package:brainshield/core/theme.dart';
import 'package:brainshield/modules/add_product/add_product_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 45.0),
          child: Column(
            children: [
              Row(children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: kColor4),
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                "Thêm sản phẩm".toUpperCase(),
                style: GoogleFonts.openSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: controller.nameController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: kColor4,
                  border: OutlineInputBorder(),
                  labelText: 'Tên sản phẩm',
                  hintText: 'Nhập vào tên sản phẩm...',
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
                  border: OutlineInputBorder(),
                  labelText: 'Mô tả',
                  hintText: 'Hãy nói những gì bạn muốn ở đây...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        GetBuilder<AddProductController>(builder: (controller) {
                      return DropdownButton<String>(
                        hint: Text(" Thể loại"),
                        alignment: Alignment.centerLeft,
                        isExpanded: true,
                        value: controller.category,
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String? newValue) =>
                            controller.categorySelected(newValue!),
                        items: <String>['Tranh vẽ', 'Âm nhạc', 'Nhiếp ảnh']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: GoogleFonts.openSans()),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                ),
              ),
              GetBuilder<AddProductController>(builder: (controller) {
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
                            color: kColor4,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: kColor5.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.folder_open,
                                    color: kColor4,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Chọn ảnh của bạn',
                                    style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: kColor4,
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
                                      color: Colors.grey.shade400,
                                      offset: Offset(0, 0.5),
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
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${(controller.platformFile!.size / 1024).ceil()} KB',
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                color: Colors.grey.shade600),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kColor4),
                onPressed: () => controller.createPicture(context),
                child: Text("Upload".toUpperCase(),
                    style: GoogleFonts.openSans(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
