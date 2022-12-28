# Finding Dangling fields using CLI
```

# list the profile files in json format
sfdx mohanc:mdapi:listFiles -p /path/to/src/folder -t profiles > /tmp/profiles.json

# find the dangling fields for those profiles
sfdx mohanc:mdapi:df -i /tmp/profiles.json > dangling_fields_2.txt

# cleanup
cd /path/to/src/profiles/folder
rm *.json

```

