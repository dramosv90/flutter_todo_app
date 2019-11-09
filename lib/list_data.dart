import 'package:flutter/cupertino.dart';

class ToDoData {
  String _name;
  bool _checked;
  Key _key;

  ToDoData(this._name) {
    this._checked = false;
    this._key = UniqueKey();
  }

  ToDoData setName(String name) {
    this._name = name;
    return this;
  }

  ToDoData setChecked(bool value) {
    this._checked = value;
    return this;
  }

  get name => this._name;

  get checked => this._checked;

  get key => this._key;
}

class ToDoDataList {
  List<ToDoData> _list;

  ToDoDataList() {
    _list = new List<ToDoData>();
  }

  add(ToDoData item) => _list.add(item);

  List<ToDoData> items() => this._list;

  setChecked(int index, bool value) => _list.elementAt(index).setChecked(value);

  isChecked(int index) => _list.elementAt(index).checked;

  removeAt(int index) => _list.removeAt(index);

  remove(Key key) => _list.removeWhere((item) => item.key.hashCode == key.hashCode);

  toggleChecked(int index) => _list.elementAt(index).setChecked(!_list.elementAt(index).checked);

  clear() => _list.clear();

  get dones => _list.where((item) => item.checked).length;

  get count => _list.length;

  get percent {
    num result = _list.length > 0 ? (this.dones / _list.length * 100) : 0;
    return result.toStringAsFixed(0);
  }
}