import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecases/usecase.dart';
import '../bloc/get_contacts_bloc.dart';

class GetContactEventController extends StatelessWidget {
  const GetContactEventController({Key? key}) : super(key: key);

  void dispatchGetContactEvent(BuildContext context, CallType callType) {
    BlocProvider.of<GetContactsBloc>(context)
        .add(GetContactsEventImp(callType));
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  dispatchGetContactEvent(context, CallType.json);
                },
                child: const Text('Json')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () => dispatchGetContactEvent(context, CallType.xml),
                child: const Text('Xml')),
          ],
        ),
      );
}
