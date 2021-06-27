import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/knowledge_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetKnowledgeUseCase implements UseCase<KnowledgeEntity,Params>{
   final DanaRepository repository;
   GetKnowledgeUseCase({this.repository});

  @override
  Future<Either<Failure, KnowledgeEntity>> call(Params params) {
   return repository.getKnowledge(params.value);
  }
}