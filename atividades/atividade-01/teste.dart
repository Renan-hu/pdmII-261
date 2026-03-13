
void main() {
  List <int> lista = [1, 2, 3, 4, 5];
  int i = 0;
  int soma = 0;

  while(i < lista.length){
    soma += lista[i];
    i++;
  }
  print(soma/lista.length);
}