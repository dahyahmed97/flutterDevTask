import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../http/network_config/network_info.dart';

abstract class BaseRepository {
  INetworkInfo networkInfo;

  BaseRepository(
    this.networkInfo,
  );

  Future<Either<Failure, T>> handleGeneralException<T>(
      Future<T> Function() fun) async {
    return networkInfo.ifConnectedOrReturnFailure<T>(
      () async {
        return handleException(fun);
      },
    );
  }

  Future<Either<Failure, T>> callDataSourceWithNoInternetCheck<T>(
      Future<T> Function() fun) async {
    return handleException(fun);
  }

  Future<Either<Failure, T>> repoCaching<T>(
      Future<T> Function() fun1, Future<T> Function() fun2) async {
    return networkInfo.isConnectedToServer(() {
      if (kDebugMode) {
        // loggy.info("return from remote data source");
      }
      return handleException(fun1);
    }, () {
      if (kDebugMode) {
        //loggy.info("return from local data source");
      }
      return handleException(fun2);
    });
  }

  Future<Either<Failure, T>> handleException<T>(
      Future<T> Function() apiCall) async {
    try {
      return Right(await apiCall());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on UnAuthorizedException {
      return Left(UnAuthorizedFailure("401"));
    } on OnboardOpenedException {
      return Left(OnboardOpenedFailure("OnboardOpenedFailure"));
    } on NetworkException {
      return Left(NetworkFailure("NETWORK_FAILURE "));
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }
      //  await FirebaseCrashlytics.instance.recordError(
      //  e,
      //stackTrace,
      // reason: 'un-handeled error occurred',
      //fatal: true,
      //);
      return Left(GeneralFailure("GeneralFailure-Unexpected error occurred"));
    }
  }
}
