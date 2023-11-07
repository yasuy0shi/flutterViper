import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutterViper/interactors/interactor_bus.dart';
import 'package:flutterViper/interactors/interactor_bus_builder.dart';

final interactorBusProvider =
    Provider<InteractorBus>((ref) => InteractorBusBuilder.build());
