


import 'package:banda/cubit/signup/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cubit/login_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      UserCreate(
        uID: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );

    }).catchError((onError) {
      emit(SocialRegisterErrorState(onError.toString()));
    });
  }

  void UserCreate({
    required String name,
    required String email,
    required String phone,
    required String uID,
  }) {

    LogInUserModel model = LogInUserModel(
      name: name,
      phone: phone,
      email: email,
      uID: uID,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(model.toMap())
        .then((value) {
          emit(SocialRegisterSuccessStates());
    })
        .catchError((onError){
          emit(SocialRegisterErrorState(onError));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordVisibilityState());
  }
}
