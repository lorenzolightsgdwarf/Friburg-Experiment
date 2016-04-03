#include "logger.h"
#include <QDir>
#include <QDebug>
#include <QDateTime>
Logger::Logger(QObject *parent) : QObject(parent)
{

}

Logger::~Logger()
{
    close();
}

void Logger::close()
{
    if(m_file.isOpen())
        m_file.close();
}

void Logger::setError(QString e)
{
    m_error=e;
    emit errorChanged();
}
void Logger::init(){
    QDir localDir;
    if(!localDir.exists("logs"))
        if(!localDir.mkdir("logs")){
            setError("Cannot create directory of the logs. Move the executable in another folder.");
            return;
        }
    QString log_file_name=QDateTime::currentDateTime().toString("dMyyhms");
    m_file.setFileName("logs/"+log_file_name+".csv");
    write_header();
}

void Logger::write_header(){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Action;Condition;Time;Time_from_start;Exercise;Answer_Text;Selected_Avatar;N_Online_Avatars;Online_Avatars\n";
    m_file.close();
    m_mutex.unlock();
}
void Logger::write_read_instruction(QString condition){
    m_mutex.lock();
    m_condition=condition;
    m_time.start();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Reading_Instructions;"<<m_condition<<";0;;;;;;\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_start_experiment(){
    m_mutex.lock();
    m_time_since_start.start();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Start_experiment;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";0;;;;;\n";
    m_file.close();
    m_mutex.unlock();
}
void Logger::write_select_exercise(QString exercise){
    m_mutex.lock();
    m_exercise=exercise;
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Select_exercise;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";"
                                     <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_exercise<<";;;;\n";
    m_file.close();
    m_mutex.unlock();

}

void Logger::write_exercise_answer(QString exercise, QString text){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Exercise_answer;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";"
                                     <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<exercise<<
                                       ";"<<text<<";;;\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_select_avatar(QString avatarID){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Select_Avatar;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";"
                                     <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_exercise<<
                                       ";;"<<avatarID<<";;\n";
    m_file.close();
    m_mutex.unlock();

}
void Logger::write_update_online_avatars(QString n, QString avatarsID){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Update_Online_Avatars;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";"
                                     <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_exercise<<
                                       ";;;"<<n<<";"<<avatarsID<<"\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_finish(){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"Finish;"<<m_condition<<";"<< QString::number(m_time.elapsed()/1000)<<";"
                                     <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_exercise<<
                                       ";;;;\n";
    m_file.close();
    m_mutex.unlock();
}
