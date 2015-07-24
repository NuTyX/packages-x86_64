# Begin /etc/profile.d/kf5.sh

source /etc/profile.d/qt5.sh

export KF5_PREFIX=/usr

pathappend /usr/lib/qt5/plugins    QT_PLUGIN_PATH
pathappend $QT5DIR/lib/qt5/plugins QT_PLUGIN_PATH

pathappend /usr/lib/qt5/qml        QML_IMPORT_PATH
pathappend $QT5DIR/lib/qt5/qml     QML_IMPORT_PATH

pathappend /usr/lib/qt5/qml        QML2_IMPORT_PATH
pathappend $QT5DIR/lib/qt5/qml     QML2_IMPORT_PATH

# End /etc/profile.d/kf5.sh
