# relative paths to lib p3d and media
P3D_PATH = p3d
MEDIA_PATH = ../media

# common QT project configuration
QT += core gui opengl # should be ok for Qt 4.8 and Qt 5.1
CONFIG += debug_and_release
CONFIG(debug,debug|release) {
  TARGET=$$join(TARGET,,,"_d")
}
TEMPLATE = app

DESTDIR = $$_PRO_FILE_PWD_/bin
DEFINES += MEDIA_PATH=\\\"$$MEDIA_PATH\\\"
DEFINES+= RENDER_SHADER_PATH=\\\"$$MEDIA_PATH/shader\\\"


# QT >=5 and QT <5 compatibility
greaterThan(QT_MAJOR_VERSION, 4) {
QT += widgets
CONFIG += c++11
}
else {
  QMAKE_CXXFLAGS += -std=c++11 # C++ 11 / -std=c++0x for old compilers
}

# includes glew : for compatibility reason, glew *MUST* be installed
CONFIG += with_glew # uncomment this line if glew is required
with_glew:DEFINES+=WITH_GLEW # to check if #include <GL/glew.h> should be done (see glsupport.h and GLView.cpp)

# linux config : tested on ubuntu 12/13 32bits, fedora 20 64bits
unix:!macx:with_glew {
    CONFIG += link_pkgconfig
    PKGCONFIG += glew
}

# mac os config : ** not tested **
macx {
    INCLUDEPATH += /opt/local/include
    with_glew:LIBS+=-lglew
    LIBS += -framework OpenGL
}

# win32 config : tested on win7 32bits (qt mingw)
win32 {
  CONFIG += console
  with_glew {
DEFINES+=GLEW_STATIC
LIBS+=-lglew32s
}
  DEFINES+=_STDCALL_SUPPORTED
  LIBS+= -lopengl32
}


INCLUDEPATH += src/application/ src/p3d/render/ src/p3d/scene/ src/p3d/gui/ src/p3d/algebra/ 
DEPENDPATH += src/application/ src/p3d/render/ src/p3d/scene/ src/p3d/gui/ src/p3d/algebra/ 

SOURCES += \
	src/application/GLApplication.cpp \
	src/p3d/render/DebugTool.cpp \
	src/p3d/render/GLTool.cpp \
	src/p3d/scene/Camera.cpp \
	src/p3d/gui/Tools.cpp \
	src/p3d/algebra/Vector2.cpp \
	src/p3d/scene/Object3D.cpp \
	src/p3d/algebra/Quaternion.cpp \
	src/p3d/algebra/Line.cpp \
	src/p3d/algebra/Plane.cpp \
	src/p3d/render/VertexArray.cpp \
	src/p3d/algebra/Vector4.cpp \
	src/p3d/algebra/Vector3.cpp \
	src/p3d/algebra/Matrix4.cpp \
	src/p3d/algebra/Matrix3.cpp \
	src/p3d/render/Shader.cpp \
	src/p3d/render/GLRender.cpp \
	src/p3d/gui/GLText.cpp \
	src/p3d/render/GLPrimitive.cpp \
	src/p3d/render/Texture.cpp \
	src/p3d/render/FrameBuffer.cpp \
	src/p3d/scene/MeshObject3D.cpp \
	src/p3d/scene/Mesh.cpp \
	src/p3d/scene/MeshGL.cpp \
	src/p3d/gui/GLWidget.cpp \
	src/p3d/gui/main.cpp \
	src/p3d/gui/MainWindow.cpp
HEADERS += \
	src/p3d/render/DebugTool.h \
	src/p3d/gui/Tools.h \
	src/p3d/algebra/Vector2.h \
	src/p3d/gui/glsupport.h \
	src/p3d/scene/Camera.h \
	src/p3d/algebra/Quaternion.h \
	src/p3d/scene/Object3D.h \
	src/p3d/algebra/Plane.h \
	src/p3d/algebra/Line.h \
	src/p3d/render/VertexArray.h \
	src/p3d/algebra/Vector4.h \
	src/p3d/algebra/Vector3.h \
	src/p3d/algebra/Matrix3.h \
	src/p3d/algebra/Matrix4.h \
	src/p3d/render/Shader.h \
	src/p3d/render/GLRender.h \
	src/p3d/render/GLTool.h \
	src/p3d/gui/GLText.h \
	src/p3d/render/GLPrimitive.h \
	src/p3d/render/Texture.h \
	src/application/GLApplication.h \
	src/p3d/render/FrameBuffer.h \
	src/p3d/scene/MeshObject3D.h \
	src/p3d/scene/MeshGL.h \
	src/p3d/scene/Mesh.h \
	src/p3d/gui/GLWidget.h \
	src/p3d/gui/MainWindow.h
OTHER_FILES +=\
	media/mosaic_pierre.jpg\
	media/al.obj\
	media/univLille1.png\
	media/EarthDay512.jpg\
	media/shader/ambientTexture.frag\
	media/shader/perPixelLighting.frag\
	media/shader/perVertexLighting.frag\
	media/shader/shadowMap.frag\
	media/shader/textureTransform.frag\
	media/shader/ambientTexture.vert\
	media/shader/perPixelLighting.vert\
	media/shader/perVertexLighting.vert\
	media/shader/shadowMap.vert\
	media/shader/textureTransform.vert\
	media/porsche.obj\
	media/cessna.obj

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32d
else:unix: LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32

INCLUDEPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include
DEPENDPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32s
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32sd
else:unix: LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32s

INCLUDEPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include
DEPENDPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32d
else:unix: LIBS += -L$$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/lib/ -lglew32

INCLUDEPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include
DEPENDPATH += $$PWD/../../../../../../Qt/Qt5.2.1/5.2.1/msvc2012_64_opengl/include
