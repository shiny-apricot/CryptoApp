import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selection_menu/selection_menu.dart';
import 'package:selection_menu/components_configurations.dart';

class AddInvestment extends StatefulWidget {
  @override
  _AddInvestmentState createState() => _AddInvestmentState();
}

class _AddInvestmentState extends State<AddInvestment> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Investment'),
          backgroundColor: Color(0xFF002B32),
          toolbarHeight: 70.0,
        ),
        body: SafeArea(
          child: Container(
            color: Color(0xFF003942),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Column(
              children: [
                SelectionRow(),
                Expanded(
                  flex: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0x28D3D3D3),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(7, 0, 0, 5),
                            child: Text(
                              'Invested Count',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[200]
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xFF002B32),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                                hintText: "Count",
                                hintStyle: TextStyle(
                                  color: Color(0x60FFFFFF)
                                ),
                                suffixText: 'TRY',
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0x28D3D3D3),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    )
                ),
                Expanded(
                  flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0x28D3D3D3),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectionRow extends StatefulWidget {
  @override
  _SelectionRowState createState() => _SelectionRowState();
}

class _SelectionRowState extends State<SelectionRow> {

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 3,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: SelectionMenu<String>(
              itemSearchMatcher: this.itemSearchMatcher,
              showSelectedItemAsTrigger: true,
              initiallySelectedItemIndex: 0,
              itemsList: ['BTC','TRY','ETH'],
              itemBuilder: this.itemBuilder,
              onItemSelected: (item){
                setState(() {

                });
              },

              componentsConfiguration: DialogComponentsConfiguration<String>().copyWith(
                searchFieldComponent:
                  SearchFieldComponent(builder: _searchFieldBuilder),

                searchBarComponent:
                  SearchBarComponent(builder: _searchBarBuilder),

                searchingIndicatorComponent:
                  SearchingIndicatorComponent(builder: _searchingIndicatorBuilder),

                triggerComponent:
                  TriggerComponent(builder: _triggerBuilder),
                triggerFromItemComponent:
                  TriggerFromItemComponent(builder: _triggerFromItemBuilder),

                menuAnimationDurations: MenuAnimationDurations(
                    forward: const Duration(milliseconds: 500),
                    reverse: const Duration(milliseconds: 500)
                ),
                animationComponent: DropdownAnimationComponent(),
              ),
            )
        )
    );
  }

  bool itemSearchMatcher(String searchString, String currency) {
    return currency.toLowerCase().contains(searchString.trim().toLowerCase());
  }

  Widget itemBuilder(BuildContext context, String item, OnItemTapped onItemTapped)
  {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onItemTapped,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item)
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchFieldBuilder(SearchFieldComponentData data){
    return TextField(
      controller: data.searchTextController,
      decoration: InputDecoration(
        hintText: "Search Currency...",
        border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
      ),
    );
  }

  Widget _searchBarBuilder(SearchBarComponentData data) {
      List<Widget> list = [];
      list.add(Flexible(
        child: data.searchField,
        flex: data.menuFlexValues.searchField
      ));

      if (data.isSearching)
        list.add(Flexible(
          child: data.searchingIndicator,
          flex: data.menuFlexValues.searchingIndicator,
        ));
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      );
  }

  Widget _searchingIndicatorBuilder(
      SearchingIndicatorComponentData data) {
    return Text("Searching...");
  }

  static Widget _triggerBuilder(TriggerComponentData data) {
    return RaisedButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: data.triggerMenu,
      color: Colors.red,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFFFEAD34),
        ),
      ),
    );
  }

  static Widget _triggerFromItemBuilder(TriggerFromItemComponentData data) {
    return Container(

      child: RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: data.triggerMenu,
        color: Color(0xFFFEAD34),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Invested Currency',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Icon(Icons.money),
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}


