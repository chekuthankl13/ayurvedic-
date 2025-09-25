

import 'package:ayurvedic/core/error/failure.dart';
import 'package:dartz/dartz.dart';



abstract class Usecase<Types,Params> {
 Future<Either<Failure,Types>> call(Params param);
}

abstract class Usecase2<Types,Params> {
 Future<Type> call(Params param);
}

class NoParam  {
}