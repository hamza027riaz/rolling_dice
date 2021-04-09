import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class UI extends StatefulWidget {
  @override
  _UI createState() => _UI();
}

class _UI extends State<UI>
    with SingleTickerProviderStateMixin {

  int dice_number1 = 1;
  int dice_number2 = 1;
  int dice_number3 = 1;
  int dice_number4 = 1;
  int sum1 = 0;
  int sum2 = 0;
  int sum3 = 0;
  int sum4 = 0;
  int click = 0;
  int  click4 = 0;
  int flag=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who Can Beat App'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
                  child: Text(
                    "Total Clicks: 10",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      letterSpacing: 0.8,
                      height: 1,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.only(right: 50.0, top: 30.0, left: 20.0),
                      child: Column(
                        children: [
                          Text(
                            '$sum1',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          FlatButton(
                            child: Image.asset(
                                'assets/images/dice$dice_number1.png'),
                            onPressed: () {
                              updatedice1();
                               },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 50.0, top: 30.0, right: 20.0),
                      child: Column(
                        children: [
                          Text(
                            '$sum2',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          FlatButton(
                            child: Image.asset(
                                'assets/images/dice$dice_number2.png'),
                            onPressed: () {
                              updatedice2();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100.0,
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 50.0, top: 30.0, left: 20.0, bottom: 40.0),
                      child: Column(
                        children: [
                          Text(
                            '$sum3',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          FlatButton(
                            child: Image.asset(
                                'assets/images/dice$dice_number3.png'),
                            onPressed: () {
                              updatedice3();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 50.0, top: 30.0, right: 20.0, bottom: 40.0),
                      child: Column(
                        children: [
                          Text(
                            '$sum4',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          FlatButton(
                            child: Image.asset(
                                'assets/images/dice$dice_number4.png'),
                            onPressed: () {
                              updatedice4();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setresultstate();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updatedice1() {
    setState(() {

      if(flag==0)
        {

          dice_number1 = Random().nextInt(6) + 1;
          sum1 = sum1 + dice_number1;
          if (dice_number1 == 6) {
            click--;
          }
          click++;
          flag=1;
          if(flag==1)
            {
              UI();
            }


        }


    });
  }

  void updatedice2() {
    setState(() {

      if(flag==1)
      {

        dice_number2 = Random().nextInt(6) + 1;
        sum2 = sum2 + dice_number2;
        if (dice_number2 == 6) {
          click--;
        }
        click++;
        flag=2;
        if(flag==2)
        {
          UI();
        }


      }


    });
  }

  void updatedice3() {
    setState(() {

      if(flag==2)
      {

        dice_number3 = Random().nextInt(6) + 1;
        sum3 = sum3 + dice_number3;
        if (dice_number3 == 6) {
          click--;
        }
        click++;
        flag=3;
        if(flag==3)
        {
          UI();
        }


      }


    });
  }

  void updatedice4() {
    setState(() {
      if(flag==3)
      {

        dice_number4 = Random().nextInt(6) + 1;
        sum4 = sum4 + dice_number4;
        if (dice_number4 == 6) {
          click--;
        }
        click++;
        flag=4;
        if(flag==4)
        {
          UI();
        }


      }


    });
  }

  void sumresult() {
    if (click4 == 10) {
      if (sum1 > sum2 && sum1 > sum3 && sum1 > sum4) {
        showResultDialog('1st Player Wins');
      } else if (sum2 > sum3 && sum2 > sum4 && sum2 > sum1) {
        showResultDialog('2nd Player Wins');
      } else if (sum3 > sum1 && sum3 > sum1 && sum3 > sum4) {
        showResultDialog('3rd Player Wins');
      } else if (sum4 > sum1 && sum4 > sum2 && sum4 > sum3) {
        showResultDialog('4th Player Wins');
      }
    }
  }

  void showResultDialog(String playerName) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations !!!'),
            content: Text(
              playerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontSize: 23.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setresultstate();
                },
              )
            ],
          );
        });
  }

  void setresultstate() {
    setState(() {
      dice_number1 = 1;
      dice_number2 = 1;
      dice_number3 = 1;
      dice_number4 = 1;
      sum1 = 0;
      sum2 = 0;
      sum3 = 0;
      sum4 = 0;
    });
  }
}
