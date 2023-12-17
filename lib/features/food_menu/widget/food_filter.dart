import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/my_chip.dart';
import '../../../widget/ripple.dart';

class FoodFilter extends StatefulWidget {
  const FoodFilter({super.key});

  @override
  State<FoodFilter> createState() => _FoodFilterState();
}

class _FoodFilterState extends State<FoodFilter> {
  final List<String> entries = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];
  String selectedCategories = 'all';
  String selectedDietary = 'any';
  List<String?> priceRange = ['1', '2', '3', '4'];
  String? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(color: Color(0xffeea734)),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(25.r),
                          visualDensity: VisualDensity(horizontal: 1.w)),
                    )),
                SizedBox(
                  width: 100.w,
                ),
                Text(
                  'Filters',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff010F07),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CATEGORIES',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff454f49),
                      fontWeight: FontWeight.w300),
                ),
                Ripple(
                    onTap: () {
                      setState(() {
                        selectedCategories = 'all';
                      });
                    },
                    child: Text(
                      'CLEAR ALL',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff999f9b),
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Wrap(
              spacing: 10.w,
              runSpacing: 2.w,
              children: [
                MyChip(
                  textColor: getTextColorCategories('all'),
                  backgroundColor: getBackgroundColorCategories('all'),
                  text: 'ALL',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'all';
                    });
                  },
                ),
                MyChip(
                    text: 'BRUNCH',
                    onTap: () {
                      setState(() {
                        selectedCategories = 'br';
                      });
                    },
                    textColor: getTextColorCategories('br'),
                    backgroundColor: getBackgroundColorCategories('br')),
                MyChip(
                  text: 'DINNER',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'd';
                    });
                  },
                  textColor: getTextColorCategories('d'),
                  backgroundColor: getBackgroundColorCategories('d'),
                ),
                MyChip(
                  text: 'BURGERS',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'b';
                    });
                  },
                  textColor: getTextColorCategories('b'),
                  backgroundColor: getBackgroundColorCategories('b'),
                ),
                MyChip(
                  text: 'CHINESE',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'c';
                    });
                  },
                  textColor: getTextColorCategories('c'),
                  backgroundColor: getBackgroundColorCategories('c'),
                ),
                MyChip(
                  text: 'PIZZA',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'p';
                    });
                  },
                  textColor: getTextColorCategories('p'),
                  backgroundColor: getBackgroundColorCategories('p'),
                ),
                MyChip(
                  text: 'SALADS',
                  onTap: () {
                    setState(() {
                      selectedCategories = 's';
                    });
                  },
                  textColor: getTextColorCategories('s'),
                  backgroundColor: getBackgroundColorCategories('s'),
                ),
                MyChip(
                  text: 'SOUP',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'sp';
                    });
                  },
                  textColor: getTextColorCategories('sp'),
                  backgroundColor: getBackgroundColorCategories('sp'),
                ),
                MyChip(
                  text: 'BREAKFAST',
                  onTap: () {
                    setState(() {
                      selectedCategories = 'brk';
                    });
                  },
                  textColor: getTextColorCategories('brk'),
                  backgroundColor: getBackgroundColorCategories('brk'),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DIETARY',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff454f49),
                      fontWeight: FontWeight.w300),
                ),
                Ripple(
                    onTap: () {
                      setState(() {
                        selectedDietary = 'any';
                      });
                    },
                    child: Text(
                      'CLEAR ALL',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff999f9b),
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Wrap(
              spacing: 10.w,
              children: [
                MyChip(
                  text: 'ANY',
                  textColor: getTextColorDietry('any'),
                  backgroundColor: getBackgroundColorDietry('any'),
                  onTap: () {
                    setState(() {
                      selectedDietary = 'any';
                    });
                  },
                ),
                MyChip(
                  text: 'VEGETERIAN',
                  textColor: getTextColorDietry('v'),
                  backgroundColor: getBackgroundColorDietry('v'),
                  onTap: () {
                    setState(() {
                      selectedDietary = 'v';
                    });
                  },
                ),
                MyChip(
                  text: 'VEGAN',
                  onTap: () {
                    setState(() {
                      selectedDietary = 'vn';
                    });
                  },
                  textColor: getTextColorDietry('vn'),
                  backgroundColor: getBackgroundColorDietry('vn'),
                ),
                MyChip(
                    text: 'GLUTEN-FREE',
                    textColor: getTextColorDietry('g'),
                    backgroundColor: getBackgroundColorDietry('g'),
                    onTap: () {
                      setState(() {
                        selectedDietary = 'g';
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PRICE RANGE',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff454f49),
                      fontWeight: FontWeight.w300),
                ),
                Ripple(
                    onTap: () {
                      setState(() {
                        price = null;
                      });
                    },
                    child: Text(
                      'CLEAR ALL',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff999f9b),
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            SizedBox(
              height: 60.w,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.h,
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return Ripple(
                    onTap: () {
                      setState(() {
                        price = priceRange[index];
                      });
                    },
                    child: CircleAvatar(
                      foregroundColor: /*const Color(0xff6f7773)*/
                          getTextColorPrice(priceRange[index]),
                      radius: 30.r,
                      // ignore: dead_code
                      backgroundColor: /* const Color(0xfff1f1f1)*/
                          getBackgroundColorPrice(priceRange[index]),
                      child: Text(
                        entries[index],
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: MyChip(
                  onTap: () {},
                  text: 'APPLY FILTERS',
                  fontsize: 14.sp,
                  edgeInsets:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 10.w),
                  textColor: Colors.white,
                  backgroundColor: const Color(0xffF8B64C)),
            ),
          ],
        ),
      ),
    )));
  }

  Color getTextColorCategories(String text) {
    if (selectedCategories == text) {
      return const Color(0xfff1f1f1);
    } else {
      return const Color(0xff6f7773);
    }
  }

  Color getBackgroundColorCategories(String text) {
    if (selectedCategories == text) {
      return const Color(0xffF8B64C);
    } else {
      return const Color(0xfff1f1f1);
    }
  }

  Color getTextColorDietry(String text) {
    if (selectedDietary == text) {
      return const Color(0xfff1f1f1);
    } else {
      return const Color(0xff6f7773);
    }
  }

  Color getBackgroundColorDietry(String text) {
    if (selectedDietary == text) {
      return const Color(0xffF8B64C);
    } else {
      return const Color(0xfff1f1f1);
    }
  }

  Color getTextColorPrice(String? text) {
    if (price == text) {
      return const Color(0xfff1f1f1);
    } else {
      return const Color(0xff6f7773);
    }
  }

  Color getBackgroundColorPrice(String? text) {
    if (price == text) {
      return const Color(0xffF8B64C);
    } else {
      return const Color(0xfff1f1f1);
    }
  }
}
