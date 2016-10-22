#include <iostream>
#include <fstream>

int main(void)
{
	std::ofstream ofs("test.txt");
	ofs << "hello cron!!" << std::endl;
	return 0;
}
