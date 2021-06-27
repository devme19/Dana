import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/free_knowledge_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetFreeKnowledgeUseCase implements UseCase<FreeKnowledgeEntity,Params>{
  final DanaRepository repository;
  GetFreeKnowledgeUseCase({this.repository});

  @override
  Future<Either<Failure, FreeKnowledgeEntity>> call(Params params) {
    return repository.getFreeKnowledge(params.value);
  }
}