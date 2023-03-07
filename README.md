# Blockchain Apprentice

Este repositório contém exemplos dos cursos realizados na trilha Blockchain Apprentice, durante o período de estágio na Compass UOL.

## Solidity

>"Solidity é uma linguagem de programação de alto nível projetada para escrever contratos inteligentes em plataformas baseadas em blockchain, como Ethereum. Foi criada por Christian Reitwiessner em 2014 e é influenciada pela linguagem de programação JavaScript.
>
>Os contratos inteligentes são programas autônomos executados na rede Ethereum, que permitem que as pessoas interajam com um conjunto de regras previamente definidas sem a necessidade de intermediários. Esses contratos podem ser usados para criar aplicativos descentralizados (dApps), tokens digitais, entre outras aplicações.
>
>Solidity oferece aos desenvolvedores uma variedade de recursos para escrever contratos inteligentes, como tipagem estática, controle de fluxo, estruturas de dados avançadas, entre outros. A linguagem também permite a interação com outras contratos inteligentes, facilitando a criação de aplicativos complexos baseados em blockchain.
>
>Os contratos inteligentes escritos em Solidity são compilados em bytecode que pode ser executado na máquina virtual Ethereum (EVM), garantindo que o contrato seja executado de forma confiável em todos os nós da rede Ethereum. Como a plataforma Ethereum é baseada em um modelo de consenso descentralizado, os contratos inteligentes escritos em Solidity são executados em uma rede global de computadores, tornando-os imutáveis e transparentes."

### Tipos básicos de dados em Solidity

| Tipo de Dado | Descrição | Exemplo |
|:------------:|:---------:|:-------:|
| `boolean` | Valor booleano, verdadeiro ou falso | `true`, `false` |
| `uint` | Número inteiro sem sinal | `uint256`, `uint8` |
| `int` | Número inteiro com sinal | `int256`, `int8` |
| `address` | Endereço Ethereum de 20 bytes | `0x1234567890123456789012345678901234567890` |
| `bytes` | Dados binários de tamanho fixo | `bytes32`, `bytes8` |
| `arrays` | Coleção de elementos do mesmo tipo | `uint256[]`, `string[]` |
| `string` | Sequência de caracteres Unicode | `"Hello, World!"` |
| `structs` | Agrupamento de dados de tipos diferentes | `struct Person { string name; uint age; }` |
| `enum` | Coleção de constantes nomeadas | `enum State { Created, Locked, Inactive }` |

### `view` vs `pure`

Em Solidity, `view` e `pure` são dois tipos de funções que indicam que a função não modifica o estado do contrato e, portanto, pode ser executada sem custo em qualquer nó da rede Ethereum.

A diferença entre `view` e `pure` é que `view` é usado para funções que retornam algum valor, enquanto `pure` é usado para funções que não retornam nada.

Funções marcadas com o modificador `view` não podem modificar o estado do contrato, mas podem ler o estado atual. Essas funções são usadas principalmente para consulta de informações, cálculos e verificação de condições.

Por exemplo:

```solidity
function getBalance() public view returns (uint) {
    return balances[msg.sender];
}
```

A função `getBalance` é uma função de visualização (view) que retorna o saldo de uma conta específica.

Por outro lado, as funções marcadas com o modificador `pure` não podem ler ou modificar o estado atual do contrato. Essas funções são usadas principalmente para cálculos e manipulação de dados.

Por exemplo:

```solidity
function add(uint x, uint y) public pure returns (uint) {
    return x + y;
}
```

A função `add` é uma função pura (pure) que retorna a soma de dois valores passados como argumentos.

Ao usar `view` e `pure`, você pode tornar seu contrato mais eficiente e evitar custos desnecessários de **gás** para execução de funções que não modificam o estado do contrato.

### O que é GAS?


>"Em Solidity, `gas` é uma unidade de medida que representa o custo computacional de executar uma operação ou uma transação no Ethereum. Cada operação e transação em um contrato inteligente requer um certo montante de gas para ser executada.
>
>O `gas` é uma forma de evitar ataques de negação de serviço na rede Ethereum, onde um usuário mal-intencionado tenta sobrecarregar a rede com transações que exigem muito processamento ou armazenamento. Ao definir um limite de gás para cada operação e transação, a rede Ethereum pode garantir que as transações sejam processadas de forma justa e segura."
