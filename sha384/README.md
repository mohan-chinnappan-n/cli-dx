# How to  generate integrity attribute for the scripts and css files

- Use this [script](./gen_script_tag.sh)

```bash
bash gen_script_tag.sh --file file.js --algorithm sha512
```

- Default algorithm is sha384
```
    bash gen_script_tag.sh --file jquery.min.js
```