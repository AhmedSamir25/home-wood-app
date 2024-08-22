part of 'localization_cubit_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationUpdate extends LocalizationState {}