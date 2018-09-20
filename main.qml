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

    property int currentIndex: 0

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
                        nameField.text = firstName
                        lastNameField.text = lastName
                        phoneNumberField.text = phoneNumber

                        add.text = "Редактировать"

                        currentIndex = index
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
        height: parent.height / 2.5

        color: "skyblue"
        radius: 7

        Text
        {
            id: nameLable
            text: "Имя:"

            anchors.top: parent.top
            anchors.left: parent.left
        }


        TextField
        {
            id: nameField

            placeholderText: "Введите имя."

            anchors.top: nameLable.bottom

            width: parent.width
            height: 30
        }

        Text
        {
            id: lastNameLable
            text: "Фамилия:"

            anchors.top: nameField.bottom
            anchors.left: parent.left
        }

        TextField
        {
            id: lastNameField

            placeholderText: "Введите фамилию."

            anchors.top: lastNameLable.bottom

            width: parent.width
            height: 30
        }

        Text
        {
            id: phoneNumberLable
            text: "Номер телефона:"

            anchors.top: lastNameField.bottom
            anchors.left: parent.left
        }

        TextField
        {
            id: phoneNumberField

            placeholderText: "Введите номер."

            anchors.top: phoneNumberLable.bottom

            width: parent.width
            height: 30

        }

        Button
        {
            id: add
            anchors.right: parent.right
            anchors.top: phoneNumberField.bottom

            text: "Добавить"

            onClicked: if (text == "Добавить")
                             {
                                contacts.append({"firstName":nameField.text,
                                              "lastName":lastNameField.text,
                                              "phoneNumber":phoneNumberField.text })
                                nameField.text = ""
                                lastNameField.text = ""
                                phoneNumberField.text = ""
                             }
                        else
                             {
                                contacts.set(currentIndex, {"firstName":nameField.text,
                                              "lastName":lastNameField.text,
                                              "phoneNumber":phoneNumberField.text })
                                add.text = "Добавить"
                                nameField.text = ""
                                lastNameField.text = ""
                                phoneNumberField.text = ""
                             }
         }
    }

}
