
List<int> a = [3,2,1];
int swapTimes = 0;

void test() {
  bubbleSort(a);
}

void bubbleSort(List<int> a) {
  print(a);

  var current = 0;
  var length = a.length;

  while (current < length) {

    while (current > 0 && (a[current] < a[current-1])) {
      swap(current-1, current, a);
      current--;
    }
    current++;
  }

  print('Array is sorted in $swapTimes swaps.');
  print('First Element: ${a[0]}');
  print('Last Element: ${a[a.length-1]}');
}

void swap(int i, int j, List<int> a) {

  swapTimes++;
  var x = a[i];
  a[i] = a[j];
  a[j] = x;

  print(a);
}