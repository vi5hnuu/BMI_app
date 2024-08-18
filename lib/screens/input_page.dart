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
      extendBody: true,
      appBar: AppBar(
        title: Text("BMI Calculator".toUpperCase()),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
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
                const Text( "HEIGHT", style: kLabelTextStyle),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("$height", style: kNumberTextStyle),
                    const Text("cm", style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color(0xFFEB1555),
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 15.0
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 30.0
                    )
                  ),
                  child: Slider(
                    onChanged: (double x)=>setState(()=>height=x.toInt()),
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
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress:weight>5 ? ()=>setState(() => weight-=1):null,
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: weight<150 ? ()=>setState(() =>weight+=1):null,
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
                      const Text("AGE",style: kLabelTextStyle),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress:age>5 ? ()=>setState(() => age=age-= 1 ) : null),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: age<100 ? (){
                                setState(() =>age+=1);
                              }:null)
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
              UserBmi calc=UserBmi(height: this.height, weight: this.weight);
              if(selectedGender!=null){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context){
                      return ResultPage(bmiResult: calc.bmi.toStringAsFixed(1),resultText: calc.getWeightInterpretation(bmi: calc.bmi),intrepretation: calc.getInterpretation(bmi: calc.bmi),);
                    }));
              }else{
                Alert(
                  type: AlertType.error,
                  context: this.context,
                  buttons: [
                    DialogButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      color: Colors.cyanAccent,
                      splashColor: Colors.yellowAccent,
                      padding: EdgeInsets.zero,child: const Text( "Retry",style: const TextStyle(color: Colors.blueGrey)),
                    )
                  ],
                  desc: "Please select Your Gender\n(Male/Female)",
                  title: "Gender Not Selected.",
                  style: const AlertStyle(
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


