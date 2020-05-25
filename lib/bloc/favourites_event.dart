part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}

class GetFavourites extends FavouritesEvent {

  GetFavourites({@required this.id, @required this.filter});

  final id;
  final filter;

}