import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/follow_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetFollowersUseCase implements UseCase<FollowEntity,Params>{
  final DanaRepository repository;
  GetFollowersUseCase({this.repository});

  @override
  Future<Either<Failure, FollowEntity>> call(Params params) {
    return repository.getFollowers(params.value);
  }
}