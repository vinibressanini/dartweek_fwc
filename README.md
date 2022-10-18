# Repositório Dart Week #8 - FIFA World Cup Album

- [Objetivo](https://github.com/vinibressanini/dartweek_fwc/edit/main/README.md#1-objetivo)
- [Como Funciona?](https://github.com/vinibressanini/dartweek_fwc/edit/main/README.md#2-como-funciona)
- [Tecnologias Utilizadas](https://github.com/vinibressanini/dartweek_fwc/edit/main/README.md#3-tecnologias-utilizadas)
- [Packages Utilizados](https://github.com/vinibressanini/dartweek_fwc/edit/main/README.md#4-packages-utilizados)

## 1. Objetivo
O objetivo desta edição do Dart Week foi desenvolver uma aplicação para gerenciar albuns da copa mundo 2022 utilizando a arquitetura MVP.

## 2. Como Funciona?
Primeiramente o usuário deve se cadastrar com nome completo, email e senha. Com o cadastro feito o mesmo poderá se logar normalmente, após logado será direcionado a tela de visão geral do album onde poderá ver a porcentagem de conclusão do album, figurinhas totais, repetidas e faltando.

![image](https://user-images.githubusercontent.com/91560062/196507340-6a09f354-f589-4cdb-86f5-1a99ae88c776.png)

Ao clicar em **Minhas Figurinhas** o usuário será direcionado para o album em si onde poderá ver detalhadamente as figurinhas que possui ou não em cada um dos países participantes da copa, podendo filtrar por **todas**, **repetidas**, **faltando** e **países**.

![image](https://user-images.githubusercontent.com/91560062/196508170-66914ba3-1ce9-4ca9-821b-e13f8047583a.png)

Cada figurinha possui seu identificar númerico e de país (ex: BRA 1), e, para identificar se o usuário possui ou não a figurinha a mesma aparecerá em branco caso não ou em bordô caso possua. O número em amarelo no canto superior direito indica quantas figurinhas repetidas o usuário possui em determinada figurinha. O usuário também poderá clicar em qualquer uma das figurinhas para ser direcionado para a tela de detalhes, onde poderá gerenciar a figurinha em questão.

![image](https://user-images.githubusercontent.com/91560062/196508900-76a8f3af-56f8-4b7f-a009-e87be5365377.png)

Aqui poderá ver o total adquirido da figurinha e poderá adicionar ou remove-lás, e, para isso, após informar quantas figurinhas que deseja adicionar ou remover, o usuário deve clicar em **Atualizar Figurinha** para efetuar a ação. Também poderá excluir uma figurinha no caso de ter adicionado uma figurinha por engano, para isso, basta clicar em **Excluir Figurinha**.

### 3. Tecnologias Utilizadas
- **Flutter 3.3.4**
- **Dart 2.18.2**

### 4. Packages Utilizados
- [Top Snackbar Flutter](https://pub.dev/packages/top_snackbar_flutter)
- [Loading Animation Widget](https://pub.dev/packages/loading_animation_widget)
- [Flutter GetIt](https://pub.dev/packages/flutter_getit)
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)
- [Dio](https://pub.dev/packages/dio)
- [ValidatorLess](https://pub.dev/packages/validatorless)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Flutter Awesome Select](https://pub.dev/packages/flutter_awesome_select)
