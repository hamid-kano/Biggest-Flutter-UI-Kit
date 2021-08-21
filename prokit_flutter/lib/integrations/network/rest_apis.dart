import 'package:prokit_flutter/integrations/models/follower_model.dart';

import 'network_utils.dart';

/// GET method demo
Future<List<FollowerModel>> getFollowers() async {
  var result = await handleResponse(await getRequest('https://api.github.com/users/octocat/followers'));

  Iterable list = result;
  return list.map((model) => FollowerModel.fromJson(model)).toList();
}

/// POST method demo
Future createEmployee(Map req) async {
  return handleResponse(await postRequest('http://dummy.restapiexample.com/api/v1/create', req));
}
