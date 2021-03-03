import QtQuick 2.0
import QtQuick.Window 2.2
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.pluginName"
    description: "Description goes here"
    version: "1.0"
    onRun: {
        window.visible = true;
        lineEdit.text = "";
        lineEdit.focus = true;
    }

    Window {
        id: window;
        height: 200;
        width: 600;

        Component.onCompleted: {
            x = (Screen.width - width) * 0.5;
            y = 20;
        }

        Keys.onPressed: {
            if (event.key === Qt.Key_Escape) {
                window.visible = false;
                lineEdit.focus = false;
                event.accepted = true;
            }
            else if (event.key === Qt.Key_Return) {
                if (repeater.model.includes(lineEdit.text)) {
                    cmd(lineEdit.text);
                }
                window.visible = false;
                event.accepted = true;
            }
        }

        flags: Qt.Popup;

        Column {
            anchors.fill: parent;

            spacing: 2;

            Row {
                Text {
                    text: ">";
                }
                Text {
                    visible: lineEdit.text == "";
                    color: "lightgrey";
                    text: "Enter Command";
                    height: 20;
                }
                TextInput {
                    id: lineEdit;

                    height: 20;
                    Keys.onReturnPressed: {
                        if (repeater.model.includes(lineEdit.text)) {
                            cmd(lineEdit.text);
                        }
                        event.accepted = true;
                        window.visible = false;
                    }
                    Keys.onPressed: {
                        if (event.key === Qt.Key_Escape) {
                            window.visible = false;
                            lineEdit.focus = false;
                            event.accepted = true;
                        }
                    }

                    text: "";
                    selectByMouse: true;
                }
            }

            Repeater {
                id: repeater;
                anchors.fill: parent;
                model: ["acciaccatura", "add-8va", "add-8vb", "add-audio", "add-brackets", "add-down-bow", "add-hairpin", "add-hairpin-reverse", "add-marcato", "add-noteline", "add-remove-breaks", "add-sforzato", "add-slur", "add-staccato", "add-tenuto", "add-trill", "add-up-bow", "advance-1", "advance-16", "advance-2", "advance-32", "advance-4", "advance-64", "advance-8", "advance-breve", "advance-longa", "append-hbox", "append-measure", "append-textframe", "append-vbox", "appoggiatura", "beam-32", "beam-mid", "beam-start", "bottom-chord", "chord-a", "chord-b", "chord-c", "chord-d", "chord-e", "chord-f", "chord-g", "chord-text", "chord-tie", "clef-bass", "clef-violin", "composer-text", "concert-pitch", "copy", "copy-lyrics-to-clipboard", "cut", "dec-duration-dotted", "del-empty-measures", "delete", "double-duration", "down-chord", "duplet", "edit-element", "enh-both", "enh-current", "escape", "explode", "expression-text", "figured-bass", "fingering-text", "first-element", "flat", "flat2", "flip", "fotomode", "fret-0", "fret-1", "fret-10", "fret-11", "fret-12", "fret-13", "fret-14", "fret-2", "fret-3", "fret-4", "fret-5", "fret-6", "fret-7", "fret-8", "fret-9", "full-measure-rest", "grace16", "grace16after", "grace32", "grace32after", "grace4", "grace8after", "half-duration", "implode", "inc-duration-dotted", "insert-a", "insert-b", "insert-c", "insert-d", "insert-e", "insert-f", "insert-fretframe", "insert-g", "insert-hbox", "insert-measure", "insert-textframe", "insert-vbox", "instrument-change-text", "intervalX", "join-measures", "last-element", "lyrics", "mag", "mirror-note", "move-down", "move-left", "move-right", "move-up", "nat", "next-beat-TEXT", "next-chord", "next-element", "next-lyric", "next-measure", "next-measure-TEXT", "next-segment-element", "next-track", "no-beam", "nonuplet", "note-a", "note-b", "note-breve", "note-breve-TAB", "note-c", "note-d", "note-e", "note-f", "note-g", "note-input", "note-longa", "note-longa-TAB", "octuplet", "pad-dot", "pad-dot3", "pad-dot4", "pad-dotdot", "pad-note-1", "pad-note-1-TAB", "pad-note-128", "pad-note-128-TAB", "pad-note-16", "pad-note-16-TAB", "pad-note-2", "pad-note-2-TAB", "pad-note-32", "pad-note-32-TAB", "pad-note-4", "pad-note-4-TAB", "pad-note-64", "pad-note-64-TAB", "pad-note-8", "pad-note-8-TAB", "pad-note-decrease", "pad-note-decrease-TAB", "pad-note-increase", "pad-note-increase-TAB", "pad-rest", "page-break", "page-end", "page-next", "page-prev", "page-top", "part-text", "paste", "paste-double", "paste-half", "paste-special", "pitch-down", "pitch-down-diatonic", "pitch-down-octave", "pitch-spell", "pitch-up", "pitch-up-diatonic", "pitch-up-octave", "play", "poet-text", "prev-beat-TEXT", "prev-chord", "prev-element", "prev-lyric", "prev-measure", "prev-measure-TEXT", "prev-segment-element", "prev-track", "quadruplet", "quintuplet", "realtime-advance", "rehearsalmark-text", "relayout", "repeat-sel", "resequence-rehearsal-marks", "reset", "reset-beammode", "reset-groupings", "reset-stretch", "reset-style", "rest", "rest-1", "rest-2", "rest-4", "rest-8", "rest-TAB", "revision", "section-break", "select-all", "select-begin-line", "select-begin-score", "select-dialog", "select-end-line", "select-end-score", "select-next-chord", "select-next-measure", "select-prev-chord", "select-prev-measure", "select-section", "select-similar", "select-similar-staff", "select-staff-above", "select-staff-below", "septuplet", "set-visible", "sextuplet", "sharp", "sharp2", "show-omr", "slash-fill", "slash-rhythm", "split-measure", "staff-text", "stretch+", "stretch-", "string-above", "string-below", "subtitle-text", "swap", "system-break", "system-text", "text-word-left", "text-word-right", "tie", "time-delete", "title-text", "toggle-hide-empty", "toggle-insert-mode", "toggle-mmrest", "toggle-visible", "top-chord", "transpose-down", "transpose-up", "triplet", "tuplet-dialog", "unset-visible", "up-chord", "voice-1", "voice-2", "voice-3", "voice-4", "voice-x12", "voice-x13", "voice-x14", "voice-x23", "voice-x24", "voice-x34"];

                delegate: Rectangle {
                    visible: modelData.includes(lineEdit.text);
                    height: 30;
                    width: 600;
                    border.color: "black"
                    border.width: 1;
                    radius: 2;

                    MouseArea {
                        anchors.fill: parent;
                        cursorShape: Qt.PointingHandCursor;
                        onClicked: {
                            cmd(modelData);
                            window.visible = false;
                        }
                    }

                    Text {
                        text: modelData;
                    }
                }
            }
        }
    }
}
