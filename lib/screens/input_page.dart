import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:mybmi/calculator_brain.dart';
import 'package:mybmi/components/round_icon_button.dart';
import 'package:mybmi/screens/result_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender{MALE,FEMALE}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=120;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator".toUpperCase()),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child:ReusableCard(
                  color: selectedGender==Gender.MALE ? kActiveCardColor : kInActiveCardColor,
                  cardChild:const IconContent(icon: FontAwesomeIcons.mars,label: "MALE",),
                  onpress: (){
                    setState(() {
                      selectedGender=Gender.MALE;
                    });
                  },
                )
              ),
              Expanded(
                child:ReusableCard(
                  color: selectedGender==Gender.FEMALE?kActiveCardColor:kInActiveCardColor,
              cardChild:const IconContent(icon: FontAwesomeIcons.venus,label: "FEMALE",),
                onpress: (){
                    setState(() {
                      selectedGender=Gender.FEMALE;
                    });
                },),
              ),
            ],
          )),
          Expanded(child:ReusableCard(
            color:kInActiveCardColor,
            onpress: (){},
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "HEIGHT",
                style: kLabelTextStyle,
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                        height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                        "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0xFFEB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30.0
                    )
                  ),
                  child: Slider(
                    onChanged: (double x){
                      setState(() {
                        height=x.toInt();
                      });
                    },
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    divisions: 100,
                    label: height.toString(),
                  ),
                )
              ],
            ),
          ),),
          Expanded(child: Row(
            children: [
              Expanded(
                  child:ReusableCard(
                    color: kInActiveCardColor,
                    onpress: (){},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  if(weight>5)//min weight 5
                                    weight-=1;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  weight+=1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                child:ReusableCard(
                  color: kInActiveCardColor,
                  onpress: (){},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  if(age>5)
                                    age-=1;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  age+=1;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: this.height, weight: this.weight);
              if(selectedGender!=null){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context){
                      return ResultPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),intrepretation: calc.getIntrepretation(),);
                    }));
              }else{
                Alert(
                  type: AlertType.error,
                  context: this.context,
                  buttons: [
                    DialogButton(child: Text(
                        "Retry",
                      style: TextStyle(
                        color: Colors.blueGrey
                      ),
                    ), onPressed: (){
                      Navigator.pop(context);
                    },
                      color: Colors.cyanAccent,
                      splashColor: Colors.yellowAccent,
                      padding: EdgeInsets.zero,
                    )
                  ],
                  desc: "Please select Your Gender\n(Male/Female)",
                  title: "Gender Not Selected.",
                  style: AlertStyle(
                    backgroundColor: Colors.cyan,
                    descStyle: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                    )
                  ),
                ).show();
              }
            },
          ),
        ],
      ),
    );
  }
}


