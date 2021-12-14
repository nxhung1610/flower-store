import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_store/src/blocs/manager_account/detail_account/detail_account.dart';
import 'package:flower_store/src/blocs/manager_account/manager_account.dart';
import 'package:flower_store/src/models/enums.dart';
import 'package:flower_store/src/models/model.dart';
import 'package:flower_store/src/screens/base/screen_config.dart';
import 'package:flower_store/src/screens/manager_account/widgets/account_row_info.dart';
import 'package:flower_store/src/screens/manager_account/widgets/role_box_item.dart';
import 'package:flower_store/src/utils/themes/app_colors.dart';
import 'package:flower_store/src/utils/themes/app_text_style.dart';
import 'package:flower_store/src/utils/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<bool> showAlertDiag({required BuildContext context}) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Deleting'),
          content: const Text('Are you sure want to delete this staff'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                'OK',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ) ??
      false;
}

class DetailAccountPage extends StatefulWidget {
  static const String nameRoute = '/account/detail';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => DetailAccountPage(),
      settings: settings,
    );
  }

  DetailAccountPage({Key? key}) : super(key: key);

  @override
  _DetailAccountPageState createState() => _DetailAccountPageState();
}

class _DetailAccountPageState extends State<DetailAccountPage> {
  @override
  Widget build(BuildContext context) {
    var staff = ModalRoute.of(context)!.settings.arguments! as Staff;
    return ScreenConfig(
      builder: () => BlocProvider<DetailAccountBloc>(
        create: (context) {
          return DetailAccountBloc(staff: staff);
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            iconTheme: IconThemeData(
              color: AppColors.color5,
            ),
            centerTitle: true,
            backgroundColor: AppColors.color10,
            title: Text(
              'Detail Account',
              style: AppTextStyle.header4.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.color5,
              ),
            ),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () async {
                      final isAccept = await showAlertDiag(
                        context: context,
                      );
                      if (isAccept)
                        context
                            .read<DetailAccountBloc>()
                            .add(DetailAcccountDelete());
                    },
                    icon: SvgPicture.asset('assets/ico_delete.svg'));
              })
            ],
          ),
          body: _BodyScreen(),
        ),
      ),
    );
  }
}

class _BodyScreen extends StatefulWidget {
  _BodyScreen({Key? key}) : super(key: key);

  @override
  __BodyScreenState createState() => __BodyScreenState();
}

class __BodyScreenState extends State<_BodyScreen> {
  final focusName = FocusNode();
  final nameStaff = TextEditingController();

