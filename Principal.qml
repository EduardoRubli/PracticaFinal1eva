import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

Page {
    id: principal
    anchors.fill: parent
    width: 640
    height: 480

    signal agregar()
    signal verGastos()
    property real totalGastos: 250
    property real presupuesto: 1000

    Column {
        id: column
        anchors.centerIn: parent
        width: 200
        height: 250

        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: rectangle
            width: parent.width
            height: titulo.height + 20
            color: "lightgrey"
            anchors.top: parent.top
            anchors.bottom: listView.top
            anchors.topMargin: -35
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                id: titulo
                text: "GESTIÓN DE PRESUPUESTO"
                anchors.top: parent.top
                anchors.topMargin: 5
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                }

            Text {
                text: "Eduardo Rubli Castañeira"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


        Rectangle {
            id: grafica
            anchors.fill: parent
            color: "lightblue"
            border.color: "blue"
            border.width: 2

            Text {
                anchors.centerIn: parent
                text: "Gastos: " + principal.totalGastos.toFixed(2) +
                      "\nRestante: " + (principal.presupuesto - principal.totalGastos).toFixed(2)
                font.pixelSize: 20
                font.bold: true
            }
        }

        Row {
            id: row
            spacing: 10
            height: 60
            width: parent.width
            anchors.top: grafica.bottom
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                color: "lightgrey"
                anchors.fill: parent
            }
            Button {
                id: vergastos
                width: 120
                height: 36
                text: "Ver lista de gastos"
                onClicked: principal.verGastos()
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            RoundButton {
                id: anyadirgasto
                width: 40
                height: 40
                text: "+"
                onClicked: principal.agregar()
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 15
                highlighted: true           
            }
        }
    }
}
