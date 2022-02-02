import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/screens/category_details_screen.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/widget_functions.dart';
import 'package:restaurant_app/widgets/search_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _buildCategory({width, height, itemData}) {
    // print("####################");
    // print(width); //411.42857142857144
    // print(height); // 796.5714285714286
    // print("####################");

    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: height / 14, //57.14 
      width: width / 4, //almost 100 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: (width / 4) * 0.7,//70.0
              height: (height / 14) + 13, //70.0
              image: AssetImage(
                "$IMAGES_ROOT_DIR/${itemData['image']}"
              ),
            ),
            addVerticalSpace(15.0),
            Text("${itemData['name']}"),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularFoodItem(
    {screenSize, itemData}) {

    return Container(
      width: screenSize.width * 0.55,
      height: screenSize.height * 0.99,
      // color: Colors.red[200],
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // print("*******************");
          // print(constraints.maxHeight); //302.3428571428571
          // print(constraints.maxWidth); //226.2857142857143
          // print("*******************");
    
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetails(itemData: itemData,),
                ));
            },
            child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(flex: 2, child: Container()),
                      Expanded(
                        flex: 8,
                        child: 
                        Container(//white rectangle container
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          margin: const EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${itemData['name']}",
                                  style: GoogleFonts.cairo(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                        
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 22,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${itemData['address']}",
                                        style: GoogleFonts.cairo(
                                          fontSize: 16,
                                          letterSpacing: .9,
                                          color: Colors.black87,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ),
                        
                                  ],
                                ),
                                
                                addVerticalSpace(15.0),
                        
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${itemData['rate']}",
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                        
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "\$",
                                            style: GoogleFonts.cairo(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${itemData['price']}",
                                          style: GoogleFonts.cairo(
                                            fontSize: 25,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              
                  //positioned image
                  Positioned(
                    top: constraints.maxHeight / 30,//10.0,
                    left: constraints.maxWidth / 7.5,//30.0,
                    child: Image(
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "$IMAGES_ROOT_DIR/${itemData['image']}"
                      ),
                    ),
                  ),
                ],
              ),
          );
        }
      ),
    );  
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MAIN_GREEN_COLOR,
    ));

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [

                //First Section
                Container(
                  height: screenSize.height * 0.40,
                  decoration: const BoxDecoration(
                    color: MAIN_GREEN_COLOR,
                    image: DecorationImage(
                      image: AssetImage("$IMAGES_ROOT_DIR/tree_v.png"),
                      fit: BoxFit.fitHeight
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        addVerticalSpace(40.0),
                        //Image + text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: const Image(
                                width: 60.0,
                                height: 60.0,
                                image: AssetImage("$IMAGES_ROOT_DIR/avatar.png"),
                              ),
                            ),
                            addHorizontalSpace(20.0),
                            Flexible(
                              child: Text(
                                "How Hungary Are You Today?",
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
    
                        //Search Bar
                        addVerticalSpace(25.0),
                        SearchBarWidget(),
                      ],
                    ),
                  ),
                ),

                //Second Section
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 15.0
                    ),
                    color: MAIN_GREY_COLOR,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            addVerticalSpace(70.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Popular Foods",
                                  style: GoogleFonts.cairo(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                          
                                Text(
                                  "View All >",
                                  style: GoogleFonts.cairo(
                                    color: Colors.deepOrange
                                  ),
                                ),
                              ],
                            ),
                          
                            addVerticalSpace(15.0),
                          
                            //Food Items
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: popularFoods.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return _buildPopularFoodItem(
                                    screenSize: screenSize,
                                    itemData: popularFoods[index],
                                  );
                                },
                              ),
                            ),
                          
                          
                          ],
                        ),
                      
                        //categories
                        Positioned(
                          top: -90.0,
                          child: Container(
                            width: constraints.maxWidth,
                            height: 150.0,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: categoriesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildCategory(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                  itemData: categoriesList[index],
                                );
                              }
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              
              ]
            );
          }
        ),

      ),
    );
  }
}



