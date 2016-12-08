# JsonCPP VS 使用

# Download

[sourceforge](https://sourceforge.net/projects/jsoncpp/)

[github](https://github.com/open-source-parsers/jsoncpp)

# 编译静态库

找到./makefiles/vs71/jsoncpp.sln，双击用VS打开如下：

![](http://i.imgur.com/Zxz7EOy.png)

*PS:*
注意：“Librarian -> General -> OutputFile”需要和“Configuration -> General -> TargetName”相同，否则会有Warning.

![](http://i.imgur.com/gUgbjbe.png)

![](http://i.imgur.com/AYQbspO.png)

生成的lib_json.lib拷贝到目标工程目录中。

# 使用

解压之后，将include文件夹、src下的lib_json文件夹，拷贝至你的项目中。还有前面生成的lib文件。

如果出现下面的问题，

![](http://i.imgur.com/fL1Pa7A.png)

需要修改"C/C++ -> All Options -> Runtime Library"，为(/MTd)

加入下面代码：

	#include <iostream>
	#include <fstream>
	#include "json.h"
	
	using namespace std;
	
	#define JSON_FILE_NAME "Test.json"
	
	int JsonRead()
	{
		ifstream ifs;
		ifs.open(JSON_FILE_NAME);
	
		Json::Reader reader;
		Json::Value root;
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
	
		// reader将Json字符串解析到root，root将包含Json里所有子元素 
		if (reader.parse(pStr, root))
		{
			// 访问节点，upload_id = "UP000000"
			string upload_id = root["uploadid"].asString();
			// 访问节点，code = 100
			int code = root["code"].asInt();     
		}
	
		//JsonRead();
		//JsonWrite();
	
		return 0;
	}
