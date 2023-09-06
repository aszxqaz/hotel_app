import 'dart:math';

const maxInt32 = 0x7fffffff;

String generateId() {
  return Random().nextInt(maxInt32).toRadixString(36);
}
