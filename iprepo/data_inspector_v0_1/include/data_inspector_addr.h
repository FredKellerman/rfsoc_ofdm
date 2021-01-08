/*
 * File Name:         hdl_prj\data_inspector\ipcore\data_inspector_v0_1\include\data_inspector_addr.h
 * Description:       C Header File
 * Created:           2021-01-08 12:51:59
*/

#ifndef DATA_INSPECTOR_H_
#define DATA_INSPECTOR_H_

#define  IPCore_Reset_data_inspector       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_data_inspector      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_data_inspector   0x8  //contains unique IP timestamp (yymmddHHMM): 2101081251
#define  frame_size_Data_data_inspector    0x100  //data register for Inport frame_size

#endif /* DATA_INSPECTOR_H_ */
