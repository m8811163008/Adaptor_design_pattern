import 'package:adaptor_design_pattern/show%20contacts/presentation/bloc/get_contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../widgets/contacts_list_view.dart';
import '../widgets/get_conatcts_event_controller.dart';
import '../widgets/show_message.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptor Design Pattern'),
      ),
      body: BlocProvider<GetContactsBloc>(
        create: (context) => sl(),
        child: Center(
          child: Column(
            children: [
              const GetContactEventController(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetContactsBloc, GetContactsState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return const ShowMessageWidget(
                      message: 'Push buttons',
                    );
                  } else if (state is Error) {
                    return ShowMessageWidget(
                      message: state.message,
                    );
                  } else if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else if (state is Loaded) {
                    return ContactsListView(contacts: state.contacts);
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
