

abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates {}

class SocialRegisterLoadingState extends SocialRegisterStates {}

class SocialRegisterSuccessStates extends SocialRegisterStates {}

class SocialRegisterErrorState extends SocialRegisterStates

{

  final String error;

  SocialRegisterErrorState(this.error);

}



class SocialCreateUserSuccessStates extends SocialRegisterStates {}

class SocialCreateUserErrorState extends SocialRegisterStates

{

  final String error;

  SocialCreateUserErrorState(this.error);

}



class SocialChangePasswordVisibilityState extends SocialRegisterStates {}