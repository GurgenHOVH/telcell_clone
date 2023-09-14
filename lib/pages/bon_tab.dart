import 'package:first_project/helpers/colors.dart';
import 'package:flutter/material.dart';

class BonTab extends StatefulWidget {
  const BonTab({super.key});

  @override
  State<BonTab> createState() => _BonTabState();
}

class _BonTabState extends State<BonTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'BON',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.appBlack,
            ),
          ),
        ),
        centerTitle: true,
        title: appBarTitle(),
        bottom: filters([
          {
            'icon': Icons.maps_home_work_outlined,
            'label': 'Մարկեթ',
          },
          {
            'icon': Icons.access_time_filled_rounded,
            'label': 'Մարկեթ',
          },
          {
            'icon': Icons.wrong_location_rounded,
            'label': 'Մարկեթ',
          },
          {
            'icon': Icons.water_damage_rounded,
            'label': 'Մարկեթ',
          },
        ]),
      ),
      body: body(),
    );
  }

  Widget appBarTitle() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '5000',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.appBlack,
              ),
            ),
            Icon(
              Icons.currency_bitcoin,
              color: AppColors.appOrange,
              size: 25,
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Մինչեւ 30 սեպ 2023',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.appBlack.withAlpha(100),
              ),
            ),
            Icon(
              Icons.info_outline,
              color: AppColors.appOrange,
              size: 13,
            )
          ],
        )
      ],
    );
  }

  Widget body() {
    return itemList();
  }

  PreferredSizeWidget filters(List<Map<String, dynamic>> data) {
    return PreferredSize(
      preferredSize: const Size(200, 60),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.appLightGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              icon: Icon(
                data[0]['icon'],
                color: AppColors.appOrange,
              ),
              label: Text(
                data[0]['label'],
                style: TextStyle(color: AppColors.appBlack),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }

  Widget itemList() {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return itemTile();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 20);
  }

  Widget itemTile() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      'https://i.ebayimg.com/images/g/EaEAAOSwDPFjsaRr/s-l1200.webp',
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '01 սեպ - 30 սեպ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appBlack.withAlpha(200),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                    height: 25,
                    width: 25,
                    child: Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.appOrange,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Թարմացնող Սուրչ, coffee Թարմացնող Սուրչ, coffee',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlack,
                    ),
                  ),
                  Text(
                    'Coffee House',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlack.withAlpha(200),
                    ),
                  ),
                  Text(
                    'Թարմացնող Սուրչ, coffee Սուրչ, coffee, Սուրչ, coffee Թարմացնող Սուրչ, coffee',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBlack.withAlpha(200),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 10,
                      color: AppColors.appOrange,
                      backgroundColor: AppColors.appLightGrey,
                    ),
                  ),
                ],
              ),
              // color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
