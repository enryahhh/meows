part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      
    UserModel user = result.user!.convertToUser(
      name:name
    );
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      print(e.toString().split(',')[1].trim());
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = await result.user!.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      print(e.toString());
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Stream<User?> get userStream => _auth.authStateChanges();

}

class SignInSignUpResult {
  final UserModel? user;
  final String? message;

  SignInSignUpResult({this.user, this.message});
}