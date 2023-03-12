# movies

O projeto é um desafio de uma proposta a vaga de desenvolvedor Flutter júnior, onde foi implementada as seguintes features:
- Search
- Upcoming
- Popular
- Favorites

## Getting Started
Para rodar o projeto, clone o mesmo e rode o seguinte comando no terminal do vs code:
  flutter pub get;
  Quando finalizar esse processo, pode rodar o projeto em modo debbug ou usar o comando flutter run no terminal do vs code.
  
### Observações sobre a construção do projeto
  A arquitetura utilizada foi a MVVM a qual é propícia a mudanças, como refatorações podem acontecer futuramente, as views serão tão afetadasde forma amenizada, além disso, pode-se implementar de maneira mais facilitada os princípios do solid, deixar o código mais limpo e implementar os testes unitários de maneira mais facilitada
  
  Um dos requisitos mais importantes era a reprodução do treiler do vídeo, para exibir ao usuário, foi utilizado um package, 'youtube_player_flutter', usando essa estratégia, era necessário apenas passar a key do vídeo e reproduzir pelo próprio link do youtube.
  
  Outro requisito importante foi de salvar os filmes favoritos, nesse cenário com poucos dias, foi utilizado outro package, o 'hive', onde basicamente é um banco de dados chave-valor, mais simples, leve de se trabalhar e resolveu o problema, onde não foi necessário manipular  banco de dados complexos ou linguagem sql.
  
  Foi adicionado uma biblioteca para animação da splashScreen (Lottie) tornar a experiência mais parecida com um app de cenário real.
  
 Abaixo seguem as outras dependências que foram utilizadas no projeto para requisições HTTP (dio), e obter os caminhos dos diretórios do aparelho (path_provider) para salvar os filmes favoritos; 
  - dio: ^4.0.4
  - intl: ^0.17.0
  - video_player: ^2.5.1
