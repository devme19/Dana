import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/info_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class IsLoginUseCase implements UseCase<CvEntity,NoParams>{
  final DanaRepository repository;
  IsLoginUseCase({this.repository});

  @override
  Future<Either<Failure, CvEntity>> call(NoParams params) {
    return repository.isLogin();
  }

}