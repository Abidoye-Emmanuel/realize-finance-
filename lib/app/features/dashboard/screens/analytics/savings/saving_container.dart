import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_outline_button.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/features/dashboard/models/account_model.dart';
import 'package:realize_mobile_app/app/features/dashboard/models/currency_model.dart';
import 'package:realize_mobile_app/app/widgets/buttons/outline_button_with_image.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/savings/circles_tab.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/savings/overview_tab.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/savings/safe_pots_tab.dart';

class SavingContainer extends StatefulWidget {
  const SavingContainer({Key? key}) : super(key: key);

  @override
  _SavingContainerState createState() => _SavingContainerState();
}

class _SavingContainerState extends State<SavingContainer> {
  @override
  Widget build(BuildContext context) {
    // Calculate the horizontal padding to match the "Savings" title padding.
    const horizontalTitlePadding = 16.0;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: BackWithTextHeader(
                text: '',
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalTitlePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Savings',
                    style: TextStyle(
                      color: AppColors.primaryBlackColor2,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 70% of screen width
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TabBar(
                      labelColor: AppColors.primaryBlackColor2,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.primaryBlackColor2,
                            width: 2.0,
                          ),
                        ),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                      labelPadding: EdgeInsets.only(
                        left: 0,
                        right: horizontalTitlePadding,
                      ), // Add padding here
                      indicatorPadding: EdgeInsets.only(
                        left: 0,
                        right: horizontalTitlePadding,
                      ), // Adjust indicator padding
                      indicatorSize: TabBarIndicatorSize
                          .tab, // Make the indicator full width
                      tabs: [
                        Tab(
                          text: 'Overview',
                        ),
                        Tab(text: 'Safe pots'),
                        Tab(text: 'Circles'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SvgOutlinedTextButton(
                      text: 'Select account/card',
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            // Define the list of currencies within the builder method
                            List<Currency> currencies = [
                              Currency(
                                  name: 'USD',
                                  imagePath: 'assets/bank/usa.png',
                                  accounts: [
                                    Account(
                                      name: 'CHASE US',
                                      imagePath: 'assets/bank/chase.png',
                                    )
                                  ]),
                              Currency(
                                  name: 'CAD',
                                  imagePath: 'assets/bank/canada.png',
                                  accounts: [
                                    Account(
                                      name: 'HSBC',
                                      imagePath: 'assets/bank/hsbc_cad.png',
                                    )
                                  ]),
                              Currency(
                                  name: 'EUR',
                                  imagePath: 'assets/bank/euro.png',
                                  accounts: [
                                    Account(
                                      name: 'HSBC',
                                      imagePath: 'assets/bank/hsbc_euro.png',
                                    ),
                                    Account(
                                      name: 'MONZO',
                                      imagePath: 'assets/bank/monzo.png',
                                    ),
                                    Account(
                                      name: 'GTB',
                                      imagePath: 'assets/bank/gtb.png',
                                    ),
                                    Account(
                                      name: 'WEMA',
                                      imagePath: 'assets/bank/wema.png',
                                    )
                                  ]),
                              // ... other currencies and accounts
                            ];

                            // Define the countSelected method within the builder method
                            int countSelected() {
                              return currencies.fold(
                                  0,
                                  (previousValue, element) =>
                                      previousValue +
                                      element.accounts
                                          .where(
                                              (account) => account.isSelected)
                                          .length);
                            }

                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'My accounts',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Montserrat"),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: AppColors
                                              .primaryPurpleColorLight6,
                                          thickness: 1,
                                        ),
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                'assets/bank/worldwide.png',
                                                width: 32,
                                                height: 32,
                                              ), // Account icon
                                              const SizedBox(width: 10),
                                              const Text("ALL",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColors
                                                          .primaryBlackColor,
                                                      fontFamily:
                                                          "Montserrat")),
                                            ],
                                          ),
                                          trailing: Checkbox(
                                            value: currencies.every(
                                                (currency) => currency.accounts
                                                    .every((account) =>
                                                        account.isSelected)),
                                            checkColor: Colors.white,
                                            activeColor:
                                                AppColors.primaryPurpleColor1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                // Iterate through each currency and its accounts to update their isSelected status
                                                for (var currency
                                                    in currencies) {
                                                  for (var account
                                                      in currency.accounts) {
                                                    account.isSelected = value ??
                                                        false; // Set isSelected to the value passed or false if null
                                                  }
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          color: AppColors
                                              .primaryPurpleColorLight6,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          child: ListView(
                                            children: currencies
                                                .expand((Currency currency) {
                                              // Create a list to hold the widgets for this currency
                                              List<Widget> items = [];

                                              // Add the ListTile for the currency itself
                                              items.add(ListTile(
                                                title: Row(
                                                  children: [
                                                    Image.asset(
                                                      currency.imagePath,
                                                      width: 28,
                                                      height: 28,
                                                    ), // Account icon
                                                    const SizedBox(width: 10),
                                                    Text(currency.name,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .primaryBlackColor,
                                                            fontFamily:
                                                                "Montserrat")),
                                                  ],
                                                ),
                                                trailing: Checkbox(
                                                  checkColor: Colors.white,
                                                  activeColor: AppColors
                                                      .primaryPurpleColor1,
                                                  value: currency.accounts
                                                      .every((account) =>
                                                          account.isSelected),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      for (var account in currency.accounts) {
                                                        account.isSelected =
                                                            value!;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ));

                                              // Then, add the list of CheckboxListTiles for each account
                                              items.addAll(currency.accounts
                                                  .map((account) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(16.0, 0, 0,
                                                      0), // Add horizontal padding
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 4.0),
                                                    child: CheckboxListTile(
                                                      title: Row(
                                                        children: [
                                                          Image.asset(
                                                            account.imagePath,
                                                            width: 28,
                                                            height: 28,
                                                          ), // Account icon
                                                          const SizedBox(
                                                              width: 10),
                                                          Text(account.name,
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .primaryGrayColor3,
                                                                  fontFamily:
                                                                      "Montserrat")),
                                                        ],
                                                      ),
                                                      checkColor: Colors.white,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                      value: account.isSelected,
                                                      activeColor: AppColors
                                                          .primaryPurpleColor1,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          account.isSelected =
                                                              value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }));

                                              // Add a divider after the last account
                                              items.add(
                                                const Divider(
                                                  color: AppColors
                                                      .primaryPurpleColorLight6,
                                                  thickness: 1,
                                                ),
                                              );

                                              return items; // Return the list of items
                                            }).toList(),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right:
                                                        8.0), // Add some spacing between the buttons
                                                child: PurpleOutlineButton(
                                                  fontSize: 16,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical:
                                                          13.0), // Changed here
                                                  text:
                                                      'Reset(${countSelected()})',
                                                  onPressed: () {
                                                    // Implement the logic to reset selections
                                                    setState(() {
                                                      for (var currency
                                                          in currencies) {
                                                        for (var account
                                                            in currency
                                                                .accounts) {
                                                          account.isSelected =
                                                              false;
                                                        }
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left:
                                                        4.0), // Add some spacing between the buttons
                                                child: PurpleGradientButton(
                                                  fontSize: 16,
                                                  text: 'Apply',
                                                  onPressed: () {
                                                    // Implement the logic to apply selections
                                                    // This might involve saving the state, sending it to a server, etc.
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      svgPath: 'assets/icons/down.svg'),
                  const SizedBox(width: 8),
                  SvgOutlinedTextButton(
                      text: 'Date',
                      onPressed: () {},
                      svgPath: 'assets/icons/date.svg'),
                  const SizedBox(width: 8),
                  SvgOutlinedTextButton(
                      text: 'Filter',
                      onPressed: () {},
                      svgPath: 'assets/icons/filter.svg')
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryPurpleColorLight6,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  OverviewTab(),
                  SafePotsTab(),
                  CirclesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
