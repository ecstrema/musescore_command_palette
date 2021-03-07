import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import MuseScore 3.0

MuseScore {
    id: root;
    menuPath: qsTr("Plugins.Command Palette")
    description: qsTr("A VSCode-like command palette")
    version: "1.0"
    onRun: {
        window.visible = true;
        window.raise();
        textInput.text = "";
        textInput.focus = true;
        textInput.forceActiveFocus();

        // hack to give focus to the input window
        const timer = new timerInstance();
        timer.interval = 100;
        timer.repeat = false;
        timer.triggered.connect(function () {
            window.raise();
            window.requestActivate();
            if (!textInput.focus) {
                timer.start();
            }
        })

        timer.start();
    }

    function timerInstance() {
        return Qt.createQmlObject("import QtQuick 2.0; Timer {}", root);
    }

    property variant commands: ["acciaccatura", "add-8va", "add-8vb", "add-audio", "add-brackets", "add-down-bow", "add-hairpin", "add-hairpin-reverse", "add-marcato", "add-noteline", "add-remove-breaks", "add-sforzato", "add-slur", "add-staccato", "add-tenuto", "add-trill", "add-up-bow", "advance-1", "advance-16", "advance-2", "advance-32", "advance-4", "advance-64", "advance-8", "advance-breve", "advance-longa", "append-hbox", "append-measure", "append-textframe", "append-vbox", "appoggiatura", "beam-32", "beam-mid", "beam-start", "bottom-chord", "chord-a", "chord-b", "chord-c", "chord-d", "chord-e", "chord-f", "chord-g", "chord-text", "chord-tie", "clef-bass", "clef-violin", "composer-text", "concert-pitch", "copy", "copy-lyrics-to-clipboard", "cut", "dec-duration-dotted", "del-empty-measures", "delete", "double-duration", "down-chord", "duplet", "edit-element", "enh-both", "enh-current", "escape", "explode", "expression-text", "figured-bass", "fingering-text", "first-element", "flat", "flat2", "flip", "fotomode", "fret-0", "fret-1", "fret-10", "fret-11", "fret-12", "fret-13", "fret-14", "fret-2", "fret-3", "fret-4", "fret-5", "fret-6", "fret-7", "fret-8", "fret-9", "full-measure-rest", "grace16", "grace16after", "grace32", "grace32after", "grace4", "grace8after", "half-duration", "implode", "inc-duration-dotted", "insert-a", "insert-b", "insert-c", "insert-d", "insert-e", "insert-f", "insert-fretframe", "insert-g", "insert-hbox", "insert-measure", "insert-textframe", "insert-vbox", "instrument-change-text", "intervalX", "join-measures", "last-element", "lyrics", "mag", "mirror-note", "move-down", "move-left", "move-right", "move-up", "nat", "next-beat-TEXT", "next-chord", "next-element", "next-lyric", "next-measure", "next-measure-TEXT", "next-segment-element", "next-track", "no-beam", "nonuplet", "note-a", "note-b", "note-breve", "note-breve-TAB", "note-c", "note-d", "note-e", "note-f", "note-g", "note-input", "note-longa", "note-longa-TAB", "octuplet", "pad-dot", "pad-dot3", "pad-dot4", "pad-dotdot", "pad-note-1", "pad-note-1-TAB", "pad-note-128", "pad-note-128-TAB", "pad-note-16", "pad-note-16-TAB", "pad-note-2", "pad-note-2-TAB", "pad-note-32", "pad-note-32-TAB", "pad-note-4", "pad-note-4-TAB", "pad-note-64", "pad-note-64-TAB", "pad-note-8", "pad-note-8-TAB", "pad-note-decrease", "pad-note-decrease-TAB", "pad-note-increase", "pad-note-increase-TAB", "pad-rest", "page-break", "page-end", "page-next", "page-prev", "page-top", "part-text", "paste", "paste-double", "paste-half", "paste-special", "pitch-down", "pitch-down-diatonic", "pitch-down-octave", "pitch-spell", "pitch-up", "pitch-up-diatonic", "pitch-up-octave", "play", "poet-text", "prev-beat-TEXT", "prev-chord", "prev-element", "prev-lyric", "prev-measure", "prev-measure-TEXT", "prev-segment-element", "prev-track", "quadruplet", "quintuplet", "realtime-advance", "rehearsalmark-text", "relayout", "repeat-sel", "resequence-rehearsal-marks", "reset", "reset-beammode", "reset-groupings", "reset-stretch", "reset-style", "rest", "rest-1", "rest-2", "rest-4", "rest-8", "rest-TAB", "revision", "section-break", "select-all", "select-begin-line", "select-begin-score", "select-dialog", "select-end-line", "select-end-score", "select-next-chord", "select-next-measure", "select-prev-chord", "select-prev-measure", "select-section", "select-similar", "select-similar-staff", "select-staff-above", "select-staff-below", "septuplet", "set-visible", "sextuplet", "sharp", "sharp2", "show-omr", "slash-fill", "slash-rhythm", "split-measure", "staff-text", "stretch+", "stretch-", "string-above", "string-below", "subtitle-text", "swap", "system-break", "system-text", "text-word-left", "text-word-right", "tie", "time-delete", "title-text", "toggle-hide-empty", "toggle-insert-mode", "toggle-mmrest", "toggle-visible", "top-chord", "transpose-down", "transpose-up", "triplet", "tuplet-dialog", "unset-visible", "up-chord", "voice-1", "voice-2", "voice-3", "voice-4", "voice-x12", "voice-x13", "voice-x14", "voice-x23", "voice-x24", "voice-x34"];
    property int currentIndex: 0;

    function handleKeyPress(key) {
        if (key === Qt.Key_Return) {
            if (optionsRepeater.model.length < root.currentIndex) {
                return;
            }
            cmd(optionsRepeater.model[root.currentIndex])
            window.visible = false;
            return;
        }
        if (key === Qt.Key_Escape) {
            window.visible = false;
            return;
        }
        if (key === Qt.Key_Down) {
            if (currentIndex < 11) {
                currentIndex += 1;
            }
            return;
        }
        if (key === Qt.Key_Up) {
            if (currentIndex > 0) {
                currentIndex -= 1;
            }
            return;
        }
    }

    Window {
        id: window;

        visible: false;
        height: 26 + 2 * 5 + 26 * optionsRepeater.model.length;
        width: 600;
        color: "#333"
        flags: Qt.Popup;

        Component.onCompleted: {
            x = (Screen.width - width) * 0.5;
            y = 30;
        }

        onActiveChanged: {
            if (!active) {
                visible = false;
            }
        }

        ColumnLayout {
            anchors.fill: parent;
            spacing: 0;

            Rectangle {
                Layout.fillWidth: true;
                Layout.margins: 5;
                height: 26;

                color: "#444";
                border.color: "blue";
                border.width: 1;

                MouseArea {
                    anchors.fill: parent;
                    cursorShape: Qt.IBeamCursor;
                    onClicked: {
                        textInput.focus = true;
                    }
                }

                RowLayout {
                    anchors.fill: parent;
                    anchors.margins: 5;
                    spacing: 0;

                    Text {
                        Layout.fillHeight: true;
                        text: ">";
                        color: "white";
                    }
                    Item {
                        Layout.fillHeight: true;
                        Layout.fillWidth: true;
                        Text {
                            anchors.fill: parent;
                            visible: textInput.text == "";
                            color: "grey";
                            text: qsTr("Enter Command");
                        }
                        TextInput {
                            id: textInput;
                            anchors.fill: parent;
                            color: "white";

                            Keys.onReturnPressed: {
                                root.handleKeyPress(Qt.Key_Return);
                                event.accepted = true;
                            }
                            Keys.onPressed: {
                                handleKeyPress(event.key);
                            }

                            onFocusChanged: {
                                window.visible = focus;
                            }
                        }
                    }
                }
            }
            ColumnLayout {
                Layout.fillWidth: true;
                Layout.fillHeight: true;

                spacing: 0;

                Repeater {
                    id: optionsRepeater;
                    model: root.commands.filter(function(cmd) {return cmd.includes(textInput.text)}).slice(0, 12);

                    onModelChanged: {
                        root.currentIndex = 0;
                    }

                    Rectangle {
                        Layout.fillWidth: true;
                        height: 26
                        color: index === root.currentIndex ? "#126" : itemMouseArea.containsMouse ? "#444" : "#333";
                        RowLayout {
                            anchors.fill: parent;
                            Text {
                                Layout.margins: 5;
                                color: "white";
                                text: modelData;
                            }
                        }
                        MouseArea {
                            id: itemMouseArea;
                            anchors.fill: parent;
                            cursorShape: Qt.PointingHandCursor;
                            hoverEnabled: true;
                            onClicked: {
                                cmd(modelData);
                                window.visible = false;
                                event.accepted = true;
                            }
                        }
                    }
                }
            }
        }
    }
}
