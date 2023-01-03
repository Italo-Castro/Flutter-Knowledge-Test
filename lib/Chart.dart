import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barbosa Mello Construtora ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontStyle: FontStyle.italic, fontSize: 22),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(borderColor: Colors.red),
        // Chart title
        title: ChartTitle(text: 'Previsto X Realizado'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true, elevation: 12),
        series: <ChartSeries<_Infections, String>>[
          LineSeries<_Infections, String>(
            animationDelay: 1,
            enableTooltip: true,
            width: 5,
            legendItemText: 'Previsto ',
            name: 'Previsto',
            xValueMapper: (_Infections victims, _) => victims.year,
            yValueMapper: (_Infections victims, _) => victims.victims,
            dataSource: <_Infections>[
              _Infections('ago/22', 95222.00),
              _Infections('set/22', 101360.00),
              _Infections('ou/22', 84157.00),
              _Infections('nov/22', 35954.00),
            ],
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.blue),
          ),
          LineSeries<_Infections, String>(
            xValueMapper: (_Infections victims, _) => victims.year,
            yValueMapper: (_Infections victims, _) => victims.victims,
            color: Colors.orangeAccent,
            enableTooltip: true,
            width: 5,
            animationDuration: 1,
            legendItemText: 'Realizado',
            name: 'Realizado',
            dataSource: <_Infections>[
              _Infections('ago/22', 79640.00),
              _Infections('ago/22', 79640.00),
              _Infections('set/22', 75074.00),
              _Infections('ou/22', 74118.00),
              _Infections('nov/22', 25723.06),
            ],
            // Enable data label
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.orangeAccent),
          ),
        ],
      ),
    );
  }
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
