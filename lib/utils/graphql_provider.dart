import 'package:hasura_connect/hasura_connect.dart';

HasuraConnect hasura;

HasuraConnect setHasuraConnect(String str) {
  return hasura = HasuraConnect('http://colourful.dlinkddns.com:8080/v1/graphql', token: (isError) async {
    //sharedPreferences or other storage logic
    return "Bearer $str";
  });
}