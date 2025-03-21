import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/shared_widgets/failure_widget.dart';
import 'package:mr_candy/features/category_details/presentation/view/widgets/category_details_widget.dart';
import 'package:mr_candy/features/home/presentation/controller/get_category_details_cubit.dart';
import 'package:mr_candy/features/home/presentation/controller/get_category_details_states.dart';

class CategoryDetailsList extends StatefulWidget {
  const CategoryDetailsList({super.key, required this.id});

  final int id;

  @override
  State<CategoryDetailsList> createState() => _CategoryDetailsListState();
}

class _CategoryDetailsListState extends State<CategoryDetailsList> {
  @override
  void initState() {
    super.initState();
    context
        .read<CategoryDetailsCubit>()
        .getCategoryDetails(categoryId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsCubit, CategoryDetailsStates>(
      builder: (context, state) {
        if (state is CategoryDetailsLoadingStates) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryDetailsFailureStates) {
          return FailureWidget(errorMessage: state.errorMessage);
        } else if (state is CategoryDetailsSuccessStates) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return CategoryDetailsWidget(
                productModel: state.categoryDetails[index],
              );
            },
            itemCount: state.categoryDetails.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
