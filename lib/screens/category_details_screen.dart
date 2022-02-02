import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/widget_functions.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CategoryDetails extends StatefulWidget {
  final itemData;
  const CategoryDetails({ Key? key, this.itemData }) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  final GlobalKey<SlideActionState> _buttonKey = GlobalKey<SlideActionState>();
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    Widget _buildIconPlusTextWidget(
      {required Icon icon, required String text,
      required Color textColor,
      required bool textBold, required double textSize}) {
      return Row(
        children: [
          icon,
          Text(
            "${text}",
            style: GoogleFonts.cairo(
              fontSize: textSize,
              letterSpacing: .9,
              color: textColor,
              fontWeight: textBold ? FontWeight.bold : null,
            ),
            softWrap: false,
          ),
                  
        ],
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              //First Section
              Container(
                height: screenSize.height * 0.40,
                color: Color(0XFFDBFBD1),
                child: Stack(
                  children: [
                    Center(
                      child: Image(
                        width: (screenSize.height * 0.40) / 2,
                        height: (screenSize.height * 0.40) / 2,
                        image: AssetImage("${IMAGES_ROOT_DIR}/${widget.itemData['image']}")
                      ),
                    ),
      
                    Positioned(
                      top: (screenSize.height * 0.40) / 8,
                      left: (screenSize.height * 0.40) / 24,
                      child: GestureDetector(
                        onTap: () {
                          return Navigator.pop(context);
                        },
                        child: Container(
                          width: (screenSize.height * 0.40) / 7,
                          height: (screenSize.height * 0.40) / 7,
                          decoration: BoxDecoration(
                            color: Color(0xFFFDE8AC),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                
              ),
      
              //Second Section
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.white,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        addVerticalSpace(50.0),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //location
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Name
                                  Text("${widget.itemData['name']}"),
                                  _buildIconPlusTextWidget(
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 22,
                                    ),
                                    text:"${widget.itemData['address']}",
                                    textColor: Colors.black87,
                                    textBold: false,
                                    textSize: 16
                                  ),
                                  
                                ],
                              ),
                            ),
                            
                            //price
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                    "${widget.itemData['price']}",
                                    style: GoogleFonts.cairo(
                                      fontSize: 25,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  
                        addVerticalSpace(20.0),
                        const Divider(
                          height: 5,
                          color: Colors.black,
                        ),
                         addVerticalSpace(20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //rate
                            Text(
                              "${widget.itemData['rate']}",
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                                letterSpacing: .9,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: false,
                            ),
                        
                            //deleivery time
                            _buildIconPlusTextWidget(
                              icon: const Icon(
                                Icons.watch_later,
                                color: Colors.red,
                                size: 22,
                              ),
                              text:"18 Mins",
                              textColor: Colors.black,
                              textBold: true,
                              textSize: 16
                            ),
                        
                            //distance
                            _buildIconPlusTextWidget(
                              icon: const Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 22,
                              ),
                              text:"2.3 KM",
                              textColor: Colors.black,
                              textBold: true,
                              textSize: 16
                            ),
                        
                          ],
                        ),
                        addVerticalSpace(20.0),
                        const Divider(
                          height: 5,
                          color: Colors.black,
                        ),

                        //description
                        addVerticalSpace(20.0),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Overview",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                  ),
                                ),
                                addVerticalSpace(10.0),
                                Text(
                                  "${widget.itemData['description']}",
                                  style: GoogleFonts.cairo(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                  
                      ],
                    ),
                  ),
                )
              ),
      
            ],
          ),
      
          
      
          //Positioned Favorite icon
          Positioned(
            top: MediaQuery.of(context).orientation == Orientation.landscape 
              ? screenSize.width / 2.7 : screenSize.height / 2.7 ,//almost 300.0,
            right: 20.0,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: const Offset(5.0,5.0),
                  blurRadius: 20.0,
                  spreadRadius: 0.0
                  )
                ]
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            )
            
          ),
        
          //Positioned add to cart button
          if (!addedToCart) ...[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.12,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)), color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SlideAction(
                    text: "Add to Cart",
                    key: _buttonKey,
                    sliderButtonIcon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    onSubmit: () {
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          addedToCart = true;
                        });
                      });
                    },
                    sliderRotate: false,
                    borderRadius: 10.0,
                    elevation: 0,
                    innerColor: MAIN_GREEN_COLOR,
                    outerColor: Colors.grey.shade100,
                  ),
                ),
              ),
            )
          ]
            

        ],
      ),
    );
  }
}