import 'package:advicer/application/theme_provider/theme.dart';
import 'package:advicer/presentation/screens/home/cubit/advicer_cubit.dart';
import 'package:advicer/presentation/screens/home/widget/advice_field.dart';
import 'package:advicer/presentation/screens/home/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';

class HomeScreenWrapperProvider extends StatelessWidget {
  const HomeScreenWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerCubit>(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Advice App'),
                actions: <Widget>[
                  Switch(
                    value: themeProvider.isDark,
                    onChanged: (_) {
                      themeProvider.toggleTheme();
                    },
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<AdvicerCubit, AdvicerState>(
                          builder: (context, state) {
                        if (state is AdvicerInitial) {
                          return Center(
                            child: Text(
                              'Advice is waiting',
                              style: themeData.textTheme.displayMedium,
                            ),
                          );
                        } else if (state is AdvicerOnLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is AdvicerOnLoadedState) {
                          return AdviceField(advice: state.advice);
                        } else if (state is AdvicerOnErrorState) {
                          return AdviceField(advice: state.message);
                        } else {
                          return const SizedBox();
                        }
                      }),
                    ),
                    SizedBox(
                      height: 200,
                      child: Center(
                          child: CustomButton(
                        onTap: () => BlocProvider.of<AdvicerCubit>(context)
                            .adviceRequested,
                      )),
                    ),
                  ],
                ),
              ),
            ));
  }
}
