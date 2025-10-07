/*

  @author     :   karthick.d    02/10/2025
  @desc       :   

 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dashboard/bloc/bpwidgetprops/model/bpwidget_props.dart';
import 'package:dashboard/types/global_types.dart';

part 'bpwidget_props_event.dart';
part 'bpwidget_props_state.dart';

class BpwidgetPropsBloc extends Bloc<BpwidgetPropsEvent, BpwidgetPropsState> {
  BpwidgetPropsBloc() : super(BpwidgetPropsState.init()) {
    on<BPWidgetPropsSave>(saveBpWidgetprops);
  }

  saveBpWidgetprops(BPWidgetPropsSave event, Emitter emit ) {
    try {
      print("event final value => ${event.bpwidgetProps}");
      emit(
        state.copyWith(
          bpwidgetProps: event.bpwidgetProps
        )
      );
    } catch(error) {
      print("saveBpWidgetprops-error $error");
    }
  }

}
