import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/cubits/login_cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(LoginState initialState) : super(initialState);
  Future<void> loginUser({required String email , required String password}) async {
    try {
      emit(LoginLoading());
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong-password'));
      }
    }catch(ex){
      emit(LoginFailure(errorMessage: "Something wrong"));
    }

  }
  }