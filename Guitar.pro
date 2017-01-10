#-------------------------------------------------
#
# Project created by QtCreator 2016-02-06T19:08:45
#
#-------------------------------------------------

QT       += core gui widgets svg

TARGET = Guitar
TEMPLATE = app

CONFIG += c++11

COPYRIGHT_YEAR = 2017
VER_MAJ = 0
VER_MIN = 0
VER_PAT = 0
VERSION = $${VER_MAJ}.$${VER_MIN}.$${VER_PAT}
GIT = git --git-dir $$PWD/.git
win32 {
	DEVNULL = NUL
} else {
	DEVNULL = /dev/null
}
GIT_VERSION = $$system($$GIT rev-parse --short HEAD 2> $$DEVNULL)
VERSION_SRC  = "int copyright_year = $$COPYRIGHT_YEAR;"
VERSION_SRC += "char const product_version[] = \"$$VERSION\";"
VERSION_SRC += "char const source_revision[] = \"$$GIT_VERSION\";"
write_file("$$PWD/version.c", VERSION_SRC)

win32 {
	VERSION                  = 0.0.0.0
	QMAKE_TARGET_COMPANY     = "S.Fuchita"
	QMAKE_TARGET_DESCRIPTION = "The GUI Git Client"
	QMAKE_TARGET_COPYRIGHT   = "Copyright (C) $$COPYRIGHT_YEAR $$QMAKE_TARGET_COMPANY (@soramimi_jp)"
	QMAKE_TARGET_PRODUCT     = $${QMAKE_ORIG_TARGET}
	RC_ICONS                 = Guitar.ico
	RC_LANG                  = 1041
	RC_CODEPAGE              = 932
}
macx {
	CONFIG += app_bundle
	ICON = Guitar.icns
	QMAKE_TARGET_BUNDLE_PREFIX = jp.soramimi
	QMAKE_PKGINFO_TYPEINFO     = APPL
	PRODUCT_NAME               = $${QMAKE_ORIG_TARGET}
	# If you want append Version Info to Info.plist
	# append key and value to $${QMAKESPEC}/Info.plist.app
	# <dict>
	#    :
	#     <key>CFBundleShortVersionString</key>
	#     <value>@SHORT_VERSION@</value>
	# </dict>
}

CONFIG(debug, debug|release) {
        MOC_DIR = $$OUT_PWD/tmp/debug/moc
        OBJECTS_DIR = $$OUT_PWD/tmp/debug/objs
        RCC_DIR = $$OUT_PWD/tmp/debug/rcc
        UI_DIR  = $$OUT_PWD/tmp/debug/ui
} else {
        MOC_DIR = $$OUT_PWD/tmp/release/moc
        OBJECTS_DIR = $$OUT_PWD/tmp/release/objs
        RCC_DIR = $$OUT_PWD/tmp/release/rcc
        UI_DIR  = $$OUT_PWD/tmp/release/ui
}

unix:QMAKE_CXXFLAGS += -Werror=return-type -Werror=trigraphs

linux:QTPLUGIN += ibusplatforminputcontextplugin

INCLUDEPATH += $$PWD/src

#INCLUDEPATH += $$PWD/../libgit2/include

#win32:Debug:LIBS += $$PWD/../_build_libgit2/debug/libgit2.lib
#win32:Release:LIBS += $$PWD/../_build_libgit2/release/libgit2.lib

#unix:debug:LIBS += $$PWD/../_build_libgit2_Debug/liblibgit2.a
#unix:release:LIBS += $$PWD/../_build_libgit2_Release/liblibgit2.a

win32 {
	LIBS += advapi32.lib
	QMAKE_SUBSYSTEM_SUFFIX=,5.01
}

macx {
	t.path=Contents/Resources
	QMAKE_BUNDLE_DATA += t
}

SOURCES += \
	version.c \
	src/main.cpp\
	src/MainWindow.cpp \
	src/Git.cpp \
	src/joinpath.cpp \
	src/misc.cpp \
	src/PushDialog.cpp \
	src/ConfigCredentialHelperDialog.cpp \
	src/MySettings.cpp \
	src/FileDiffWidget.cpp \
	src/TextEditDialog.cpp \
	src/LogTableWidget.cpp \
    src/FileDiffSliderWidget.cpp \
    src/LibGit2.cpp \
    src/FileUtil.cpp \
    src/SettingsDialog.cpp \
    src/NewBranchDialog.cpp \
    src/CheckoutBranchDialog.cpp \
    src/MergeBranchDialog.cpp \
    src/CloneDialog.cpp \
    src/AboutDialog.cpp \
    src/RepositoryInfoFrame.cpp \
    src/RepositoryPropertyDialog.cpp \
    src/RepositoryData.cpp \
    src/MyToolButton.cpp \
    src/GitDiff.cpp \
    src/CommitPropertyDialog.cpp \
    src/Terminal.cpp \
    src/EditTagDialog.cpp \
    src/DeleteTagsDialog.cpp \
    src/LegacyWindowsStyleTreeControl.cpp \
    src/RepositoriesTreeWidget.cpp \
    src/SelectCommandDialog.cpp

HEADERS  += \
	src/MainWindow.h \
	src/Git.h \
	src/joinpath.h \
	src/misc.h \
	src/PushDialog.h \
	src/ConfigCredentialHelperDialog.h \
	src/MySettings.h \
	src/main.h \
	src/FileDiffWidget.h \
	src/TextEditDialog.h \
	src/LogTableWidget.h \
    src/FileDiffSliderWidget.h \
    src/LibGit2.h \
    src/FileUtil.h \
    src/SettingsDialog.h \
    src/NewBranchDialog.h \
    src/CheckoutBranchDialog.h \
    src/MergeBranchDialog.h \
    src/CloneDialog.h \
    src/AboutDialog.h \
    src/RepositoryInfoFrame.h \
    src/RepositoryPropertyDialog.h \
    src/RepositoryData.h \
    src/MyToolButton.h \
    src/GitDiff.h \
    src/CommitPropertyDialog.h \
    src/Terminal.h \
    src/EditTagDialog.h \
    src/DeleteTagsDialog.h \
    src/LegacyWindowsStyleTreeControl.h \
    src/RepositoriesTreeWidget.h \
    src/SelectCommandDialog.h

FORMS    += \
	src/MainWindow.ui \
	src/PushDialog.ui \
	src/ConfigCredentialHelperDialog.ui \
	src/TextEditDialog.ui \
    src/SettingsDialog.ui \
    src/NewBranchDialog.ui \
    src/CheckoutBranchDialog.ui \
    src/MergeBranchDialog.ui \
    src/CloneDialog.ui \
    src/AboutDialog.ui \
    src/RepositoryPropertyDialog.ui \
    src/CommitPropertyDialog.ui \
    src/EditTagDialog.ui \
    src/DeleteTagsDialog.ui \
    src/SelectCommandDialog.ui

RESOURCES += \
    resources.qrc



win32 {
	SOURCES += \
		src/win32/thread.cpp \
		src/win32/event.cpp \
		src/win32/win32.cpp

	HEADERS  += \
		src/win32/thread.h \
		src/win32/event.h \
		src/win32/mutex.h \
		src/win32/win32.h
}
