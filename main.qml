import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Gestión de presupuesto")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Principal {
            anchors.fill: parent
            onAgregar: stackView.push(formulario, {})
            onVerGastos: stackView.push(listado, {})
        }
    }

    Component {
        id: principal
            Principal {
        }
    }

    Component {
        id: formulario
        Formulario {
            function validarNumero(valor) {
                return !isNaN(parseFloat(valor)) && isFinite(valor)
            }

            onCerrar: stackView.pop()
            onEnviar: (descripcion, valor, editando, indice) => {

                var esNumero = validarNumero(valor)

                if (editando) {
                    modeloPrincipal.set(indice, {descripcion: descripcion, valor: valor})
                } else {
                    modeloPrincipal.append({descripcion: descripcion, valor: valor})
                }
                    if (esNumero) {
                        // Obtener el valor numérico
                        var valorNumerico = parseFloat(valor)
                        //principal.totalGastos += valorNumerico
                    }
                stackView.pop()
            }
        }
    }

    Component {
        id: listado
        ListadoGastos {
            anchors.fill: parent
            modelo: modeloPrincipal
            onAtras: stackView.pop()
            onBorrar: indice => {
                    modeloPrincipal.remove(indice)
            }
            onAnyadir: (editando, indice) => {
                                       if (editando) {
                                           stackView.push(formulario, {
                                                              "edicion": editando,
                                                              "indice": indice,
                                                              "datoDescripcion": modeloPrincipal.get(
                                                                                indice).descripcion,
                                                              "datoValor": modeloPrincipal.get(
                                                                               indice).valor
                                                          })
                                       } else {

                                           stackView.push(formulario, {
                                                              "edicion": editando,
                                                              "indice": indice,
                                                              "datoDescripcion": "",
                                                              "datoValor": ""
                                                          })
                                       }
                                   }
        }
    }

    ListModel {
        id: modeloPrincipal
        ListElement {
            descripcion: "Descripción"
            valor: "Valor"
        }
    }
}
