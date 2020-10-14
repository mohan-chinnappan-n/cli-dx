# Plugin install notes

- If you had error in installing sfdx-mohanc-plugins with issue in node-jq , type following commands in terminal:


```
$ export NODE_JQ_SKIP_INSTALL_BINARY=true
$ npm install node-jq

# once above step is successful install the plugin
$ sfdx plugins:install sfdx-mohanc-plugins

```

## node_modules folder in Linux
~/.local/share/sfdx/node_modules/



