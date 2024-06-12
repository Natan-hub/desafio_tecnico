# desafio_tecnico

A new Flutter project.

## Getting Started

Explicação do Projeto : 

Separação de responsabilidades em diferentes arquivos/classes: O código foi organizado em diferentes arquivos e classes para seguir o princípio de responsabilidade única. Cada arquivo ou classe tem uma responsabilidade específica, o que facilita a manutenção e o entendimento do código.

Utilização de classes de modelo (Model): Foram criadas classes de modelo para representar os dados dos carros e dos leads. Essas classes ajudam a estruturar os dados de forma mais organizada e facilitam o seu acesso e manipulação em diferentes partes do aplicativo.

Utilização de Providers para gerenciamento de estado: Foram utilizados Providers para gerenciar o estado da aplicação. Os Providers ajudam a compartilhar dados e estados entre diferentes partes do aplicativo de forma eficiente, facilitando a comunicação entre os componentes e reduzindo a necessidade de passar dados manualmente por toda a árvore de widgets. Como esse é um projeto pequeno foi utilizado o ChangeNotifier mas para projetos e coisas mais complexas vale se usar Bloc(que consto já ter expêriencia) ou Getx.

Utilização de Banco de Dados SQLite: Um banco de dados SQLite foi utilizado para armazenar os leads localmente. Isso permite que os dados dos leads sejam salvos de forma persistente no dispositivo do usuário e acessados mesmo quando o aplicativo estiver offline.

Utilização de requisições HTTP para comunicação com a API: Requisições HTTP foram utilizadas para carregar os dados dos carros a partir de uma API externa e para enviar os dados dos leads para a API do servidor. Isso permite que o aplicativo se comunique com um servidor remoto para obter e enviar dados, como os carros disponíveis e os leads registrados.

Utilização do Workmanager para agendamento de tarefas: O Workmanager foi utilizado para agendar a sincronização periódica dos leads com o servidor. Isso permite que o aplicativo envie os leads para o servidor mesmo quando estiver em segundo plano, garantindo que os dados dos leads sejam atualizados regularmente no servidor.

Comopnentização de Elemntos usados: Componentizzei alguns Widgets regularmente usados para fcilitar seu uso e já deixar a edição pronta, só mudando partes específicas. 

