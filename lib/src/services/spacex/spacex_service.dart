

import 'package:demo/src/core/models/data_result.dart';
import 'package:demo/src/services/spacex/data/documents.dart';
import 'package:demo/src/services/spacex/models/launch.dart';
import 'package:graphql/client.dart';


/// Service for handling calls to the SpaceX Graphql API.
class SpaceXService {

  // This class maintains a singleton instance.
  // An alternative method would be to use a service locator, such as get_it.
  static SpaceXService? _instance;

  late final HttpLink _httpLink;
  late final WebSocketLink _webSocketLink;
  late final GraphQLClient _client;

  SpaceXService._( String httpLink ) {
    _httpLink = HttpLink( httpLink );
    _webSocketLink = WebSocketLink( httpLink.replaceAll( 'https', 'wss' ) );
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: Link.split( ( r ) => r.isSubscription, _webSocketLink, _httpLink ),
    );
  }

  factory SpaceXService( [ String? httpLink ] ) {
    assert( _instance != null || ( httpLink != null && httpLink != '' ), 'SpaceXService must be instantiated with a valid httpLink' );
    return _instance ??= SpaceXService._( httpLink! );
  }

  void dispose() {
    _instance = null;
  }

  /// Queries a list of launches from the SpaceX GQL API
  ///
  /// [limit]: The number of records to retrieve.
  Future<DataResult<List<SpaceXLaunch>>> getLaunches( { int limit = 20 } ) async {
    final response = await _client.query(
      QueryOptions(
        variables: {
          'limit': limit,
        },
        document: gql( SpaceXDocuments.launches ),
      ),
    );

    if ( response.hasException ) {
      return DataResult.error( response.exception.toString() );
    }

    List _launchMaps = response.data?[ 'launches' ] ?? [];

    if ( _launchMaps.isEmpty ) {
      return DataResult.success( [], 'No launches recorded!' );
    }

    List<SpaceXLaunch> mapped = _launchMaps.map( ( e ) => SpaceXLaunch.fromJson( e ) ).toList();

    return DataResult.success( mapped );

  }

}