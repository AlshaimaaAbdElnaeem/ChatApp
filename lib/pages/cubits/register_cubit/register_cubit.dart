import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/cubits/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(RegisterStates initialState) : super(initialState);
  Future<void> registerUser({required String email , required String password}) async {
   try{
     emit(RegisterLoading());
       UserCredential user = await FirebaseAuth.instance
           .createUserWithEmailAndPassword(email: email, password: password);
       emit(RegisterSuccess());
   }on FirebaseAuthException catch (ex) {
     if (ex.code == 'weak-password') {
     emit(RegisterFailure(errorMessages: "weak password"));
     } else if (ex.code == 'email-already-in-use') {
       emit(RegisterFailure(errorMessages: "email already in use"));
     }
   } catch (ex) {
     emit(RegisterFailure(errorMessages: "something is wrong!"));
   }
  }
}
