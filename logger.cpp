#include "logger.h"
#include <QDir>
#include <QDebug>
#include <QDateTime>
Logger::Logger(QObject *parent) : QObject(parent)
{
    m_online_avatar_step="0";
    m_selected_avatar="none";
    m_exercise="none";
    m_friend_enable="false";
    m_sport_enable="false";
    m_livre_enable="false";
    m_telephone_enable="false";
    m_exercise_completed="false";
    m_user_code="";
    m_step=0;

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
    QString extstr="";
    #if ANDROID
        extstr=QString(getenv("EXTERNAL_STORAGE"))+"/friburg-experiment/";
    #endif
    if(!localDir.exists(extstr+"logs"))
        if(!localDir.mkpath(extstr+"logs")){
            setError("Cannot create directory of the logs. Move the executable in another folder.");
            return;
        }
    QString log_file_name=QDateTime::currentDateTime().toString("dd_MM_yy_hh_mm_ss_z");
    m_file.setFileName(extstr+"logs/"+log_file_name+".csv");
    m_file_questionnaire.setFileName(extstr+"logs/"+log_file_name+"_questionnaire.csv");
    write_header();
}

void Logger::write_questionnaire(QString text){

    m_file_questionnaire.open(QFile::WriteOnly | QFile::Append);
    m_stream_questionnaire.setDevice(&m_file_questionnaire);
    m_stream_questionnaire<<text;
    m_file_questionnaire.close();

}

void Logger::write_header(){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<"User_Code;Action;Condition;Step;Time;Time_from_start_step;Online_Avatars_Progress;Selected_Avatar;Friends_Enable;Livre_Enable;Sport_Enable;Telephone_Enable;Exercise;Exercise_Completed;Answers;Action_Details\n";
    m_file.close();
    m_mutex.unlock();
}
void Logger::write_read_instruction(QString condition,QString user_code){
    m_mutex.lock();
    m_condition=condition;
    m_user_code=user_code;
    m_time.start();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Reading_Instructions;"<<m_condition<<";"<<m_step<<";0;;;;;;;;;;;\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_start_experiment(){
    m_mutex.lock();
    m_time_since_start.restart();
    m_step++;
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Start_experiment;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"<<m_online_avatar_step<<";;;;;;;;;;\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_select_exercise(QString exercise,bool exercise_completed,QString text){
    m_mutex.lock();
    m_exercise=exercise;
    m_exercise_completed=exercise_completed? "true":"false";
    m_answer=text.replace("\n","<br>");
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Select_exercise;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";\n";
    m_file.close();
    m_mutex.unlock();

}

void Logger::write_exercise_answer(QString text,bool exercise_completed){
    m_mutex.lock();
    m_answer=text.replace("\n","<br>");
    m_exercise_completed=exercise_completed? "true":"false";
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Exercise_answer;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_select_avatar(QString avatarID,bool friend_enable,bool sport_enable,bool livre_enable,bool telephone_enable){
    m_mutex.lock();
    m_selected_avatar=avatarID;
    m_friend_enable= friend_enable? "true":"false";
    m_sport_enable= sport_enable? "true":"false";
    m_telephone_enable= telephone_enable? "true":"false";
    m_livre_enable= livre_enable? "true":"false";
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Select_Avatar;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";\n";
    m_file.close();
    m_mutex.unlock();

}
void Logger::write_update_online_avatars(QString n){
    m_mutex.lock();
    m_online_avatar_step=n;
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Update_Online_Avatars;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";\n";
    m_file.close();
    m_mutex.unlock();
}

void Logger::write_general_action(QString action, QString details){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<action<<";"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";"<<details<<"\n";
    m_file.close();
    m_mutex.unlock();
}


void Logger::write_finish(){
    m_mutex.lock();
    m_file.open(QFile::WriteOnly | QFile::Append);
    m_stream.setDevice(&m_file);
    m_stream<<m_user_code<<";"<<"Finish;"<<m_condition<<";"<<m_step<<";"<< QString::number(m_time.elapsed()/1000)<<";"
            <<QString::number(m_time_since_start.elapsed()/1000)<<";"<<m_online_avatar_step<<";"
            <<m_selected_avatar<<";"<<m_friend_enable<<";"<<m_livre_enable<<";"<<m_sport_enable<<";"
            <<m_telephone_enable<<";"<<m_exercise<<";"<<m_exercise_completed<<";"<<m_answer<<";\n";
    m_file.close();
    m_mutex.unlock();
}
