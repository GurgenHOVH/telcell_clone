import 'package:first_project/helpers/colors.dart';
import 'package:flutter/material.dart';

class OtherServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ծառայություններ',
                style: TextStyle(
                  color: AppColors.appBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'դիտել բոլորը',
                  style: TextStyle(
                    color: AppColors.appBlack,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                otherServicesItem(icon: Icons.attach_money, title: 'Վճարում'),
                otherServicesItem(
                    icon: Icons.compare_arrows_outlined, title: 'Փոխանցում'),
                otherServicesItem(icon: Icons.attach_money, title: 'Տրանսպորտ'),
                otherServicesItem(icon: Icons.attach_money, title: 'Վարկ'),
                otherServicesItem(icon: Icons.attach_money, title: 'Վարկ'),
                otherServicesItem(icon: Icons.attach_money, title: 'Վարկ'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget otherServicesItem({required IconData icon, required String title}) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: AppColors.appLightGrey,
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColors.appOrange,
          ),
          Text(title)
        ],
      ),
    );
  }
}
