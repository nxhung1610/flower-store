import 'package:dio/dio.dart';
import 'package:flower_store/src/services/base/base_repository.dart';
import 'package:flutter/material.dart';

abstract class BaseProvider<T extends BaseRepository> {
  @protected
  late T repository;
  
  BaseProvider() {
    repository = initRepository();
  }

  T initRepository();
}
