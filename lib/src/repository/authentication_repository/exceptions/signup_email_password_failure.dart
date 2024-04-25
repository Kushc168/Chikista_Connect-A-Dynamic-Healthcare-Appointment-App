class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured!!"]);


  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case 'weak-password' :
        return SignUpWithEmailAndPasswordFailure('Please enter a Strong password');
      case 'invalid-email' :
        return SignUpWithEmailAndPasswordFailure('Email is not valid or badly format');
      case 'email-already-in-use' :
        return SignUpWithEmailAndPasswordFailure('An account already exists for that email');
      case 'operation-not-allowed' :
        return SignUpWithEmailAndPasswordFailure('Operation is not allowed,please contact support');
      case 'user-disabled' :
        return SignUpWithEmailAndPasswordFailure('This user has been disabled.Please contact support for help');

      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
