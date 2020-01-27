//
//    7 numbers
//    3
//    5
//    2
//    1
//    4
//    6
//    7
//    BST
//     3
//    / \
//    2  5
//   /   /\
//   1  4  6
//          \
//           7
//

void test() {
  Node root;
  var list = [3,5,2,1,4,6,7];
  for (var data in list) {
    root= insert(root,data);
  }
  var height = getHeight(root);
  print(height); // height == 3
}

/// recursive way for BST height
int getHeight(Node root){
  var leftHeight = 0;
  var rightHeight = 0;
  //Write your code here
  if (root == null || (root.left == null && root.right == null)) {
    return 0;
  } else {
    if (root.left != null) {
      leftHeight = getHeight(root.left) + 1;
    }
    if (root.right != null) {
      rightHeight = getHeight(root.right) + 1;
    }
  }
  return (leftHeight > rightHeight) ? leftHeight : rightHeight ;
}

class Node {
  Node left, right;
  int data;

  Node(int data) {
    this.data = data;
    left = right = null;
  }
}

Node insert(Node root,int data){
  if(root==null){
    return new Node(data);
  }
  else{
    Node cur;
    if(data<=root.data){
      cur=insert(root.left,data);
      root.left=cur;
    }
    else{
      cur=insert(root.right,data);
      root.right=cur;
    }
    return root;
  }
}
