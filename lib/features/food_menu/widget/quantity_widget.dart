import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quantity',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: isTablet ? 5.sp : 10.sp),
        ),
        Row(
          children: [
            itemCount != 1
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        itemCount--;
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      size: 20.r,
                    ))
                : IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove,
                      size: 20.r,
                    )),
            Container(
              width: 60.w,
              height: 30.h,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                itemCount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 6.sp),
              )),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    itemCount++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 20.r,
                )),
          ],
        ),
      ],
    );
  }
}