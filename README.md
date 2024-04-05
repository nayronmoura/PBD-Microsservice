## Como instalar o Dart e o Melos

#### Instalando o Dart SDK
Acesse o site https://dart.dev/get-dart e siga as instruções para baixar e instalar o SDK para o seu sistema operacional.
Verifique se o Dart SDK está instalado corretamente executando o comando dart --version no terminal.

### Instalando o Melos
1- Instale o Melos globalmente com o seguinte comando:
``dart pub global activate melos``
2- Verifique se o Melos está instalado corretamente executando o comando **melos --version** no terminal

### Rodando todas as aplicações com melos explode
1- Abra o terminal e navegue até a pasta do seu projeto Flutter.
2- Execute o comando **melos explode**.
3- Este comando irá criar um symlink para cada projeto na pasta packages dentro da pasta bin. Isso permite que você execute cada aplicativo como se estivesse em um projeto Flutter independente.

### Rodando um projeto individual
1- Abra o terminal e navegue até a pasta do projeto Flutter.
2- Navegue até a pasta bin do projeto individual que você deseja executar.
Execute o comando **dart run**.
Por exemplo, para executar o projeto auth, você executaria os seguintes comandos:
``
cd packages/auth
cd bin
dart run
``
## Como instalar o Dart e o Melos
com o melos, você poderá executar todos os projetos ao mesmo tempo!

### Instalando o Melos

1- Instale o Melos globalmente com o seguinte comando:
    ``dart pub global activate melos``
2- Verifique se o Melos está instalado corretamente executando o comando `melos --version` no terminal.

### Rodando todas as aplicações com `melos explode`

1- Abra o terminal e navegue até a pasta do projeto.
2- Execute o comando `melos explode`.
