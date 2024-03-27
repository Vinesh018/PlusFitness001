import 'dart:convert';
import 'package:dynamic_shared_preferences/dynamic_shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/deletemeals.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

var breakfastList = <String>[];
var breakfastListcal = <String>[];

var lunchList = <String>[];
var lunchListcal = <String>[];

var dinnerList = <String>[];
var dinnerlistcal = <String>[];

List<MealsItems> _mealsItem = [
  MealsItems(
      itemname: 'Avacado',
      calaries: 240,
      uid: '1',
      imageurl: 'assets/meals/avocado.png'),
  MealsItems(
      itemname: 'Bread',
      calaries: 265,
      uid: '2',
      imageurl: 'assets/meals/bread.png'),
  MealsItems(
      itemname: 'Butter',
      calaries: 102,
      uid: '3',
      imageurl: 'assets/meals/butter.png'),
  MealsItems(
      itemname: 'Naan (Indian bread)',
      calaries: 262,
      uid: '4',
      imageurl: 'assets/meals/naan.png'),
  MealsItems(
      itemname: 'Pizza',
      calaries: 266,
      uid: '5',
      imageurl: 'assets/meals/pizza.png'),
  MealsItems(
      itemname: 'Rajma',
      calaries: 333,
      uid: '6',
      imageurl: 'assets/meals/rajma.png'),
  MealsItems(
      itemname: 'Rice',
      calaries: 130,
      uid: '7',
      imageurl: 'assets/meals/rice.png'),
  MealsItems(
      itemname: 'Roti (Indian Bread)',
      calaries: 120,
      uid: '9',
      imageurl: 'assets/meals/roti.jpg'),
  MealsItems(
      itemname: 'Salad',
      calaries: 100,
      uid: '10',
      imageurl: 'assets/meals/salad.png'),
  MealsItems(
      itemname: 'Sandwich',
      calaries: 280,
      uid: '10',
      imageurl: 'assets/meals/sandwich.png'),
  MealsItems(
      itemname: 'Soup',
      calaries: 190,
      uid: '11',
      imageurl: 'assets/meals/soup.png'),
  MealsItems(
      itemname: 'Tomatoes',
      calaries: 20,
      uid: '12',
      imageurl: 'assets/meals/tomato.png'),
  MealsItems(
      itemname: 'Veggies',
      calaries: 65,
      uid: '13',
      imageurl: 'assets/meals/veggies.png'),
];
var screenwidth;

class MealsItems {
  final String itemname;
  final double calaries;
  final String uid;
  final String imageurl;
  MealsItems(
      {required this.itemname,
      required this.calaries,
      required this.uid,
      required this.imageurl});
}

class DragandDrop extends StatefulWidget {
  @override
  State<DragandDrop> createState() => _DragandDropState();
}

