import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes.dart';
import '../cubit/all_style_guide_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _pickTypeface() {
    Navigator.of(context).pushNamed(AppRouter.pickTypeface);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _pickTypeface,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AllStyleGuideCubit, StyleGuideState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.styleGuides.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.styleGuides[index].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
