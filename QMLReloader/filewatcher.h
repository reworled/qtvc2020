#ifndef FILEWATCHER_H
#define FILEWATCHER_H

#include <QObject>
#include <QFileSystemWatcher>

class FileWatcher : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool legitfile READ legitfile NOTIFY legitfileChanged)
    Q_PROPERTY(QString fileName READ fileName WRITE setFileName NOTIFY fileNameChanged)
    Q_PROPERTY(QString extension READ extension WRITE setExtension NOTIFY extensionChanged)
public:
    explicit FileWatcher(QObject *parent = nullptr);

    bool legitfile() { return m_legitfile; }
    QString fileName() { return m_fileName; }
    void setFileName(QString fileName);
    void reloadFileData();

    void setExtension(QString ext);
    QString extension() { return m_ext; }

signals:
    void legitfileChanged();
    void fileNameChanged();
    void extensionChanged();

    void fileContentChanged(QString fileContent);

private:
    bool m_legitfile = false;
    QString m_fileName;
    QString m_ext = "*";
    QFileSystemWatcher m_watchman;

    void checkFileName();
};

#endif // FILEWATCHER_H
