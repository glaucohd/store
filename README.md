# Instrução

- Faça do clone do repositório e na raiz do projeto, renomeie o arquivo .env.exemple para .env.
- Adicione sua API_KEY, caso não tenha uma você pode criar atraves do site [Google Developers Console](https://cloud.google.com/?hl=pt-br)

## Desafio do projeto

<p>Criar um projeto de interface para um aplicativo que possui campos de login com opções de autenticação pelo Facebook e Google. Após o login, o usuário é redirecionado para uma tela de listagem de produtos em duas colunas com lazy loading. Há um menu drawer com opções de perfil, meus produtos, configurações e logout.</p>
<p>Ao selecionar um produto, uma nova tela é apresentada com um mapa do <strong>Google Maps</strong> mostrando a localização do usuário, um thumbnail do produto com uma descrição e um botão de compra. Após clicar no botão, um modal pergunta se confirma a compra ou não, exibindo uma mensagem de sucesso em caso afirmativo e cancelando o modal em caso negativo.</p>

Link do apk para download: [Drive](https://drive.google.com/file/d/11W5aCVrRB11SyrAaMGKdNDyvGGi25LTO/view?usp=share_link) 

## Conclusão

<p>Eu criei o projeto em <strong>Flutter</strong> utilizando as melhores práticas de programação, seguindo os princípios de <em>Clean Architecture</em>, <em>Clean Code</em> e <em>SOLID</em>. Para implementar a funcionalidade de mapa, eu utilizei a biblioteca <strong>google_maps_flutter</strong>, juntamente com outras bibliotecas como:</p>
<ul>
  <li>geolocator</li>
  <li>google_sign_in</li>
  <li>flutter_facebook_auth</li>
  <li>permission_handler</li>
  <li>provider</li>
  <li>flutter_config</li>
  <li>geocoding</li>
  <li>http</li>
  <li>cached_network_image</li>
  <li>flutter_cache_manager</li>
  <li>firebase_auth</li>
  <li>firebase_core</li>
  <li>auth_buttons</li>
</ul>
<p>Com a ajuda dessas bibliotecas, eu consegui implementar uma interface de login com opções de autenticação pelo Facebook e Google, e também adicionei uma funcionalidade de mapa, onde os usuários podem ver a localização de um produto selecionado. O uso das bibliotecas também me permitiu adicionar recursos extras, como o armazenamento em cache de imagens e a integração com o Firebase para gerenciar a autenticação.</p>
<p>Em resumo, com a utilização das bibliotecas mencionadas e a adoção das melhores práticas de programação, eu fui capaz de criar um projeto em Flutter robusto, escalável e de fácil manutenção.</p>

