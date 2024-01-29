import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Статистика',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

var now = DateTime.now();
var startOfWeek = now.subtract(Duration(days: now.weekday - 1));
var endOfWeek = now.add(Duration(days: 7 - now.weekday));
var formatter = DateFormat('dd.MM.yyyy');

DateTime startOfMonth = DateTime(now.year, now.month, 1);
DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 560,
                height: 150,
                alignment: Alignment.center,
                child: Text('Недельная статистика с ${formatter.format(startOfWeek)} по ${formatter.format(endOfWeek)}', style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 255, 255, 255), fontFamily: "Montserrat", fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 200,
                width: 1000,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(
                            show: false,),
                          lineTouchData: LineTouchData(enabled: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: Color.fromARGB(255, 255, 255, 255)),),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 2500),
                                FlSpot(1, 3500),
                                FlSpot(2, 1500),
                                FlSpot(3, 1000),
                                FlSpot(4, 3000),
                                FlSpot(5, 10000),
                                FlSpot(6, 5000)
                              ],
                              isCurved: true,
                              colors: [Color.fromARGB(255, 0, 51, 255)],
                              barWidth: 5,
                              
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color.fromARGB(255, 24, 28, 255).withOpacity(0.2), Color.fromARGB(255, 0, 58, 144).withOpacity(0.2)],
                                
                              )
                              
                            )
                          ],
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false
                          ),
                          titlesData: FlTitlesData(
                            
                            bottomTitles: SideTitles(
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold ),
                              showTitles: true),
                            leftTitles: SideTitles(
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true,
                              
                              
                              getTitles: (value) {   
                                if (value == 1000 || value == 10000) {
                                  return value.toInt().toString();
                                } else {
                                  return '';
                                }
                              },
                              margin: 25,
                              reservedSize: 30,
                            ),
                          ),
                        ) 
                      )
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 75,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 1000,
                padding: EdgeInsets.all(8),
                
                child: Column(
                  children: [
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(
                            show: false,),
                          lineTouchData: LineTouchData(enabled: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: Color.fromARGB(255, 255, 255, 255)),),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1200),
                                FlSpot(1, 3400),
                                FlSpot(2, 3100),
                                FlSpot(3, 2600),
                                FlSpot(4, 4200),
                                FlSpot(5, 3800),
                                FlSpot(6, 4100)
                              ],
                              isCurved: true,
                              colors: [Color.fromARGB(255, 0, 51, 255)],
                              barWidth: 5,
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color.fromARGB(255, 24, 28, 255).withOpacity(0.2), Color.fromARGB(255, 0, 58, 144).withOpacity(0.2)]
                              )
                            )
                          ],
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              
                              
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true),
                            leftTitles: SideTitles(
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true,
                              getTitles: (value) {
                                if (value == 4200 || value == 1200) {
                                  return value.toInt().toString();
                                } else {
                                  return '';
                                }
                              },
                              margin: 25,
                              reservedSize: 30,
                            
                            ),
                          ),
                        ) 
                      )
                    )
                  ],
                ),
              ),
              Container(
                width: 560,
                height: 150,
                alignment: Alignment.center,
                child: Text('Месячная статистика с ${formatter.format(startOfMonth)} по ${formatter.format(endOfMonth)}', style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 255, 255, 255), fontFamily: "Montserrat", fontWeight: FontWeight.bold,)),
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 1000,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(
                            show: false,),
                          lineTouchData: LineTouchData(enabled: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: Color.fromARGB(255, 255, 255, 255)),),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 2500),
                                FlSpot(1, 3500),
                                FlSpot(2, 1500),
                                FlSpot(3, 1000),
                                FlSpot(4, 3000),
                                FlSpot(5, 10000),
                                FlSpot(6, 5000),
                                FlSpot(7, 2500),
                                FlSpot(8, 3500),
                                FlSpot(9, 1500),
                                FlSpot(10, 1000),
                                FlSpot(11, 3000),
                                FlSpot(12, 10000),
                                FlSpot(13, 5000),
                                FlSpot(14, 2500),
                                FlSpot(15, 3500),
                                FlSpot(16, 1500),
                                FlSpot(17, 1000),
                                FlSpot(18, 3000),
                                FlSpot(19, 10000),
                                FlSpot(20, 5000),
                                FlSpot(21, 2500),
                                FlSpot(22, 3500),
                                FlSpot(23, 1500),
                                FlSpot(24, 1000),
                                FlSpot(25, 3000),
                                FlSpot(26, 10000),
                                FlSpot(27, 5000),
                                FlSpot(28, 2500),
                                FlSpot(29, 3500),
                                FlSpot(30, 1500),
                                FlSpot(31, 1000),
                                
                              ],
                              isCurved: true,
                              colors: [Color.fromARGB(255, 0, 51, 255)],
                              barWidth: 5,
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color.fromARGB(255, 24, 28, 255).withOpacity(0.2), Color.fromARGB(255, 0, 58, 144).withOpacity(0.2)]
                              )
                            )
                          ],
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              
                              
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true),
                            leftTitles: SideTitles(
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true,
                              getTitles: (value) {
                                if (value == 10000 || value == 1000) {
                                  return value.toInt().toString();
                                } else {
                                  return '';
                                }
                              },
                              margin: 25,
                              reservedSize: 30,
                            
                            ),
                          ),
                        ) 
                      )
                    )
                  ],
                ),
              ),
              Container(
                width: 200,
                height: 75,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 1000,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(
                            show: false,),
                          lineTouchData: LineTouchData(enabled: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: Color.fromARGB(255, 255, 255, 255)),),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1200),
                                FlSpot(1, 3400),
                                FlSpot(2, 3100),
                                FlSpot(3, 2600),
                                FlSpot(4, 4200),
                                FlSpot(5, 3800),
                                FlSpot(7, 4100),
                                FlSpot(8, 1200),
                                FlSpot(9, 3400),
                                FlSpot(10, 3100),
                                FlSpot(11, 2600),
                                FlSpot(12, 4200),
                                FlSpot(13, 3800),
                                FlSpot(14, 4100),
                                FlSpot(15, 1200),
                                FlSpot(16, 3400),
                                FlSpot(17, 3100),
                                FlSpot(18, 2600),
                                FlSpot(19, 4200),
                                FlSpot(20, 3800),
                                FlSpot(21, 4100),
                                FlSpot(22, 1200),
                                FlSpot(23, 3400),
                                FlSpot(24, 3100),
                                FlSpot(25, 2600),
                                FlSpot(26, 4200),
                                FlSpot(27, 3800),
                                FlSpot(28, 4100),
                                FlSpot(29, 4100),
                                FlSpot(30, 3100),
                              ],
                              isCurved: true,
                              colors: [Color.fromARGB(255, 0, 51, 255)],
                              barWidth: 5,
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color.fromARGB(255, 24, 28, 255).withOpacity(0.2), Color.fromARGB(255, 0, 58, 144).withOpacity(0.2)]
                              )
                            )
                          ],
                          gridData: FlGridData(
                            drawVerticalLine: false,
                            drawHorizontalLine: false
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              
                              
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true),
                            leftTitles: SideTitles(
                              getTextStyles: (context, value) => TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                              showTitles: true,
                              getTitles: (value) {
                                if (value == 4200 || value == 1200) {
                                  return value.toInt().toString();
                                } else {
                                  return '';
                                }
                              },
                              margin: 25,
                              reservedSize: 30,
                            
                            ),
                          ),
                        ) 
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('', 
                      style: TextStyle(color: Colors.orange, fontSize: 18)
                    ),
                    SizedBox(height: 5),
                    Text('',
                      style: TextStyle(color: Colors.orange, fontSize: 18)
                    ), 
                    SizedBox(height: 5),
                    Text('',
                      style: TextStyle(color: Colors.orange, fontSize: 18)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}