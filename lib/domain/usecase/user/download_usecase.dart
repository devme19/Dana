import 'dart:io';

import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/client.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:either_option/src/either.dart';
import 'package:flutter/services.dart';

class DownLoadUseCase implements UseCase<bool,Params>{
  @override
  Future<Either<Failure, bool>> call(Params params) {

  }
  download()async{
    Directory downloadsDirectory;
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }
    Client.dio.download('', downloadsDirectory.path,onReceiveProgress: (rec,total){

    });
  }
}