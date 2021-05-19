import 'package:KitchenKing/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  Function saveFilters;

  final Map<String, bool> current;
  FiltersScreen(this.current, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

Widget _builSwitch(
    String title, String description, bool current, Function update) {
  return SwitchListTile(
    title: Text(title),
    subtitle: Text(description),
    value: current,
    onChanged: update,
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.current['gluten'];
    _vegeterian = widget.current['vegeterian'];
    _vegan = widget.current['vegan'];
    _lactoseFree = widget.current['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selected = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(_selected);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('add filters to your meal'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _builSwitch(
                    'GlutenFree', 'Only inclue GlutenFree meals ', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _builSwitch('Vegan', 'Only inclue Vegan meals ', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _builSwitch(
                    'Vegeterian', 'Only inclue vegeterain meals ', _vegeterian,
                    (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                }),
                _builSwitch('LactoseFree', 'Only inclue LactoseFree meals ',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
