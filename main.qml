import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Window
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int indexx: 0

    ListModel
    {
        id: contacts
        ListElement
        {
            firstName: "Андрей"
            lastName: "Балконский"
            phoneNumber: "8-999-081-812"
        }
        ListElement
        {
            firstName: "Иван"
            lastName: "Иванов"
            phoneNumber: "8-999-202-322"
        }
    }

    Component
    {
        id: personalData
        Rectangle
        {
            width: parent.width
            height: 40

            Text
            {
                text: lastName + " " + firstName + "\n" + phoneNumber
            }

            color: "skyblue"

            Image
            {
                width: 20
                height: 20

                id: pic
                source: "Icons/Icon_2.png"

                anchors.top: parent.top
                anchors.right: parent.right

                MouseArea
                {
                    anchors.fill: parent
                    onClicked: contacts.remove(index,1)
                }
            }

            Image
            {
                width: 20
                height: 20

                source: "Icons/Icon_1.png"

                anchors.top: parent.top
                anchors.right: pic.left

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        name.text = firstName
                        sure_name.text = lastName
                        number.text = phoneNumber

                        add.text = "Редактировать"

                        indexx = index
                    }
                }
            }
        }
    }

    ListView
    {
        spacing: 10

        width: parent.width / 3
        height: parent.height

        anchors.top: parent.top
        anchors.topMargin: 20

        anchors.left: parent.left
        anchors.leftMargin: 20

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        model: contacts
        delegate: personalData
    }

    Rectangle
    {
        anchors.top: parent.top
        anchors.topMargin: 20

        anchors.right: parent.right
        anchors.rightMargin: 20

        width: parent.width / 3
        height: parent.height / 3

        color: "skyblue"
        radius: 7

        Text
        {
            id: lable_1
            text: "Имя:"

            anchors.top: parent.top
            anchors.left: parent.left
        }

        Rectangle
        {
            width: parent.width
            height: 20

            anchors.top: lable_1.bottom

            id: field_1

            radius: 7
            border.color: "black"

            TextEdit
            {
                id: name

                anchors.left: parent.left
                anchors.leftMargin: 5

                text: "Введите имя."
            }
        }

        Text
        {
            id: lable_2
            text: "Фамилия:"

            anchors.top: field_1.bottom
            anchors.left: parent.left
        }

        Rectangle
        {
            width: parent.width
            height: 20

            anchors.top: lable_2.bottom

            id: field_2

            radius: 7
            border.color: "black"

            TextEdit
            {
                id: sure_name

                anchors.left: parent.left
                anchors.leftMargin: 5

                text: "Введите фамилию."
            }
        }

        Text
        {
            id: lable_3
            text: "Номер телефона:"

            anchors.top: field_2.bottom
            anchors.left: parent.left
        }

        Rectangle
        {
            width: parent.width
            height: 20

            anchors.top: lable_3.bottom

            id: field_3

            radius: 7
            border.color: "black"

            TextEdit
            {
                id: number

                anchors.left: parent.left
                anchors.leftMargin: 5

                text: "Введите номер."
            }
        }

        Button
        {
            id: add
            anchors.right: parent.right
            anchors.top: field_3.bottom

            text: "Добавить"

            onClicked: if (text == "Добавить")
                             {
                                contacts.append({"firstName":name.text,
                                              "lastName":sure_name.text,
                                              "phoneNumber":number.text })
                                name.text = "Введите имя."
                                sure_name.text = "Введите фамилию."
                                number.text = "Введите номер."
                             }
                        else
                             {
                                contacts.set(indexx, {"firstName":name.text,
                                              "lastName":sure_name.text,
                                              "phoneNumber":number.text })
                                add.text = "Добавить"
                                name.text = "Введите имя."
                                sure_name.text = "Введите фамилию."
                                number.text = "Введите номер."
                             }
         }
    }

}
