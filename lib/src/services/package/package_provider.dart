import 'package:flower_store/src/models/package/package.dart';
import 'package:flower_store/src/services/base/base_provider.dart';
import 'package:flower_store/src/services/package/package_repository.dart';

class PackageProvider extends BaseProvider<PackageRepository> {
  @override
  PackageRepository initRepository() {
    return PackageRepository();
  }

  Future<List<Package>> get() async {
    final res = await repository.pacakges();
    return (res.data['data'] as List).map((e) => Package.fromMap(e)).toList();
  }
}
