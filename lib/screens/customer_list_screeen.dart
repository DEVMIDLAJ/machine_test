import 'package:flutter/material.dart';
import 'package:machin_test/const/colors.dart';
import 'package:machin_test/model/customer_model.dart';
import 'package:machin_test/services/api_services.dart';
import 'package:machin_test/widgets/display_text.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  // Controller for search field
  TextEditingController searchController = TextEditingController();
  // Future for storing customer data
  late Future<CustomerModel> _customerData;

  @override
  void initState() {
    super.initState();
    // Fetching customer data from API on widget initialization
    _customerData = ApiServices().fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    // Getting screen size
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // Setting background color
      backgroundColor: kbackground,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kbackground,
        // Back button
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
          ),
        ),
        title: const DisplayText(
          // Title widget
          title: 'Customers',
          textColor: kwhite,
          textSize: 18,
          textFont: FontWeight.w600,
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        // Body container decoration
        decoration: const BoxDecoration(
          color: kbodyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    // Search field
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: kgrey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.purple,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: Image(
                      image: AssetImage(
                        "assets/icon1.png",
                      ),
                      fit: BoxFit.cover,
                    ), // Icon widget
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: FutureBuilder<CustomerModel>(
                  future: _customerData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ); // Show loading indicator while fetching data
                    } else if (snapshot.hasError) {
                      return Center(
                        child: DisplayText(
                          title: 'Error: ${snapshot.error}',
                        ),
                      ); // Show error message if API call fails
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.data!.data!.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: size.height * 0.02,
                                );
                              },
                              itemBuilder: (context, index) {
                                // Building list item widget
                                Color cardBackgroundColor;
                                switch (index % 3) {
                                  case 0:
                                    cardBackgroundColor = kgreen;
                                    break;
                                  case 1:
                                    cardBackgroundColor = kred;
                                    break;
                                  case 2:
                                  default:
                                    cardBackgroundColor = korange;
                                    break;
                                }

                                return Container(
                                  height: size.height * 0.17,
                                  width: size.width,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // CircleAvatar widget
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: cardBackgroundColor,
                                          child: DisplayText(
                                              title: snapshot
                                                      .data!
                                                      .data!
                                                      .data![index]
                                                      .name!
                                                      .isNotEmpty
                                                  ? snapshot.data!.data!
                                                      .data![index].name![0]
                                                      .toUpperCase()
                                                  : '',
                                              textColor: kwhite),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Display customer name
                                                DisplayText(
                                                  title:
                                                      "${snapshot.data!.data!.data![index].name.toString()}",
                                                  textSize: 18,
                                                  textFont: FontWeight.bold,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  // ElevatedButton widget
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                        primary:
                                                            cardBackgroundColor),
                                                    child: DisplayText(
                                                        title:
                                                            "${snapshot.data!.data!.data![index].status.toString()}",
                                                        textColor: kwhite),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Display area name
                                            DisplayText(
                                              title:
                                                  "${snapshot.data!.data!.data![index].areaName.toString()}",
                                              textSize: 13,
                                            ),
                                            // Display address
                                            DisplayText(
                                              title:
                                                  "${snapshot.data!.data!.data![index].address.toString()}",
                                              textSize: 13,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.006,
                                            ),
                                            Row(
                                              children: [
                                                // Display customer ID
                                                DisplayText(
                                                  title:
                                                      "ID: ${"${snapshot.data!.data!.data![index].id.toString()}"}",
                                                  textSize: 13,
                                                  textColor:
                                                      const Color.fromARGB(
                                                          255, 24, 24, 99),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.25,
                                                ),
                                                // Display LCO number
                                                DisplayText(
                                                    title:
                                                        "LCO# ${"${snapshot.data!.data!.data![index].lcoNo.toString()}"}",
                                                    textSize: 13,
                                                    textColor: kbackground),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