class _DragandDropState extends State<DragandDrop>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Mealtype> _mealtype = [
    Mealtype(
      mealtype: 'Breakfast',
      mealtypeimageurl: 'assets/images/breakfast.png',
    ),
    Mealtype(mealtype: 'Lunch', mealtypeimageurl: 'assets/images/lunch.png'),
    Mealtype(mealtype: 'Dinner', mealtypeimageurl: 'assets/images/dinner.png'),
  ];

  final GlobalKey _draggablekey = GlobalKey();

  void _itemDroppedOnMealsItem(
      {required MealsItems mealsItems, required Mealtype mealtype}) {
    setState(() {
      mealtype.mealitem.add(mealsItems);
      storeAndRetrieveList();
      storeAndRetrievebreakfastListofcal();
      storeAndRetrieveListlunch();
      storeAndRetrieveListlunchcal();
      storeAndRetrieveListdinner();
      storeAndRetrieveListdinnercal();

      if (mealtype.mealtype == "Breakfast") {
        final breakfast = mealtype.mealitem.map((object) {
          return "${object.itemname}";
        });
        final breakfastcal = mealtype.mealitem.map((object) {
          return "${object.calaries}";
        });

        breakfastList = breakfast.toList();
        breakfastListcal = breakfastcal.toList();
        // print(" breakfastList  List is ${breakfastcal.runtimeType}");
        // print(" breakfast calarie is List is ${breakfastcal}");
        // print(" breakfast calarie is List is ${breakfastList}");
      }

      if (mealtype.mealtype == "Lunch") {
        final lunch = mealtype.mealitem.map((object) {
          return "${object.itemname}";
        });
        final lunchcal = mealtype.mealitem.map((object) {
          return "${object.calaries}";
        });
        lunchList = lunch.toList();
        lunchListcal = lunchcal.toList();

        // print("Lunch List $lunchList");
      }

      if (mealtype.mealtype == "Dinner") {
        final dinner = mealtype.mealitem.map((object) {
          return "${object.itemname}";
        });
         final dinnercal = mealtype.mealitem.map((object) {
          return "${object.calaries}";
        });

        dinnerList = dinner.toList();
        dinnerlistcal = dinnercal.toList();

        // print(" Dinner List $dinnerList");
      }
    });
  }

  Future<void> storeAndRetrieveList() async {
    var sp = await SharedPreferences.getInstance();

    // Retrieve the current list from SharedPreferences
    List<String>? breakfastlistfromsharedpref =
        sp.getStringList(sharedprefkeysfinal.breakfastlist);

    if (breakfastlistfromsharedpref != null) {
      // Decode the stored items into a List<dynamic>
      List<dynamic> decodedList =
          breakfastlistfromsharedpref.map((item) => json.decode(item)).toList();
      decodedList.add(breakfastList.last);
      List<String> updatedList =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.breakfastlist, updatedList);
      // print(
      // 'Updated list stored in SharedPreferences of breakfast is: $updatedList');
    } else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrList =
          breakfastList.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.breakfastlist, usrList);
      // print('Initial list stored in SharedPreferences: $usrList');
    }

    // Now, you can retrieve the updated list and update your UI
    List<String>? finalList =
        sp.getStringList(sharedprefkeysfinal.breakfastlist);
    if (finalList != null) {
      breakfastList =
          finalList.map((item) => json.decode(item) as String).toList();
      // print('Getting Value from SharedPreferences is $breakfastList');
    } else {
      print('No value found in SharedPreferences');
    }
    setState(() {
      
    });
  }

  Future<void> storeAndRetrievebreakfastListofcal() async {
    var sp = await SharedPreferences.getInstance();

    List<String>? breakfastcallistofsp =
        sp.getStringList(sharedprefkeysfinal.braekfastlistcal);
    if (breakfastcallistofsp != null) {
      List<dynamic> decodedList =
          breakfastcallistofsp.map((item) => json.decode(item)).toList();
      decodedList.add(breakfastListcal.last);
      List<String> updatedList =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.braekfastlistcal, updatedList);
      // print(
      // 'Updated list stored in SharedPreferences of breakfast calarirs  is: $updatedList');
    } else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrList =
          breakfastListcal.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.braekfastlistcal, usrList);
      // print('Initial list stored in SharedPreferences: $usrList');
    }
    List<String>? finalList =
        sp.getStringList(sharedprefkeysfinal.braekfastlistcal);
    if (finalList != null) {
      breakfastListcal =
          finalList.map((item) => json.decode(item) as String).toList();
      print(
          'Getting Value from SharedPreferences of calaries breakfastlist is $breakfastListcal');
      print('Getting Value from SharedPreferences is $breakfastList');
    } else {
      print('No value found in SharedPreferences');
    }
    setState(() {});
  }

  Future<void> storeAndRetrieveListlunch() async {
    var sp = await SharedPreferences.getInstance();

    List<String>? lunchfromsharedpref =
        sp.getStringList(sharedprefkeysfinal.lunchlist);
    if (lunchfromsharedpref != null) {
      // Decode the stored items into a List<dynamic>
      List<dynamic> decodedList =
          lunchfromsharedpref.map((item) => json.decode(item)).toList();
      decodedList.add(lunchList.last);
      List<String> updatedListlunch =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.lunchlist, updatedListlunch);
      print(
          'Updated list stored in SharedPreferences of lunch  is : $updatedListlunch');
    } else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrListlunch =
          lunchList.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.lunchlist, usrListlunch);
      print('Initial list stored in SharedPreferences: $usrListlunch');
    }
    List<String>? finalListlunch =
        sp.getStringList(sharedprefkeysfinal.lunchlist);
    if (finalListlunch != null) {
      lunchList =
          finalListlunch.map((item) => json.decode(item) as String).toList();
      print('Getting Value from SharedPreferences is for launch is $lunchList');
    } else {
      print('No value found in SharedPreferences');
    }

    setState(() {});
  }

  Future<void> storeAndRetrieveListlunchcal() async {
    var sp = await SharedPreferences.getInstance();
    List<String>? lunchcallistofsp =
        sp.getStringList(sharedprefkeysfinal.lunchlistcal);
    if (lunchcallistofsp != null) {
      List<dynamic> decodedList =
          lunchcallistofsp.map((item) => json.decode(item)).toList();
      decodedList.add(lunchListcal.last);
      List<String> updatedList =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.lunchlistcal, updatedList);
      // print(
      // 'Updated list stored in SharedPreferences of breakfast calarirs  is: $updatedList');
    }
    else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrList =
          lunchListcal.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.lunchlistcal, usrList);
      // print('Initial list stored in SharedPreferences: $usrList');
    }
       List<String>? finalList =
        sp.getStringList(sharedprefkeysfinal.lunchlistcal);
    if (finalList != null) {
      lunchListcal =
          finalList.map((item) => json.decode(item) as String).toList();
      print(
          'Getting Value from SharedPreferences of calaries lunch is $lunchListcal');
      print('Getting Value from SharedPreferences is $lunchList');
    } else {
      print('No value found in SharedPreferences');
    }
    setState(() {});
  }

  Future<void> storeAndRetrieveListdinner() async {
    var sp = await SharedPreferences.getInstance();

    List<String>? dinnerfromsharedpref =
        sp.getStringList(sharedprefkeysfinal.dinnerlist);
    if (dinnerfromsharedpref != null) {
      // Decode the stored items into a List<dynamic>
      List<dynamic> decodedList =
          dinnerfromsharedpref.map((item) => json.decode(item)).toList();
      decodedList.add(dinnerList.last);
      List<String> updatedListldinner =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(
          sharedprefkeysfinal.dinnerlist, updatedListldinner);
      print(
          'Updated list stored in SharedPreferences of ldinner  is : $updatedListldinner');
    } else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrListdinner =
          dinnerList.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.dinnerlist, usrListdinner);
      print(
          'Initial list stored in SharedPreferences in dinner: $usrListdinner');
    }
    List<String>? finalListdinner =
        sp.getStringList(sharedprefkeysfinal.dinnerlist);
    if (finalListdinner != null) {
      dinnerList =
          finalListdinner.map((item) => json.decode(item) as String).toList();
      print(
          'Getting Value from SharedPreferences is for dinner is $dinnerList');
    } else {
      print('No value found in SharedPreferences');
    }

    setState(() {});
  }
  
  Future<void> storeAndRetrieveListdinnercal() async {
    var sp = await SharedPreferences.getInstance();
    List<String>? dinnercallistofsp =
        sp.getStringList(sharedprefkeysfinal.dinnerlistcal);
    if (dinnercallistofsp != null) {
      List<dynamic> decodedList =
          dinnercallistofsp.map((item) => json.decode(item)).toList();
      decodedList.add(dinnerlistcal.last);
      List<String> updatedList =
          decodedList.map((item) => json.encode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.dinnerlistcal, updatedList);
      // print(
      // 'Updated list stored in SharedPreferences of breakfast calarirs  is: $updatedList');
    }
    else {
      // If no list exists yet, create a new one with the current breakfastList
      List<String> usrList =
          dinnerlistcal.map((item) => jsonEncode(item)).toList();
      await sp.setStringList(sharedprefkeysfinal.dinnerlistcal, usrList);
      // print('Initial list stored in SharedPreferences: $usrList');
    }
       List<String>? finalList =
        sp.getStringList(sharedprefkeysfinal.dinnerlistcal);
    if (finalList != null) {
     dinnerlistcal =
          finalList.map((item) => json.decode(item) as String).toList();
      print(
          'Getting Value from SharedPreferences of calaries dinner is $dinnerlistcal');
      print('Getting Value from SharedPreferences is $dinnerList');
    } else {
      print('No value found in SharedPreferences');
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    screenwidth = width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        title: Text(
          "Add Meals to your Bucket",
          style: TextStyle(color: Colors.indigo, fontFamily: "FontMain"),
        ),
      ),
      bottomNavigationBar: footer(),
      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildcontent(),
      ),
    );
  }

  Widget _buildcontent() {
    return Stack(
      children: [
        SafeArea(
            child: Column(
          children: [
            Expanded(child: _buildmenuList()),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const deletemeals()),
                  );
                },
                child: _builditemRow()),
          ],
        ))
      ],
    );
  }

  Widget _buildmenuList() {
    return ListView.separated(
      itemCount: _mealsItem.length,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 12,
        );
      },
      itemBuilder: (context, index) {
        final item = _mealsItem[index];
        return _buildMenuItem(mealsitem: item);
      },
    );
  }

  Widget _buildMenuItem({required MealsItems mealsitem}) {
    return LongPressDraggable<MealsItems>(
        data: mealsitem,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        child: MenuListItem(
          foodcalories: mealsitem.calaries,
          foodname: mealsitem.itemname,
          oneitemimageurl: mealsitem.imageurl,
        ),
        feedback: DraggingListItem(
            dragkey: _draggablekey, dragableimageurl: mealsitem.imageurl));
  }

  Widget _builditemRow() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink.shade100, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
        child: Column(
          children: [
            Row(
              children: _mealtype.map(_buildIteamWithDropZone).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIteamWithDropZone(Mealtype mealtype) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DragTarget<MealsItems>(
        builder: (context, candidateData, rejectedData) {
          return MealsCart(
            hasItems: mealtype.mealitem.isNotEmpty,
            highlighted: candidateData.isNotEmpty,
            mealtype: mealtype,
          );
        },
        onAcceptWithDetails: (details) {
          _itemDroppedOnMealsItem(mealsItems: details.data, mealtype: mealtype);
        },
      ),
    ));
  }
}

