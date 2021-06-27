import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/knowledge_detail_model.dart';
import 'package:dana/domain/entity/knowledge_detail_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetKnowledgeDetailUseCase implements UseCase<KnowledgeDetailEntity,Params>{
  final DanaRepository repository;
  GetKnowledgeDetailUseCase({this.repository});

  @override
  Future<Either<Failure, KnowledgeDetailEntity>> call(Params params) {
   return repository.getKnowledgeDetail(params.value);
  }
}