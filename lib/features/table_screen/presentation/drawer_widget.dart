import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/logout/logout_presentation/alert_dialog_box.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 304.h,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250.h,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xffF8B64C),
              ),
              accountName: Text(
                'Kitwosd Restro System',
                style: TextStyle(fontSize: 8.sp),
              ),
              accountEmail: Text(
                'admin@gmail.com',
                style: TextStyle(fontSize: 6.sp),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
              currentAccountPictureSize: Size.fromRadius(70.r),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text('Notifications', style: TextStyle(fontSize: 6.sp)),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('Log Out', style: TextStyle(fontSize: 6.sp)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => alertDialog(context),
              );
            },
          )
        ],
      ),
    );
  }
}
