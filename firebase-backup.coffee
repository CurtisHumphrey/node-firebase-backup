#!/usr/bin/env coffee
#
fs = require 'fs'
Firebase = require 'firebase'

config = require './config.json'

# no need to edit below this line
console.log "Starting backup..."


rootRef = new Firebase(config.firebaseURL)
rootRef.authWithCustomToken config.firebaseSecret, (error) ->
  if error
    console.log error
  else
    rootRef.once "value", (snapshot) ->
      
      # construct a filename based on today's date and the exact time in milliseconds
      now = new Date()
      filename = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() + "-" + now.getTime() + ".json"
      fs.writeFile config.backupLocation + "/" + filename, JSON.stringify(snapshot.exportVal()), (err) ->
        if err
          console.log err
        else
          console.log "The backup was saved! " + filename
        
        # all done, quit node.js
        process.exit()
        return

      rootRef.unauth()
      return

  return