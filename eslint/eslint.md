# eslint

## Install

- Inside a node project (say ~/code-check)
```
npm i eslint
```

## config .eslintrc

```

{
    "parserOptions": {
        "ecmaVersion": "latest"
    },

    "env": {
        "es6": true
    },
    "rules": {
        "semi": ["error", "always"],
        "quotes": ["error", "double"]
    }
}

```

## Sample code to test test.js
```js

const add = (a,b) => a + b;
console.log(add(10,20));
```


## Run

```
~/code-check/node_modules/.bin/eslint test.js
```

## Run and fix the code
```
~/code-check/node_modules/.bin/eslint --fix test.js
```



