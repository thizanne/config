#!/usr/bin/env python

import mpd

state_translate = {
    "stop" : "Stopped",
    "play" : "Playing",
    "pause": "Paused",
}

client = mpd.MPDClient()
client.connect("localhost", 6600)

status = client.status()
state = state_translate[status["state"]]

if state == "Stopped":
    print(state)
else:
    playlist = client.playlistinfo()
    song = playlist[int(status["song"])]

    try:
        title = song["title"]
    except KeyError:
        title = song["file"]

    try:
        artist = song["artist"]
    except:
        artist = "No artist"

    print("%s: %s - %s" % (state, artist, title))
