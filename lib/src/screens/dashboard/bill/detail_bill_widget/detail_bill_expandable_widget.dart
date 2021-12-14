import 'package:expandable/expandable.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class ExpandableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 12),
                        child: Text(
                          'Detail',
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.green,
                        child: Container(
                          width: 26.w,
                          height: 28.h,
                          child: Center(
                            child: ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_left,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 25.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding:
                                    EdgeInsets.only(right: 12, bottom: 12),
                                hasIcon: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: Text(
                '',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 1),
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: 345,
                    child: Card(
                      color: AppColors.color10,
                      elevation: 0,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 2),
                                  child: Image(
                                    width: 50.w,
                                    height: 50.h,
                                    image:
                                        AssetImage('assets/template_plant.png'),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 21),
                                      child: Text(
                                        'Chậu Hana',
                                        style: AppTextStyle.header6.copyWith(
                                          color: AppColors.color6,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 5),
                                      child: Text(
                                        '10 000 VND',
                                        style: AppTextStyle.header7.copyWith(
                                          color: AppColors.color7,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, top: 22),
                                      child: Text(
                                        '(x3)',
                                        style: AppTextStyle.header7.copyWith(
                                          color: AppColors.color3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, right: 21),
                                      child: Text(
                                        '30,000 VND',
                                        style: AppTextStyle.header7.copyWith(
                                          color: AppColors.color6,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
