MANUAL DE USO


-> PRIMEIROS PASSOS

1) Crie um ambiente virtual para o seu projeto.
===
virtualenv venv --no-site-packages
===


2) Ative o ambiente virtual do projeto.
===
source venv/bin/activate
===


3) Instale os componentes requeridos.
===
pip install -r requirements.txt
===


4) Gerar tabelas do banco de dados.
===
./manage.py migrate
===


5) Criar o super usuário do banco de dados.
===
./manage.py createsuperuser
===



-> IGNORANDO ARQUIVOS E DIRETÓRIOS QUE NÃO SERÃO VERSIONADOS

1) Adicione o nome do arquivo ou diretório na lista de arquivos que serão ignorados.

a) Abra o arquivo com a lista:
===
vi .svnignore
===

b) Adicione o nome do arquivo ou diretório à lista e salve o arquivo:
===
media
venv
local_settings.py
nome_do_arquivo_que_sera_ignorado
===


2) Realize o porpset do subversion para ignorar a nova lista.
===
svn propset svn:ignore -R -F .svnignore .
===


3) Agora realize um commit.
===
svn ci -m 'nova lista de itens do svnignore'
===




INSTALANDO NOVAS APPS

1) Instale a nova app através do pip.
===
pip install nova_app
===


2) Agora adicione esta nova app aos requisitos do projeto.
===
pip freeze > requirements.txt
===


3) Realize um novo commit.
===
svn ci -m 'alteração no requirements.txt'
===





