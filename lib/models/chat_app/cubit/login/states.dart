

abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoadLoginState extends SocialLoginStates {}

class SocialLoginSuccessStates extends SocialLoginStates {}

class SocialLoginErrorState extends SocialLoginStates

{

  final String error;

  SocialLoginErrorState(this.error);

}





class SocialChangePasswordVisibilityState extends SocialLoginStates {}