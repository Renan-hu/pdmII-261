class Stack{
  List<int> numeros = [];

  void push(int valor){
    numeros.add(valor);
  }

  void pop(){
    numeros.removeLast();
  }

  void vTop(){
    print(numeros.last);
  }

  void vAll(){
    print(numeros);
  }

}

void main(){
  Stack pilha1 = Stack();
  pilha1.push(10);
  pilha1.push(20);
  pilha1.push(30);
  pilha1.push(40);
  pilha1.vTop();
  pilha1.vAll();

  pilha1.pop();
  pilha1.vAll();
  pilha1.vTop();

  pilha1.push(40);
  pilha1.vAll();
  pilha1.vTop();
}


