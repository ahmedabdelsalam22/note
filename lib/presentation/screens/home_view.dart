import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/services/network_services.dart';
import 'package:note/data/data_source/remote_data_source.dart';
import 'package:note/domain/repository/notes_repository.dart';
import 'package:note/presentation/contoller/note_cubit.dart';
import 'package:note/presentation/screens/add_note.dart';

import '../contoller/note_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => NoteCubit(
          NotesRepositoryImpl(RemoteDataSourceImpl(NetworkServicesImpl())),
        )..getNotes(),
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = NoteCubit.get(context);
            return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: 'Note',
                        onPressedIcon: () {},
                        icon: Icons.search,
                      ),
                      const SizedBox(height: 30),
                      if (state is GetNotesLoadingState)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      if (state is GetNotesErrorState)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      if (state is GetNotesSuccessState)
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NoteItem(
                                  noteModel: cubit.noteModel![index],
                                  cubit: cubit);
                            },
                            itemCount: cubit.noteModel!.length,
                          ),
                        ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => AddNote(noteCubit: cubit,))));
                  },
                  child: const Icon(Icons.add),
                ));
          },
        ),
      ),
    );
  }
}
