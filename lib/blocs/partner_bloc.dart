/*
 * @author chengpenggao
 * @date 2019/11/13
 */
import 'package:meta/meta.dart';
import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:luck_pets/datas/models.dart';

class PartnerBloc extends BlocBase {
  BehaviorSubject<List<UserBeanEntity>> _respon =
      BehaviorSubject<List<UserBeanEntity>>();

  Sink<List<UserBeanEntity>> get _responSink => _respon.sink;

  Stream<List<UserBeanEntity>> get _responStream => _respon.stream;

  @override
  void dispose() {
    _respon.close();
  }

  @override
  Future getData({String labId}) {
    return null;
  }

  @override
  Future onLoadMore({String labId}) {
    return null;
  }

  @override
  Future onRefresh({String labId}) {
    return null;
  }
}
