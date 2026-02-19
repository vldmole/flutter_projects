import 'package:flutter/material.dart';

typedef TMenuItem = ({String text, IconData icon});

class DrawerBuilder {
  
  final PageController _pageController;
  final BuildContext _context;
  List<TMenuItem> _items = [];
  String? _header;

  DrawerBuilder(this._context, this._pageController);

  DrawerBuilder addItems(List<TMenuItem> items){

    _items = [..._items, ...items];
    return this;
  }

  DrawerBuilder header(String header){
    _header = header;
    return this;
  }

  Drawer build() {

      return Drawer(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              if( _header != null) (
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Center(
                    child: Text( _header!,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  )
                )
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children:_generateMenuButtons()
                )
              )
            ]
          ),
        ),
      );
    }

  List<Widget> _generateMenuButtons() {

    final int currentPage = _pageController.hasClients ? _pageController.page?.round() ?? 0 : 0;

    return [
      for (int i = 0; i < _items.length; i++)
        ListTile(

          leading: Icon(
            _items[i].icon,
            color: i == currentPage ? Colors.blue : Colors.grey,
          ),
          
          title: Text(
            _items[i].text,
            style: TextStyle(
              fontWeight: ((i == currentPage) ? FontWeight.bold : FontWeight.normal),
              color: ((i == currentPage) ? Colors.blue : Colors.black87),
            ),
          ),
          
          selected: (i == currentPage),
          selectedTileColor: Colors.blue.withValues(alpha: 0.1), 
          
          onTap: () {
            _pageController.jumpToPage(i);
            Navigator.pop(_context);
          },
        ),
    ];
  /*
    return _items.asMap().entries.map((entry) {
    
      int index = entry.key;
      var item = entry.value;

      return ListTile(
        leading: Icon(item.iconData),
        title: Text(item.text),
        onTap: () {
          _pageController.jumpToPage(index); // Usa o índice da lista
          Navigator.pop(_context);
        },
      );
    }).toList();
    */
  }
} 
