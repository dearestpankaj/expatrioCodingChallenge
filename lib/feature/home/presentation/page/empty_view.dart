import 'package:coding_challenge/feature/tax_detail/presentation/pages/tax_detail_page.dart';
import 'package:coding_challenge/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 0.6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          _bottomGirlImage(),
          Text('Uh-Oh!', style: Theme.of(context).textTheme.titleMedium,),
          Text('We need your tax data in order for you to access your tax account', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,),
          ButtonWidget(text: 'Update Your Tax Data', press: () => {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                builder: (context) => TaxDetailPage())
          }, BackgroundColor: Theme.of(context).primaryColor),
        ],),
      ),
    );
  }

  // Widget _financialInfoDeclaration(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.all(16),
  //     child: Container(
  //       height: MediaQuery.of(context).size.height * 0.7,
  //       decoration: const BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(25.0),
  //           topRight: Radius.circular(25.0),
  //         ),
  //       ),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(16),
  //             child: Text(
  //               "Declaration of financial information",
  //               style: Theme.of(context).textTheme.titleSmall,
  //             ),
  //           ),
  //           TaxDetailPage(),
  //           ButtonWidget(
  //               text: 'SAVE',
  //               press: () {
  //                 Navigator.pop(context);
  //               },
  //               BackgroundColor: Theme.of(context).primaryColor)
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _bottomGirlImage() {
    return SvgPicture.asset(
      'assets/CryingGirl.svg',
      width: 200.0,
      height: 200.0,
    );
  }
}
