# atom snippets

* "Snippets: Available" in the Command Palette will show options;
*  Edit > Snippets menu - will open ~/.atom/snippets.cson

```
code    +tab  => will add code segmnet with 3"`"
cc            => like code
bb      +tab  => (md) add code block for bash
ff      +tab  => (md) add code file


```


## myAdditions:

```
## The default scope for markdown in atom is .source.gfm
## use the ${1} to put the coursere and tab to jump next
'.source.gfm':
  'insert-code-general':
    'prefix': 'cc'
    'body': '\n```\n${1}\n```'
  'insert-code-bash':
    'prefix': 'bb'
    'body': '```Bash\n${1}\n```'
  'insert-code-file':
    'prefix': 'ff'
    'body': '```\n${1}\n=================={2}\n${3}\n```'
```
