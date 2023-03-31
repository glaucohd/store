# Instrução

- Faça do clone do repositório e na raiz do projeto, renomeie o arquivo .env.exemple para .env.
- Adicione sua API_KEY, caso não tenha uma você pode criar atraves do site [Google Developers Console](https://cloud.google.com/?hl=pt-br)

## Desafio do projeto

Criar um projeto de interface para um aplicativo que possui campos de login com opções de autenticação pelo Facebook e Google. Após o login, o usuário é redirecionado para uma tela de listagem de produtos em duas colunas com lazy loading. Há um menu drawer com opções de perfil, meus produtos, configurações e logout. 

Ao selecionar um produto, uma nova tela é apresentada com um mapa do Google Maps mostrando a localização do usuário, um thumbnail do produto com uma descrição e um botão de compra. Após clicar no botão, um modal pergunta se confirma a compra ou não, exibindo uma mensagem de sucesso em caso afirmativo e cancelando o modal em caso negativo.

## Conclusão

Eu criei o projeto utilizando as melhores práticas de programação, seguindo os princípios de Clean Architecture, Clean Code e SOLID. Para implementar a funcionalidade de mapa, eu utilizei a biblioteca google_maps_flutter, juntamente com outras bibliotecas como geolocator, google_sign_in, flutter_facebook_auth, permission_handler, provider, flutter_config, geocoding, http, cached_network_image, flutter_cache_manager, firebase_auth, firebase_core e auth_buttons.

Com a ajuda dessas bibliotecas, eu consegui implementar uma interface de login com opções de autenticação pelo Facebook e Google, e também adicionei uma funcionalidade de mapa, onde os usuários podem ver a localização de um produto selecionado. O uso das bibliotecas também me permitiu adicionar recursos extras, como o armazenamento em cache de imagens e a integração com o Firebase para gerenciar a autenticação.

Em resumo, com a utilização das bibliotecas mencionadas e a adoção das melhores práticas de programação, eu fui capaz de criar um projeto em Flutter robusto, escalável e de fácil manutenção.

