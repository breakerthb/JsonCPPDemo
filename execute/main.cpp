#include <iostream>
#include <fstream>
#include "json/json.h"

using namespace std;

#define JSON_FILE_NAME "Test.json"

int JsonRead()
{
    ifstream ifs;
    ifs.open(JSON_FILE_NAME);

    Json::Reader reader;
    Json::Value root;
    // root is in {}
    if (!reader.parse(ifs, root, false))
    {
        return -1;
    }

    string name = root["name"].asString();
    int age = root["age"].asInt();

    cout << name << endl;
    cout << age << endl;

    ifs.close();

    return 0;
}

int JsonWrite()
{
    Json::Value root;
    Json::FastWriter writer;
    Json::Value person;

    person["name"] = "hello";
    person["age"] = 23;
    root.append(person);

    string json_file = writer.write(root);

    ofstream ofs;
    ofs.open(JSON_FILE_NAME);
    ofs << json_file;

    ofs.close();

    return 0;
}

int main()
{
    char* pStr = "{\"uploadid\": \"UP000000\",\"code\": 100,\"msg\": \"\",\"files\": \"\"}";

    Json::Reader reader;
    Json::Value root;

    if (reader.parse(pStr, root))
    {
        string strUploadID = root["uploadid"].asString();
        int nCode = root["code"].asInt();

        cout << strUploadID << endl;
        cout << nCode << endl;
    }

    JsonRead();
    //JsonWrite();

    return 0;
}

