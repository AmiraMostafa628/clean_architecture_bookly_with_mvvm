import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Param>{
  Future<Either<Failure,Type>> execute(Param param);
}

abstract class UseCase2<Type,Param,Param2>{
  Future<Either<Failure,Type>> execute(Param param,Param2 param2);
}


class NoParam{}