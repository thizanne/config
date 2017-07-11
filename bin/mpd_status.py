#!/usr/bin/env python2

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
    title = song["title"]
    artist = song["artist"]

    print("%s: %s - %s" % (state, artist, title))
