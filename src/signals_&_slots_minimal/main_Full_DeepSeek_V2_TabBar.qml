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
    height: 700
    visible: true
    title: qsTr("Constat Impact Solution (CIS)")
    color: "#f0f0f0"
    
    // Header avec titre et description
    Column {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 20
        spacing: 8
        
        Text {
            width: parent.width
            text: qsTr("Méthode Constat Impact Solution")
            font.pixelSize: 20
            font.bold: true
            color: "#2c3e50"
        }
        
        Text {
            width: parent.width
            wrapMode: Text.WordWrap
            text: qsTr("Approche structurée en 3 étapes pour analyser un problème et proposer une réponse organisée et persuasive. Elle transforme une observation en plan d'action.")
            font.pixelSize: 12
            color: "#34495e"
            lineHeight: 1.4
        }
    }
    
    // TabBar pour les 3 étapes
    TabBar {
        id: tabBar
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        
        background: Rectangle {
            color: "#ffffff"
            radius: 8
            border.color: "#dee2e6"
            border.width: 1
        }
        
        TabButton {
            text: qsTr("1. CONSTAT")
            width: implicitWidth
            leftPadding: 20
            rightPadding: 20
            
            background: Rectangle {
                color: parent.checked ? "#3498db" : "transparent"
                radius: parent.checked ? 8 : 0
                
                Rectangle {
                    width: 24
                    height: 24
                    radius: 12
                    color: parent.parent.checked ? "white" : "#3498db"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    
                    Text {
                        anchors.centerIn: parent
                        text: "1"
                        font.pixelSize: 12
                        font.bold: true
                        color: parent.parent.checked ? "#3498db" : "white"
                    }
                }
            }
            
            contentItem: Text {
                text: parent.text
                font.pixelSize: 14
                font.bold: parent.checked
                color: parent.checked ? "white" : "#2c3e50"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: 30
            }
        }
        
        TabButton {
            text: qsTr("2. IMPACT")
            width: implicitWidth
            leftPadding: 20
            rightPadding: 20
            
            background: Rectangle {
                color: parent.checked ? "#e74c3c" : "transparent"
                radius: parent.checked ? 8 : 0
                
                Rectangle {
                    width: 24
                    height: 24
                    radius: 12
                    color: parent.parent.checked ? "white" : "#e74c3c"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    
                    Text {
                        anchors.centerIn: parent
                        text: "2"
                        font.pixelSize: 12
                        font.bold: true
                        color: parent.parent.checked ? "#e74c3c" : "white"
                    }
                }
            }
            
            contentItem: Text {
                text: parent.text
                font.pixelSize: 14
                font.bold: parent.checked
                color: parent.checked ? "white" : "#2c3e50"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: 30
            }
        }
        
        TabButton {
            text: qsTr("3. SOLUTION")
            width: implicitWidth
            leftPadding: 20
            rightPadding: 20
            
            background: Rectangle {
                color: parent.checked ? "#2ecc71" : "transparent"
                radius: parent.checked ? 8 : 0
                
                Rectangle {
                    width: 24
                    height: 24
                    radius: 12
                    color: parent.parent.checked ? "white" : "#2ecc71"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    
                    Text {
                        anchors.centerIn: parent
                        text: "3"
                        font.pixelSize: 12
                        font.bold: true
                        color: parent.parent.checked ? "#2ecc71" : "white"
                    }
                }
            }
            
            contentItem: Text {
                text: parent.text
                font.pixelSize: 14
                font.bold: parent.checked
                color: parent.checked ? "white" : "#2c3e50"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                leftPadding: 30
            }
        }
    }
    
    // SwipeView pour afficher le contenu de chaque onglet (remplace StackLayout)
    SwipeView {
        id: swipeView
        anchors.top: tabBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top
        anchors.margins: 20
        anchors.topMargin: 10
        currentIndex: tabBar.currentIndex
        interactive: false  // Désactive le swipe pour navigation manuelle seulement
        
        // Synchronisation TabBar <-> SwipeView
        onCurrentIndexChanged: tabBar.currentIndex = currentIndex
        
        // === PAGE 1 : CONSTAT ===
        Item {
            id: constatPage
            
            Flickable {
                anchors.fill: parent
                contentHeight: constatColumn.height
                clip: true
                
                Column {
                    id: constatColumn
                    width: parent.width
                    spacing: 16
                    
                    Rectangle {
                        width: parent.width
                        height: constatContent.height + 32
                        color: "#ffffff"
                        radius: 8
                        border.color: "#3498db"
                        border.width: 2
                        
                        Column {
                            id: constatContent
                            width: parent.width - 24
                            anchors.centerIn: parent
                            spacing: 12
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Établir un diagnostic factuel, neutre et vérifiable.")
                                font.pixelSize: 13
                                color: "#34495e"
                                font.italic: true
                            }
                            
                            Column {
                                width: parent.width
                                spacing: 6
                                
                                Text {
                                    text: qsTr("Saisir votre constat (max 500 caractères) :")
                                    font.pixelSize: 12
                                    color: "#666666"
                                    font.bold: true
                                }
                                
                                TextArea {
                                    id: constatInput
                                    placeholderText: qsTr("Ex: Les ventes du produit X ont baissé de 15% ce trimestre...")
                                    width: parent.width
                                    height: 150
                                    wrapMode: TextArea.Wrap
                                    selectByMouse: true
                                    color: "#333333"
                                    font.pixelSize: 12
                                    
                                    background: Rectangle {
                                        border.color: constatInput.length > 500 ? "#ff6b6b" : (constatInput.focus ? "#3498db" : "#cccccc")
                                        border.width: 1
                                        radius: 4
                                        color: "#ffffff"
                                    }
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: 10
                                    
                                    Text {
                                        text: qsTr("%1 / 500").arg(constatInput.length)
                                        font.pixelSize: 11
                                        color: constatInput.length > 500 ? "#ff6b6b" : "#999999"
                                    }
                                    
                                    Text {
                                        text: constatInput.length > 500 ? qsTr("⚠ Trop long !") : ""
                                        font.pixelSize: 11
                                        color: "#ff6b6b"
                                        font.bold: true
                                    }
                                }
                            }
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Conseil : Soyez factuel, évitez les jugements. Utilisez des chiffres et des faits vérifiables.")
                                font.pixelSize: 11
                                color: "#7f8c8d"
                                font.italic: true
                            }
                        }
                    }
                    
                    // Navigation entre pages
                    Row {
                        width: parent.width
                        spacing: 10
                        layoutDirection: Qt.RightToLeft
                        
                        Button {
                            text: qsTr("Suivant →")
                            onClicked: swipeView.currentIndex = 1
                            
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
                        }
                    }
                }
                
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AsNeeded
                    width: 6
                }
            }
        }
        
        // === PAGE 2 : IMPACT ===
        Item {
            id: impactPage
            
            Flickable {
                anchors.fill: parent
                contentHeight: impactColumn.height
                clip: true
                
                Column {
                    id: impactColumn
                    width: parent.width
                    spacing: 16
                    
                    Rectangle {
                        width: parent.width
                        height: impactContent.height + 32
                        color: "#ffffff"
                        radius: 8
                        border.color: "#e74c3c"
                        border.width: 2
                        
                        Column {
                            id: impactContent
                            width: parent.width - 24
                            anchors.centerIn: parent
                            spacing: 12
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Analyser les conséquences et implications du constat.")
                                font.pixelSize: 13
                                color: "#34495e"
                                font.italic: true
                            }
                            
                            Column {
                                width: parent.width
                                spacing: 6
                                
                                Text {
                                    text: qsTr("Décrire les impacts (max 500 caractères) :")
                                    font.pixelSize: 12
                                    color: "#666666"
                                    font.bold: true
                                }
                                
                                TextArea {
                                    id: impactInput
                                    placeholderText: qsTr("Ex: Cette baisse affecte notre part de marché de 5% et réduit la marge bénéficiaire...")
                                    width: parent.width
                                    height: 120
                                    wrapMode: TextArea.Wrap
                                    selectByMouse: true
                                    color: "#333333"
                                    font.pixelSize: 12
                                    
                                    background: Rectangle {
                                        border.color: impactInput.length > 500 ? "#ff6b6b" : (impactInput.focus ? "#e74c3c" : "#cccccc")
                                        border.width: 1
                                        radius: 4
                                        color: "#ffffff"
                                    }
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: 10
                                    
                                    Text {
                                        text: qsTr("%1 / 500").arg(impactInput.length)
                                        font.pixelSize: 11
                                        color: impactInput.length > 500 ? "#ff6b6b" : "#999999"
                                    }
                                    
                                    Text {
                                        text: impactInput.length > 500 ? qsTr("⚠ Trop long !") : ""
                                        font.pixelSize: 11
                                        color: "#ff6b6b"
                                        font.bold: true
                                    }
                                }
                            }
                            
                            Column {
                                width: parent.width
                                spacing: 8
                                
                                Text {
                                    text: qsTr("Types d'impact concernés :")
                                    font.pixelSize: 12
                                    color: "#666666"
                                    font.bold: true
                                }
                                
                                Grid {
                                    width: parent.width
                                    columns: 2
                                    spacing: 10
                                    
                                    CheckBox {
                                        text: qsTr("📊 Financier")
                                        checked: true
                                        font.pixelSize: 12
                                    }
                                    CheckBox {
                                        text: qsTr("⚙️ Opérationnel")
                                        font.pixelSize: 12
                                    }
                                    CheckBox {
                                        text: qsTr("📈 Commercial")
                                        font.pixelSize: 12
                                    }
                                    CheckBox {
                                        text: qsTr("⭐ Réputation")
                                        font.pixelSize: 12
                                    }
                                    CheckBox {
                                        text: qsTr("⚖️ Juridique")
                                        font.pixelSize: 12
                                    }
                                    CheckBox {
                                        text: qsTr("🔒 Sécurité")
                                        font.pixelSize: 12
                                    }
                                }
                            }
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Conseil : Identifiez les impacts directs et indirects. Pensez aux conséquences à court, moyen et long terme.")
                                font.pixelSize: 11
                                color: "#7f8c8d"
                                font.italic: true
                            }
                        }
                    }
                    
                    // Navigation entre pages
                    Row {
                        width: parent.width
                        spacing: 10
                        
                        Button {
                            text: qsTr("← Précédent")
                            onClicked: swipeView.currentIndex = 0
                            
                            background: Rectangle {
                                color: parent.down ? "#95a5a6" : (parent.hovered ? "#7f8c8d" : "#95a5a6")
                                radius: 4
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                            }
                        }
                        
                        Item { width: parent.width - 200; height: 1 }  // Spacer
                        
                        Button {
                            text: qsTr("Suivant →")
                            onClicked: swipeView.currentIndex = 2
                            
                            background: Rectangle {
                                color: parent.down ? "#e74c3c" : (parent.hovered ? "#c0392b" : "#e74c3c")
                                radius: 4
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                            }
                        }
                    }
                }
                
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AsNeeded
                    width: 6
                }
            }
        }
        
        // === PAGE 3 : SOLUTION ===
        Item {
            id: solutionPage
            
            Flickable {
                anchors.fill: parent
                contentHeight: solutionColumn.height
                clip: true
                
                Column {
                    id: solutionColumn
                    width: parent.width
                    spacing: 16
                    
                    Rectangle {
                        width: parent.width
                        height: solutionContent.height + 32
                        color: "#ffffff"
                        radius: 8
                        border.color: "#2ecc71"
                        border.width: 2
                        
                        Column {
                            id: solutionContent
                            width: parent.width - 24
                            anchors.centerIn: parent
                            spacing: 12
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Proposer des actions concrètes et réalisables pour résoudre le problème.")
                                font.pixelSize: 13
                                color: "#34495e"
                                font.italic: true
                            }
                            
                            Column {
                                width: parent.width
                                spacing: 6
                                
                                Text {
                                    text: qsTr("Proposer vos solutions (max 500 caractères) :")
                                    font.pixelSize: 12
                                    color: "#666666"
                                    font.bold: true
                                }
                                
                                TextArea {
                                    id: solutionInput
                                    placeholderText: qsTr("Ex: 1. Lancer une campagne promotionnelle ciblée...\n2. Améliorer le produit sur les points A et B...\n3. Former l'équipe commerciale...")
                                    width: parent.width
                                    height: 140
                                    wrapMode: TextArea.Wrap
                                    selectByMouse: true
                                    color: "#333333"
                                    font.pixelSize: 12
                                    
                                    background: Rectangle {
                                        border.color: solutionInput.length > 500 ? "#ff6b6b" : (solutionInput.focus ? "#2ecc71" : "#cccccc")
                                        border.width: 1
                                        radius: 4
                                        color: "#ffffff"
                                    }
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: 10
                                    
                                    Text {
                                        text: qsTr("%1 / 500").arg(solutionInput.length)
                                        font.pixelSize: 11
                                        color: solutionInput.length > 500 ? "#ff6b6b" : "#999999"
                                    }
                                    
                                    Text {
                                        text: solutionInput.length > 500 ? qsTr("⚠ Trop long !") : ""
                                        font.pixelSize: 11
                                        color: "#ff6b6b"
                                        font.bold: true
                                    }
                                }
                            }
                            
                            Column {
                                width: parent.width
                                spacing: 8
                                
                                Text {
                                    text: qsTr("Paramètres de mise en œuvre :")
                                    font.pixelSize: 12
                                    color: "#666666"
                                    font.bold: true
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: 20
                                    
                                    Column {
                                        width: (parent.width - 20) / 2
                                        spacing: 6
                                        
                                        Text {
                                            text: qsTr("Priorité :")
                                            font.pixelSize: 11
                                            color: "#666666"
                                        }
                                        
                                        ComboBox {
                                            width: parent.width
                                            model: [qsTr("🔴 Haute"), qsTr("🟡 Moyenne"), qsTr("🟢 Basse")]
                                            currentIndex: 0
                                            font.pixelSize: 12
                                        }
                                    }
                                    
                                    Column {
                                        width: (parent.width - 20) / 2
                                        spacing: 6
                                        
                                        Text {
                                            text: qsTr("Échéance :")
                                            font.pixelSize: 11
                                            color: "#666666"
                                        }
                                        
                                        TextField {
                                            id: echeanceField
                                            width: parent.width
                                            placeholderText: qsTr("JJ/MM/AAAA")
                                            font.pixelSize: 12
                                            
                                            background: Rectangle {
                                                border.color: parent.focus ? "#2ecc71" : "#cccccc"
                                                border.width: 1
                                                radius: 4
                                                color: "#ffffff"
                                            }
                                            
                                            onTextChanged: {
                                                if (text.length === 10) {
                                                    var parts = text.split('/');
                                                    if (parts.length === 3) {
                                                        var jour = parseInt(parts[0]);
                                                        var mois = parseInt(parts[1]);
                                                        var annee = parseInt(parts[2]);
                                                        
                                                        var isValid = (jour >= 1 && jour <= 31) &&
                                                                     (mois >= 1 && mois <= 12) &&
                                                                     (annee >= 1900 && annee <= 2100);
                                                        
                                                        if (!isValid) {
                                                            console.log("Date invalide");
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Text {
                                width: parent.width
                                wrapMode: Text.WordWrap
                                text: qsTr("Conseil : Proposez des actions SMART (Spécifiques, Mesurables, Atteignables, Réalistes, Temporellement définies).")
                                font.pixelSize: 11
                                color: "#7f8c8d"
                                font.italic: true
                            }
                        }
                    }
                    
                    // Navigation entre pages
                    Row {
                        width: parent.width
                        spacing: 10
                        
                        Button {
                            text: qsTr("← Précédent")
                            onClicked: swipeView.currentIndex = 1
                            
                            background: Rectangle {
                                color: parent.down ? "#95a5a6" : (parent.hovered ? "#7f8c8d" : "#95a5a6")
                                radius: 4
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                            }
                        }
                    }
                }
                
                ScrollBar.vertical: ScrollBar {
                    policy: ScrollBar.AsNeeded
                    width: 6
                }
            }
        }
    }
    
    // Footer avec métriques et boutons
    Rectangle {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 160
        color: "#ffffff"
        border.color: "#dee2e6"
        border.width: 1
        
        Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12
            
            // Métriques
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
                                    return qsTr("✅ Complet")
                                } else if (constatInput.length > 0 || impactInput.length > 0 || solutionInput.length > 0) {
                                    return qsTr("🟡 En cours")
                                } else {
                                    return qsTr("🔴 Vide")
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
            
            // Boutons d'action
            Row {
                width: parent.width
                spacing: 12
                
                Button {
                    text: qsTr("↺ Réinitialiser")
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
                        swipeView.currentIndex = 0
                        tabBar.currentIndex = 0
                    }
                }
                
                Button {
                    text: qsTr("💾 Enregistrer")
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
                    text: qsTr("📄 Générer rapport")
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
        }
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