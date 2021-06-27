
import 'package:dana/core/error/failures.dart';
import 'package:either_option/either_option.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
// ignore: must_be_immutable
class Params extends Equatable {
  final Map body;
  final bool boolValue;
  final String value;
  String id;

  Params({this.body,this.boolValue,this.id,this.value});

  @override
  List<Object> get props => [body,boolValue,id];
}