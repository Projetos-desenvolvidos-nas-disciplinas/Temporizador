# Temporizador

Neste bloco teremos dois temporizadores, um de 5 segundos e o outro de 20 segundos, que serão acionados pela lógica do controle (RST), quando o RST estiver em nível lógico alto, irá acionar o temporizador de 5 segundos, quando estiver em nível lógico baixo, irá acionar o temporizador de 20 segundos.

![image](https://github.com/Projetos-desenvolvidos-nas-disciplinas/Temporizador/assets/83460164/ff624eaa-4f24-49e0-8378-d4c8247cb494)

O temporizador é basicamente um contador, que fará a contagem do sinal de clock, já que usaremos o clock com a frequência em 1 segundo. Os temporizadores funcionam da seguinte forma:

● O de 5 segundos receberá como entrada o RST e terá 3 bits, como também, o sinal de clock, para fazer a contagem o clear deve está acionado. O contador vai registrar 5 ciclos de clock para poder liberar o sinal T5s (T5s = b2 * b1' * b0) , que será
responsável pela autorização da mudança dos estados, quando o tempo de espera for igual a 5 segundos.

● O de 20 segundos receberá como entrada o RST’ e terá 5 bits, como também, sinal de clock, para fazer a contagem o clear deve está acionado. O contador vai registrar 20 ciclos de clock para poder liberar o sinal T20s ( T20s = b4 * b3' * b2 * b1' * b0' ), que será responsável por liberar a abertura do cofre.

● Nos momentos em que os temporizadores não forem acionados, irão estar com o clear negado, mantendo assim os temporizadores sempre em 0.

● Daí, no momento que a máquina entrar em um estado de contagem, o clear será desligado e o temporizador em questão vai iniciar sua contagem em 0 até o valor determinado.
