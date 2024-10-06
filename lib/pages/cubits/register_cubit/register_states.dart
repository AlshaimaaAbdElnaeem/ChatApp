abstract class RegisterStates {}
 class RegisterInitialState extends RegisterStates{}
class RegisterLoading extends RegisterStates{}
class RegisterSuccess extends RegisterStates{
}
class RegisterFailure extends RegisterStates{
  String errorMessages ;
  RegisterFailure ({required this.errorMessages});
}