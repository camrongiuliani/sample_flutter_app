

class SpaceXDocuments {

  static get launches => '''
    query Launches(\$limit: Int) {
      launches(limit: \$limit) {
        mission_name
        mission_id
        details
        rocket {
          rocket_name
          rocket {
            company
            cost_per_launch
            boosters
            name
            mass {
              kg
            }
          }
        }
        launch_site {
          site_name
        }
        launch_date_local
      }
    }
  ''';

}