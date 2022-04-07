import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/update_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, Post post, TextEditingController titleController, TextEditingController bodyController) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: (){
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
                //Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text("Update a Post", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
      ],
    ),
  );
}
