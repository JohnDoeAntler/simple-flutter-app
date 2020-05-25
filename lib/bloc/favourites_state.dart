part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesLoaded extends FavouritesState {

  final response;

  FavouritesLoaded({@required this.response});

}
