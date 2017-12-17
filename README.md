# Projeto: Snake v1.0

Projeto feito em Swift no Xcode do jogo clássico Snake. Desenvolvimento de uma versão simples onde há somente um alimento para o jogador pegar e receber um ponto.

### Jogo

Durante o jogo, é gerado um alimento para a cobra sempre que o anterior é comido. Caso o jogador atinja uma das bordas ou uma das partes do corpo da cobra, o jogo é encerrado e ele pode começar novamente.

A dificuldade do jogo pode ser escolhida antes do início de um jogo. Cada dificuldade muda o tempo que a cobra espera entre os movimentos.
Tempo de cada dificuldades:
 *  Fácil - 0.4 segundo.
 *  Médio - 0.25 segundo.
 *  Difícil - 0.1 segundo.

## Planejamento de desenvolvimento

* *11/12/2017* - Criação do projeto e prototipação da interface.
* *12/12/2017* - Modelagem e commit com o modelo. Organização das branches do repositório.
* *13/12/2017* - Interface pronta sem a lógica do jogo.
* *14/12/2017* - Gerar, aleatoriamente, a posição para um alimento. Incrementar os pontos da cobra e aumentar seu tamanho ao comer o alimento.
* *15/12/2017* - Colisão da cobra com ela mesma e a parede (fim do jogo). Implementação das diferentes dificuldades (alterar o tempo).
* *16/12/2017* - Testes e correções de bugs.
* *17/12/2017* - Interface de Game Over e últimos ajustes.
* *18/12/2017* - Envio do projeto.

## Autores

* **Gabriel Bendia** - *Engenharia da Computação PUC-Rio*
