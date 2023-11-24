import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme/provider/theme_provider.dart';
import '../provider/counter_provider.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(
              (Provider.of<ThemeProvider>(context, listen: false)
                          .theme
                          .isDark ==
                      true)
                  ? Icons.sunny
                  : Icons.dark_mode_rounded,
            ),
          ),
        ],
        title: Text("homepage"),
        centerTitle: true,
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (context, CounterProvider, _) => FloatingActionButton(
          onPressed: () {
            CounterProvider.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Center(
        child: Container(
          height: h * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://stories.freepiklabs.com/api/vectors/no-data/rafiki/render?color=&background=complete&hide=',
              ),
            ),
          ),
          child: Consumer<CounterProvider>(
            builder:
                (BuildContext context, CounterProvider counterProvider, _) {
              return Center(
                child: Text(
                  '${counterProvider.counter.count}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              );
            },
            // child: Text(
            //   "${Provider.of<CounterProvider>(context, listen: false).counter.count}",

            // ),
          ),
        ),
      ),
    );
  }
}
