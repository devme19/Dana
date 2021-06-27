import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/free_knowledge_detail_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetFreeKnowledgeDetailUseCase implements UseCase<FreeKnowledgeDetailEntity,Params>{
  final DanaRepository repository;

  GetFreeKnowledgeDetailUseCase({this.repository});

  @override
  Future<Either<Failure, FreeKnowledgeDetailEntity>> call(Params params) {
    return repository.getFreeKnowledgeDetail(params.id);
  }
}