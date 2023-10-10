import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusTile extends StatefulWidget {
  final int sn;
  final String title;
  final int index;

  const OrderStatusTile(
      {super.key, required this.sn, required this.title, required this.index});

  @override
  State<OrderStatusTile> createState() => _OrderStatusTileState();
}

class _OrderStatusTileState extends State<OrderStatusTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.w),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: const Color(0xFFe3e3e3))),
        child: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: 4), //
            leading: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
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
            trailing: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.pending,
                  size: 30,
                  color: Color(0xffF8B64C),
                ),
                SizedBox(
                  width: 2.w,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            )));
  }
}
