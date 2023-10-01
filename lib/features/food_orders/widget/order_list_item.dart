import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/helper/function.dart';

class OrderListTile extends StatefulWidget {
  OrderListTile(
      {super.key,
      required this.id,
      required this.sn,
      this.status = "pending",
      required this.subtitle,
      required this.title,
      required this.price});
  final int id;
  final int sn;
  final String title;
  final String subtitle;
  final String? price;
  String status;

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  String selectedStatus = "pending";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xFFe3e3e3))),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: 4), //
        leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xff868686))),
            child: Text(
              widget.sn.toString(),
              style: TextStyle(
                  fontSize: 4.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffF8B64C)),
            )),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 6.sp,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
              color: const Color(0xff868686),
              fontWeight: FontWeight.w400,
              fontSize: 5.sp),
        ),
        trailing: Column(
          children: [
            Text(
              widget.price!,
              style: TextStyle(
                  color: const Color(0xffF8B64C),
                  fontWeight: FontWeight.w600,
                  fontSize: 5.sp),
            ),
            SizedBox(
              height: 5.w,
            ),
            Container(
              height: isTablet ? 7.w : 20.w,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: const Color(0xffF8B64C))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: widget.status,
                    items: [
                      DropdownMenuItem(
                        value: 'pending',
                        child: Text(
                          'Pending',
                          style: TextStyle(fontSize: 4.sp),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'preparing',
                        child: Text(
                          'Preparing',
                          style: TextStyle(fontSize: 4.sp),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ready',
                        child: Text(
                          'Ready to be served',
                          style: TextStyle(fontSize: 4.sp),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'delivered',
                        child: Text(
                          'Delivered',
                          style: TextStyle(fontSize: 4.sp),
                        ),
                      ),
                    ],
                    onChanged: (v) {
                      setState(() {
                        widget.status = v!;
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
