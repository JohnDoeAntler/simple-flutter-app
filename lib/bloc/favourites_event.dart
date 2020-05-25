part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}

class GetFavourites extends FavouritesEvent {

  final id;
  final filter;

  GetFavourites({@required this.id, @required this.filter});

}