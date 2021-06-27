import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class LogOutUseCase implements UseCase<bool,NoParams>{
  final DanaRepository repository;
  LogOutUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
   return repository.logOut();
  }
  
}