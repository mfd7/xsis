import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xsis/data/_core/app_exceptions.dart';
import 'package:xsis/domain/_core/app_failures.dart' as af;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/data/_core/models/response_model.dart';

extension StatusCodeX on int? {
  String get toStatusMessage {
    if (this == null) {
      return AppConstant.kConnectionError.tr;
    }
    return toString().tr;
  }
}

extension ListErrorModelX on List<ErrorModel> {
  Map<String, String> toErrorMap() {
    final errorMap = <String, String>{};
    for (final error in this) {
      errorMap[error.attribute] = error.text;
    }
    return errorMap;
  }
}

extension AppFailureParsingDataX on af.ParsingData {
  String get message => AppConstant.kParsingDataCode.tr;
}

extension AppFailureX on af.AppFailure {
  String getMessage() {
    return map(
      general: (g) => g.message,
      validation: (v) => v.message,
      parsingData: (p) => p.message,
    );
  }

  Either<af.Validation, String> validationOrMessage() {
    return map(
      general: (e) => Right(e.getMessage()),
      validation: (e) => left(e),
      parsingData: (e) => Right(e.getMessage()),
    );
  }
}

extension AppExceptionX on AppException {
  af.AppFailure toAppFailure() {
    return map(
      network: (n) => af.AppFailure.general(n.statusCode.toStatusMessage),
      parsingData: (p) => const af.AppFailure.parsingData(),
      validation: (v) =>
          af.AppFailure.validation(v.message, v.errors.toErrorMap()),
    );
  }
}

extension EitherX on Either<af.AppFailure, Unit> {
  af.AppFailure? leftOrNull() => fold((l) => l, (r) => null);

  Either<af.Validation, String>? validationOrMessage() =>
      leftOrNull()?.validationOrMessage();
}

extension StringEmptyNullX on String? {
  bool get isNotNullAndNotEmpty {
    return this != null && this!.isNotEmpty;
  }

  String get strip {
    if (isNotNullAndNotEmpty) {
      return this!;
    }
    return '-';
  }

  String get formatRp {
    if (isNotNullAndNotEmpty) {
      final currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp ',
        decimalDigits: 0,
      );
      final number = num.tryParse(this ?? '');
      if (number != null) {
        return currencyFormatter.format(number);
      }
    }
    return '-';
  }
}

extension BoolNullX on bool? {
  bool get isTrue {
    return this != null && this!;
  }
}

extension OptionX<T> on Option<T> {
  T? getOrNull() {
    return fold(() => null, (a) => a);
  }
}

extension FileX on File {
  String get fileName => basename(path);
}
