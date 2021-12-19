import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  final Function() onClick;
  const BillItem({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 441,
        height: 64,
        color: AppColors.color10,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Container(
                      child: Text(
                        '#123',
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color8,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Container(
                      child: Text(
                        'Jul 1,2021',
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      child: Text(
                        '100,000 VND',
                        style: AppTextStyle.header6.copyWith(
                          color: AppColors.color6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        onClick();
      },
    );
  }
}
