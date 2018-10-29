#--------------------------------------------------------------------
# path to build directory (generated by cmake)
#--------------------------------------------------------------------
PRE_TARGETDEPS += $$PWD/../../setup.pri
include($$PWD/../../setup.pri)

#--------------------------------------------------------------------
# project
#--------------------------------------------------------------------

# uncomment to compil as library
#DEFINES = USE_LIB_VERSION

# library or app
contains ( DEFINES, USE_LIB_VERSION ) {
    TEMPLATE = lib
    CONFIG += staticlib
} else {
    TEMPLATE = app
    SOURCES += src/main.cpp
}


QT -= core gui
TARGET = gplay-encoder
CONFIG += c++11
CONFIG -= qt
CONFIG -= app_bundle

DESTDIR = $$GPLAY_OUTPUT_DIR/bin
QMAKE_CLEAN += $$DESTDIR/$$TARGET

CONFIG(debug, debug|release):
    DEFINES +=  _DEBUG \
                USE_FBX

INCLUDEPATH += $$GPLAY_OUTPUT_DIR/include/gplayengine/thirdparty

#--------------------------------------------------------------------
# platform specific
#--------------------------------------------------------------------
linux: {
    DEFINES += __linux__
    PRE_TARGETDEPS += $$GPLAY_OUTPUT_DIR/lib/libgplay-deps.a
    LIBS += -L$$GPLAY_OUTPUT_DIR/lib/ -lgplay-deps

    QMAKE_CXXFLAGS += -std=c++11 -lstdc++ -pthread -w
    INCLUDEPATH += /usr/include/fbxsdk

    LIBS += -L/usr/lib/gcc4/x64/release -lfbxsdk
    LIBS += -lstdc++ -ldl -lpthread

    # Note: when running the encoder, if error : error while loading shared libraries: libfbxsdk.so: cannot open shared object...
    # open a terminal :
    # export LD_LIBRARY_PATH=/usr/lib/gcc4/x64/release
    # ./gplay-encoder
    #
    # But this flag should resolve the path where to find the libfbxsdk.so library at runtime and fix this error.
    QMAKE_LFLAGS_RPATH=
    QMAKE_LFLAGS += "-Wl,-rpath,\'/usr/lib/gcc4/x64/release\'"
}






#--------------------------------------------------------------------
# files
#--------------------------------------------------------------------
SOURCES += src/Mesh.cpp \
    src/AnimationChannel.cpp \
    src/Animation.cpp \
    src/Animations.cpp \
    src/Base.cpp \
    src/BoundingVolume.cpp \
    src/Camera.cpp \
    src/Constants.cpp \
    src/Curve.cpp \
    src/edtaa3func.c \
    src/Effect.cpp \
    src/EncoderArguments.cpp \
    src/FBXSceneEncoder.cpp \
    src/FBXUtil.cpp \
    src/FileIO.cpp \
    src/Font.cpp \
    src/Glyph.cpp \
    src/GPBDecoder.cpp \
    src/GPBFile.cpp \
    src/Heightmap.cpp \
    src/Image.cpp \
    src/Light.cpp \
    src/Material.cpp \
    src/MaterialParameter.cpp \
    src/Matrix.cpp \
    src/MeshPart.cpp \
    src/MeshSkin.cpp \
    src/MeshSubSet.cpp \
    src/Model.cpp \
    src/Node.cpp \
    src/NormalMapGenerator.cpp \
    src/Object.cpp \
    src/Quaternion.cpp \
    src/Reference.cpp \
    src/ReferenceTable.cpp \
    src/Sampler.cpp \
    src/Scene.cpp \
    src/StringUtil.cpp \
    src/Transform.cpp \
    src/TTFFontEncoder.cpp \
    src/TMXSceneEncoder.cpp \
    src/TMXTypes.cpp \
    src/Vector2.cpp \
    src/Vector3.cpp \
    src/Vector4.cpp \
    src/Vertex.cpp \
    src/VertexElement.cpp

HEADERS += src/AnimationChannel.h \
    src/AnimationChannel.h \
    src/Animation.h \
    src/Animations.h \
    src/Base.h \
    src/BoundingVolume.h \
    src/Camera.h \
    src/Constants.h \
    src/Curve.h \
    src/Curve.inl \
    src/edtaa3func.h \
    src/Effect.h \
    src/EncoderArguments.h \
    src/FBXSceneEncoder.h \
    src/FBXUtil.h \
    src/FileIO.h \
    src/Font.h \
    src/Glyph.h \
    src/GPBDecoder.h \
    src/GPBFile.h \
    src/Heightmap.h \
    src/Image.h \
    src/Light.h \
    src/Material.h \
    src/MaterialParameter.h \
    src/Matrix.h \
    src/Mesh.h \
    src/MeshPart.h \
    src/MeshSkin.h \
    src/MeshSubSet.h \
    src/Model.h \
    src/Node.h \
    src/NormalMapGenerator.h \
    src/Object.h \
    src/Quaternion.h \
    src/Quaternion.inl \
    src/Reference.h \
    src/ReferenceTable.h \
    src/Sampler.h \
    src/Scene.h \
    src/StringUtil.h \
    src/Thread.h \
    src/Transform.h \
    src/TTFFontEncoder.h \
    src/TMXSceneEncoder.h \
    src/TMXTypes.h \
    src/Vector2.h \
    src/Vector2.inl \
    src/Vector3.h \
    src/Vector3.inl \
    src/Vector4.h \
    src/Vector4.inl \
    src/VertexElement.h \
    src/Vertex.h
