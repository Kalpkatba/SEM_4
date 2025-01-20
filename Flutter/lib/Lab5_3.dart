import 'dart:io';

void main() {
  List<String> demo_list = [
    'Delhi',
    'Mumbai',
    'Bangalore',
    'Hyderabad',
    'Ahmedabad'
  ];
  demo_list.replaceRange(4, 5, ['Surat']);
  print(demo_list);
}
