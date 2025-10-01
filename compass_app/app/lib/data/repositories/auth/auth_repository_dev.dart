// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../../utils/result.dart';
import 'auth_repository.dart';

class AuthRepositoryDev extends AuthRepository {
  bool _loggedIn = false;

  @override
  Future<bool> get isAuthenticated => Future.value(_loggedIn);

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    _loggedIn = true;
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> logout() async {
    _loggedIn = false;
    notifyListeners();
    return const Result.ok(null);
  }
}