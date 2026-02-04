// comentario

// todo vez que for programar em Dart, é necessário importar a sua biblioteca
import "dart:io";

// necessita de uma função principal
void main(){
  print("Hello World");
  // STDOUNT - coloca o proximo comando um na frente do anterior
  stdout.write("Ola");
  stdout.write(" Mundo");
  print("");
  // input
  print("\nInsira o seu nome? ");
  String? nome = stdin.readLineSync(); // ? - possibilita da variavel ser nula, caso o usuario não escreva nada
  // para obigar o usuario escrever no input, use ! => String nome = stdin.readLineSync()!;

  print("Ola $nome, digite a sua idade: ");
  int idade = int.parse(stdin.readLineSync()!);
  print("Sua idade é $idade");
}

// para rodar o programa: dart nome-do-arquivo.dart