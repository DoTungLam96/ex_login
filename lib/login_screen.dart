import 'package:ex_module_core/ex_module_core.dart';
import 'package:ex_widget/ex_widget.dart';
import 'package:flutter/material.dart';

import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';
import 'widgets/button_widget.dart';
import 'widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController edtUsername = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    edtUsername.text = "140219";
    edtPassword.text = "Ssi@12345";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocProvider(
      create: (context) => GetIt.instance<LoginCubit>(),
      child: IBoardScaffold(
        appBar: BaseAppBar(
          automaticallyImplyLeading: false,
          title: ILocale.current.login,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              TextFieldWidget(
                  hintText: ILocale.current.username,
                  textEditingController: edtUsername),
              const SizedBox(
                height: 12,
              ),
              TextFieldWidget(
                  hintText: ILocale.current.password,
                  textEditingController: edtPassword),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is Error) {
                    GetIt.instance<ToastWidget>()
                        .showToastCenterError(message: state.message ?? "");
                  }
                  if (state is LoginSuccess) {
                    GetIt.instance<ToastWidget>().showToastCenterSuccess(
                        message:
                            "Login succesfully! Welcome, ${state.user?.fullName} ");
                    Navigator.of(context).pushNamed(Constants.homePage,
                        arguments: state.user?.fullName);
                  }
                },
                builder: (context, state) {
                  if (state is Loading) {
                    isLoading = true;
                  }
                  if (state is Error) {
                    isLoading = false;
                  }
                  if (state is LoginSuccess) {
                    isLoading = false;
                  }

                  return ButtonWidget(
                    onPress: () {
                      final username = edtUsername.text;
                      final password = edtPassword.text;
                      context
                          .read<LoginCubit>()
                          .login(username: username, password: password);
                      // Navigator.of(context).pushNamed(Constants.homePage,
                      //     arguments: HomeArgs(username: "Test Test"));
                    },
                    margin: const EdgeInsets.only(top: 16),
                    title: ILocale.current.login,
                    radius: 6,
                    isLoading: state is Loading,
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    bgColor: Colors.green,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
