import 'package:games_services/games_services.dart';

class PlayerProfile {

  Future<String> getPlayerName() async{

    final player =
    await GamesServices.getPlayer();

    return player.displayName;

  }

}