#ifndef LOGGER_H
#define LOGGER_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QMutex>
#include <QTime>
class Logger : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString error READ error NOTIFY errorChanged)
public:
    explicit Logger(QObject *parent = 0);
    ~Logger();
    Q_INVOKABLE void close();
    QString error(){return m_error;}
    void setError(QString);
    Q_INVOKABLE void init();
    Q_INVOKABLE void write_header();
    Q_INVOKABLE void write_read_instruction(QString condition);
    Q_INVOKABLE void write_start_experiment();
    Q_INVOKABLE void write_select_exercise(QString exercise);
    Q_INVOKABLE void write_exercise_answer(QString exercise, QString text);
    Q_INVOKABLE void write_select_avatar(QString avatarID);
    Q_INVOKABLE void write_update_online_avatars(QString n, QString avatarsID);
    Q_INVOKABLE void write_finish();
signals:
    void errorChanged();
private:
    QFile m_file;
    QTextStream m_stream;
    QString m_error;
    QMutex m_mutex;

    QString m_condition,m_exercise;
    QTime m_time;
    QTime m_time_since_start;
};

#endif // LOGGER_H
