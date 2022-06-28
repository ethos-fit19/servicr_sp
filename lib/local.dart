import '../../providers/currentuser_provider.dart';
import '../../util/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentUserProvider = useProvider(currentUserProvider);

String uid = _currentUserProvider.state.id!;
