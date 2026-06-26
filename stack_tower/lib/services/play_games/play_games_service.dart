import 'package:games_services/games_services.dart';

class PlayGamesService {

  PlayGamesService._();

  static final instance =
  PlayGamesService._();

  Future<bool> signIn() async{

    try{

      await GamesServices.signIn();

      return true;

    }catch(_){

      return false;

    }

  }

}