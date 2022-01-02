import 'package:collection/src/iterable_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_store/src/services/app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_store/src/models/base/bill/bill.dart';
part './statistic_event.dart';
part './statistic_state.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  StatisticBloc() : super(StatisticInitial()) {
    on<StatisticLoaded>((event, emit) async {
      emit(StatisticLoading());
      final _requestList = (await AppRepository().request.get()) as List<Bill>;
      final _invoiceList = (await AppRepository().invoice.get()) as List<Bill>;
      Map<int, Map<int, List<Bill>>> _billMap = {};
      final _requestTempMap =
          _requestList.groupListsBy((element) => element.createdAt!.year);

      _requestTempMap.forEach((key, value) {
        if (_billMap.containsKey(key)) {
          value
              .groupListsBy((element) => element.createdAt!.month)
              .forEach((keyChild, valueChild) {
            if (_billMap[key]!.containsKey(keyChild)) {
              _billMap[key]![keyChild]!.addAll(valueChild);
            } else {
              _billMap[key]![keyChild] = valueChild;
            }
          });
        } else {
          _billMap[key] =
              value.groupListsBy((element) => element.createdAt!.month);
        }
      });

      final _invoiceTempMap =
          _invoiceList.groupListsBy((element) => element.createdAt!.year);

      _invoiceTempMap.forEach((key, value) {
        if (_billMap.containsKey(key)) {
          value
              .groupListsBy((element) => element.createdAt!.month)
              .forEach((keyChild, valueChild) {
            if (_billMap[key]!.containsKey(keyChild)) {
              _billMap[key]![keyChild]!.addAll(valueChild);
            } else {
              _billMap[key]![keyChild] = valueChild;
            }
          });
        } else {
          _billMap[key] =
              value.groupListsBy((element) => element.createdAt!.month);
        }
      });

      final years = [..._billMap.keys].toSet().toList();

      emit(
        StatisticLoadSucess(
          years: years,
          selectYear: years.first,
          billMap: _billMap,
        ),
      );
    });
    on<StatisticChangeYear>((event, emit) async {
      emit((state as StatisticLoadSucess).copyWith(selectYear: event.year));
    });
  }
}
