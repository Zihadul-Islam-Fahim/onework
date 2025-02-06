import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/chat_controller.dart';

openBottomSheet() {
  Get.bottomSheet(
    GetBuilder<ChatController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Selected Image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            controller.imageFile != null
                ? SizedBox(
                    width: double.infinity,
                    child: Image.file(controller.imageFile!, height: 300))
                : const Text("No image selected"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Close bottom sheet
                  },
                  child: const Text("Close"),
                ),
                Visibility(
                  visible: controller.imageLoading == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.sendImageFile();
                    },
                    child: const Text("Send"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }),
    isScrollControlled: true,
  );
}
