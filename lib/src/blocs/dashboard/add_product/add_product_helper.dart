import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_transform/stream_transform.dart';

Future<XFile?> openImagePicker() async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  return image;
}

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}
