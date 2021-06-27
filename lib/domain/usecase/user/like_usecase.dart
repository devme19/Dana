import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/like_response_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class LikeUseCase implements UseCase<LikeResponseEntity,Params>{
  final DanaRepository repository;
  LikeUseCase({this.repository});

  @override
  Future<Either<Failure, LikeResponseEntity>> call(Params params) {
    return repository.like(params.body);
  }

}