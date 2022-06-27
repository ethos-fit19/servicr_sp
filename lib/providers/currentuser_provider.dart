import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user_model.dart';

final currentUserProvider = StateProvider<UserModel>((ref) => UserModel());
