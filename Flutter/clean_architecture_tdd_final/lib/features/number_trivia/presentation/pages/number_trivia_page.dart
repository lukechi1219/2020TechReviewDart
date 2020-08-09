import 'package:clean_architecture_tdd_final/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return null;
                  } else if (state is Loaded) {
                    return null;
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return Container(
                    child: Text('test 3'),
                  );
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }

  Container MessageDisplay({@required String message}) {
    return Container(
      child: Text(message),
    );
  }

  TriviaControls() {
    return Text('controls');
  }
}
