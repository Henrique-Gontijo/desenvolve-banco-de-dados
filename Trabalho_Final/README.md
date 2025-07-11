# Passos Iniciais

- Caso não possua, crie um banco de dados no MySQL para comportar os dados;
- Substitua os dados no arquivo `.env` pelo seu prórpio usuário, senha e nome do banco que irá receber os dados das tabelas;
- Digite `pip install -r requirements.txt` para instalar as bibliotecas necessárias para o projeto funcionar.

## Execução
Primeiramete execute o arquivo `models.py` para a criação das tabelas no banco. Em seguida, execute `populador.py` 
para que os dados do arquivo JSON sejam transferidos para as tabelas do banco.