class MealsCart extends StatelessWidget {
  final Mealtype mealtype;
  final bool highlighted;
  final bool hasItems;

  const MealsCart(
      {super.key,
      required this.mealtype,
      this.highlighted = false,
      this.hasItems = false});
  @override
  Widget build(BuildContext context) {
    final textcolor = highlighted ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Transform.scale(
        scale: highlighted ? 1.075 : 1.0,
        child: Material(
          elevation: highlighted ? 8 : 4,
          borderRadius: BorderRadius.circular(22),
          color: highlighted ? Colors.indigo.shade200 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.asset(
                      mealtype.mealtypeimageurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  mealtype.mealtype,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: textcolor,
                      fontWeight:
                          hasItems ? FontWeight.normal : FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "FontMain"),
                ),
                Visibility(
                  visible: hasItems,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  child: Column(
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        mealtype.formattedtotalcalaries,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: textcolor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${mealtype.mealitem.length} item${mealtype.mealitem.length != 1 ? 's' : ''}',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: textcolor,
                                  fontSize: 15,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mealtype {
  final String mealtype;
  final String mealtypeimageurl;
  final List<MealsItems> mealitem;

  String get formattedtotalcalaries {
    final totalcalaries =
        mealitem.fold(0, (pre, item) => (pre + item.calaries).toInt());
    print(mealtype);
    print(totalcalaries);

    return '${(totalcalaries).toStringAsFixed(0)} Kcal';
  }

  Mealtype(
      {required this.mealtype,
      required this.mealtypeimageurl,
      List<MealsItems>? mealitem})
      : mealitem = mealitem ?? [];
}

class DraggingListItem extends StatelessWidget {
  final GlobalKey dragkey;
  final String dragableimageurl;

  const DraggingListItem(
      {super.key, required this.dragkey, required this.dragableimageurl});
  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragkey,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image.asset(
              dragableimageurl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final String foodname;
  final double foodcalories;
  final String oneitemimageurl;
  final bool isDepressed;

  const MenuListItem(
      {this.foodname = '',
      this.foodcalories = 0.0,
      this.oneitemimageurl = '',
      this.isDepressed = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topLeft: Radius.circular(10),
        topRight: Radius.circular(60),
        bottomRight: Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image.asset(
                      oneitemimageurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodname,
                  style: TextStyle(
                      fontFamily: 'FontMain',
                      color: Colors.black,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${foodcalories} Kcal',
                  style: TextStyle(
                      fontFamily: 'FontMain',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
