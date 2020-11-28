import 'package:flutter/material.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';

class SelectionRow extends StatefulWidget {

  static String selectedCurrency = 'USD';

  @override
  _SelectionRowState createState() => _SelectionRowState();
}

class _SelectionRowState extends State<SelectionRow> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: SelectionMenu<String>(
          itemSearchMatcher: this.itemSearchMatcher,
          showSelectedItemAsTrigger: true,
          initiallySelectedItemIndex: 0,
          itemsList: ['BTC','TRY','ETH'],
          itemBuilder: this.itemBuilder,
          onItemSelected: (item){
            setState(() {
              SelectionRow.selectedCurrency = item;
              print(item);
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Color(0xFFFEAD34),
        ),
      ),
    );
  }

  static Widget _triggerFromItemBuilder(TriggerFromItemComponentData data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xFFFEAD34),
      ),
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: data.triggerMenu,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Invested Currency Here',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.attach_money,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}