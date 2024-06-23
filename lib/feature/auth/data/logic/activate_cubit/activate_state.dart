
class ActivateUserState {}

class ActivateUserInitial extends ActivateUserState {}

class ActivateUserLoading extends ActivateUserState {}

class ActivateUserSuccess extends ActivateUserState {
  // final ActivateUserModel activateUserModel;
  // ActivateUserSuccess(this.activateUserModel);

  // @override
  // List<Object> get props => [activateUserModel];
}

class ActivateUserError extends ActivateUserState {
  final String error;

  ActivateUserError(this.error);
}
