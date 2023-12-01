import 'package:common_models/common_models.dart';
import 'package:findx_dart_client/app_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../app/navigation/app_route_builder.dart';
import '../../../shared/state/data_pager_with_last_id_cubit.dart';

typedef MathFieldListState = DataState<FetchFailure, DataPage<MathFieldPageItem>>;

extension MathFieldListCubitX on BuildContext {
  MathFieldListCubit get mathFieldListCubit => read<MathFieldListCubit>();
}

@injectable
final class MathFieldListCubit extends DataPagerWithLastIdCubit<FetchFailure, MathFieldPageItem> {
  MathFieldListCubit(
    this._mathFieldRemoteRepository,
    this._goRouter,
  ) {
    fetchNextPage();
  }

  final MathFieldRemoteRepository _mathFieldRemoteRepository;
  final GoRouter _goRouter;

  @override
  String idSelector(MathFieldPageItem item) => item.id;

  @override
  Future<Either<FetchFailure, DataPage<MathFieldPageItem>>?> provideDataPage(
    String? lastId,
  ) {
    return _mathFieldRemoteRepository.filter(limit: 10, lastId: lastId);
  }

  Future<void> onNewMathFieldPressed() async {
    await _goRouter.push(AppRouteBuilder.mutateMathField());

    onRefresh();
  }
}
