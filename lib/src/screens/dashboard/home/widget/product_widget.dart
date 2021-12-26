import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/product.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  final RoleType role;
  final Product product;
  final Function()? onClick;
  final Function()? onEdit;
  const ProductWidget(
      {Key? key,
      required this.product,
      this.role = RoleType.Seller,
      this.onClick,
      this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.color10,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashFactory: role == RoleType.Supplier
            ? NoSplash.splashFactory
            : InkRipple.splashFactory,
        onTap: () {
          if (onClick != null) onClick!();
        },
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 126.w,
                width: 126.w,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: product.image,
                  errorWidget: (context, url, error) => Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/template_plant.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Expanded(
                child: Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 120.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                product.name,
                                style: AppTextStyle.header5.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.color6,
                                ),
                              ),
                              Expanded(child: Container()),
                              role == RoleType.Supplier
                                  ? IconButton(
                                      splashRadius: 20.w,
                                      constraints: BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                      iconSize: 17.w,
                                      onPressed: () {
                                        if (onEdit != null) onEdit!();
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/ico_edit.svg'),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          product.description,
                          maxLines: 2,
                          style: AppTextStyle.header6.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontStyle: FontStyle.normal,
                            color: AppColors.color6,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          '${NumberFormat("###,###,###").format(product.basePrice)} VND',
                          style: AppTextStyle.header5.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.color6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
