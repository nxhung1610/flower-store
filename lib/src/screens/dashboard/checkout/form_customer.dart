part of 'checkout_page.dart';

class _FormCustomer extends StatelessWidget {
  const _FormCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkoutBloc = context.read<CheckoutBloc>();
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RowCustomerInfo(
            title: 'Customer Name',
            onChanged: (value) {
              checkoutBloc.add(NameCustomerChanged(value));
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          _RowCustomerInfo(
            title: 'Phone Number',
            onChanged: (value) {
              checkoutBloc.add(PhoneCustomerChanged(value));
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          _RowCustomerInfo(
            title: 'Email Address',
            onChanged: (value) {
              checkoutBloc.add(EmailCustomerChanged(value));
            },
          ),
        ],
      ),
    );
  }
}

class _RowCustomerInfo extends StatelessWidget {
  final String title;
  final Function(String value) onChanged;
  const _RowCustomerInfo(
      {Key? key, required this.title, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.header5.copyWith(
              color: AppColors.color6,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.color10,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: TextField(
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                border: InputBorder.none,
                fillColor: AppColors.color10,
              ),
              style: AppTextStyle.header5.copyWith(
                color: AppColors.color6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
