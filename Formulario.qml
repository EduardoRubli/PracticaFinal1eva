import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: formulario
    property bool edicion
    property int indice
    property string datoDescripcion
    property string datoValor
    signal cerrar()
    signal enviar(string descripcion, string valor, bool editando, int indice)

    function enviarFormulario() {
        if (descripcion.text.trim() !== "" || valor.text.trim() !== "") {
                    formulario.enviar(descripcion.text, valor.text, formulario.edicion, formulario.indice);
                } else {
                    console.warn("Los campos no pueden estar vacíos. Por favor, ingresa valores válidos.");
                }
    }

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
                text: "FORMULARIO DE EDICIÓN"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                }
        }

        Rectangle {
            id: form
            anchors.fill: parent
            color: "lightblue"
            border.color: "blue"
            border.width: 2

            TextField {
                id: descripcion
                width: 99
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                text: formulario.datoDescripcion
                anchors.top: parent.top
                anchors.topMargin: 60
                onAccepted: formulario.enviarFormulario()
                placeholderText: qsTr("Descripción")
            }

            TextField {
                id: valor
                width: 99
                height: 30
                anchors.top: descripcion.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 5
                text: formulario.datoValor
                onAccepted: formulario.enviarFormulario()
                placeholderText: qsTr("Valor")
            }

            Row {
                id: rowBotones
                width: 132
                height: 60
                anchors.top: valor.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 5

                Button {
                    id: aceptar
                    height: 25
                    width: 99
                    text: qsTr("Aceptar")
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: formulario.enviarFormulario()
                }

                Button {
                    id: volver
                    height: 25
                    width: 99
                    text: qsTr("Volver")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: aceptar.bottom
                    onClicked: formulario.cerrar()
                }
            }
        }

        Row {
            id: row
            spacing: 10
            height: 60
            width: parent.width
            anchors.top: form.bottom
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                color: "lightgrey"
                anchors.fill: parent
            }

        }
    }
}
