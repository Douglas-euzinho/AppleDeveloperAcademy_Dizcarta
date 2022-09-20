
# Dizcarta Game

Abaixo existem a documentação sobre a arquitetura do projeto e padrão de commits. 


## Commit Semântico

Como padrão é adotado o commit semântico para o projeto. A estrutura padrão é **tag(ISSUE-JIRA): mensagem do commit**



## Uso/Exemplos

**build:** Alterações que afetam o sistema de construção ou dependências externas (escopos de exemplo: gulp, broccoli, npm),

**ci:** Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs);

**docs:** referem-se a inclusão ou alteração somente de arquivos de documentação;

**feat:** Tratam adições de novas funcionalidades ou de quaisquer outras novas implantações ao código;

**fix:** Essencialmente definem o tratamento de correções de bugs;

**perf:** Uma alteração de código que melhora o desempenho;

**refactor:** Tipo utilizado em quaisquer mudanças que sejam executados no código, porém não alterem a funcionalidade final da tarefa impactada;

**style:** Alterações referentes a formatações na apresentação do código que não afetam o significado do código, como por exemplo: espaço em branco, formatação, ponto e vírgula ausente etc.);

**test:** Adicionando testes ausentes ou corrigindo testes existentes nos processos de testes automatizados (TDD);

**chore:** Atualização de tarefas que não ocasionam alteração no código de produção, mas mudanças de ferramentas, mudanças de configuração e bibliotecas que realmente não entram em produção;

**env:** basicamente utilizado na descrição de modificações ou adições em arquivos de configuração em processos e métodos de integração contínua (CI), como parâmetros em arquivos de configuração de containers.

#### Exemplo
```
refactor(DIZ-44): remove xcode code template and created project struct
```

#### Referência
 - [Commit Semântico](https://blog.geekhunter.com.br/o-que-e-commit-e-como-usar-commits-semanticos/)
## Arquitetura do projeto

A arquitetura utilizada será a **IVO (Identifiable, View, Observed)**  

 - [Sobre a arquitetura](https://www.youtube.com/watch?v=SOA0IT7sxvc)

### Identifiable
É semelhante ao Model da arquitetura MVVM e implementará o protocolo Identifiable 


#### View 
Interface UI onde serão exibidos os dados. Na pasta view pode conter os componentes que são utilizados por ela. 

#### Observed
É semelhante a View Model da arquitetura MVVM. Ela implementa o protocolo ObservableObject.

## CI/CD

A CI/CD do Projeto está configurada da seguinte maneira: 

### Merge
 **develop**: Executa os testes unitários 

### Push de Branch
**Branch Iniciando com o nome 'testflight/**' : Gera uma versão para o testflight da branch criada com esse padrão de nome

**Branch Iniciando com o nome 'release/**' : Roda os Tests, Compila, Archive e Analyze. Gera uma versão para o testflight e AppStore da branch criada com esse padrão de nome 