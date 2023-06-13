import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:mob_video/app/modules/home/model/assets_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  RxList<AssetsFile> files = <AssetsFile>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    loadFiles();
    super.onInit();
  }

  void loadFiles() async {
    // getStorage.remove('cartData');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("files")) {
      files.value =
          List<Map<String, dynamic>>.from(jsonDecode(prefs.getString("files")!))
              .map((x) => AssetsFile.fromJson(x))
              .toList();
      print('--- files----');
      print(files.length);
    }
  }

  void saveCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("files", jsonEncode(files));
    loadFiles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getFile() async {
    // Pick the image from gallery
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    // Get the application folder directory
    final directory = await getExternalStorageDirectory();

    // Copy Image to the directory
    if (pickedFile != null) {
      if (directory != null) {
        final img = await File(pickedFile.path)
            .copy('${directory.path}/${pickedFile.name}');

        files.add(AssetsFile(name: pickedFile.name, path: img.path));
        saveCartItems();
      }
    }
  }
}
