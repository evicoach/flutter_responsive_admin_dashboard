import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  final picker = ImagePicker();
  static const maxImageSizeInMb = 1;

  static Future<num> getFileSize(XFile? file) async {
    int length = await file!.length();
    double sizeInMb = length / (1024 * 1024);
    return sizeInMb;
  }

  Future<XFile?> getImage(ImageSource source, XFile? file) async {
    if (source == ImageSource.gallery) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'png'],
      );
      if (result == null || result.files.isEmpty) return null;
      return XFile(result.files.first.path!);
    }

    final pickedFile = await picker.pickImage(source: source);
    file = pickedFile;
    return pickedFile;
  }
}
