import 'package:bloc_library/bloc/user_bloc.dart';
import 'package:bloc_library/presentation/screens/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfPost extends StatefulWidget {
  @override
  _ListOfPostState createState() => _ListOfPostState();
}

class _ListOfPostState extends State<ListOfPost> {
  @override
  void initState() {
    // BlocProvider.of<UserBloc>(context).add(UserModelLoadedEvent());
    context.read<UserBloc>().add(UserModelLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                print(state);
                if (state is UserFetchingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is UserFetchedState) {
                  print(state);
                  return ListView.builder(
                      itemCount: state.userModel.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.userModel[index].name),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (Context) => DetailedScreen(
                                        state.userModel[index])));
                          },
                        );
                      });
                } else {
                  return Text('something went wrong');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
