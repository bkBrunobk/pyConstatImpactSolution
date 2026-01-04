import QtQuick 2.15
import QtQuick.Controls 2.15

/*
Méthode Constat-Impact-Solution (CIS)

Approche structurée en 3 étapes pour analyser un problème et proposer une réponse organisée et persuasive. 
Elle transforme une observation en plan d'action.
*/

ApplicationWindow {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Constat Impact Solution (CIS)")
    color: "#f0f0f0"

    Column {
        anchors.centerIn: parent
        anchors.margins: 16
        spacing: 12
        width: window.width - 32

        // Titre
        Text {
            width: parent.width
            text: qsTr("Méthode Constat Impact Solution")
            font.pixelSize: 14
            font.bold: true
            //color: "#333333"
            }
        
        // Description courte
        Text {
            width: parent.width
            wrapMode: TextArea.Wrap
            text: qsTr("Approche structurée en 3 étapes pour analyser un problème et proposer une réponse organisée et persuasive.\nElle transforme une observation en plan d'action.")
            font.pixelSize: 12
            //color: "#333333"
        }

        // Etape 1
        Text {
            width: parent.width
            text: qsTr("Etape 1")
            font.pixelSize: 12
            font.bold: true
            //color: "#333333"
            }
        // Description courte
        Text {
            width: parent.width
            wrapMode: TextArea.Wrap
            text: qsTr("Établir un diagnostic factuel, neutre et vérifiable.")
            font.pixelSize: 12
            //color: "#333333"
        }

        // Champ pour saisir un message à envoyer vers Python
        Column {
            width: parent.width
            spacing: 4

            Text {
                text: qsTr("Saisir votre constat (max 500 chars) :")
                font.pixelSize: 11
                color: "#666666"
            }

            TextArea {
                id: input
                placeholderText: qsTr("Mon constat")
                width: parent.width
                height: 160
                wrapMode: TextArea.Wrap
                selectByMouse: true
                color: "#333333"
                
                // Feedback visuel si champ invalide
                background: Rectangle {
                    border.color: input.length > 500 ? "#ff6b6b" : (input.focus ? "#4c8dff" : "#cccccc")
                    border.width: 1
                    radius: 4
                    color: "#ffffff"
                }
            }

            // Compteur de caractères
            Text {
                text: qsTr("%1 / 500").arg(input.length)
                font.pixelSize: 10
                color: input.length > 500 ? "#ff6b6b" : "#999999"
                anchors.right: parent.right
            }
        }

        // Boutons tests
        Row {
            spacing: 8
            width: parent.width

            Button {
                id: sendBtn
                text: qsTr("Envoyer")
                enabled: input.length > 0 && input.length <= 500 && typeof backend !== 'undefined'
                
                onClicked: {
                    if (typeof backend !== 'undefined' && backend) {
                        backend.send_to_python(input.text)
                        input.text = ""
                        input.focus = false
                    }
                }
            }

            Button {
                id: requestBtn
                text: qsTr("Demander")
                enabled: typeof backend !== 'undefined'
                
                onClicked: {
                    if (typeof backend !== 'undefined' && backend) {
                        try {
                            var r = backend.request_from_python()
                            response.text = r || qsTr("(réponse vide)")
                        } catch (e) {
                            response.text = qsTr("Erreur : ") + e
                        }
                    }
                }
            }

            Button {
                id: pingBtn
                text: qsTr("Ping")
                enabled: typeof backend !== 'undefined'
                
                onClicked: {
                    if (typeof backend !== 'undefined' && backend) {
                        // Appel asynchrone : réponse via signal messageToQml
                        backend.ping()
                    }
                }
            }
        }

        // Zone d'état / logs
        Rectangle {
            width: parent.width
            height: 80
            color: "#fafafa"
            border.color: "#dddddd"
            border.width: 1
            radius: 4

            Flickable {
                anchors.fill: parent
                anchors.margins: 8
                contentHeight: response.height
                clip: true

                Text {
                    id: response
                    width: parent.width
                    text: qsTr("En attente de réponse...")
                    wrapMode: Text.WordWrap
                    color: "#333333"
                    font.pixelSize: 12
                }
            }
        }

        // Message informatif si backend non disponible
        Rectangle {
            width: parent.width
            height: backendWarning.height + 12
            color: typeof backend === 'undefined' ? "#fff3cd" : "transparent"
            border.color: typeof backend === 'undefined' ? "#ffc107" : "transparent"
            border.width: 1
            radius: 4
            visible: typeof backend === 'undefined'

            Text {
                id: backendWarning
                anchors.centerIn: parent
                text: qsTr("⚠ Backend Python non disponible")
                color: "#856404"
                font.pixelSize: 11
            }
        }
    }

    // Branchement sur le signal Python messageToQml
    Connections {
        target: typeof backend !== 'undefined' ? backend : null
        
        function onMessageToQml(msg) {
            // Validation défensive du paramètre
            var m = (typeof msg !== 'undefined' && msg !== null) ? String(msg) : qsTr("(sans contenu)")
            response.text = m
            // Feedback auditif optionnel : console.log("[QML] Signal reçu :", m)
        }
    }
}
