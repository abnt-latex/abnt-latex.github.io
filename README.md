# abnt-latex.github.io

## Criando Posts

Para criar um **post**, adicione um arquivo ao seu diretório `_posts` com o seguinte formato:

```
YEAR-MONTH-DAY-title.MARKUP
```

Onde `YEAR` é um número de quatro dígitos, `MONTH` e `DAY` são números de dois dígitos e `MARKUP` é a extensão do arquivo que representa o formato usado no arquivo. Por exemplo, seguem alguns exemplos de nomes de arquivos de postagem válidos:

```
2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.md
```

Todos os arquivos de postagem de blog devem começar com um cabeçalho (*front matter*), que geralmente é usado para definir um layout ou outros metadados. Para um exemplo simples, ele pode estar vazio:

```
---
layout: post
title:  "Welcome to Jekyll!"
---

# Welcome

**Hello world**, this is my first Jekyll blog post.

I hope you like it!
```

Para mais detalhes: https://jekyllrb.com/docs/posts/