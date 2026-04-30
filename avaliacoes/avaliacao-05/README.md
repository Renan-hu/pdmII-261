# 1. INTRODUÇÃO

A linguagem é um dos principais instrumentos de construção do conhecimento humano. O filósofo Ludwig Wittgenstein propôs uma nova forma de compreender a linguagem por meio do conceito de **Jogos de Linguagem**, destacando que o significado das palavras está diretamente relacionado ao seu uso em contextos específicos.

Este trabalho tem como objetivo apresentar o conceito de Jogos de Linguagem, discutir sua aplicação no ensino e exemplificar seu uso no contexto da Programação Orientada a Objetos (POO).



# 2. CONCEITO DE JOGOS DE LINGUAGEM

O conceito de Jogos de Linguagem foi desenvolvido por Wittgenstein em sua obra *Investigações Filosóficas*. Segundo o autor, a linguagem não possui significados fixos e universais; ao contrário, seu sentido depende do contexto em que é utilizada.

Assim, falar uma língua é semelhante a participar de um jogo, no qual existem regras que orientam o uso das palavras. Essas regras não são necessariamente explícitas, mas são aprendidas socialmente.

Os Jogos de Linguagem apresentam algumas características principais:

* O significado das palavras depende do uso;
* A linguagem está ligada às práticas sociais;
* Diferentes áreas possuem diferentes formas de uso da linguagem;
* A compreensão ocorre dentro de um contexto específico.

Dessa forma, uma mesma palavra pode ter diferentes significados dependendo do “jogo” em que está inserida.



# 3. JOGOS DE LINGUAGEM NO ENSINO

No contexto educacional, o conceito de Jogos de Linguagem contribui para uma abordagem mais prática e contextualizada do aprendizado. Em vez de focar apenas na memorização de definições, o ensino passa a valorizar o uso efetivo dos conceitos.

Essa perspectiva pedagógica incentiva:

* A aprendizagem baseada em situações reais;
* A participação ativa dos alunos;
* A construção do conhecimento por meio da prática;
* O desenvolvimento da comunicação e interpretação.

Por exemplo, ao ensinar um conceito como “objeto” em programação, o professor não deve apenas apresentar sua definição teórica, mas também propor atividades em que o aluno utilize esse conceito na prática, compreendendo seu funcionamento dentro de um sistema.

Assim, o aprendizado ocorre pela inserção do estudante no “jogo” específico daquela área do conhecimento.



# 4. EXEMPLO DE JOGO DE LINGUAGEM NA PROGRAMAÇÃO ORIENTADA A OBJETOS

Na Programação Orientada a Objetos, diversos termos técnicos fazem parte de um jogo de linguagem próprio da área, como “classe”, “objeto”, “herança” e “método”.

### 4.1 Exemplo prático

Considere o seguinte exemplo em linguagem semelhante ao Java:

```java
class Veiculo {
    String modelo;

    void mover() {
        System.out.println("O veículo está se movendo");
    }
}

class Carro extends Veiculo {
    void mover() {
        System.out.println("O carro está dirigindo");
    }
}
```

### 4.2 Interpretação

Nesse contexto:

* “Classe” representa uma estrutura que define propriedades e comportamentos;
* “Herança” indica que uma classe pode reutilizar características de outra;
* “Método” define ações que os objetos podem executar;
* “Objeto” é a instância concreta dessas definições.

O significado desses termos só é compreendido dentro do contexto da programação, caracterizando um jogo de linguagem específico.



# 5. EVIDÊNCIAS

### 5.1 Texto explicativo

Os Jogos de Linguagem demonstram que o significado das palavras está diretamente ligado ao seu uso em práticas sociais. No ensino, essa abordagem favorece metodologias ativas, nas quais o aluno aprende por meio da aplicação prática dos conceitos. Na programação, essa ideia é evidente, pois os conceitos só fazem sentido quando utilizados na construção de sistemas reais.



### 5.2 Documentação de um Jogo de Linguagem (POO)

**Nome do Jogo:** Modelagem de Veículos em Programação Orientada a Objetos

**Objetivo:**
Compreender e aplicar os conceitos de classe, objeto e herança.

**Regras:**

1. Toda entidade deve ser representada por uma classe;
2. Classes podem herdar características de outras classes;
3. Métodos representam comportamentos;
4. Objetos são instâncias das classes criadas.

**Contexto:**
Ambiente de desenvolvimento de software utilizando Programação Orientada a Objetos.

**Aplicação:**

* Criar uma classe base (Veículo);
* Criar subclasses (Carro, Moto);
* Implementar e sobrescrever métodos.

**Resultado Esperado:**
O aluno compreende os conceitos por meio da prática, entendendo seu uso dentro do contexto da programação.


