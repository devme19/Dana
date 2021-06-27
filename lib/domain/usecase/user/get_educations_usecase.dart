import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/education_list_response_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:either_option/src/either.dart';

class GetEducationUseCase implements UseCase<EducationListResponseEntity,NoParams>{
  final DanaRepository repository;
  GetEducationUseCase({this.repository});

  @override
  Future<Either<Failure, EducationListResponseEntity>> call(params) {
    return repository.getEducations();
  }

}