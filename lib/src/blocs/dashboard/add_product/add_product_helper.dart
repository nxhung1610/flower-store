import 'package:image_picker/image_picker.dart';

Future<XFile?> openImagePicker() async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  return image;
}
