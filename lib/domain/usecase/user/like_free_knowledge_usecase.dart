import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class LikeFreeKnowledgeUseCase implements UseCase<bool,Params>{
  final DanaRepository repository;

  LikeFreeKnowledgeUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) {
   return repository.likeFreeKnowledge(params.body);
  }

}