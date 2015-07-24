# Begin /etc/profile.d/qt5.sh

export QT5DIR=/usr
export QT5PREFIX=/usr

# End /etc/profile.d/qt5.sh

# Begin Qt5 changes for KF5

pathappend $QT5DIR/lib/qt5/plugins  QT_PLUGIN_PATH
pathappend $QT5DIR/lib/qt5/qml      QML_IMPORT_PATH
pathappend $QT5DIR/lib/qt5/qml      QML2_IMPORT_PATH

# End Qt5 changes for KF5
