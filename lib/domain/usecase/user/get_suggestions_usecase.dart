import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/suggestion_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class GetSuggestionsUseCase implements UseCase<SuggestionEntity,Params>{
  final DanaRepository repository;
  GetSuggestionsUseCase({this.repository});

  @override
  Future<Either<Failure, SuggestionEntity>> call(Params params) {
    return repository.getSuggestions(params.value);
  }

}