# Inclusive language scanning

```

Inclusive language is language that is free from words, phrases or tones that reflect prejudiced, stereotyped or discriminatory views of particular people or groups. It is also language that doesn’t deliberately or inadvertently exclude people from being seen as part of a group.

```

## [Woke](https://docs.getwoke.tech/installation/)

- Install
```
# on macOs

brew install get-woke/tap/woke


```

### Testing

```
cat text1.txt
```

```
The master called the students to do the home work.
Guys responded to these 	questions
whitelisting ip address will solve this issue
```
- Scan

```
woke text1.txt
```

```
text1.txt:2:0-4: `Guys` may be insensitive, use `folks`, `people`, `you all`, `y'all`, `yinz` instead (error)
Guys responded to these 	questions
^
text1.txt:3:0-9: `whitelist` may be insensitive, use `allowlist`, `inclusion list` instead (warning)
whitelisting ip address will solve this issue
^
```

## Similar Tools
- [es-lint plugin](https://www.npmjs.com/package/eslint-plugin-inclusive-language)
- [Woke VS Code extension]()
![woke in VS Code](img/woke-in-vscode.png)

