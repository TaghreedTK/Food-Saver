abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {}

final class UploadProfilePic extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}
