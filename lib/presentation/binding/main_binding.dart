import 'package:dana/data/datasource/local/dana_local_datasource.dart';
import 'package:dana/data/datasource/remote/dana_remote_datasource.dart';
import 'package:dana/data/repository/dana_repository_impl.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<DanaRemoteDataSource>(DanaRemoteDataSourceImpl());
    Get.put<DanaLocalDataSource>(DanaLocalDataSourceImpl());
    Get.put<DanaRepository>(
        DanaRepositoryImpl(
            remoteDataSource: Get.find(),
            localDataSource: Get.find()
        ));
  }

}