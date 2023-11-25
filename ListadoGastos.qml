import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: listado
    anchors.fill: parent
    width: 640
    height: 480

    signal atras()
    signal anyadir(bool edicion, int indice)
    signal borrar(int indice)
    property alias modelo: listView.model

    Column {
        id: column
        anchors.centerIn: parent
        width: 200
        height: 250
        spacing: 10

        Rectangle {
            id: grafica
            anchors.fill: parent
            border.color: "blue"
            border.width: 2
        }

        Rectangle {
            id: rectangle
            width: parent.width
            height: titulo.height + 10
            color: "lightgrey"
            anchors.bottom: listView.top
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: titulo
                height: 20
                text: "LISTA DE GASTOS"
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        ListView {
            id: listView
            width: parent.width
            height: parent.height - 50
            anchors.top: titulo.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 37
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            currentIndex: -1

            model: ListModel {
                ListElement {
                    descripcion: "Descripción"
                    valor: "Valor"
                }
            }
            delegate: Item {
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    color: "lightblue"
                    anchors.fill: parent
                }

                Row {
                    id: rowl
                    spacing: 5
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        text: descripcion + " : "
                        anchors.verticalCenter: parent.verticalCenter

                        font.bold: true
                    }

                    Text {
                        text: valor
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: listView.currentIndex = index
                }
            }
        }

        Rectangle {
            id: rectangle1
            width: parent.width
            height: 45 // Ajusta según sea necesario
            color: "lightgrey"
            anchors.bottom: parent.bottom

            Row {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    id: editar
                    width: 56
                    height: 36
                    text: qsTr("Editar")
                    onClicked: {
                        var currentIndex = listView.currentIndex
                        listado.anyadir(true, currentIndex)
                    }
                }

                Button {
                    id: borrar
                    width: 56
                    height: 36
                    text: qsTr("Borrar")
                    onClicked: {
                        var currentIndex = listView.currentIndex
                        if (currentIndex >= 0) {
                            listado.borrar(currentIndex)
                        }
                    }
                }
            }
        }
        Rectangle {
            id: rectangle2
            width: parent.width
            height: 45
            color: "lightgreen"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -45

            Button {
                id: button
                text: "Atrás"
                width: 40
                height: 36
                onClicked: listado.atras()
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 48
            }

            RoundButton {
                id: roundButton
                text: "+"
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 48
                onClicked: anyadir(false, 0)
            }

        }
    }
}
