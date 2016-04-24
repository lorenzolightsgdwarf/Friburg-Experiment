TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    logger.cpp

RESOURCES += qml.qrc

RC_ICONS = icon.ico
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    logger.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

#windeployqt.exe .\Friburg-Experiment.exe --qmldir ..\..\Friburg-Experiment\ --release --dir release
#copy exe in the release folder
#copy libraries icu*, libgcc_s_dw2, libstdc++6.dll, libwinpthread-1
