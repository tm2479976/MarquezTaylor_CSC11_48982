#include <iostream> 
using namespace std;

//Global Constants
const float CNVMNYR = 1.0f / 12.0f;
const float PI = 355.0f / 113.0f;
const float CNVR2AR = 1.0f / PI;


int main(int argc, char** argv)
{
	//88 months to years

	unsigned char in = 88;
	unsigned char ft = CNVMNYR*in;
	cout << static_cast<int>(in) << "(mn) = "
		<< static_cast<int>(ft) << "(yr)" << endl;
	cout << "Float Conversion mn to yr = " << CNVMNYR << endl;
	 
	unsigned char R1 = in;         //BP  0WD 8
	unsigned int  R2 = 0x00155556; //BP-24WD24
	unsigned int  R0 = R2*R1;      //BP-24WD32
	R0 >>= 24;                     //BP  0WD 8
	cout << static_cast<int>(R1) << "(mn) = "
		<< static_cast<int>(R0) << "(yr)" << endl;
	cout << "Hex Conversion mn to yr = " << R2 << endl << endl;

	//110 area to radius squared

	unsigned char ar = 110;
	unsigned char r2 = CNVR2AR*ar;
	cout << static_cast<int>(ar) << "(ar) = "
		<< static_cast<int>(r2) << "(r2)" << endl;
	cout << "Float Conversion ar to r2 = " << CNVR2AR << endl;

	unsigned char R10 = ar;         //BP  0WD16
	unsigned int  R20 = 0x00517CC1; //BP-24WD16
	unsigned int  R00 = R20*R10;    //BP-24WD16
	R00 >>= 24;                     //BP  0WD 8
	cout << static_cast<int>(R10) << "(ar) = "
		<< static_cast<int>(R00) << "(r2)" << endl;
	cout << "Hex Conversion ar to r2 = " << R20 << endl << endl;

	//113.4 area to radius squared

	float ar2 = 113.4;
	unsigned char r20 = CNVR2AR*ar2;
	cout << static_cast<int>(ar2) << "(ar) = "
		<< static_cast<int>(r20) << "(r2)" << endl;
	cout << "Float Conversion ar to r2 = " << CNVR2AR << endl;

	unsigned int  R11 = 0x007167;   //BP -2WD16
	unsigned int  R21 = 0x00517C;   //BP-24WD16
	unsigned int  R01 = R20*R10;    //BP-24WD16
	R01 >>= 24;                     //BP  0WD 8
	R11 >>= 8;
	cout << static_cast<int>(R11) << "(ar) = "
		<< static_cast<int>(R01) << "(r2)" << endl;
	cout << "Hex Conversion ar to r2 = " << R21 << endl << endl;

	//6 radius to area

	unsigned char rd = 6;
	unsigned char AR = rd*rd*PI;
	cout << static_cast<int>(rd) << "(rd) = "
		<< static_cast<int>(AR) << "(AR)" << endl;
	cout << "Float Conversion rd to AR = " << PI << endl;

	unsigned char R12 = rd;          //BP  0WD 8
	unsigned int  R22 = 0x003243F6;  //BP-20WD24
	unsigned int  R02 = R12*R12*R22; //BP-20WD24
	R02 >>= 20;                      //BP  0WD 8
	cout << static_cast<int>(R12) << "(rd) = "
		<< static_cast<int>(R02) << "(AR)" << endl;
	cout << "Hex Conversion rd to AR = " << R22 << endl << endl;

	//6.5 radius to area

	float rd2 = 6.5f;
	unsigned int AR2 = rd2*rd2*PI;
	cout << static_cast<float>(rd2) << "(rd) = "
		<< static_cast<float>(AR2) << "(AR)" << endl;
	cout << "Float Conversion rd to AR = " << PI << endl;

	unsigned int  R13 = 0x0068;      //BP -1WD16
	unsigned int  R23 = 0x003243;    //BP-20WD16
	unsigned int  R03 = R13*R13*R23; //BP-20WD16
	R03 >>= 20;                      //BP  0WD 8
	R13 >>= 4;                       //BP  0WD 8
	cout << static_cast<int>(R13) << "(rd) = "
		<< static_cast<int>(R03) << "(AR)" << endl;
	cout << "Hex Conversion rd to AR = " << R23 << endl << endl;

	return 0;
}