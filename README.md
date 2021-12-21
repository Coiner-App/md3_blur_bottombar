# md3_blur_bottombar

!!! This is a fork of https://github.com/DonsWayo/blur_bottom_bar !!!

NavigationBar widget with blur behind

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  md3_blur_bottombar: ^1.0.1
```

## Basic Usage


```dart
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Account(),
  ];

  static const List<NavigationDestination> _navItems = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      label: 'Search',
    ),
    NavigationDestination(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Account',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blur bar example")),
      body: Stack(
        children: <Widget>[
          _widgetOptions[_selectedIndex],
          MD3BlurBottomView(
            onIndexChange: (index) => _onItemTapped(index),
            selectedIndex: _selectedIndex,
            bottomNavigationBarItems: _navItems,
          ),
        ],
      ),
    );
  }
```
