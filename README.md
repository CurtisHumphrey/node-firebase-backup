# Firebase backup

Backups up your firebase to a local file. Based on work by https://github.com/sergiopantoja/firebase-backup-node

# Requirements
- nodejs
- firebase
- coffeescript

# How do I use it?

Make a ./config.json file like:
```json
{
  "backupLocation": "backups",
  "firebaseURL": "your url",
  "firebaseSecret": "your secret key"
}
```

Then Run:

```
coffee ./firebase-backup.coffee
```


## License
Copyright © 2014 Curtis M. Humphrey and is licensed under the terms of the MIT License.