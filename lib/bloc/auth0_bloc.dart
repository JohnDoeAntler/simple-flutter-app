import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/utils/graphql_provider.dart';
import 'package:client/utils/jwt.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:meta/meta.dart';

part 'auth0_event.dart';
part 'auth0_state.dart';

class Auth0Bloc extends Bloc<Auth0Event, Auth0State> {
	@override
	Auth0State get initialState => Auth0Initial();

	static final String baseUrl = 'https://fyp-api.auth0.com';
	static final String clientId = 'JFX7Z1xMlr3ksIaNf56xP8hBioLu25cp';
	static final auth0 = Auth0(baseUrl: baseUrl, clientId: clientId);

	@override
	Stream<Auth0State> mapEventToState(
		Auth0Event event,
	) async* {
		yield Auth0Loading();

		if (event is Login) {
			var response = await auth0.webAuth.authorize({
					'audience': '$baseUrl/userinfo',
					'scope': 'openid email offline_access',
				});

			final token = response['id_token'];
			final userId = parseJwt(response['id_token'])['sub'];

			setHasuraConnect(token);
			yield Auth0LoggedIn(token: token, userId: userId);
		} else if (event is Logout) {
			await auth0.webAuth.clearSession();
			yield Auth0LoggedOut();
		} else {
			yield Auth0Initial();
		}
	}
}
