import 'package:flutter/material.dart';
List<MealsItems> _mealsItem = [
  MealsItems(
      itemname: 'Avacado',
      calaries: 240,
      uid: '1',
      imageurl: 'assets/meals/avocado.png'),
  MealsItems(
      itemname: 'bread',
      calaries: 265,
      uid: '2',
      imageurl: 'assets/meals/bread.png'),
  MealsItems(
      itemname: 'butter',
      calaries: 717,
      uid: '3',
      imageurl: 'assets/meals/butter.png'),
];

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildcontent(),
    );
  }

  Widget _buildcontent() {
    return Stack(
      children: [
        SafeArea(
            child: Column(
          children: [
            Expanded(child: _buildmenuList()),
            _builditemRow(),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Row(
          children: _mealtype.map(_buildIteamWithDropZone).toList(),
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
    final textcolor = highlighted ? Colors.black : Colors.black;
    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8 : 4,
        borderRadius: BorderRadius.circular(22),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 46,
                  height: 46,
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
                    ),
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${mealtype.mealitem.length} item${mealtype.mealitem.length != 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: textcolor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              )
            ],
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
        print(totalcalaries);
    return 'cal${(totalcalaries).toStringAsFixed(2)}';
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
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 120,
                height: 120,
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
                  '${foodcalories}',
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