  @override
  void initState() {
    nameStaff.text = context.read<DetailAccountBloc>().staff.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailAccountBloc = context.read<DetailAccountBloc>();
    return BlocListener<DetailAccountBloc, DetailAccountState>(
      listener: (context, state) {
        switch (state.status) {
          case FormStatus.Loading:
            ScreenTool.showLoading(context, state.isLoading);
            break;
          case FormStatus.FillForm:
            break;
          case FormStatus.Error:
            Flushbar(
                title: "Detail Submit",
                message: state.errorMessage,
                duration: Duration(
                  milliseconds: 1000,
                )).show(context);
            break;
          case FormStatus.Success:
            Navigator.pop(context, true);
            Flushbar(
                title: "Detail Submit",
                message: "Detail Account Update Success",
                duration: Duration(
                  milliseconds: 1000,
                )).show(context);
            break;
        }
      },
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Stack(
                    children: [
                      BlocBuilder<DetailAccountBloc, DetailAccountState>(
                        builder: (context, state) => Container(
                          width: double.infinity,
                          height: 191.h,
                          decoration: BoxDecoration(
                            color: AppColors.color9,
                            image: state.isAvatarLocal
                                ? DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        AppColors.color10.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    image: FileImage(
                                      File(state.avatarPath),
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        AppColors.color10.withOpacity(0.5),
                                        BlendMode.dstATop),
                                    image: CachedNetworkImageProvider(
                                      state.avatarPath,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 51.h),
                          child: InkWell(
                            splashColor: AppColors.color10,
                            borderRadius: BorderRadius.circular(100.w),
                            onTap: () => detailAccountBloc
                                .add(DetailAccountChooseImage()),
                            child: BlocBuilder<DetailAccountBloc,
                                DetailAccountState>(
                              builder: (context, state) => Container(
                                height: 200.w,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5.sp,
                                    color: AppColors.color10,
                                  ),
                                  color: AppColors.color9,
                                  shape: BoxShape.circle,
                                ),
                                child: state.avatarPath.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(95.w),
                                        child: state.isAvatarLocal
                                            ? Image.file(
                                                File(state.avatarPath),
                                                fit: BoxFit.fill,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: state.avatarPath,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Container(),
                                              ),
                                      )
                                    : Center(
                                        child: SvgPicture.asset(
                                          'assets/ico_camera.svg',
                                          height: 40.w,
                                          color: AppColors.color10,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    IntrinsicWidth(
                      child: BlocBuilder<DetailAccountBloc, DetailAccountState>(
                        builder: (context, state) {
                          return TextField(
                            style: AppTextStyle.header4.copyWith(
                              color: AppColors.color6,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            autofocus: true,
                            controller: nameStaff,
                            readOnly: state.isNameReadOnly,
                            focusNode: focusName,
                            onChanged: (value) => detailAccountBloc
                                .add(NameStaffChanged(nameStaff: value)),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: SvgPicture.asset(
                        'assets/ico_pencil.svg',
                        height: 20.w,
                        color: AppColors.color9,
                      ),
                      splashRadius: 20.w,
                      onPressed: () {
                        detailAccountBloc.add(NameStaffStatus(
                            isNameReadOnly:
                                !detailAccountBloc.state.isNameReadOnly));
                        focusName.requestFocus();
                        // FocusScope.of(context).requestFocus(focusName);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    IntrinsicWidth(
                      child: BlocBuilder<DetailAccountBloc, DetailAccountState>(
                        builder: (context, state) => Text(
                          state.role.toString().split('.')[1],
                          style: AppTextStyle.header5.copyWith(
                            color: AppColors.color6,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: SvgPicture.asset(
                        'assets/ico_pencil.svg',
                        height: 20.w,
                        color: AppColors.color9,
                      ),
                      splashRadius: 20.w,
                      onPressed: () async {
                        final choose = (await _showDialogChooseRole());
                        if (choose != null)
                          detailAccountBloc.add(RoleChanged(type: choose));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                AccountRowInfo(
                  initText: detailAccountBloc.staff.phone,
                  onChanged: (value) {
                    detailAccountBloc
                        .add(PhoneNumberChanged(phoneNumber: value));
                  },
                  icon: SvgPicture.asset(
                    'assets/ico_phone.svg',
                  ),
                  hintText: 'Phone Number',
                  intputType: TextInputType.number,
                ),
                AccountRowInfo(
                  initText: detailAccountBloc.staff.email,
                  onChanged: (value) {
                    detailAccountBloc
                        .add(EmailAddressChanged(emailAddress: value));
                  },
                  icon: SvgPicture.asset('assets/ico_email.svg'),
                  hintText: 'Email Address',
                  intputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 60.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    elevation: 0,
                    primary: AppColors.color3,
                    padding: EdgeInsets.symmetric(
                      horizontal: 97.w,
                      vertical: 15.h,
                    ),
                  ),
                  onPressed: () {
                    detailAccountBloc.add(DetailAccountSubmit());
                  },
                  child: Text(
                    'Update',
                    style: AppTextStyle.header4.copyWith(
                      color: AppColors.color10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<RoleType> _showDialogChooseRole() async {
    final roles = context.read<ManagerAccountBloc>().roles;
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
          ),
          child: Container(
            padding: EdgeInsets.all(18.w),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 17.h,
              ),
              shrinkWrap: true,
              itemCount: roles.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pop(context, RoleType.values[roles[index].type]);
                },
                child: RoleBoxItem(
                  role: RoleType.values[roles[index].type],
                  isPadding: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
