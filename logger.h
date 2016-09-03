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
    Q_INVOKABLE void write_read_instruction(QString condition, QString user_code);
    Q_INVOKABLE void write_start_experiment();
    Q_INVOKABLE void write_select_exercise(QString exercise, bool exercise_completed,QString text);
    Q_INVOKABLE void write_exercise_answer(QString text, bool exercise_completed);
    Q_INVOKABLE void write_select_avatar(QString avatarID,bool friend_enable,bool sport_enable,bool livre_enable,bool telephone_enable);
    Q_INVOKABLE void write_update_online_avatars(QString n);
    Q_INVOKABLE void write_finish();
    Q_INVOKABLE void write_questionnaire(QString text);
    Q_INVOKABLE void write_general_action(QString action, QString details=QString());
signals:
    void errorChanged();
private:
    QFile m_file,m_file_questionnaire;
    QTextStream m_stream,m_stream_questionnaire;

    QString m_error;
    QMutex m_mutex;

    QString m_condition,m_exercise,m_online_avatar_step,
            m_selected_avatar,m_friend_enable,m_livre_enable,m_sport_enable,
            m_telephone_enable,m_answer,m_exercise_completed,m_user_code;
    QTime m_time;
    QTime m_time_since_start;
};

#endif // LOGGER_H
