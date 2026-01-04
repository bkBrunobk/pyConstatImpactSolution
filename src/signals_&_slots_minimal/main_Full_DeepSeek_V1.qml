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
    height: 850  // Augmenté pour accommoder les nouvelles sections
    visible: true
    title: qsTr("Constat Impact Solution (CIS)")
    color: "#f0f0f0"

    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 16
        contentHeight: contentColumn.height
        clip: true
        
        Column {
            id: contentColumn
            width: parent.width
            spacing: 24

            // Titre
            Text {
                width: parent.width
                text: qsTr("Méthode Constat Impact Solution")
                font.pixelSize: 16
                font.bold: true
                color: "#2c3e50"
            }
            
            // Description courte
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                text: qsTr("Approche structurée en 3 étapes pour analyser un problème et proposer une réponse organisée et persuasive.\nElle transforme une observation en plan d'action.")
                font.pixelSize: 12
                color: "#34495e"
                lineHeight: 1.4
            }

            // === ÉTAPE 1 : CONSTAT ===
            Rectangle {
                width: parent.width
                height: step1Column.height + 24
                color: "#ffffff"
                radius: 8
                border.color: "#3498db"
                border.width: 2
                
                Column {
                    id: step1Column
                    width: parent.width - 24
                    anchors.centerIn: parent
                    spacing: 8
                    
                    // Titre étape 1
                    Row {
                        width: parent.width
                        spacing: 8
                        
                        Rectangle {
                            width: 24
                            height: 24
                            radius: 12
                            color: "#3498db"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "1"
                                font.pixelSize: 12
                                font.bold: true
                                color: "white"
                            }
                        }
                        
                        Text {
                            text: qsTr("CONSTAT")
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2c3e50"
                            verticalAlignment: Text.AlignVCenter
                            height: 24
                        }
                    }
                    
                    // Description étape 1
                    Text {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: qsTr("Établir un diagnostic factuel, neutre et vérifiable.")
                        font.pixelSize: 12
                        color: "#34495e"
                        font.italic: true
                    }
                    
                    // Champ pour saisir le constat
                    Column {
                        width: parent.width
                        spacing: 4
                        
                        Text {
                            text: qsTr("Saisir votre constat (max 500 caractères) :")
                            font.pixelSize: 11
                            color: "#666666"
                        }
                        
                        TextArea {
                            id: constatInput
                            placeholderText: qsTr("Ex: Les ventes du produit X ont baissé de 15% ce trimestre...")
                            width: parent.width
                            height: 120
                            wrapMode: TextArea.Wrap
                            selectByMouse: true
                            color: "#333333"
                            
                            // Feedback visuel si champ invalide
                            background: Rectangle {
                                border.color: constatInput.length > 500 ? "#ff6b6b" : (constatInput.focus ? "#3498db" : "#cccccc")
                                border.width: 1
                                radius: 4
                                color: "#ffffff"
                            }
                        }
                        
                        // Compteur de caractères
                        Text {
                            text: qsTr("%1 / 500").arg(constatInput.length)
                            font.pixelSize: 10
                            color: constatInput.length > 500 ? "#ff6b6b" : "#999999"
                            anchors.right: parent.right
                        }
                    }
                }
            }

            // === ÉTAPE 2 : IMPACT ===
            Rectangle {
                width: parent.width
                height: step2Column.height + 24
                color: "#ffffff"
                radius: 8
                border.color: "#e74c3c"
                border.width: 2
                
                Column {
                    id: step2Column
                    width: parent.width - 24
                    anchors.centerIn: parent
                    spacing: 8
                    
                    // Titre étape 2
                    Row {
                        width: parent.width
                        spacing: 8
                        
                        Rectangle {
                            width: 24
                            height: 24
                            radius: 12
                            color: "#e74c3c"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "2"
                                font.pixelSize: 12
                                font.bold: true
                                color: "white"
                            }
                        }
                        
                        Text {
                            text: qsTr("IMPACT")
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2c3e50"
                            verticalAlignment: Text.AlignVCenter
                            height: 24
                        }
                    }
                    
                    // Description étape 2
                    Text {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: qsTr("Analyser les conséquences et implications du constat.")
                        font.pixelSize: 12
                        color: "#34495e"
                        font.italic: true
                    }
                    
                    // Champ pour saisir l'impact
                    Column {
                        width: parent.width
                        spacing: 4
                        
                        Text {
                            text: qsTr("Décrire les impacts (max 500 caractères) :")
                            font.pixelSize: 11
                            color: "#666666"
                        }
                        
                        TextArea {
                            id: impactInput
                            placeholderText: qsTr("Ex: Cette baisse affecte notre part de marché de 5% et réduit la marge bénéficiaire...")
                            width: parent.width
                            height: 120
                            wrapMode: TextArea.Wrap
                            selectByMouse: true
                            color: "#333333"
                            
                            // Feedback visuel si champ invalide
                            background: Rectangle {
                                border.color: impactInput.length > 500 ? "#ff6b6b" : (impactInput.focus ? "#e74c3c" : "#cccccc")
                                border.width: 1
                                radius: 4
                                color: "#ffffff"
                            }
                        }
                        
                        // Compteur de caractères
                        Text {
                            text: qsTr("%1 / 500").arg(impactInput.length)
                            font.pixelSize: 10
                            color: impactInput.length > 500 ? "#ff6b6b" : "#999999"
                            anchors.right: parent.right
                        }
                    }
                    
                    // Types d'impacts (checkboxes)
                    Column {
                        width: parent.width
                        spacing: 6
                        
                        Text {
                            text: qsTr("Types d'impact concernés :")
                            font.pixelSize: 11
                            color: "#666666"
                        }
                        
                        Grid {
                            width: parent.width
                            columns: 2
                            spacing: 8
                            
                            CheckBox {
                                text: qsTr("Financier")
                                checked: true
                            }
                            CheckBox {
                                text: qsTr("Opérationnel")
                            }
                            CheckBox {
                                text: qsTr("Commercial")
                            }
                            CheckBox {
                                text: qsTr("Réputation")
                            }
                            CheckBox {
                                text: qsTr("Juridique")
                            }
                            CheckBox {
                                text: qsTr("Sécurité")
                            }
                        }
                    }
                }
            }

            // === ÉTAPE 3 : SOLUTION ===
            Rectangle {
                width: parent.width
                height: step3Column.height + 24
                color: "#ffffff"
                radius: 8
                border.color: "#2ecc71"
                border.width: 2
                
                Column {
                    id: step3Column
                    width: parent.width - 24
                    anchors.centerIn: parent
                    spacing: 8
                    
                    // Titre étape 3
                    Row {
                        width: parent.width
                        spacing: 8
                        
                        Rectangle {
                            width: 24
                            height: 24
                            radius: 12
                            color: "#2ecc71"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "3"
                                font.pixelSize: 12
                                font.bold: true
                                color: "white"
                            }
                        }
                        
                        Text {
                            text: qsTr("SOLUTION")
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2c3e50"
                            verticalAlignment: Text.AlignVCenter
                            height: 24
                        }
                    }
                    
                    // Description étape 3
                    Text {
                        width: parent.width
                        wrapMode: Text.WordWrap
                        text: qsTr("Proposer des actions concrètes et réalisables pour résoudre le problème.")
                        font.pixelSize: 12
                        color: "#34495e"
                        font.italic: true
                    }
                    
                    // Champ pour saisir la solution
                    Column {
                        width: parent.width
                        spacing: 4
                        
                        Text {
                            text: qsTr("Proposer vos solutions (max 500 caractères) :")
                            font.pixelSize: 11
                            color: "#666666"
                        }
                        
                        TextArea {
                            id: solutionInput
                            placeholderText: qsTr("Ex: 1. Lancer une campagne promotionnelle ciblée...\n2. Améliorer le produit sur les points A et B...\n3. Former l'équipe commerciale...")
                            width: parent.width
                            height: 140
                            wrapMode: TextArea.Wrap
                            selectByMouse: true
                            color: "#333333"
                            
                            // Feedback visuel si champ invalide
                            background: Rectangle {
                                border.color: solutionInput.length > 500 ? "#ff6b6b" : (solutionInput.focus ? "#2ecc71" : "#cccccc")
                                border.width: 1
                                radius: 4
                                color: "#ffffff"
                            }
                        }
                        
                        // Compteur de caractères
                        Text {
                            text: qsTr("%1 / 500").arg(solutionInput.length)
                            font.pixelSize: 10
                            color: solutionInput.length > 500 ? "#ff6b6b" : "#999999"
                            anchors.right: parent.right
                        }
                    }
                    
                    // Priorité et échéance
                    Row {
                        width: parent.width
                        spacing: 16
                        
                        Column {
                            width: (parent.width - 16) / 2
                            spacing: 4
                            
                            Text {
                                text: qsTr("Priorité :")
                                font.pixelSize: 11
                                color: "#666666"
                            }
                            
                            ComboBox {
                                width: parent.width
                                model: [qsTr("Haute"), qsTr("Moyenne"), qsTr("Basse")]
                                currentIndex: 0
                            }
                        }
                        
                        Column {
                            width: (parent.width - 16) / 2
                            spacing: 4
                            
                            Text {
                                text: qsTr("Échéance :")
                                font.pixelSize: 11
                                color: "#666666"
                            }
                            
                            TextField {
                                id: echeanceField
                                width: parent.width
                                placeholderText: qsTr("JJ/MM/AAAA")
                                
                                // Validation simple sans RegExpValidator
                                onTextChanged: {
                                    // Validation basique de la date
                                    if (text.length === 10) {
                                        var parts = text.split('/');
                                        if (parts.length === 3) {
                                            var jour = parseInt(parts[0]);
                                            var mois = parseInt(parts[1]);
                                            var annee = parseInt(parts[2]);
                                            
                                            // Validation simple
                                            var isValid = (jour >= 1 && jour <= 31) &&
                                                         (mois >= 1 && mois <= 12) &&
                                                         (annee >= 1900 && annee <= 2100);
                                            
                                            if (!isValid) {
                                                console.log("Date invalide");
                                                // Tu peux ajouter un feedback visuel ici
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // === BOUTONS D'ACTION ===
            Row {
                width: parent.width
                spacing: 12
                padding: 8
                
                Button {
                    text: qsTr("Réinitialiser")
                    width: (parent.width - 24) / 3
                    height: 40
                    
                    background: Rectangle {
                        color: parent.down ? "#bdc3c7" : (parent.hovered ? "#ecf0f1" : "#ffffff")
                        border.color: "#95a5a6"
                        border.width: 1
                        radius: 4
                    }
                    
                    onClicked: {
                        constatInput.text = ""
                        impactInput.text = ""
                        solutionInput.text = ""
                        echeanceField.text = ""
                    }
                }
                
                Button {
                    text: qsTr("Enregistrer brouillon")
                    width: (parent.width - 24) / 3
                    height: 40
                    
                    background: Rectangle {
                        color: parent.down ? "#3498db" : (parent.hovered ? "#2980b9" : "#3498db")
                        radius: 4
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
                    
                    onClicked: {
                        console.log("Brouillon enregistré")
                        // TODO: Implémenter sauvegarde
                    }
                }
                
                Button {
                    text: qsTr("Générer rapport")
                    width: (parent.width - 24) / 3
                    height: 40
                    enabled: constatInput.length > 0 && impactInput.length > 0 && solutionInput.length > 0
                    
                    background: Rectangle {
                        color: parent.enabled ? (parent.down ? "#27ae60" : (parent.hovered ? "#229954" : "#2ecc71")) : "#bdc3c7"
                        radius: 4
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
                    
                    onClicked: {
                        console.log("Génération du rapport CIS")
                        // TODO: Implémenter génération rapport
                        if (typeof backend !== 'undefined' && backend) {
                            backend.generate_cis_report(
                                constatInput.text,
                                impactInput.text,
                                solutionInput.text
                            )
                        }
                    }
                }
            }
            
            // === MÉTRICS / STATUT ===
            Rectangle {
                width: parent.width
                height: 60
                color: "#f8f9fa"
                radius: 6
                border.color: "#dee2e6"
                border.width: 1
                
                Row {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 16
                    
                    Column {
                        width: (parent.width - 32) / 3
                        spacing: 2
                        
                        Text {
                            text: qsTr("Complétude")
                            font.pixelSize: 10
                            color: "#666666"
                        }
                        
                        Text {
                            text: {
                                var filled = 0;
                                if (constatInput.length > 0) filled++;
                                if (impactInput.length > 0) filled++;
                                if (solutionInput.length > 0) filled++;
                                return Math.round((filled / 3) * 100) + "%"
                            }
                            font.pixelSize: 16
                            font.bold: true
                            color: "#2ecc71"
                        }
                    }
                    
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#dee2e6"
                    }
                    
                    Column {
                        width: (parent.width - 32) / 3
                        spacing: 2
                        
                        Text {
                            text: qsTr("Caractères total")
                            font.pixelSize: 10
                            color: "#666666"
                        }
                        
                        Text {
                            text: (constatInput.length + impactInput.length + solutionInput.length).toString()
                            font.pixelSize: 16
                            font.bold: true
                            color: "#3498db"
                        }
                    }
                    
                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#dee2e6"
                    }
                    
                    Column {
                        width: (parent.width - 32) / 3
                        spacing: 2
                        
                        Text {
                            text: qsTr("Statut")
                            font.pixelSize: 10
                            color: "#666666"
                        }
                        
                        Text {
                            text: {
                                if (constatInput.length > 0 && impactInput.length > 0 && solutionInput.length > 0) {
                                    return qsTr("Complet")
                                } else if (constatInput.length > 0 || impactInput.length > 0 || solutionInput.length > 0) {
                                    return qsTr("En cours")
                                } else {
                                    return qsTr("Vide")
                                }
                            }
                            font.pixelSize: 16
                            font.bold: true
                            color: {
                                if (constatInput.length > 0 && impactInput.length > 0 && solutionInput.length > 0) {
                                    return "#2ecc71"
                                } else if (constatInput.length > 0 || impactInput.length > 0 || solutionInput.length > 0) {
                                    return "#f39c12"
                                } else {
                                    return "#e74c3c"
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Barre de défilement
    ScrollBar.vertical: ScrollBar {
        id: scrollBar
        policy: ScrollBar.AsNeeded
        width: 8
    }

    // === CONNECTIONS POUR BACKEND PYTHON ===
    /*
    // Décommente quand backend Python sera disponible
    Connections {
        target: typeof backend !== 'undefined' ? backend : null
        
        function onReportGenerated(reportData) {
            console.log("Rapport généré :", reportData)
            // Afficher le rapport ou l'exporter
        }
    }
    */
}