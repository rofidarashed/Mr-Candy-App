import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_candy/features/home/data/models/product_model.dart';
import '../../../../../core/utils/app_colors.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.bestSellerColorContainer,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor2,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        "-${productModel.discount}%",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 3.h,
                      ),
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.loginAppbar1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                CachedNetworkImage(
                  imageUrl: productModel.image,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  errorWidget: (c, u, e) {
                    return const Icon(Icons.error_outline_rounded);
                  },
                  placeholder: (c, e) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          1.verticalSpace,
          SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor2,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 19.w),
                      child: Text(
                        productModel.name.substring(0, 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.almarai(
                          textStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.w),
                      child: Row(
                        children: [
                          Text(
                            maxLines: 1,
                            "جنيه",
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.loginAppbar1,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                          Text(
                            maxLines: 1,
                            productModel.price.toString(),
                            style: GoogleFonts.almarai(
                              textStyle: TextStyle(
                                color: AppColors.loginAppbar1,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
