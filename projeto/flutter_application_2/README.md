##oioi
pasta lib é onde vc ira colocar o codigo das suas telas(arquivos em dart)

pubspeck é o arquivo onde é colocado as bibliotecas

para adicionar imagens no seu projeto na linha 62 e 63 tire o comentario e passe
o path da sua pasta criada, exemplo:
    assets:
        - images/a_dot_burr.jpeg

qunado vc baixa uma fonte .ttf e coloca dntro da pasta fonts do projeto, para
usa-la vc precisa tirar o comentario da linha 77 a 80:
    fonts:
        - family: Schyler
       fonts:
         - asset: fonts/Schyler-Regular.ttf
         - asset: fonts/Schyler-Italic.ttf
           style: italic