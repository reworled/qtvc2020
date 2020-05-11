#include "filewatcher.h"

#include <QFileInfo>

FileWatcher::FileWatcher(QObject *parent) : QObject(parent)
{
    QObject::connect(&m_watchman, &QFileSystemWatcher::fileChanged, this, &FileWatcher::reloadFileData);
}

void FileWatcher::setFileName(QString fileName)
{
    if (fileName.startsWith("file://")) {
        fileName = fileName.right(fileName.length() - 7);
    }
    if (fileName != m_fileName) {
        if (m_legitfile) {
            m_watchman.removePath(m_fileName);
        }
        m_fileName = fileName;
        emit fileNameChanged();
        checkFileName();
    }
}

void FileWatcher::checkFileName()
{
    QFileInfo info(m_fileName);
    bool legitFile = (info.exists() && info.isFile() && info.fileName().endsWith(m_ext) );
    if (legitFile) {
        m_legitfile = info.exists();
        emit legitfileChanged();
        if (info.isFile()) {
            m_watchman.addPath(m_fileName);
        }
    }
}

void FileWatcher::reloadFileData()
{
    QFile file(m_fileName);
    if (file.open(QIODevice::ReadOnly))
    {
        QString content = file.readAll();
        emit fileContentChanged(content);
    }
}

void FileWatcher::setExtension(QString ext)
{
    if (ext != m_ext) {
        m_ext = ext;
        emit extensionChanged();
    }
}
