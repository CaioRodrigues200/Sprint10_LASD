# Sprint10_LASD
 Projeto para implementação de desencapsulador Ethernet em um processador MIPS modelado em FPGA

 ## Instrução ET (Ethernet) aplicada

 Para aplicar a instrução ET, pode ser utilizado uma chamada de rotina do tipo a seguir:

 ```
00|   ADDi $2, $0, 1   // Tarefas pré sub-rotina
01|   JAL 5            // Ir para sub-rotina
02|   ADDi $4, $0, 3   // Tarefas pós sub-rotina
03|   J 11              // Finalizar programa
04|
05|   ADDi $3, $0, 2   --------- // Início da sub-rotina Ethernet
06|   ET               // Requisitar recepção da rede Ethernet
07|   LW $5, F0($0)    // Resgatar o dado obtido pela transmissão Ethernet
08|   BEQ $5, $3, 1    // Verificar se o dado $5 procede
09|   J 6              // Loop de sub-rotina
10|   JR $8            --------- // Final da sub-rotina Ethernet
11|
 ```

 Tangente à instrução ET (linha 06), poderá ser necessário adicionar mais instruções consecutivas antes de resgatar algum dado, pois a quantidade de clocks varia com o tamanho do dado transitando na rede.