# OpenSheetMusicDisplay-Swift-Example
An example of how to run OpenSheetMusicDisplay inside a WKWebView to display a MusicXML score

[OpenSheetMusicDisplay](https://opensheetmusicdisplay.github.io) is a JavaScript library that renders music notation of MusicXML files in the browser and it's built on top of [VexFlow](https://www.vexflow.com).

This is a demo implementation in Swift that works on iOS and macOS-Catalyst by running JavaScript in a `WKWebView` and uses OSMD version [0.8.7](https://github.com/opensheetmusicdisplay/opensheetmusicdisplay/releases/tag/0.8.7)

OSMD doesn't [yet](https://opensheetmusicdisplay.org/2019/12/05/audio-player-is-coming-in-2020/) support audio playback but you can add separate audio player and [sync the cursor to music](https://github.com/opensheetmusicdisplay/opensheetmusicdisplay/wiki/Tutorial:-Extracting-note-timing-for-playing).

I haven't figured out how to transpose or export the charts as an image or PDF.
Also I wonder if there is a more elegant way to deal with JavaScript, perhaps using [JavaScriptCore](https://developer.apple.com/documentation/javascriptcore)?

If you know about any of the above or have other ideas, contributions are welcome.

![App Image](example.png?)
