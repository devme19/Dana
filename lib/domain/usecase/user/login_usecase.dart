import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/login_response_entity.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class LoginUseCase implements UseCase<LoginResponseEntity,Params>{
  final DanaRepository repository;
  LoginUseCase({this.repository});

  @override
  Future<Either<Failure, LoginResponseEntity>> call(Params params) {
    return repository.login(params.body);
  }

}