import 'package:bookly_store/Featurs/home/data/presinataion/manger/home_cubit_state/featch_book_state_cubit.dart';
import 'package:bookly_store/Featurs/home/data/presinataion/views/home_viewDetailsBook.dart';
import 'package:bookly_store/Featurs/home/data/presinataion/views/widgets/CustomListVeiwBook.dart';
import 'package:bookly_store/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FutearListViewIteam extends StatelessWidget {
  const FutearListViewIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatchBookStateCubit, FeatchBookStateState>(
      builder: (context, state) {
        if (state is FeatchBookStateSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsBookView(
                          bookmodel: state.books[index], // تمرير الكتاب الصحيح
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 5,
                      top: 10,
                      bottom: 10,
                    ),
                    child: CustomListVeiwBook(bookmodel: state.books[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is FeatchBookStateFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is FeatchBookStateLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: kColor,
              strokeWidth: 5,
              backgroundColor: Colors.white,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
