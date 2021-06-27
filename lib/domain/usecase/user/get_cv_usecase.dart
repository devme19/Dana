import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/info_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetCvUseCase implements UseCase<CvEntity,Params>{
  final DanaRepository repository;
  GetCvUseCase({this.repository});

  @override
  Future<Either<Failure, CvEntity>> call(Params params) {
    return repository.getCv(params.value);
  }
}