/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	Fast output of the Spectrum screen on the LCD display
 *
 */

#include "zx80.h"

.syntax unified
.thumb

.equ counter_start, 0x0000
.equ DMA2_BASE, 0x40026400
.equ DMA2_DMAS1CR, 0x0028
.equ DMA_S1PAR, 0x0030
.equ DMA_S1M0AR, 0x0034
.equ DMA_LIFCR, 0x0008
.equ TIM13_BASE, 0x40001c00

.equ enable, 1
.equ disable, 0

.global zx80_screen
.extern memory //pointer to memory and data array
.extern screenn_data
.extern screen1_buf//INT_SCR //interrupt for z80, 50Hz
//.extern INT_SCR

zx80_screen:
			b reg_init
loop:
			ldrb r0, [r12, #0x10]
			tst r0, #1
			beq loop
			strb r9, [r12, #0x10]

loop1:


			tbh [pc, r4]
table:
			.short ((sc_0x4000-table)/2)
			.short ((sc_0x4001-table)/2)
			.short ((sc_0x4002-table)/2)
			.short ((sc_0x4003-table)/2)
			.short ((sc_0x4004-table)/2)
			.short ((sc_0x4005-table)/2)
			.short ((sc_0x4006-table)/2)
			.short ((sc_0x4007-table)/2)
			.short ((sc_0x4008-table)/2)
			.short ((sc_0x4009-table)/2)
			.short ((sc_0x400A-table)/2)
			.short ((sc_0x400B-table)/2)
			.short ((sc_0x400C-table)/2)
			.short ((sc_0x400D-table)/2)
			.short ((sc_0x400E-table)/2)
			.short ((sc_0x400F-table)/2)
			.short ((sc_0x4010-table)/2)
			.short ((sc_0x4011-table)/2)
			.short ((sc_0x4012-table)/2)
			.short ((sc_0x4013-table)/2)
			.short ((sc_0x4014-table)/2)
			.short ((sc_0x4015-table)/2)
			.short ((sc_0x4016-table)/2)
			.short ((sc_0x4017-table)/2)
			.short ((sc_0x4018-table)/2)
			.short ((sc_0x4019-table)/2)
			.short ((sc_0x401A-table)/2)
			.short ((sc_0x401B-table)/2)
			.short ((sc_0x401C-table)/2)
			.short ((sc_0x401D-table)/2)
			.short ((sc_0x401E-table)/2)
			.short ((sc_0x401F-table)/2)
			.short ((sc_0x4100-table)/2)
			.short ((sc_0x4101-table)/2)
			.short ((sc_0x4102-table)/2)
			.short ((sc_0x4103-table)/2)
			.short ((sc_0x4104-table)/2)
			.short ((sc_0x4105-table)/2)
			.short ((sc_0x4106-table)/2)
			.short ((sc_0x4107-table)/2)
			.short ((sc_0x4108-table)/2)
			.short ((sc_0x4109-table)/2)
			.short ((sc_0x410A-table)/2)
			.short ((sc_0x410B-table)/2)
			.short ((sc_0x410C-table)/2)
			.short ((sc_0x410D-table)/2)
			.short ((sc_0x410E-table)/2)
			.short ((sc_0x410F-table)/2)
			.short ((sc_0x4110-table)/2)
			.short ((sc_0x4111-table)/2)
			.short ((sc_0x4112-table)/2)
			.short ((sc_0x4113-table)/2)
			.short ((sc_0x4114-table)/2)
			.short ((sc_0x4115-table)/2)
			.short ((sc_0x4116-table)/2)
			.short ((sc_0x4117-table)/2)
			.short ((sc_0x4118-table)/2)
			.short ((sc_0x4119-table)/2)
			.short ((sc_0x411A-table)/2)
			.short ((sc_0x411B-table)/2)
			.short ((sc_0x411C-table)/2)
			.short ((sc_0x411D-table)/2)
			.short ((sc_0x411E-table)/2)
			.short ((sc_0x411F-table)/2)
			.short ((sc_0x4200-table)/2)
			.short ((sc_0x4201-table)/2)
			.short ((sc_0x4202-table)/2)
			.short ((sc_0x4203-table)/2)
			.short ((sc_0x4204-table)/2)
			.short ((sc_0x4205-table)/2)
			.short ((sc_0x4206-table)/2)
			.short ((sc_0x4207-table)/2)
			.short ((sc_0x4208-table)/2)
			.short ((sc_0x4209-table)/2)
			.short ((sc_0x420A-table)/2)
			.short ((sc_0x420B-table)/2)
			.short ((sc_0x420C-table)/2)
			.short ((sc_0x420D-table)/2)
			.short ((sc_0x420E-table)/2)
			.short ((sc_0x420F-table)/2)
			.short ((sc_0x4210-table)/2)
			.short ((sc_0x4211-table)/2)
			.short ((sc_0x4212-table)/2)
			.short ((sc_0x4213-table)/2)
			.short ((sc_0x4214-table)/2)
			.short ((sc_0x4215-table)/2)
			.short ((sc_0x4216-table)/2)
			.short ((sc_0x4217-table)/2)
			.short ((sc_0x4218-table)/2)
			.short ((sc_0x4219-table)/2)
			.short ((sc_0x421A-table)/2)
			.short ((sc_0x421B-table)/2)
			.short ((sc_0x421C-table)/2)
			.short ((sc_0x421D-table)/2)
			.short ((sc_0x421E-table)/2)
			.short ((sc_0x421F-table)/2)
			.short ((sc_0x4300-table)/2)
			.short ((sc_0x4301-table)/2)
			.short ((sc_0x4302-table)/2)
			.short ((sc_0x4303-table)/2)
			.short ((sc_0x4304-table)/2)
			.short ((sc_0x4305-table)/2)
			.short ((sc_0x4306-table)/2)
			.short ((sc_0x4307-table)/2)
			.short ((sc_0x4308-table)/2)
			.short ((sc_0x4309-table)/2)
			.short ((sc_0x430A-table)/2)
			.short ((sc_0x430B-table)/2)
			.short ((sc_0x430C-table)/2)
			.short ((sc_0x430D-table)/2)
			.short ((sc_0x430E-table)/2)
			.short ((sc_0x430F-table)/2)
			.short ((sc_0x4310-table)/2)
			.short ((sc_0x4311-table)/2)
			.short ((sc_0x4312-table)/2)
			.short ((sc_0x4313-table)/2)
			.short ((sc_0x4314-table)/2)
			.short ((sc_0x4315-table)/2)
			.short ((sc_0x4316-table)/2)
			.short ((sc_0x4317-table)/2)
			.short ((sc_0x4318-table)/2)
			.short ((sc_0x4319-table)/2)
			.short ((sc_0x431A-table)/2)
			.short ((sc_0x431B-table)/2)
			.short ((sc_0x431C-table)/2)
			.short ((sc_0x431D-table)/2)
			.short ((sc_0x431E-table)/2)
			.short ((sc_0x431F-table)/2)
			.short ((sc_0x4400-table)/2)
			.short ((sc_0x4401-table)/2)
			.short ((sc_0x4402-table)/2)
			.short ((sc_0x4403-table)/2)
			.short ((sc_0x4404-table)/2)
			.short ((sc_0x4405-table)/2)
			.short ((sc_0x4406-table)/2)
			.short ((sc_0x4407-table)/2)
			.short ((sc_0x4408-table)/2)
			.short ((sc_0x4409-table)/2)
			.short ((sc_0x440A-table)/2)
			.short ((sc_0x440B-table)/2)
			.short ((sc_0x440C-table)/2)
			.short ((sc_0x440D-table)/2)
			.short ((sc_0x440E-table)/2)
			.short ((sc_0x440F-table)/2)
			.short ((sc_0x4410-table)/2)
			.short ((sc_0x4411-table)/2)
			.short ((sc_0x4412-table)/2)
			.short ((sc_0x4413-table)/2)
			.short ((sc_0x4414-table)/2)
			.short ((sc_0x4415-table)/2)
			.short ((sc_0x4416-table)/2)
			.short ((sc_0x4417-table)/2)
			.short ((sc_0x4418-table)/2)
			.short ((sc_0x4419-table)/2)
			.short ((sc_0x441A-table)/2)
			.short ((sc_0x441B-table)/2)
			.short ((sc_0x441C-table)/2)
			.short ((sc_0x441D-table)/2)
			.short ((sc_0x441E-table)/2)
			.short ((sc_0x441F-table)/2)
			.short ((sc_0x4500-table)/2)
			.short ((sc_0x4501-table)/2)
			.short ((sc_0x4502-table)/2)
			.short ((sc_0x4503-table)/2)
			.short ((sc_0x4504-table)/2)
			.short ((sc_0x4505-table)/2)
			.short ((sc_0x4506-table)/2)
			.short ((sc_0x4507-table)/2)
			.short ((sc_0x4508-table)/2)
			.short ((sc_0x4509-table)/2)
			.short ((sc_0x450A-table)/2)
			.short ((sc_0x450B-table)/2)
			.short ((sc_0x450C-table)/2)
			.short ((sc_0x450D-table)/2)
			.short ((sc_0x450E-table)/2)
			.short ((sc_0x450F-table)/2)
			.short ((sc_0x4510-table)/2)
			.short ((sc_0x4511-table)/2)
			.short ((sc_0x4512-table)/2)
			.short ((sc_0x4513-table)/2)
			.short ((sc_0x4514-table)/2)
			.short ((sc_0x4515-table)/2)
			.short ((sc_0x4516-table)/2)
			.short ((sc_0x4517-table)/2)
			.short ((sc_0x4518-table)/2)
			.short ((sc_0x4519-table)/2)
			.short ((sc_0x451A-table)/2)
			.short ((sc_0x451B-table)/2)
			.short ((sc_0x451C-table)/2)
			.short ((sc_0x451D-table)/2)
			.short ((sc_0x451E-table)/2)
			.short ((sc_0x451F-table)/2)
			.short ((sc_0x4600-table)/2)
			.short ((sc_0x4601-table)/2)
			.short ((sc_0x4602-table)/2)
			.short ((sc_0x4603-table)/2)
			.short ((sc_0x4604-table)/2)
			.short ((sc_0x4605-table)/2)
			.short ((sc_0x4606-table)/2)
			.short ((sc_0x4607-table)/2)
			.short ((sc_0x4608-table)/2)
			.short ((sc_0x4609-table)/2)
			.short ((sc_0x460A-table)/2)
			.short ((sc_0x460B-table)/2)
			.short ((sc_0x460C-table)/2)
			.short ((sc_0x460D-table)/2)
			.short ((sc_0x460E-table)/2)
			.short ((sc_0x460F-table)/2)
			.short ((sc_0x4610-table)/2)
			.short ((sc_0x4611-table)/2)
			.short ((sc_0x4612-table)/2)
			.short ((sc_0x4613-table)/2)
			.short ((sc_0x4614-table)/2)
			.short ((sc_0x4615-table)/2)
			.short ((sc_0x4616-table)/2)
			.short ((sc_0x4617-table)/2)
			.short ((sc_0x4618-table)/2)
			.short ((sc_0x4619-table)/2)
			.short ((sc_0x461A-table)/2)
			.short ((sc_0x461B-table)/2)
			.short ((sc_0x461C-table)/2)
			.short ((sc_0x461D-table)/2)
			.short ((sc_0x461E-table)/2)
			.short ((sc_0x461F-table)/2)
			.short ((sc_0x4700-table)/2)
			.short ((sc_0x4701-table)/2)
			.short ((sc_0x4702-table)/2)
			.short ((sc_0x4703-table)/2)
			.short ((sc_0x4704-table)/2)
			.short ((sc_0x4705-table)/2)
			.short ((sc_0x4706-table)/2)
			.short ((sc_0x4707-table)/2)
			.short ((sc_0x4708-table)/2)
			.short ((sc_0x4709-table)/2)
			.short ((sc_0x470A-table)/2)
			.short ((sc_0x470B-table)/2)
			.short ((sc_0x470C-table)/2)
			.short ((sc_0x470D-table)/2)
			.short ((sc_0x470E-table)/2)
			.short ((sc_0x470F-table)/2)
			.short ((sc_0x4710-table)/2)
			.short ((sc_0x4711-table)/2)
			.short ((sc_0x4712-table)/2)
			.short ((sc_0x4713-table)/2)
			.short ((sc_0x4714-table)/2)
			.short ((sc_0x4715-table)/2)
			.short ((sc_0x4716-table)/2)
			.short ((sc_0x4717-table)/2)
			.short ((sc_0x4718-table)/2)
			.short ((sc_0x4719-table)/2)
			.short ((sc_0x471A-table)/2)
			.short ((sc_0x471B-table)/2)
			.short ((sc_0x471C-table)/2)
			.short ((sc_0x471D-table)/2)
			.short ((sc_0x471E-table)/2)
			.short ((sc_0x471F-table)/2)
			.short ((sc_0x4020-table)/2)
			.short ((sc_0x4021-table)/2)
			.short ((sc_0x4022-table)/2)
			.short ((sc_0x4023-table)/2)
			.short ((sc_0x4024-table)/2)
			.short ((sc_0x4025-table)/2)
			.short ((sc_0x4026-table)/2)
			.short ((sc_0x4027-table)/2)
			.short ((sc_0x4028-table)/2)
			.short ((sc_0x4029-table)/2)
			.short ((sc_0x402A-table)/2)
			.short ((sc_0x402B-table)/2)
			.short ((sc_0x402C-table)/2)
			.short ((sc_0x402D-table)/2)
			.short ((sc_0x402E-table)/2)
			.short ((sc_0x402F-table)/2)
			.short ((sc_0x4030-table)/2)
			.short ((sc_0x4031-table)/2)
			.short ((sc_0x4032-table)/2)
			.short ((sc_0x4033-table)/2)
			.short ((sc_0x4034-table)/2)
			.short ((sc_0x4035-table)/2)
			.short ((sc_0x4036-table)/2)
			.short ((sc_0x4037-table)/2)
			.short ((sc_0x4038-table)/2)
			.short ((sc_0x4039-table)/2)
			.short ((sc_0x403A-table)/2)
			.short ((sc_0x403B-table)/2)
			.short ((sc_0x403C-table)/2)
			.short ((sc_0x403D-table)/2)
			.short ((sc_0x403E-table)/2)
			.short ((sc_0x403F-table)/2)
			.short ((sc_0x4120-table)/2)
			.short ((sc_0x4121-table)/2)
			.short ((sc_0x4122-table)/2)
			.short ((sc_0x4123-table)/2)
			.short ((sc_0x4124-table)/2)
			.short ((sc_0x4125-table)/2)
			.short ((sc_0x4126-table)/2)
			.short ((sc_0x4127-table)/2)
			.short ((sc_0x4128-table)/2)
			.short ((sc_0x4129-table)/2)
			.short ((sc_0x412A-table)/2)
			.short ((sc_0x412B-table)/2)
			.short ((sc_0x412C-table)/2)
			.short ((sc_0x412D-table)/2)
			.short ((sc_0x412E-table)/2)
			.short ((sc_0x412F-table)/2)
			.short ((sc_0x4130-table)/2)
			.short ((sc_0x4131-table)/2)
			.short ((sc_0x4132-table)/2)
			.short ((sc_0x4133-table)/2)
			.short ((sc_0x4134-table)/2)
			.short ((sc_0x4135-table)/2)
			.short ((sc_0x4136-table)/2)
			.short ((sc_0x4137-table)/2)
			.short ((sc_0x4138-table)/2)
			.short ((sc_0x4139-table)/2)
			.short ((sc_0x413A-table)/2)
			.short ((sc_0x413B-table)/2)
			.short ((sc_0x413C-table)/2)
			.short ((sc_0x413D-table)/2)
			.short ((sc_0x413E-table)/2)
			.short ((sc_0x413F-table)/2)
			.short ((sc_0x4220-table)/2)
			.short ((sc_0x4221-table)/2)
			.short ((sc_0x4222-table)/2)
			.short ((sc_0x4223-table)/2)
			.short ((sc_0x4224-table)/2)
			.short ((sc_0x4225-table)/2)
			.short ((sc_0x4226-table)/2)
			.short ((sc_0x4227-table)/2)
			.short ((sc_0x4228-table)/2)
			.short ((sc_0x4229-table)/2)
			.short ((sc_0x422A-table)/2)
			.short ((sc_0x422B-table)/2)
			.short ((sc_0x422C-table)/2)
			.short ((sc_0x422D-table)/2)
			.short ((sc_0x422E-table)/2)
			.short ((sc_0x422F-table)/2)
			.short ((sc_0x4230-table)/2)
			.short ((sc_0x4231-table)/2)
			.short ((sc_0x4232-table)/2)
			.short ((sc_0x4233-table)/2)
			.short ((sc_0x4234-table)/2)
			.short ((sc_0x4235-table)/2)
			.short ((sc_0x4236-table)/2)
			.short ((sc_0x4237-table)/2)
			.short ((sc_0x4238-table)/2)
			.short ((sc_0x4239-table)/2)
			.short ((sc_0x423A-table)/2)
			.short ((sc_0x423B-table)/2)
			.short ((sc_0x423C-table)/2)
			.short ((sc_0x423D-table)/2)
			.short ((sc_0x423E-table)/2)
			.short ((sc_0x423F-table)/2)
			.short ((sc_0x4320-table)/2)
			.short ((sc_0x4321-table)/2)
			.short ((sc_0x4322-table)/2)
			.short ((sc_0x4323-table)/2)
			.short ((sc_0x4324-table)/2)
			.short ((sc_0x4325-table)/2)
			.short ((sc_0x4326-table)/2)
			.short ((sc_0x4327-table)/2)
			.short ((sc_0x4328-table)/2)
			.short ((sc_0x4329-table)/2)
			.short ((sc_0x432A-table)/2)
			.short ((sc_0x432B-table)/2)
			.short ((sc_0x432C-table)/2)
			.short ((sc_0x432D-table)/2)
			.short ((sc_0x432E-table)/2)
			.short ((sc_0x432F-table)/2)
			.short ((sc_0x4330-table)/2)
			.short ((sc_0x4331-table)/2)
			.short ((sc_0x4332-table)/2)
			.short ((sc_0x4333-table)/2)
			.short ((sc_0x4334-table)/2)
			.short ((sc_0x4335-table)/2)
			.short ((sc_0x4336-table)/2)
			.short ((sc_0x4337-table)/2)
			.short ((sc_0x4338-table)/2)
			.short ((sc_0x4339-table)/2)
			.short ((sc_0x433A-table)/2)
			.short ((sc_0x433B-table)/2)
			.short ((sc_0x433C-table)/2)
			.short ((sc_0x433D-table)/2)
			.short ((sc_0x433E-table)/2)
			.short ((sc_0x433F-table)/2)
			.short ((sc_0x4420-table)/2)
			.short ((sc_0x4421-table)/2)
			.short ((sc_0x4422-table)/2)
			.short ((sc_0x4423-table)/2)
			.short ((sc_0x4424-table)/2)
			.short ((sc_0x4425-table)/2)
			.short ((sc_0x4426-table)/2)
			.short ((sc_0x4427-table)/2)
			.short ((sc_0x4428-table)/2)
			.short ((sc_0x4429-table)/2)
			.short ((sc_0x442A-table)/2)
			.short ((sc_0x442B-table)/2)
			.short ((sc_0x442C-table)/2)
			.short ((sc_0x442D-table)/2)
			.short ((sc_0x442E-table)/2)
			.short ((sc_0x442F-table)/2)
			.short ((sc_0x4430-table)/2)
			.short ((sc_0x4431-table)/2)
			.short ((sc_0x4432-table)/2)
			.short ((sc_0x4433-table)/2)
			.short ((sc_0x4434-table)/2)
			.short ((sc_0x4435-table)/2)
			.short ((sc_0x4436-table)/2)
			.short ((sc_0x4437-table)/2)
			.short ((sc_0x4438-table)/2)
			.short ((sc_0x4439-table)/2)
			.short ((sc_0x443A-table)/2)
			.short ((sc_0x443B-table)/2)
			.short ((sc_0x443C-table)/2)
			.short ((sc_0x443D-table)/2)
			.short ((sc_0x443E-table)/2)
			.short ((sc_0x443F-table)/2)
			.short ((sc_0x4520-table)/2)
			.short ((sc_0x4521-table)/2)
			.short ((sc_0x4522-table)/2)
			.short ((sc_0x4523-table)/2)
			.short ((sc_0x4524-table)/2)
			.short ((sc_0x4525-table)/2)
			.short ((sc_0x4526-table)/2)
			.short ((sc_0x4527-table)/2)
			.short ((sc_0x4528-table)/2)
			.short ((sc_0x4529-table)/2)
			.short ((sc_0x452A-table)/2)
			.short ((sc_0x452B-table)/2)
			.short ((sc_0x452C-table)/2)
			.short ((sc_0x452D-table)/2)
			.short ((sc_0x452E-table)/2)
			.short ((sc_0x452F-table)/2)
			.short ((sc_0x4530-table)/2)
			.short ((sc_0x4531-table)/2)
			.short ((sc_0x4532-table)/2)
			.short ((sc_0x4533-table)/2)
			.short ((sc_0x4534-table)/2)
			.short ((sc_0x4535-table)/2)
			.short ((sc_0x4536-table)/2)
			.short ((sc_0x4537-table)/2)
			.short ((sc_0x4538-table)/2)
			.short ((sc_0x4539-table)/2)
			.short ((sc_0x453A-table)/2)
			.short ((sc_0x453B-table)/2)
			.short ((sc_0x453C-table)/2)
			.short ((sc_0x453D-table)/2)
			.short ((sc_0x453E-table)/2)
			.short ((sc_0x453F-table)/2)
			.short ((sc_0x4620-table)/2)
			.short ((sc_0x4621-table)/2)
			.short ((sc_0x4622-table)/2)
			.short ((sc_0x4623-table)/2)
			.short ((sc_0x4624-table)/2)
			.short ((sc_0x4625-table)/2)
			.short ((sc_0x4626-table)/2)
			.short ((sc_0x4627-table)/2)
			.short ((sc_0x4628-table)/2)
			.short ((sc_0x4629-table)/2)
			.short ((sc_0x462A-table)/2)
			.short ((sc_0x462B-table)/2)
			.short ((sc_0x462C-table)/2)
			.short ((sc_0x462D-table)/2)
			.short ((sc_0x462E-table)/2)
			.short ((sc_0x462F-table)/2)
			.short ((sc_0x4630-table)/2)
			.short ((sc_0x4631-table)/2)
			.short ((sc_0x4632-table)/2)
			.short ((sc_0x4633-table)/2)
			.short ((sc_0x4634-table)/2)
			.short ((sc_0x4635-table)/2)
			.short ((sc_0x4636-table)/2)
			.short ((sc_0x4637-table)/2)
			.short ((sc_0x4638-table)/2)
			.short ((sc_0x4639-table)/2)
			.short ((sc_0x463A-table)/2)
			.short ((sc_0x463B-table)/2)
			.short ((sc_0x463C-table)/2)
			.short ((sc_0x463D-table)/2)
			.short ((sc_0x463E-table)/2)
			.short ((sc_0x463F-table)/2)
			.short ((sc_0x4720-table)/2)
			.short ((sc_0x4721-table)/2)
			.short ((sc_0x4722-table)/2)
			.short ((sc_0x4723-table)/2)
			.short ((sc_0x4724-table)/2)
			.short ((sc_0x4725-table)/2)
			.short ((sc_0x4726-table)/2)
			.short ((sc_0x4727-table)/2)
			.short ((sc_0x4728-table)/2)
			.short ((sc_0x4729-table)/2)
			.short ((sc_0x472A-table)/2)
			.short ((sc_0x472B-table)/2)
			.short ((sc_0x472C-table)/2)
			.short ((sc_0x472D-table)/2)
			.short ((sc_0x472E-table)/2)
			.short ((sc_0x472F-table)/2)
			.short ((sc_0x4730-table)/2)
			.short ((sc_0x4731-table)/2)
			.short ((sc_0x4732-table)/2)
			.short ((sc_0x4733-table)/2)
			.short ((sc_0x4734-table)/2)
			.short ((sc_0x4735-table)/2)
			.short ((sc_0x4736-table)/2)
			.short ((sc_0x4737-table)/2)
			.short ((sc_0x4738-table)/2)
			.short ((sc_0x4739-table)/2)
			.short ((sc_0x473A-table)/2)
			.short ((sc_0x473B-table)/2)
			.short ((sc_0x473C-table)/2)
			.short ((sc_0x473D-table)/2)
			.short ((sc_0x473E-table)/2)
			.short ((sc_0x473F-table)/2)
			.short ((sc_0x4040-table)/2)
			.short ((sc_0x4041-table)/2)
			.short ((sc_0x4042-table)/2)
			.short ((sc_0x4043-table)/2)
			.short ((sc_0x4044-table)/2)
			.short ((sc_0x4045-table)/2)
			.short ((sc_0x4046-table)/2)
			.short ((sc_0x4047-table)/2)
			.short ((sc_0x4048-table)/2)
			.short ((sc_0x4049-table)/2)
			.short ((sc_0x404A-table)/2)
			.short ((sc_0x404B-table)/2)
			.short ((sc_0x404C-table)/2)
			.short ((sc_0x404D-table)/2)
			.short ((sc_0x404E-table)/2)
			.short ((sc_0x404F-table)/2)
			.short ((sc_0x4050-table)/2)
			.short ((sc_0x4051-table)/2)
			.short ((sc_0x4052-table)/2)
			.short ((sc_0x4053-table)/2)
			.short ((sc_0x4054-table)/2)
			.short ((sc_0x4055-table)/2)
			.short ((sc_0x4056-table)/2)
			.short ((sc_0x4057-table)/2)
			.short ((sc_0x4058-table)/2)
			.short ((sc_0x4059-table)/2)
			.short ((sc_0x405A-table)/2)
			.short ((sc_0x405B-table)/2)
			.short ((sc_0x405C-table)/2)
			.short ((sc_0x405D-table)/2)
			.short ((sc_0x405E-table)/2)
			.short ((sc_0x405F-table)/2)
			.short ((sc_0x4140-table)/2)
			.short ((sc_0x4141-table)/2)
			.short ((sc_0x4142-table)/2)
			.short ((sc_0x4143-table)/2)
			.short ((sc_0x4144-table)/2)
			.short ((sc_0x4145-table)/2)
			.short ((sc_0x4146-table)/2)
			.short ((sc_0x4147-table)/2)
			.short ((sc_0x4148-table)/2)
			.short ((sc_0x4149-table)/2)
			.short ((sc_0x414A-table)/2)
			.short ((sc_0x414B-table)/2)
			.short ((sc_0x414C-table)/2)
			.short ((sc_0x414D-table)/2)
			.short ((sc_0x414E-table)/2)
			.short ((sc_0x414F-table)/2)
			.short ((sc_0x4150-table)/2)
			.short ((sc_0x4151-table)/2)
			.short ((sc_0x4152-table)/2)
			.short ((sc_0x4153-table)/2)
			.short ((sc_0x4154-table)/2)
			.short ((sc_0x4155-table)/2)
			.short ((sc_0x4156-table)/2)
			.short ((sc_0x4157-table)/2)
			.short ((sc_0x4158-table)/2)
			.short ((sc_0x4159-table)/2)
			.short ((sc_0x415A-table)/2)
			.short ((sc_0x415B-table)/2)
			.short ((sc_0x415C-table)/2)
			.short ((sc_0x415D-table)/2)
			.short ((sc_0x415E-table)/2)
			.short ((sc_0x415F-table)/2)
			.short ((sc_0x4240-table)/2)
			.short ((sc_0x4241-table)/2)
			.short ((sc_0x4242-table)/2)
			.short ((sc_0x4243-table)/2)
			.short ((sc_0x4244-table)/2)
			.short ((sc_0x4245-table)/2)
			.short ((sc_0x4246-table)/2)
			.short ((sc_0x4247-table)/2)
			.short ((sc_0x4248-table)/2)
			.short ((sc_0x4249-table)/2)
			.short ((sc_0x424A-table)/2)
			.short ((sc_0x424B-table)/2)
			.short ((sc_0x424C-table)/2)
			.short ((sc_0x424D-table)/2)
			.short ((sc_0x424E-table)/2)
			.short ((sc_0x424F-table)/2)
			.short ((sc_0x4250-table)/2)
			.short ((sc_0x4251-table)/2)
			.short ((sc_0x4252-table)/2)
			.short ((sc_0x4253-table)/2)
			.short ((sc_0x4254-table)/2)
			.short ((sc_0x4255-table)/2)
			.short ((sc_0x4256-table)/2)
			.short ((sc_0x4257-table)/2)
			.short ((sc_0x4258-table)/2)
			.short ((sc_0x4259-table)/2)
			.short ((sc_0x425A-table)/2)
			.short ((sc_0x425B-table)/2)
			.short ((sc_0x425C-table)/2)
			.short ((sc_0x425D-table)/2)
			.short ((sc_0x425E-table)/2)
			.short ((sc_0x425F-table)/2)
			.short ((sc_0x4340-table)/2)
			.short ((sc_0x4341-table)/2)
			.short ((sc_0x4342-table)/2)
			.short ((sc_0x4343-table)/2)
			.short ((sc_0x4344-table)/2)
			.short ((sc_0x4345-table)/2)
			.short ((sc_0x4346-table)/2)
			.short ((sc_0x4347-table)/2)
			.short ((sc_0x4348-table)/2)
			.short ((sc_0x4349-table)/2)
			.short ((sc_0x434A-table)/2)
			.short ((sc_0x434B-table)/2)
			.short ((sc_0x434C-table)/2)
			.short ((sc_0x434D-table)/2)
			.short ((sc_0x434E-table)/2)
			.short ((sc_0x434F-table)/2)
			.short ((sc_0x4350-table)/2)
			.short ((sc_0x4351-table)/2)
			.short ((sc_0x4352-table)/2)
			.short ((sc_0x4353-table)/2)
			.short ((sc_0x4354-table)/2)
			.short ((sc_0x4355-table)/2)
			.short ((sc_0x4356-table)/2)
			.short ((sc_0x4357-table)/2)
			.short ((sc_0x4358-table)/2)
			.short ((sc_0x4359-table)/2)
			.short ((sc_0x435A-table)/2)
			.short ((sc_0x435B-table)/2)
			.short ((sc_0x435C-table)/2)
			.short ((sc_0x435D-table)/2)
			.short ((sc_0x435E-table)/2)
			.short ((sc_0x435F-table)/2)
			.short ((sc_0x4440-table)/2)
			.short ((sc_0x4441-table)/2)
			.short ((sc_0x4442-table)/2)
			.short ((sc_0x4443-table)/2)
			.short ((sc_0x4444-table)/2)
			.short ((sc_0x4445-table)/2)
			.short ((sc_0x4446-table)/2)
			.short ((sc_0x4447-table)/2)
			.short ((sc_0x4448-table)/2)
			.short ((sc_0x4449-table)/2)
			.short ((sc_0x444A-table)/2)
			.short ((sc_0x444B-table)/2)
			.short ((sc_0x444C-table)/2)
			.short ((sc_0x444D-table)/2)
			.short ((sc_0x444E-table)/2)
			.short ((sc_0x444F-table)/2)
			.short ((sc_0x4450-table)/2)
			.short ((sc_0x4451-table)/2)
			.short ((sc_0x4452-table)/2)
			.short ((sc_0x4453-table)/2)
			.short ((sc_0x4454-table)/2)
			.short ((sc_0x4455-table)/2)
			.short ((sc_0x4456-table)/2)
			.short ((sc_0x4457-table)/2)
			.short ((sc_0x4458-table)/2)
			.short ((sc_0x4459-table)/2)
			.short ((sc_0x445A-table)/2)
			.short ((sc_0x445B-table)/2)
			.short ((sc_0x445C-table)/2)
			.short ((sc_0x445D-table)/2)
			.short ((sc_0x445E-table)/2)
			.short ((sc_0x445F-table)/2)
			.short ((sc_0x4540-table)/2)
			.short ((sc_0x4541-table)/2)
			.short ((sc_0x4542-table)/2)
			.short ((sc_0x4543-table)/2)
			.short ((sc_0x4544-table)/2)
			.short ((sc_0x4545-table)/2)
			.short ((sc_0x4546-table)/2)
			.short ((sc_0x4547-table)/2)
			.short ((sc_0x4548-table)/2)
			.short ((sc_0x4549-table)/2)
			.short ((sc_0x454A-table)/2)
			.short ((sc_0x454B-table)/2)
			.short ((sc_0x454C-table)/2)
			.short ((sc_0x454D-table)/2)
			.short ((sc_0x454E-table)/2)
			.short ((sc_0x454F-table)/2)
			.short ((sc_0x4550-table)/2)
			.short ((sc_0x4551-table)/2)
			.short ((sc_0x4552-table)/2)
			.short ((sc_0x4553-table)/2)
			.short ((sc_0x4554-table)/2)
			.short ((sc_0x4555-table)/2)
			.short ((sc_0x4556-table)/2)
			.short ((sc_0x4557-table)/2)
			.short ((sc_0x4558-table)/2)
			.short ((sc_0x4559-table)/2)
			.short ((sc_0x455A-table)/2)
			.short ((sc_0x455B-table)/2)
			.short ((sc_0x455C-table)/2)
			.short ((sc_0x455D-table)/2)
			.short ((sc_0x455E-table)/2)
			.short ((sc_0x455F-table)/2)
			.short ((sc_0x4640-table)/2)
			.short ((sc_0x4641-table)/2)
			.short ((sc_0x4642-table)/2)
			.short ((sc_0x4643-table)/2)
			.short ((sc_0x4644-table)/2)
			.short ((sc_0x4645-table)/2)
			.short ((sc_0x4646-table)/2)
			.short ((sc_0x4647-table)/2)
			.short ((sc_0x4648-table)/2)
			.short ((sc_0x4649-table)/2)
			.short ((sc_0x464A-table)/2)
			.short ((sc_0x464B-table)/2)
			.short ((sc_0x464C-table)/2)
			.short ((sc_0x464D-table)/2)
			.short ((sc_0x464E-table)/2)
			.short ((sc_0x464F-table)/2)
			.short ((sc_0x4650-table)/2)
			.short ((sc_0x4651-table)/2)
			.short ((sc_0x4652-table)/2)
			.short ((sc_0x4653-table)/2)
			.short ((sc_0x4654-table)/2)
			.short ((sc_0x4655-table)/2)
			.short ((sc_0x4656-table)/2)
			.short ((sc_0x4657-table)/2)
			.short ((sc_0x4658-table)/2)
			.short ((sc_0x4659-table)/2)
			.short ((sc_0x465A-table)/2)
			.short ((sc_0x465B-table)/2)
			.short ((sc_0x465C-table)/2)
			.short ((sc_0x465D-table)/2)
			.short ((sc_0x465E-table)/2)
			.short ((sc_0x465F-table)/2)
			.short ((sc_0x4740-table)/2)
			.short ((sc_0x4741-table)/2)
			.short ((sc_0x4742-table)/2)
			.short ((sc_0x4743-table)/2)
			.short ((sc_0x4744-table)/2)
			.short ((sc_0x4745-table)/2)
			.short ((sc_0x4746-table)/2)
			.short ((sc_0x4747-table)/2)
			.short ((sc_0x4748-table)/2)
			.short ((sc_0x4749-table)/2)
			.short ((sc_0x474A-table)/2)
			.short ((sc_0x474B-table)/2)
			.short ((sc_0x474C-table)/2)
			.short ((sc_0x474D-table)/2)
			.short ((sc_0x474E-table)/2)
			.short ((sc_0x474F-table)/2)
			.short ((sc_0x4750-table)/2)
			.short ((sc_0x4751-table)/2)
			.short ((sc_0x4752-table)/2)
			.short ((sc_0x4753-table)/2)
			.short ((sc_0x4754-table)/2)
			.short ((sc_0x4755-table)/2)
			.short ((sc_0x4756-table)/2)
			.short ((sc_0x4757-table)/2)
			.short ((sc_0x4758-table)/2)
			.short ((sc_0x4759-table)/2)
			.short ((sc_0x475A-table)/2)
			.short ((sc_0x475B-table)/2)
			.short ((sc_0x475C-table)/2)
			.short ((sc_0x475D-table)/2)
			.short ((sc_0x475E-table)/2)
			.short ((sc_0x475F-table)/2)
			.short ((sc_0x4060-table)/2)
			.short ((sc_0x4061-table)/2)
			.short ((sc_0x4062-table)/2)
			.short ((sc_0x4063-table)/2)
			.short ((sc_0x4064-table)/2)
			.short ((sc_0x4065-table)/2)
			.short ((sc_0x4066-table)/2)
			.short ((sc_0x4067-table)/2)
			.short ((sc_0x4068-table)/2)
			.short ((sc_0x4069-table)/2)
			.short ((sc_0x406A-table)/2)
			.short ((sc_0x406B-table)/2)
			.short ((sc_0x406C-table)/2)
			.short ((sc_0x406D-table)/2)
			.short ((sc_0x406E-table)/2)
			.short ((sc_0x406F-table)/2)
			.short ((sc_0x4070-table)/2)
			.short ((sc_0x4071-table)/2)
			.short ((sc_0x4072-table)/2)
			.short ((sc_0x4073-table)/2)
			.short ((sc_0x4074-table)/2)
			.short ((sc_0x4075-table)/2)
			.short ((sc_0x4076-table)/2)
			.short ((sc_0x4077-table)/2)
			.short ((sc_0x4078-table)/2)
			.short ((sc_0x4079-table)/2)
			.short ((sc_0x407A-table)/2)
			.short ((sc_0x407B-table)/2)
			.short ((sc_0x407C-table)/2)
			.short ((sc_0x407D-table)/2)
			.short ((sc_0x407E-table)/2)
			.short ((sc_0x407F-table)/2)
			.short ((sc_0x4160-table)/2)
			.short ((sc_0x4161-table)/2)
			.short ((sc_0x4162-table)/2)
			.short ((sc_0x4163-table)/2)
			.short ((sc_0x4164-table)/2)
			.short ((sc_0x4165-table)/2)
			.short ((sc_0x4166-table)/2)
			.short ((sc_0x4167-table)/2)
			.short ((sc_0x4168-table)/2)
			.short ((sc_0x4169-table)/2)
			.short ((sc_0x416A-table)/2)
			.short ((sc_0x416B-table)/2)
			.short ((sc_0x416C-table)/2)
			.short ((sc_0x416D-table)/2)
			.short ((sc_0x416E-table)/2)
			.short ((sc_0x416F-table)/2)
			.short ((sc_0x4170-table)/2)
			.short ((sc_0x4171-table)/2)
			.short ((sc_0x4172-table)/2)
			.short ((sc_0x4173-table)/2)
			.short ((sc_0x4174-table)/2)
			.short ((sc_0x4175-table)/2)
			.short ((sc_0x4176-table)/2)
			.short ((sc_0x4177-table)/2)
			.short ((sc_0x4178-table)/2)
			.short ((sc_0x4179-table)/2)
			.short ((sc_0x417A-table)/2)
			.short ((sc_0x417B-table)/2)
			.short ((sc_0x417C-table)/2)
			.short ((sc_0x417D-table)/2)
			.short ((sc_0x417E-table)/2)
			.short ((sc_0x417F-table)/2)
			.short ((sc_0x4260-table)/2)
			.short ((sc_0x4261-table)/2)
			.short ((sc_0x4262-table)/2)
			.short ((sc_0x4263-table)/2)
			.short ((sc_0x4264-table)/2)
			.short ((sc_0x4265-table)/2)
			.short ((sc_0x4266-table)/2)
			.short ((sc_0x4267-table)/2)
			.short ((sc_0x4268-table)/2)
			.short ((sc_0x4269-table)/2)
			.short ((sc_0x426A-table)/2)
			.short ((sc_0x426B-table)/2)
			.short ((sc_0x426C-table)/2)
			.short ((sc_0x426D-table)/2)
			.short ((sc_0x426E-table)/2)
			.short ((sc_0x426F-table)/2)
			.short ((sc_0x4270-table)/2)
			.short ((sc_0x4271-table)/2)
			.short ((sc_0x4272-table)/2)
			.short ((sc_0x4273-table)/2)
			.short ((sc_0x4274-table)/2)
			.short ((sc_0x4275-table)/2)
			.short ((sc_0x4276-table)/2)
			.short ((sc_0x4277-table)/2)
			.short ((sc_0x4278-table)/2)
			.short ((sc_0x4279-table)/2)
			.short ((sc_0x427A-table)/2)
			.short ((sc_0x427B-table)/2)
			.short ((sc_0x427C-table)/2)
			.short ((sc_0x427D-table)/2)
			.short ((sc_0x427E-table)/2)
			.short ((sc_0x427F-table)/2)
			.short ((sc_0x4360-table)/2)
			.short ((sc_0x4361-table)/2)
			.short ((sc_0x4362-table)/2)
			.short ((sc_0x4363-table)/2)
			.short ((sc_0x4364-table)/2)
			.short ((sc_0x4365-table)/2)
			.short ((sc_0x4366-table)/2)
			.short ((sc_0x4367-table)/2)
			.short ((sc_0x4368-table)/2)
			.short ((sc_0x4369-table)/2)
			.short ((sc_0x436A-table)/2)
			.short ((sc_0x436B-table)/2)
			.short ((sc_0x436C-table)/2)
			.short ((sc_0x436D-table)/2)
			.short ((sc_0x436E-table)/2)
			.short ((sc_0x436F-table)/2)
			.short ((sc_0x4370-table)/2)
			.short ((sc_0x4371-table)/2)
			.short ((sc_0x4372-table)/2)
			.short ((sc_0x4373-table)/2)
			.short ((sc_0x4374-table)/2)
			.short ((sc_0x4375-table)/2)
			.short ((sc_0x4376-table)/2)
			.short ((sc_0x4377-table)/2)
			.short ((sc_0x4378-table)/2)
			.short ((sc_0x4379-table)/2)
			.short ((sc_0x437A-table)/2)
			.short ((sc_0x437B-table)/2)
			.short ((sc_0x437C-table)/2)
			.short ((sc_0x437D-table)/2)
			.short ((sc_0x437E-table)/2)
			.short ((sc_0x437F-table)/2)
			.short ((sc_0x4460-table)/2)
			.short ((sc_0x4461-table)/2)
			.short ((sc_0x4462-table)/2)
			.short ((sc_0x4463-table)/2)
			.short ((sc_0x4464-table)/2)
			.short ((sc_0x4465-table)/2)
			.short ((sc_0x4466-table)/2)
			.short ((sc_0x4467-table)/2)
			.short ((sc_0x4468-table)/2)
			.short ((sc_0x4469-table)/2)
			.short ((sc_0x446A-table)/2)
			.short ((sc_0x446B-table)/2)
			.short ((sc_0x446C-table)/2)
			.short ((sc_0x446D-table)/2)
			.short ((sc_0x446E-table)/2)
			.short ((sc_0x446F-table)/2)
			.short ((sc_0x4470-table)/2)
			.short ((sc_0x4471-table)/2)
			.short ((sc_0x4472-table)/2)
			.short ((sc_0x4473-table)/2)
			.short ((sc_0x4474-table)/2)
			.short ((sc_0x4475-table)/2)
			.short ((sc_0x4476-table)/2)
			.short ((sc_0x4477-table)/2)
			.short ((sc_0x4478-table)/2)
			.short ((sc_0x4479-table)/2)
			.short ((sc_0x447A-table)/2)
			.short ((sc_0x447B-table)/2)
			.short ((sc_0x447C-table)/2)
			.short ((sc_0x447D-table)/2)
			.short ((sc_0x447E-table)/2)
			.short ((sc_0x447F-table)/2)
			.short ((sc_0x4560-table)/2)
			.short ((sc_0x4561-table)/2)
			.short ((sc_0x4562-table)/2)
			.short ((sc_0x4563-table)/2)
			.short ((sc_0x4564-table)/2)
			.short ((sc_0x4565-table)/2)
			.short ((sc_0x4566-table)/2)
			.short ((sc_0x4567-table)/2)
			.short ((sc_0x4568-table)/2)
			.short ((sc_0x4569-table)/2)
			.short ((sc_0x456A-table)/2)
			.short ((sc_0x456B-table)/2)
			.short ((sc_0x456C-table)/2)
			.short ((sc_0x456D-table)/2)
			.short ((sc_0x456E-table)/2)
			.short ((sc_0x456F-table)/2)
			.short ((sc_0x4570-table)/2)
			.short ((sc_0x4571-table)/2)
			.short ((sc_0x4572-table)/2)
			.short ((sc_0x4573-table)/2)
			.short ((sc_0x4574-table)/2)
			.short ((sc_0x4575-table)/2)
			.short ((sc_0x4576-table)/2)
			.short ((sc_0x4577-table)/2)
			.short ((sc_0x4578-table)/2)
			.short ((sc_0x4579-table)/2)
			.short ((sc_0x457A-table)/2)
			.short ((sc_0x457B-table)/2)
			.short ((sc_0x457C-table)/2)
			.short ((sc_0x457D-table)/2)
			.short ((sc_0x457E-table)/2)
			.short ((sc_0x457F-table)/2)
			.short ((sc_0x4660-table)/2)
			.short ((sc_0x4661-table)/2)
			.short ((sc_0x4662-table)/2)
			.short ((sc_0x4663-table)/2)
			.short ((sc_0x4664-table)/2)
			.short ((sc_0x4665-table)/2)
			.short ((sc_0x4666-table)/2)
			.short ((sc_0x4667-table)/2)
			.short ((sc_0x4668-table)/2)
			.short ((sc_0x4669-table)/2)
			.short ((sc_0x466A-table)/2)
			.short ((sc_0x466B-table)/2)
			.short ((sc_0x466C-table)/2)
			.short ((sc_0x466D-table)/2)
			.short ((sc_0x466E-table)/2)
			.short ((sc_0x466F-table)/2)
			.short ((sc_0x4670-table)/2)
			.short ((sc_0x4671-table)/2)
			.short ((sc_0x4672-table)/2)
			.short ((sc_0x4673-table)/2)
			.short ((sc_0x4674-table)/2)
			.short ((sc_0x4675-table)/2)
			.short ((sc_0x4676-table)/2)
			.short ((sc_0x4677-table)/2)
			.short ((sc_0x4678-table)/2)
			.short ((sc_0x4679-table)/2)
			.short ((sc_0x467A-table)/2)
			.short ((sc_0x467B-table)/2)
			.short ((sc_0x467C-table)/2)
			.short ((sc_0x467D-table)/2)
			.short ((sc_0x467E-table)/2)
			.short ((sc_0x467F-table)/2)
			.short ((sc_0x4760-table)/2)
			.short ((sc_0x4761-table)/2)
			.short ((sc_0x4762-table)/2)
			.short ((sc_0x4763-table)/2)
			.short ((sc_0x4764-table)/2)
			.short ((sc_0x4765-table)/2)
			.short ((sc_0x4766-table)/2)
			.short ((sc_0x4767-table)/2)
			.short ((sc_0x4768-table)/2)
			.short ((sc_0x4769-table)/2)
			.short ((sc_0x476A-table)/2)
			.short ((sc_0x476B-table)/2)
			.short ((sc_0x476C-table)/2)
			.short ((sc_0x476D-table)/2)
			.short ((sc_0x476E-table)/2)
			.short ((sc_0x476F-table)/2)
			.short ((sc_0x4770-table)/2)
			.short ((sc_0x4771-table)/2)
			.short ((sc_0x4772-table)/2)
			.short ((sc_0x4773-table)/2)
			.short ((sc_0x4774-table)/2)
			.short ((sc_0x4775-table)/2)
			.short ((sc_0x4776-table)/2)
			.short ((sc_0x4777-table)/2)
			.short ((sc_0x4778-table)/2)
			.short ((sc_0x4779-table)/2)
			.short ((sc_0x477A-table)/2)
			.short ((sc_0x477B-table)/2)
			.short ((sc_0x477C-table)/2)
			.short ((sc_0x477D-table)/2)
			.short ((sc_0x477E-table)/2)
			.short ((sc_0x477F-table)/2)
			.short ((sc_0x4080-table)/2)
			.short ((sc_0x4081-table)/2)
			.short ((sc_0x4082-table)/2)
			.short ((sc_0x4083-table)/2)
			.short ((sc_0x4084-table)/2)
			.short ((sc_0x4085-table)/2)
			.short ((sc_0x4086-table)/2)
			.short ((sc_0x4087-table)/2)
			.short ((sc_0x4088-table)/2)
			.short ((sc_0x4089-table)/2)
			.short ((sc_0x408A-table)/2)
			.short ((sc_0x408B-table)/2)
			.short ((sc_0x408C-table)/2)
			.short ((sc_0x408D-table)/2)
			.short ((sc_0x408E-table)/2)
			.short ((sc_0x408F-table)/2)
			.short ((sc_0x4090-table)/2)
			.short ((sc_0x4091-table)/2)
			.short ((sc_0x4092-table)/2)
			.short ((sc_0x4093-table)/2)
			.short ((sc_0x4094-table)/2)
			.short ((sc_0x4095-table)/2)
			.short ((sc_0x4096-table)/2)
			.short ((sc_0x4097-table)/2)
			.short ((sc_0x4098-table)/2)
			.short ((sc_0x4099-table)/2)
			.short ((sc_0x409A-table)/2)
			.short ((sc_0x409B-table)/2)
			.short ((sc_0x409C-table)/2)
			.short ((sc_0x409D-table)/2)
			.short ((sc_0x409E-table)/2)
			.short ((sc_0x409F-table)/2)
			.short ((sc_0x4180-table)/2)
			.short ((sc_0x4181-table)/2)
			.short ((sc_0x4182-table)/2)
			.short ((sc_0x4183-table)/2)
			.short ((sc_0x4184-table)/2)
			.short ((sc_0x4185-table)/2)
			.short ((sc_0x4186-table)/2)
			.short ((sc_0x4187-table)/2)
			.short ((sc_0x4188-table)/2)
			.short ((sc_0x4189-table)/2)
			.short ((sc_0x418A-table)/2)
			.short ((sc_0x418B-table)/2)
			.short ((sc_0x418C-table)/2)
			.short ((sc_0x418D-table)/2)
			.short ((sc_0x418E-table)/2)
			.short ((sc_0x418F-table)/2)
			.short ((sc_0x4190-table)/2)
			.short ((sc_0x4191-table)/2)
			.short ((sc_0x4192-table)/2)
			.short ((sc_0x4193-table)/2)
			.short ((sc_0x4194-table)/2)
			.short ((sc_0x4195-table)/2)
			.short ((sc_0x4196-table)/2)
			.short ((sc_0x4197-table)/2)
			.short ((sc_0x4198-table)/2)
			.short ((sc_0x4199-table)/2)
			.short ((sc_0x419A-table)/2)
			.short ((sc_0x419B-table)/2)
			.short ((sc_0x419C-table)/2)
			.short ((sc_0x419D-table)/2)
			.short ((sc_0x419E-table)/2)
			.short ((sc_0x419F-table)/2)
			.short ((sc_0x4280-table)/2)
			.short ((sc_0x4281-table)/2)
			.short ((sc_0x4282-table)/2)
			.short ((sc_0x4283-table)/2)
			.short ((sc_0x4284-table)/2)
			.short ((sc_0x4285-table)/2)
			.short ((sc_0x4286-table)/2)
			.short ((sc_0x4287-table)/2)
			.short ((sc_0x4288-table)/2)
			.short ((sc_0x4289-table)/2)
			.short ((sc_0x428A-table)/2)
			.short ((sc_0x428B-table)/2)
			.short ((sc_0x428C-table)/2)
			.short ((sc_0x428D-table)/2)
			.short ((sc_0x428E-table)/2)
			.short ((sc_0x428F-table)/2)
			.short ((sc_0x4290-table)/2)
			.short ((sc_0x4291-table)/2)
			.short ((sc_0x4292-table)/2)
			.short ((sc_0x4293-table)/2)
			.short ((sc_0x4294-table)/2)
			.short ((sc_0x4295-table)/2)
			.short ((sc_0x4296-table)/2)
			.short ((sc_0x4297-table)/2)
			.short ((sc_0x4298-table)/2)
			.short ((sc_0x4299-table)/2)
			.short ((sc_0x429A-table)/2)
			.short ((sc_0x429B-table)/2)
			.short ((sc_0x429C-table)/2)
			.short ((sc_0x429D-table)/2)
			.short ((sc_0x429E-table)/2)
			.short ((sc_0x429F-table)/2)
			.short ((sc_0x4380-table)/2)
			.short ((sc_0x4381-table)/2)
			.short ((sc_0x4382-table)/2)
			.short ((sc_0x4383-table)/2)
			.short ((sc_0x4384-table)/2)
			.short ((sc_0x4385-table)/2)
			.short ((sc_0x4386-table)/2)
			.short ((sc_0x4387-table)/2)
			.short ((sc_0x4388-table)/2)
			.short ((sc_0x4389-table)/2)
			.short ((sc_0x438A-table)/2)
			.short ((sc_0x438B-table)/2)
			.short ((sc_0x438C-table)/2)
			.short ((sc_0x438D-table)/2)
			.short ((sc_0x438E-table)/2)
			.short ((sc_0x438F-table)/2)
			.short ((sc_0x4390-table)/2)
			.short ((sc_0x4391-table)/2)
			.short ((sc_0x4392-table)/2)
			.short ((sc_0x4393-table)/2)
			.short ((sc_0x4394-table)/2)
			.short ((sc_0x4395-table)/2)
			.short ((sc_0x4396-table)/2)
			.short ((sc_0x4397-table)/2)
			.short ((sc_0x4398-table)/2)
			.short ((sc_0x4399-table)/2)
			.short ((sc_0x439A-table)/2)
			.short ((sc_0x439B-table)/2)
			.short ((sc_0x439C-table)/2)
			.short ((sc_0x439D-table)/2)
			.short ((sc_0x439E-table)/2)
			.short ((sc_0x439F-table)/2)
			.short ((sc_0x4480-table)/2)
			.short ((sc_0x4481-table)/2)
			.short ((sc_0x4482-table)/2)
			.short ((sc_0x4483-table)/2)
			.short ((sc_0x4484-table)/2)
			.short ((sc_0x4485-table)/2)
			.short ((sc_0x4486-table)/2)
			.short ((sc_0x4487-table)/2)
			.short ((sc_0x4488-table)/2)
			.short ((sc_0x4489-table)/2)
			.short ((sc_0x448A-table)/2)
			.short ((sc_0x448B-table)/2)
			.short ((sc_0x448C-table)/2)
			.short ((sc_0x448D-table)/2)
			.short ((sc_0x448E-table)/2)
			.short ((sc_0x448F-table)/2)
			.short ((sc_0x4490-table)/2)
			.short ((sc_0x4491-table)/2)
			.short ((sc_0x4492-table)/2)
			.short ((sc_0x4493-table)/2)
			.short ((sc_0x4494-table)/2)
			.short ((sc_0x4495-table)/2)
			.short ((sc_0x4496-table)/2)
			.short ((sc_0x4497-table)/2)
			.short ((sc_0x4498-table)/2)
			.short ((sc_0x4499-table)/2)
			.short ((sc_0x449A-table)/2)
			.short ((sc_0x449B-table)/2)
			.short ((sc_0x449C-table)/2)
			.short ((sc_0x449D-table)/2)
			.short ((sc_0x449E-table)/2)
			.short ((sc_0x449F-table)/2)
			.short ((sc_0x4580-table)/2)
			.short ((sc_0x4581-table)/2)
			.short ((sc_0x4582-table)/2)
			.short ((sc_0x4583-table)/2)
			.short ((sc_0x4584-table)/2)
			.short ((sc_0x4585-table)/2)
			.short ((sc_0x4586-table)/2)
			.short ((sc_0x4587-table)/2)
			.short ((sc_0x4588-table)/2)
			.short ((sc_0x4589-table)/2)
			.short ((sc_0x458A-table)/2)
			.short ((sc_0x458B-table)/2)
			.short ((sc_0x458C-table)/2)
			.short ((sc_0x458D-table)/2)
			.short ((sc_0x458E-table)/2)
			.short ((sc_0x458F-table)/2)
			.short ((sc_0x4590-table)/2)
			.short ((sc_0x4591-table)/2)
			.short ((sc_0x4592-table)/2)
			.short ((sc_0x4593-table)/2)
			.short ((sc_0x4594-table)/2)
			.short ((sc_0x4595-table)/2)
			.short ((sc_0x4596-table)/2)
			.short ((sc_0x4597-table)/2)
			.short ((sc_0x4598-table)/2)
			.short ((sc_0x4599-table)/2)
			.short ((sc_0x459A-table)/2)
			.short ((sc_0x459B-table)/2)
			.short ((sc_0x459C-table)/2)
			.short ((sc_0x459D-table)/2)
			.short ((sc_0x459E-table)/2)
			.short ((sc_0x459F-table)/2)
			.short ((sc_0x4680-table)/2)
			.short ((sc_0x4681-table)/2)
			.short ((sc_0x4682-table)/2)
			.short ((sc_0x4683-table)/2)
			.short ((sc_0x4684-table)/2)
			.short ((sc_0x4685-table)/2)
			.short ((sc_0x4686-table)/2)
			.short ((sc_0x4687-table)/2)
			.short ((sc_0x4688-table)/2)
			.short ((sc_0x4689-table)/2)
			.short ((sc_0x468A-table)/2)
			.short ((sc_0x468B-table)/2)
			.short ((sc_0x468C-table)/2)
			.short ((sc_0x468D-table)/2)
			.short ((sc_0x468E-table)/2)
			.short ((sc_0x468F-table)/2)
			.short ((sc_0x4690-table)/2)
			.short ((sc_0x4691-table)/2)
			.short ((sc_0x4692-table)/2)
			.short ((sc_0x4693-table)/2)
			.short ((sc_0x4694-table)/2)
			.short ((sc_0x4695-table)/2)
			.short ((sc_0x4696-table)/2)
			.short ((sc_0x4697-table)/2)
			.short ((sc_0x4698-table)/2)
			.short ((sc_0x4699-table)/2)
			.short ((sc_0x469A-table)/2)
			.short ((sc_0x469B-table)/2)
			.short ((sc_0x469C-table)/2)
			.short ((sc_0x469D-table)/2)
			.short ((sc_0x469E-table)/2)
			.short ((sc_0x469F-table)/2)
			.short ((sc_0x4780-table)/2)
			.short ((sc_0x4781-table)/2)
			.short ((sc_0x4782-table)/2)
			.short ((sc_0x4783-table)/2)
			.short ((sc_0x4784-table)/2)
			.short ((sc_0x4785-table)/2)
			.short ((sc_0x4786-table)/2)
			.short ((sc_0x4787-table)/2)
			.short ((sc_0x4788-table)/2)
			.short ((sc_0x4789-table)/2)
			.short ((sc_0x478A-table)/2)
			.short ((sc_0x478B-table)/2)
			.short ((sc_0x478C-table)/2)
			.short ((sc_0x478D-table)/2)
			.short ((sc_0x478E-table)/2)
			.short ((sc_0x478F-table)/2)
			.short ((sc_0x4790-table)/2)
			.short ((sc_0x4791-table)/2)
			.short ((sc_0x4792-table)/2)
			.short ((sc_0x4793-table)/2)
			.short ((sc_0x4794-table)/2)
			.short ((sc_0x4795-table)/2)
			.short ((sc_0x4796-table)/2)
			.short ((sc_0x4797-table)/2)
			.short ((sc_0x4798-table)/2)
			.short ((sc_0x4799-table)/2)
			.short ((sc_0x479A-table)/2)
			.short ((sc_0x479B-table)/2)
			.short ((sc_0x479C-table)/2)
			.short ((sc_0x479D-table)/2)
			.short ((sc_0x479E-table)/2)
			.short ((sc_0x479F-table)/2)
			.short ((sc_0x40A0-table)/2)
			.short ((sc_0x40A1-table)/2)
			.short ((sc_0x40A2-table)/2)
			.short ((sc_0x40A3-table)/2)
			.short ((sc_0x40A4-table)/2)
			.short ((sc_0x40A5-table)/2)
			.short ((sc_0x40A6-table)/2)
			.short ((sc_0x40A7-table)/2)
			.short ((sc_0x40A8-table)/2)
			.short ((sc_0x40A9-table)/2)
			.short ((sc_0x40AA-table)/2)
			.short ((sc_0x40AB-table)/2)
			.short ((sc_0x40AC-table)/2)
			.short ((sc_0x40AD-table)/2)
			.short ((sc_0x40AE-table)/2)
			.short ((sc_0x40AF-table)/2)
			.short ((sc_0x40B0-table)/2)
			.short ((sc_0x40B1-table)/2)
			.short ((sc_0x40B2-table)/2)
			.short ((sc_0x40B3-table)/2)
			.short ((sc_0x40B4-table)/2)
			.short ((sc_0x40B5-table)/2)
			.short ((sc_0x40B6-table)/2)
			.short ((sc_0x40B7-table)/2)
			.short ((sc_0x40B8-table)/2)
			.short ((sc_0x40B9-table)/2)
			.short ((sc_0x40BA-table)/2)
			.short ((sc_0x40BB-table)/2)
			.short ((sc_0x40BC-table)/2)
			.short ((sc_0x40BD-table)/2)
			.short ((sc_0x40BE-table)/2)
			.short ((sc_0x40BF-table)/2)
			.short ((sc_0x41A0-table)/2)
			.short ((sc_0x41A1-table)/2)
			.short ((sc_0x41A2-table)/2)
			.short ((sc_0x41A3-table)/2)
			.short ((sc_0x41A4-table)/2)
			.short ((sc_0x41A5-table)/2)
			.short ((sc_0x41A6-table)/2)
			.short ((sc_0x41A7-table)/2)
			.short ((sc_0x41A8-table)/2)
			.short ((sc_0x41A9-table)/2)
			.short ((sc_0x41AA-table)/2)
			.short ((sc_0x41AB-table)/2)
			.short ((sc_0x41AC-table)/2)
			.short ((sc_0x41AD-table)/2)
			.short ((sc_0x41AE-table)/2)
			.short ((sc_0x41AF-table)/2)
			.short ((sc_0x41B0-table)/2)
			.short ((sc_0x41B1-table)/2)
			.short ((sc_0x41B2-table)/2)
			.short ((sc_0x41B3-table)/2)
			.short ((sc_0x41B4-table)/2)
			.short ((sc_0x41B5-table)/2)
			.short ((sc_0x41B6-table)/2)
			.short ((sc_0x41B7-table)/2)
			.short ((sc_0x41B8-table)/2)
			.short ((sc_0x41B9-table)/2)
			.short ((sc_0x41BA-table)/2)
			.short ((sc_0x41BB-table)/2)
			.short ((sc_0x41BC-table)/2)
			.short ((sc_0x41BD-table)/2)
			.short ((sc_0x41BE-table)/2)
			.short ((sc_0x41BF-table)/2)
			.short ((sc_0x42A0-table)/2)
			.short ((sc_0x42A1-table)/2)
			.short ((sc_0x42A2-table)/2)
			.short ((sc_0x42A3-table)/2)
			.short ((sc_0x42A4-table)/2)
			.short ((sc_0x42A5-table)/2)
			.short ((sc_0x42A6-table)/2)
			.short ((sc_0x42A7-table)/2)
			.short ((sc_0x42A8-table)/2)
			.short ((sc_0x42A9-table)/2)
			.short ((sc_0x42AA-table)/2)
			.short ((sc_0x42AB-table)/2)
			.short ((sc_0x42AC-table)/2)
			.short ((sc_0x42AD-table)/2)
			.short ((sc_0x42AE-table)/2)
			.short ((sc_0x42AF-table)/2)
			.short ((sc_0x42B0-table)/2)
			.short ((sc_0x42B1-table)/2)
			.short ((sc_0x42B2-table)/2)
			.short ((sc_0x42B3-table)/2)
			.short ((sc_0x42B4-table)/2)
			.short ((sc_0x42B5-table)/2)
			.short ((sc_0x42B6-table)/2)
			.short ((sc_0x42B7-table)/2)
			.short ((sc_0x42B8-table)/2)
			.short ((sc_0x42B9-table)/2)
			.short ((sc_0x42BA-table)/2)
			.short ((sc_0x42BB-table)/2)
			.short ((sc_0x42BC-table)/2)
			.short ((sc_0x42BD-table)/2)
			.short ((sc_0x42BE-table)/2)
			.short ((sc_0x42BF-table)/2)
			.short ((sc_0x43A0-table)/2)
			.short ((sc_0x43A1-table)/2)
			.short ((sc_0x43A2-table)/2)
			.short ((sc_0x43A3-table)/2)
			.short ((sc_0x43A4-table)/2)
			.short ((sc_0x43A5-table)/2)
			.short ((sc_0x43A6-table)/2)
			.short ((sc_0x43A7-table)/2)
			.short ((sc_0x43A8-table)/2)
			.short ((sc_0x43A9-table)/2)
			.short ((sc_0x43AA-table)/2)
			.short ((sc_0x43AB-table)/2)
			.short ((sc_0x43AC-table)/2)
			.short ((sc_0x43AD-table)/2)
			.short ((sc_0x43AE-table)/2)
			.short ((sc_0x43AF-table)/2)
			.short ((sc_0x43B0-table)/2)
			.short ((sc_0x43B1-table)/2)
			.short ((sc_0x43B2-table)/2)
			.short ((sc_0x43B3-table)/2)
			.short ((sc_0x43B4-table)/2)
			.short ((sc_0x43B5-table)/2)
			.short ((sc_0x43B6-table)/2)
			.short ((sc_0x43B7-table)/2)
			.short ((sc_0x43B8-table)/2)
			.short ((sc_0x43B9-table)/2)
			.short ((sc_0x43BA-table)/2)
			.short ((sc_0x43BB-table)/2)
			.short ((sc_0x43BC-table)/2)
			.short ((sc_0x43BD-table)/2)
			.short ((sc_0x43BE-table)/2)
			.short ((sc_0x43BF-table)/2)
			.short ((sc_0x44A0-table)/2)
			.short ((sc_0x44A1-table)/2)
			.short ((sc_0x44A2-table)/2)
			.short ((sc_0x44A3-table)/2)
			.short ((sc_0x44A4-table)/2)
			.short ((sc_0x44A5-table)/2)
			.short ((sc_0x44A6-table)/2)
			.short ((sc_0x44A7-table)/2)
			.short ((sc_0x44A8-table)/2)
			.short ((sc_0x44A9-table)/2)
			.short ((sc_0x44AA-table)/2)
			.short ((sc_0x44AB-table)/2)
			.short ((sc_0x44AC-table)/2)
			.short ((sc_0x44AD-table)/2)
			.short ((sc_0x44AE-table)/2)
			.short ((sc_0x44AF-table)/2)
			.short ((sc_0x44B0-table)/2)
			.short ((sc_0x44B1-table)/2)
			.short ((sc_0x44B2-table)/2)
			.short ((sc_0x44B3-table)/2)
			.short ((sc_0x44B4-table)/2)
			.short ((sc_0x44B5-table)/2)
			.short ((sc_0x44B6-table)/2)
			.short ((sc_0x44B7-table)/2)
			.short ((sc_0x44B8-table)/2)
			.short ((sc_0x44B9-table)/2)
			.short ((sc_0x44BA-table)/2)
			.short ((sc_0x44BB-table)/2)
			.short ((sc_0x44BC-table)/2)
			.short ((sc_0x44BD-table)/2)
			.short ((sc_0x44BE-table)/2)
			.short ((sc_0x44BF-table)/2)
			.short ((sc_0x45A0-table)/2)
			.short ((sc_0x45A1-table)/2)
			.short ((sc_0x45A2-table)/2)
			.short ((sc_0x45A3-table)/2)
			.short ((sc_0x45A4-table)/2)
			.short ((sc_0x45A5-table)/2)
			.short ((sc_0x45A6-table)/2)
			.short ((sc_0x45A7-table)/2)
			.short ((sc_0x45A8-table)/2)
			.short ((sc_0x45A9-table)/2)
			.short ((sc_0x45AA-table)/2)
			.short ((sc_0x45AB-table)/2)
			.short ((sc_0x45AC-table)/2)
			.short ((sc_0x45AD-table)/2)
			.short ((sc_0x45AE-table)/2)
			.short ((sc_0x45AF-table)/2)
			.short ((sc_0x45B0-table)/2)
			.short ((sc_0x45B1-table)/2)
			.short ((sc_0x45B2-table)/2)
			.short ((sc_0x45B3-table)/2)
			.short ((sc_0x45B4-table)/2)
			.short ((sc_0x45B5-table)/2)
			.short ((sc_0x45B6-table)/2)
			.short ((sc_0x45B7-table)/2)
			.short ((sc_0x45B8-table)/2)
			.short ((sc_0x45B9-table)/2)
			.short ((sc_0x45BA-table)/2)
			.short ((sc_0x45BB-table)/2)
			.short ((sc_0x45BC-table)/2)
			.short ((sc_0x45BD-table)/2)
			.short ((sc_0x45BE-table)/2)
			.short ((sc_0x45BF-table)/2)
			.short ((sc_0x46A0-table)/2)
			.short ((sc_0x46A1-table)/2)
			.short ((sc_0x46A2-table)/2)
			.short ((sc_0x46A3-table)/2)
			.short ((sc_0x46A4-table)/2)
			.short ((sc_0x46A5-table)/2)
			.short ((sc_0x46A6-table)/2)
			.short ((sc_0x46A7-table)/2)
			.short ((sc_0x46A8-table)/2)
			.short ((sc_0x46A9-table)/2)
			.short ((sc_0x46AA-table)/2)
			.short ((sc_0x46AB-table)/2)
			.short ((sc_0x46AC-table)/2)
			.short ((sc_0x46AD-table)/2)
			.short ((sc_0x46AE-table)/2)
			.short ((sc_0x46AF-table)/2)
			.short ((sc_0x46B0-table)/2)
			.short ((sc_0x46B1-table)/2)
			.short ((sc_0x46B2-table)/2)
			.short ((sc_0x46B3-table)/2)
			.short ((sc_0x46B4-table)/2)
			.short ((sc_0x46B5-table)/2)
			.short ((sc_0x46B6-table)/2)
			.short ((sc_0x46B7-table)/2)
			.short ((sc_0x46B8-table)/2)
			.short ((sc_0x46B9-table)/2)
			.short ((sc_0x46BA-table)/2)
			.short ((sc_0x46BB-table)/2)
			.short ((sc_0x46BC-table)/2)
			.short ((sc_0x46BD-table)/2)
			.short ((sc_0x46BE-table)/2)
			.short ((sc_0x46BF-table)/2)
			.short ((sc_0x47A0-table)/2)
			.short ((sc_0x47A1-table)/2)
			.short ((sc_0x47A2-table)/2)
			.short ((sc_0x47A3-table)/2)
			.short ((sc_0x47A4-table)/2)
			.short ((sc_0x47A5-table)/2)
			.short ((sc_0x47A6-table)/2)
			.short ((sc_0x47A7-table)/2)
			.short ((sc_0x47A8-table)/2)
			.short ((sc_0x47A9-table)/2)
			.short ((sc_0x47AA-table)/2)
			.short ((sc_0x47AB-table)/2)
			.short ((sc_0x47AC-table)/2)
			.short ((sc_0x47AD-table)/2)
			.short ((sc_0x47AE-table)/2)
			.short ((sc_0x47AF-table)/2)
			.short ((sc_0x47B0-table)/2)
			.short ((sc_0x47B1-table)/2)
			.short ((sc_0x47B2-table)/2)
			.short ((sc_0x47B3-table)/2)
			.short ((sc_0x47B4-table)/2)
			.short ((sc_0x47B5-table)/2)
			.short ((sc_0x47B6-table)/2)
			.short ((sc_0x47B7-table)/2)
			.short ((sc_0x47B8-table)/2)
			.short ((sc_0x47B9-table)/2)
			.short ((sc_0x47BA-table)/2)
			.short ((sc_0x47BB-table)/2)
			.short ((sc_0x47BC-table)/2)
			.short ((sc_0x47BD-table)/2)
			.short ((sc_0x47BE-table)/2)
			.short ((sc_0x47BF-table)/2)
			.short ((sc_0x40C0-table)/2)
			.short ((sc_0x40C1-table)/2)
			.short ((sc_0x40C2-table)/2)
			.short ((sc_0x40C3-table)/2)
			.short ((sc_0x40C4-table)/2)
			.short ((sc_0x40C5-table)/2)
			.short ((sc_0x40C6-table)/2)
			.short ((sc_0x40C7-table)/2)
			.short ((sc_0x40C8-table)/2)
			.short ((sc_0x40C9-table)/2)
			.short ((sc_0x40CA-table)/2)
			.short ((sc_0x40CB-table)/2)
			.short ((sc_0x40CC-table)/2)
			.short ((sc_0x40CD-table)/2)
			.short ((sc_0x40CE-table)/2)
			.short ((sc_0x40CF-table)/2)
			.short ((sc_0x40D0-table)/2)
			.short ((sc_0x40D1-table)/2)
			.short ((sc_0x40D2-table)/2)
			.short ((sc_0x40D3-table)/2)
			.short ((sc_0x40D4-table)/2)
			.short ((sc_0x40D5-table)/2)
			.short ((sc_0x40D6-table)/2)
			.short ((sc_0x40D7-table)/2)
			.short ((sc_0x40D8-table)/2)
			.short ((sc_0x40D9-table)/2)
			.short ((sc_0x40DA-table)/2)
			.short ((sc_0x40DB-table)/2)
			.short ((sc_0x40DC-table)/2)
			.short ((sc_0x40DD-table)/2)
			.short ((sc_0x40DE-table)/2)
			.short ((sc_0x40DF-table)/2)
			.short ((sc_0x41C0-table)/2)
			.short ((sc_0x41C1-table)/2)
			.short ((sc_0x41C2-table)/2)
			.short ((sc_0x41C3-table)/2)
			.short ((sc_0x41C4-table)/2)
			.short ((sc_0x41C5-table)/2)
			.short ((sc_0x41C6-table)/2)
			.short ((sc_0x41C7-table)/2)
			.short ((sc_0x41C8-table)/2)
			.short ((sc_0x41C9-table)/2)
			.short ((sc_0x41CA-table)/2)
			.short ((sc_0x41CB-table)/2)
			.short ((sc_0x41CC-table)/2)
			.short ((sc_0x41CD-table)/2)
			.short ((sc_0x41CE-table)/2)
			.short ((sc_0x41CF-table)/2)
			.short ((sc_0x41D0-table)/2)
			.short ((sc_0x41D1-table)/2)
			.short ((sc_0x41D2-table)/2)
			.short ((sc_0x41D3-table)/2)
			.short ((sc_0x41D4-table)/2)
			.short ((sc_0x41D5-table)/2)
			.short ((sc_0x41D6-table)/2)
			.short ((sc_0x41D7-table)/2)
			.short ((sc_0x41D8-table)/2)
			.short ((sc_0x41D9-table)/2)
			.short ((sc_0x41DA-table)/2)
			.short ((sc_0x41DB-table)/2)
			.short ((sc_0x41DC-table)/2)
			.short ((sc_0x41DD-table)/2)
			.short ((sc_0x41DE-table)/2)
			.short ((sc_0x41DF-table)/2)
			.short ((sc_0x42C0-table)/2)
			.short ((sc_0x42C1-table)/2)
			.short ((sc_0x42C2-table)/2)
			.short ((sc_0x42C3-table)/2)
			.short ((sc_0x42C4-table)/2)
			.short ((sc_0x42C5-table)/2)
			.short ((sc_0x42C6-table)/2)
			.short ((sc_0x42C7-table)/2)
			.short ((sc_0x42C8-table)/2)
			.short ((sc_0x42C9-table)/2)
			.short ((sc_0x42CA-table)/2)
			.short ((sc_0x42CB-table)/2)
			.short ((sc_0x42CC-table)/2)
			.short ((sc_0x42CD-table)/2)
			.short ((sc_0x42CE-table)/2)
			.short ((sc_0x42CF-table)/2)
			.short ((sc_0x42D0-table)/2)
			.short ((sc_0x42D1-table)/2)
			.short ((sc_0x42D2-table)/2)
			.short ((sc_0x42D3-table)/2)
			.short ((sc_0x42D4-table)/2)
			.short ((sc_0x42D5-table)/2)
			.short ((sc_0x42D6-table)/2)
			.short ((sc_0x42D7-table)/2)
			.short ((sc_0x42D8-table)/2)
			.short ((sc_0x42D9-table)/2)
			.short ((sc_0x42DA-table)/2)
			.short ((sc_0x42DB-table)/2)
			.short ((sc_0x42DC-table)/2)
			.short ((sc_0x42DD-table)/2)
			.short ((sc_0x42DE-table)/2)
			.short ((sc_0x42DF-table)/2)
			.short ((sc_0x43C0-table)/2)
			.short ((sc_0x43C1-table)/2)
			.short ((sc_0x43C2-table)/2)
			.short ((sc_0x43C3-table)/2)
			.short ((sc_0x43C4-table)/2)
			.short ((sc_0x43C5-table)/2)
			.short ((sc_0x43C6-table)/2)
			.short ((sc_0x43C7-table)/2)
			.short ((sc_0x43C8-table)/2)
			.short ((sc_0x43C9-table)/2)
			.short ((sc_0x43CA-table)/2)
			.short ((sc_0x43CB-table)/2)
			.short ((sc_0x43CC-table)/2)
			.short ((sc_0x43CD-table)/2)
			.short ((sc_0x43CE-table)/2)
			.short ((sc_0x43CF-table)/2)
			.short ((sc_0x43D0-table)/2)
			.short ((sc_0x43D1-table)/2)
			.short ((sc_0x43D2-table)/2)
			.short ((sc_0x43D3-table)/2)
			.short ((sc_0x43D4-table)/2)
			.short ((sc_0x43D5-table)/2)
			.short ((sc_0x43D6-table)/2)
			.short ((sc_0x43D7-table)/2)
			.short ((sc_0x43D8-table)/2)
			.short ((sc_0x43D9-table)/2)
			.short ((sc_0x43DA-table)/2)
			.short ((sc_0x43DB-table)/2)
			.short ((sc_0x43DC-table)/2)
			.short ((sc_0x43DD-table)/2)
			.short ((sc_0x43DE-table)/2)
			.short ((sc_0x43DF-table)/2)
			.short ((sc_0x44C0-table)/2)
			.short ((sc_0x44C1-table)/2)
			.short ((sc_0x44C2-table)/2)
			.short ((sc_0x44C3-table)/2)
			.short ((sc_0x44C4-table)/2)
			.short ((sc_0x44C5-table)/2)
			.short ((sc_0x44C6-table)/2)
			.short ((sc_0x44C7-table)/2)
			.short ((sc_0x44C8-table)/2)
			.short ((sc_0x44C9-table)/2)
			.short ((sc_0x44CA-table)/2)
			.short ((sc_0x44CB-table)/2)
			.short ((sc_0x44CC-table)/2)
			.short ((sc_0x44CD-table)/2)
			.short ((sc_0x44CE-table)/2)
			.short ((sc_0x44CF-table)/2)
			.short ((sc_0x44D0-table)/2)
			.short ((sc_0x44D1-table)/2)
			.short ((sc_0x44D2-table)/2)
			.short ((sc_0x44D3-table)/2)
			.short ((sc_0x44D4-table)/2)
			.short ((sc_0x44D5-table)/2)
			.short ((sc_0x44D6-table)/2)
			.short ((sc_0x44D7-table)/2)
			.short ((sc_0x44D8-table)/2)
			.short ((sc_0x44D9-table)/2)
			.short ((sc_0x44DA-table)/2)
			.short ((sc_0x44DB-table)/2)
			.short ((sc_0x44DC-table)/2)
			.short ((sc_0x44DD-table)/2)
			.short ((sc_0x44DE-table)/2)
			.short ((sc_0x44DF-table)/2)
			.short ((sc_0x45C0-table)/2)
			.short ((sc_0x45C1-table)/2)
			.short ((sc_0x45C2-table)/2)
			.short ((sc_0x45C3-table)/2)
			.short ((sc_0x45C4-table)/2)
			.short ((sc_0x45C5-table)/2)
			.short ((sc_0x45C6-table)/2)
			.short ((sc_0x45C7-table)/2)
			.short ((sc_0x45C8-table)/2)
			.short ((sc_0x45C9-table)/2)
			.short ((sc_0x45CA-table)/2)
			.short ((sc_0x45CB-table)/2)
			.short ((sc_0x45CC-table)/2)
			.short ((sc_0x45CD-table)/2)
			.short ((sc_0x45CE-table)/2)
			.short ((sc_0x45CF-table)/2)
			.short ((sc_0x45D0-table)/2)
			.short ((sc_0x45D1-table)/2)
			.short ((sc_0x45D2-table)/2)
			.short ((sc_0x45D3-table)/2)
			.short ((sc_0x45D4-table)/2)
			.short ((sc_0x45D5-table)/2)
			.short ((sc_0x45D6-table)/2)
			.short ((sc_0x45D7-table)/2)
			.short ((sc_0x45D8-table)/2)
			.short ((sc_0x45D9-table)/2)
			.short ((sc_0x45DA-table)/2)
			.short ((sc_0x45DB-table)/2)
			.short ((sc_0x45DC-table)/2)
			.short ((sc_0x45DD-table)/2)
			.short ((sc_0x45DE-table)/2)
			.short ((sc_0x45DF-table)/2)
			.short ((sc_0x46C0-table)/2)
			.short ((sc_0x46C1-table)/2)
			.short ((sc_0x46C2-table)/2)
			.short ((sc_0x46C3-table)/2)
			.short ((sc_0x46C4-table)/2)
			.short ((sc_0x46C5-table)/2)
			.short ((sc_0x46C6-table)/2)
			.short ((sc_0x46C7-table)/2)
			.short ((sc_0x46C8-table)/2)
			.short ((sc_0x46C9-table)/2)
			.short ((sc_0x46CA-table)/2)
			.short ((sc_0x46CB-table)/2)
			.short ((sc_0x46CC-table)/2)
			.short ((sc_0x46CD-table)/2)
			.short ((sc_0x46CE-table)/2)
			.short ((sc_0x46CF-table)/2)
			.short ((sc_0x46D0-table)/2)
			.short ((sc_0x46D1-table)/2)
			.short ((sc_0x46D2-table)/2)
			.short ((sc_0x46D3-table)/2)
			.short ((sc_0x46D4-table)/2)
			.short ((sc_0x46D5-table)/2)
			.short ((sc_0x46D6-table)/2)
			.short ((sc_0x46D7-table)/2)
			.short ((sc_0x46D8-table)/2)
			.short ((sc_0x46D9-table)/2)
			.short ((sc_0x46DA-table)/2)
			.short ((sc_0x46DB-table)/2)
			.short ((sc_0x46DC-table)/2)
			.short ((sc_0x46DD-table)/2)
			.short ((sc_0x46DE-table)/2)
			.short ((sc_0x46DF-table)/2)
			.short ((sc_0x47C0-table)/2)
			.short ((sc_0x47C1-table)/2)
			.short ((sc_0x47C2-table)/2)
			.short ((sc_0x47C3-table)/2)
			.short ((sc_0x47C4-table)/2)
			.short ((sc_0x47C5-table)/2)
			.short ((sc_0x47C6-table)/2)
			.short ((sc_0x47C7-table)/2)
			.short ((sc_0x47C8-table)/2)
			.short ((sc_0x47C9-table)/2)
			.short ((sc_0x47CA-table)/2)
			.short ((sc_0x47CB-table)/2)
			.short ((sc_0x47CC-table)/2)
			.short ((sc_0x47CD-table)/2)
			.short ((sc_0x47CE-table)/2)
			.short ((sc_0x47CF-table)/2)
			.short ((sc_0x47D0-table)/2)
			.short ((sc_0x47D1-table)/2)
			.short ((sc_0x47D2-table)/2)
			.short ((sc_0x47D3-table)/2)
			.short ((sc_0x47D4-table)/2)
			.short ((sc_0x47D5-table)/2)
			.short ((sc_0x47D6-table)/2)
			.short ((sc_0x47D7-table)/2)
			.short ((sc_0x47D8-table)/2)
			.short ((sc_0x47D9-table)/2)
			.short ((sc_0x47DA-table)/2)
			.short ((sc_0x47DB-table)/2)
			.short ((sc_0x47DC-table)/2)
			.short ((sc_0x47DD-table)/2)
			.short ((sc_0x47DE-table)/2)
			.short ((sc_0x47DF-table)/2)
			.short ((sc_0x40E0-table)/2)
			.short ((sc_0x40E1-table)/2)
			.short ((sc_0x40E2-table)/2)
			.short ((sc_0x40E3-table)/2)
			.short ((sc_0x40E4-table)/2)
			.short ((sc_0x40E5-table)/2)
			.short ((sc_0x40E6-table)/2)
			.short ((sc_0x40E7-table)/2)
			.short ((sc_0x40E8-table)/2)
			.short ((sc_0x40E9-table)/2)
			.short ((sc_0x40EA-table)/2)
			.short ((sc_0x40EB-table)/2)
			.short ((sc_0x40EC-table)/2)
			.short ((sc_0x40ED-table)/2)
			.short ((sc_0x40EE-table)/2)
			.short ((sc_0x40EF-table)/2)
			.short ((sc_0x40F0-table)/2)
			.short ((sc_0x40F1-table)/2)
			.short ((sc_0x40F2-table)/2)
			.short ((sc_0x40F3-table)/2)
			.short ((sc_0x40F4-table)/2)
			.short ((sc_0x40F5-table)/2)
			.short ((sc_0x40F6-table)/2)
			.short ((sc_0x40F7-table)/2)
			.short ((sc_0x40F8-table)/2)
			.short ((sc_0x40F9-table)/2)
			.short ((sc_0x40FA-table)/2)
			.short ((sc_0x40FB-table)/2)
			.short ((sc_0x40FC-table)/2)
			.short ((sc_0x40FD-table)/2)
			.short ((sc_0x40FE-table)/2)
			.short ((sc_0x40FF-table)/2)
			.short ((sc_0x41E0-table)/2)
			.short ((sc_0x41E1-table)/2)
			.short ((sc_0x41E2-table)/2)
			.short ((sc_0x41E3-table)/2)
			.short ((sc_0x41E4-table)/2)
			.short ((sc_0x41E5-table)/2)
			.short ((sc_0x41E6-table)/2)
			.short ((sc_0x41E7-table)/2)
			.short ((sc_0x41E8-table)/2)
			.short ((sc_0x41E9-table)/2)
			.short ((sc_0x41EA-table)/2)
			.short ((sc_0x41EB-table)/2)
			.short ((sc_0x41EC-table)/2)
			.short ((sc_0x41ED-table)/2)
			.short ((sc_0x41EE-table)/2)
			.short ((sc_0x41EF-table)/2)
			.short ((sc_0x41F0-table)/2)
			.short ((sc_0x41F1-table)/2)
			.short ((sc_0x41F2-table)/2)
			.short ((sc_0x41F3-table)/2)
			.short ((sc_0x41F4-table)/2)
			.short ((sc_0x41F5-table)/2)
			.short ((sc_0x41F6-table)/2)
			.short ((sc_0x41F7-table)/2)
			.short ((sc_0x41F8-table)/2)
			.short ((sc_0x41F9-table)/2)
			.short ((sc_0x41FA-table)/2)
			.short ((sc_0x41FB-table)/2)
			.short ((sc_0x41FC-table)/2)
			.short ((sc_0x41FD-table)/2)
			.short ((sc_0x41FE-table)/2)
			.short ((sc_0x41FF-table)/2)
			.short ((sc_0x42E0-table)/2)
			.short ((sc_0x42E1-table)/2)
			.short ((sc_0x42E2-table)/2)
			.short ((sc_0x42E3-table)/2)
			.short ((sc_0x42E4-table)/2)
			.short ((sc_0x42E5-table)/2)
			.short ((sc_0x42E6-table)/2)
			.short ((sc_0x42E7-table)/2)
			.short ((sc_0x42E8-table)/2)
			.short ((sc_0x42E9-table)/2)
			.short ((sc_0x42EA-table)/2)
			.short ((sc_0x42EB-table)/2)
			.short ((sc_0x42EC-table)/2)
			.short ((sc_0x42ED-table)/2)
			.short ((sc_0x42EE-table)/2)
			.short ((sc_0x42EF-table)/2)
			.short ((sc_0x42F0-table)/2)
			.short ((sc_0x42F1-table)/2)
			.short ((sc_0x42F2-table)/2)
			.short ((sc_0x42F3-table)/2)
			.short ((sc_0x42F4-table)/2)
			.short ((sc_0x42F5-table)/2)
			.short ((sc_0x42F6-table)/2)
			.short ((sc_0x42F7-table)/2)
			.short ((sc_0x42F8-table)/2)
			.short ((sc_0x42F9-table)/2)
			.short ((sc_0x42FA-table)/2)
			.short ((sc_0x42FB-table)/2)
			.short ((sc_0x42FC-table)/2)
			.short ((sc_0x42FD-table)/2)
			.short ((sc_0x42FE-table)/2)
			.short ((sc_0x42FF-table)/2)
			.short ((sc_0x43E0-table)/2)
			.short ((sc_0x43E1-table)/2)
			.short ((sc_0x43E2-table)/2)
			.short ((sc_0x43E3-table)/2)
			.short ((sc_0x43E4-table)/2)
			.short ((sc_0x43E5-table)/2)
			.short ((sc_0x43E6-table)/2)
			.short ((sc_0x43E7-table)/2)
			.short ((sc_0x43E8-table)/2)
			.short ((sc_0x43E9-table)/2)
			.short ((sc_0x43EA-table)/2)
			.short ((sc_0x43EB-table)/2)
			.short ((sc_0x43EC-table)/2)
			.short ((sc_0x43ED-table)/2)
			.short ((sc_0x43EE-table)/2)
			.short ((sc_0x43EF-table)/2)
			.short ((sc_0x43F0-table)/2)
			.short ((sc_0x43F1-table)/2)
			.short ((sc_0x43F2-table)/2)
			.short ((sc_0x43F3-table)/2)
			.short ((sc_0x43F4-table)/2)
			.short ((sc_0x43F5-table)/2)
			.short ((sc_0x43F6-table)/2)
			.short ((sc_0x43F7-table)/2)
			.short ((sc_0x43F8-table)/2)
			.short ((sc_0x43F9-table)/2)
			.short ((sc_0x43FA-table)/2)
			.short ((sc_0x43FB-table)/2)
			.short ((sc_0x43FC-table)/2)
			.short ((sc_0x43FD-table)/2)
			.short ((sc_0x43FE-table)/2)
			.short ((sc_0x43FF-table)/2)
			.short ((sc_0x44E0-table)/2)
			.short ((sc_0x44E1-table)/2)
			.short ((sc_0x44E2-table)/2)
			.short ((sc_0x44E3-table)/2)
			.short ((sc_0x44E4-table)/2)
			.short ((sc_0x44E5-table)/2)
			.short ((sc_0x44E6-table)/2)
			.short ((sc_0x44E7-table)/2)
			.short ((sc_0x44E8-table)/2)
			.short ((sc_0x44E9-table)/2)
			.short ((sc_0x44EA-table)/2)
			.short ((sc_0x44EB-table)/2)
			.short ((sc_0x44EC-table)/2)
			.short ((sc_0x44ED-table)/2)
			.short ((sc_0x44EE-table)/2)
			.short ((sc_0x44EF-table)/2)
			.short ((sc_0x44F0-table)/2)
			.short ((sc_0x44F1-table)/2)
			.short ((sc_0x44F2-table)/2)
			.short ((sc_0x44F3-table)/2)
			.short ((sc_0x44F4-table)/2)
			.short ((sc_0x44F5-table)/2)
			.short ((sc_0x44F6-table)/2)
			.short ((sc_0x44F7-table)/2)
			.short ((sc_0x44F8-table)/2)
			.short ((sc_0x44F9-table)/2)
			.short ((sc_0x44FA-table)/2)
			.short ((sc_0x44FB-table)/2)
			.short ((sc_0x44FC-table)/2)
			.short ((sc_0x44FD-table)/2)
			.short ((sc_0x44FE-table)/2)
			.short ((sc_0x44FF-table)/2)
			.short ((sc_0x45E0-table)/2)
			.short ((sc_0x45E1-table)/2)
			.short ((sc_0x45E2-table)/2)
			.short ((sc_0x45E3-table)/2)
			.short ((sc_0x45E4-table)/2)
			.short ((sc_0x45E5-table)/2)
			.short ((sc_0x45E6-table)/2)
			.short ((sc_0x45E7-table)/2)
			.short ((sc_0x45E8-table)/2)
			.short ((sc_0x45E9-table)/2)
			.short ((sc_0x45EA-table)/2)
			.short ((sc_0x45EB-table)/2)
			.short ((sc_0x45EC-table)/2)
			.short ((sc_0x45ED-table)/2)
			.short ((sc_0x45EE-table)/2)
			.short ((sc_0x45EF-table)/2)
			.short ((sc_0x45F0-table)/2)
			.short ((sc_0x45F1-table)/2)
			.short ((sc_0x45F2-table)/2)
			.short ((sc_0x45F3-table)/2)
			.short ((sc_0x45F4-table)/2)
			.short ((sc_0x45F5-table)/2)
			.short ((sc_0x45F6-table)/2)
			.short ((sc_0x45F7-table)/2)
			.short ((sc_0x45F8-table)/2)
			.short ((sc_0x45F9-table)/2)
			.short ((sc_0x45FA-table)/2)
			.short ((sc_0x45FB-table)/2)
			.short ((sc_0x45FC-table)/2)
			.short ((sc_0x45FD-table)/2)
			.short ((sc_0x45FE-table)/2)
			.short ((sc_0x45FF-table)/2)
			.short ((sc_0x46E0-table)/2)
			.short ((sc_0x46E1-table)/2)
			.short ((sc_0x46E2-table)/2)
			.short ((sc_0x46E3-table)/2)
			.short ((sc_0x46E4-table)/2)
			.short ((sc_0x46E5-table)/2)
			.short ((sc_0x46E6-table)/2)
			.short ((sc_0x46E7-table)/2)
			.short ((sc_0x46E8-table)/2)
			.short ((sc_0x46E9-table)/2)
			.short ((sc_0x46EA-table)/2)
			.short ((sc_0x46EB-table)/2)
			.short ((sc_0x46EC-table)/2)
			.short ((sc_0x46ED-table)/2)
			.short ((sc_0x46EE-table)/2)
			.short ((sc_0x46EF-table)/2)
			.short ((sc_0x46F0-table)/2)
			.short ((sc_0x46F1-table)/2)
			.short ((sc_0x46F2-table)/2)
			.short ((sc_0x46F3-table)/2)
			.short ((sc_0x46F4-table)/2)
			.short ((sc_0x46F5-table)/2)
			.short ((sc_0x46F6-table)/2)
			.short ((sc_0x46F7-table)/2)
			.short ((sc_0x46F8-table)/2)
			.short ((sc_0x46F9-table)/2)
			.short ((sc_0x46FA-table)/2)
			.short ((sc_0x46FB-table)/2)
			.short ((sc_0x46FC-table)/2)
			.short ((sc_0x46FD-table)/2)
			.short ((sc_0x46FE-table)/2)
			.short ((sc_0x46FF-table)/2)
			.short ((sc_0x47E0-table)/2)
			.short ((sc_0x47E1-table)/2)
			.short ((sc_0x47E2-table)/2)
			.short ((sc_0x47E3-table)/2)
			.short ((sc_0x47E4-table)/2)
			.short ((sc_0x47E5-table)/2)
			.short ((sc_0x47E6-table)/2)
			.short ((sc_0x47E7-table)/2)
			.short ((sc_0x47E8-table)/2)
			.short ((sc_0x47E9-table)/2)
			.short ((sc_0x47EA-table)/2)
			.short ((sc_0x47EB-table)/2)
			.short ((sc_0x47EC-table)/2)
			.short ((sc_0x47ED-table)/2)
			.short ((sc_0x47EE-table)/2)
			.short ((sc_0x47EF-table)/2)
			.short ((sc_0x47F0-table)/2)
			.short ((sc_0x47F1-table)/2)
			.short ((sc_0x47F2-table)/2)
			.short ((sc_0x47F3-table)/2)
			.short ((sc_0x47F4-table)/2)
			.short ((sc_0x47F5-table)/2)
			.short ((sc_0x47F6-table)/2)
			.short ((sc_0x47F7-table)/2)
			.short ((sc_0x47F8-table)/2)
			.short ((sc_0x47F9-table)/2)
			.short ((sc_0x47FA-table)/2)
			.short ((sc_0x47FB-table)/2)
			.short ((sc_0x47FC-table)/2)
			.short ((sc_0x47FD-table)/2)
			.short ((sc_0x47FE-table)/2)
			.short ((sc_0x47FF-table)/2)
			.short ((sc_0x4800-table)/2)
			.short ((sc_0x4801-table)/2)
			.short ((sc_0x4802-table)/2)
			.short ((sc_0x4803-table)/2)
			.short ((sc_0x4804-table)/2)
			.short ((sc_0x4805-table)/2)
			.short ((sc_0x4806-table)/2)
			.short ((sc_0x4807-table)/2)
			.short ((sc_0x4808-table)/2)
			.short ((sc_0x4809-table)/2)
			.short ((sc_0x480A-table)/2)
			.short ((sc_0x480B-table)/2)
			.short ((sc_0x480C-table)/2)
			.short ((sc_0x480D-table)/2)
			.short ((sc_0x480E-table)/2)
			.short ((sc_0x480F-table)/2)
			.short ((sc_0x4810-table)/2)
			.short ((sc_0x4811-table)/2)
			.short ((sc_0x4812-table)/2)
			.short ((sc_0x4813-table)/2)
			.short ((sc_0x4814-table)/2)
			.short ((sc_0x4815-table)/2)
			.short ((sc_0x4816-table)/2)
			.short ((sc_0x4817-table)/2)
			.short ((sc_0x4818-table)/2)
			.short ((sc_0x4819-table)/2)
			.short ((sc_0x481A-table)/2)
			.short ((sc_0x481B-table)/2)
			.short ((sc_0x481C-table)/2)
			.short ((sc_0x481D-table)/2)
			.short ((sc_0x481E-table)/2)
			.short ((sc_0x481F-table)/2)
			.short ((sc_0x4900-table)/2)
			.short ((sc_0x4901-table)/2)
			.short ((sc_0x4902-table)/2)
			.short ((sc_0x4903-table)/2)
			.short ((sc_0x4904-table)/2)
			.short ((sc_0x4905-table)/2)
			.short ((sc_0x4906-table)/2)
			.short ((sc_0x4907-table)/2)
			.short ((sc_0x4908-table)/2)
			.short ((sc_0x4909-table)/2)
			.short ((sc_0x490A-table)/2)
			.short ((sc_0x490B-table)/2)
			.short ((sc_0x490C-table)/2)
			.short ((sc_0x490D-table)/2)
			.short ((sc_0x490E-table)/2)
			.short ((sc_0x490F-table)/2)
			.short ((sc_0x4910-table)/2)
			.short ((sc_0x4911-table)/2)
			.short ((sc_0x4912-table)/2)
			.short ((sc_0x4913-table)/2)
			.short ((sc_0x4914-table)/2)
			.short ((sc_0x4915-table)/2)
			.short ((sc_0x4916-table)/2)
			.short ((sc_0x4917-table)/2)
			.short ((sc_0x4918-table)/2)
			.short ((sc_0x4919-table)/2)
			.short ((sc_0x491A-table)/2)
			.short ((sc_0x491B-table)/2)
			.short ((sc_0x491C-table)/2)
			.short ((sc_0x491D-table)/2)
			.short ((sc_0x491E-table)/2)
			.short ((sc_0x491F-table)/2)
			.short ((sc_0x4A00-table)/2)
			.short ((sc_0x4A01-table)/2)
			.short ((sc_0x4A02-table)/2)
			.short ((sc_0x4A03-table)/2)
			.short ((sc_0x4A04-table)/2)
			.short ((sc_0x4A05-table)/2)
			.short ((sc_0x4A06-table)/2)
			.short ((sc_0x4A07-table)/2)
			.short ((sc_0x4A08-table)/2)
			.short ((sc_0x4A09-table)/2)
			.short ((sc_0x4A0A-table)/2)
			.short ((sc_0x4A0B-table)/2)
			.short ((sc_0x4A0C-table)/2)
			.short ((sc_0x4A0D-table)/2)
			.short ((sc_0x4A0E-table)/2)
			.short ((sc_0x4A0F-table)/2)
			.short ((sc_0x4A10-table)/2)
			.short ((sc_0x4A11-table)/2)
			.short ((sc_0x4A12-table)/2)
			.short ((sc_0x4A13-table)/2)
			.short ((sc_0x4A14-table)/2)
			.short ((sc_0x4A15-table)/2)
			.short ((sc_0x4A16-table)/2)
			.short ((sc_0x4A17-table)/2)
			.short ((sc_0x4A18-table)/2)
			.short ((sc_0x4A19-table)/2)
			.short ((sc_0x4A1A-table)/2)
			.short ((sc_0x4A1B-table)/2)
			.short ((sc_0x4A1C-table)/2)
			.short ((sc_0x4A1D-table)/2)
			.short ((sc_0x4A1E-table)/2)
			.short ((sc_0x4A1F-table)/2)
			.short ((sc_0x4B00-table)/2)
			.short ((sc_0x4B01-table)/2)
			.short ((sc_0x4B02-table)/2)
			.short ((sc_0x4B03-table)/2)
			.short ((sc_0x4B04-table)/2)
			.short ((sc_0x4B05-table)/2)
			.short ((sc_0x4B06-table)/2)
			.short ((sc_0x4B07-table)/2)
			.short ((sc_0x4B08-table)/2)
			.short ((sc_0x4B09-table)/2)
			.short ((sc_0x4B0A-table)/2)
			.short ((sc_0x4B0B-table)/2)
			.short ((sc_0x4B0C-table)/2)
			.short ((sc_0x4B0D-table)/2)
			.short ((sc_0x4B0E-table)/2)
			.short ((sc_0x4B0F-table)/2)
			.short ((sc_0x4B10-table)/2)
			.short ((sc_0x4B11-table)/2)
			.short ((sc_0x4B12-table)/2)
			.short ((sc_0x4B13-table)/2)
			.short ((sc_0x4B14-table)/2)
			.short ((sc_0x4B15-table)/2)
			.short ((sc_0x4B16-table)/2)
			.short ((sc_0x4B17-table)/2)
			.short ((sc_0x4B18-table)/2)
			.short ((sc_0x4B19-table)/2)
			.short ((sc_0x4B1A-table)/2)
			.short ((sc_0x4B1B-table)/2)
			.short ((sc_0x4B1C-table)/2)
			.short ((sc_0x4B1D-table)/2)
			.short ((sc_0x4B1E-table)/2)
			.short ((sc_0x4B1F-table)/2)
			.short ((sc_0x4C00-table)/2)
			.short ((sc_0x4C01-table)/2)
			.short ((sc_0x4C02-table)/2)
			.short ((sc_0x4C03-table)/2)
			.short ((sc_0x4C04-table)/2)
			.short ((sc_0x4C05-table)/2)
			.short ((sc_0x4C06-table)/2)
			.short ((sc_0x4C07-table)/2)
			.short ((sc_0x4C08-table)/2)
			.short ((sc_0x4C09-table)/2)
			.short ((sc_0x4C0A-table)/2)
			.short ((sc_0x4C0B-table)/2)
			.short ((sc_0x4C0C-table)/2)
			.short ((sc_0x4C0D-table)/2)
			.short ((sc_0x4C0E-table)/2)
			.short ((sc_0x4C0F-table)/2)
			.short ((sc_0x4C10-table)/2)
			.short ((sc_0x4C11-table)/2)
			.short ((sc_0x4C12-table)/2)
			.short ((sc_0x4C13-table)/2)
			.short ((sc_0x4C14-table)/2)
			.short ((sc_0x4C15-table)/2)
			.short ((sc_0x4C16-table)/2)
			.short ((sc_0x4C17-table)/2)
			.short ((sc_0x4C18-table)/2)
			.short ((sc_0x4C19-table)/2)
			.short ((sc_0x4C1A-table)/2)
			.short ((sc_0x4C1B-table)/2)
			.short ((sc_0x4C1C-table)/2)
			.short ((sc_0x4C1D-table)/2)
			.short ((sc_0x4C1E-table)/2)
			.short ((sc_0x4C1F-table)/2)
			.short ((sc_0x4D00-table)/2)
			.short ((sc_0x4D01-table)/2)
			.short ((sc_0x4D02-table)/2)
			.short ((sc_0x4D03-table)/2)
			.short ((sc_0x4D04-table)/2)
			.short ((sc_0x4D05-table)/2)
			.short ((sc_0x4D06-table)/2)
			.short ((sc_0x4D07-table)/2)
			.short ((sc_0x4D08-table)/2)
			.short ((sc_0x4D09-table)/2)
			.short ((sc_0x4D0A-table)/2)
			.short ((sc_0x4D0B-table)/2)
			.short ((sc_0x4D0C-table)/2)
			.short ((sc_0x4D0D-table)/2)
			.short ((sc_0x4D0E-table)/2)
			.short ((sc_0x4D0F-table)/2)
			.short ((sc_0x4D10-table)/2)
			.short ((sc_0x4D11-table)/2)
			.short ((sc_0x4D12-table)/2)
			.short ((sc_0x4D13-table)/2)
			.short ((sc_0x4D14-table)/2)
			.short ((sc_0x4D15-table)/2)
			.short ((sc_0x4D16-table)/2)
			.short ((sc_0x4D17-table)/2)
			.short ((sc_0x4D18-table)/2)
			.short ((sc_0x4D19-table)/2)
			.short ((sc_0x4D1A-table)/2)
			.short ((sc_0x4D1B-table)/2)
			.short ((sc_0x4D1C-table)/2)
			.short ((sc_0x4D1D-table)/2)
			.short ((sc_0x4D1E-table)/2)
			.short ((sc_0x4D1F-table)/2)
			.short ((sc_0x4E00-table)/2)
			.short ((sc_0x4E01-table)/2)
			.short ((sc_0x4E02-table)/2)
			.short ((sc_0x4E03-table)/2)
			.short ((sc_0x4E04-table)/2)
			.short ((sc_0x4E05-table)/2)
			.short ((sc_0x4E06-table)/2)
			.short ((sc_0x4E07-table)/2)
			.short ((sc_0x4E08-table)/2)
			.short ((sc_0x4E09-table)/2)
			.short ((sc_0x4E0A-table)/2)
			.short ((sc_0x4E0B-table)/2)
			.short ((sc_0x4E0C-table)/2)
			.short ((sc_0x4E0D-table)/2)
			.short ((sc_0x4E0E-table)/2)
			.short ((sc_0x4E0F-table)/2)
			.short ((sc_0x4E10-table)/2)
			.short ((sc_0x4E11-table)/2)
			.short ((sc_0x4E12-table)/2)
			.short ((sc_0x4E13-table)/2)
			.short ((sc_0x4E14-table)/2)
			.short ((sc_0x4E15-table)/2)
			.short ((sc_0x4E16-table)/2)
			.short ((sc_0x4E17-table)/2)
			.short ((sc_0x4E18-table)/2)
			.short ((sc_0x4E19-table)/2)
			.short ((sc_0x4E1A-table)/2)
			.short ((sc_0x4E1B-table)/2)
			.short ((sc_0x4E1C-table)/2)
			.short ((sc_0x4E1D-table)/2)
			.short ((sc_0x4E1E-table)/2)
			.short ((sc_0x4E1F-table)/2)
			.short ((sc_0x4F00-table)/2)
			.short ((sc_0x4F01-table)/2)
			.short ((sc_0x4F02-table)/2)
			.short ((sc_0x4F03-table)/2)
			.short ((sc_0x4F04-table)/2)
			.short ((sc_0x4F05-table)/2)
			.short ((sc_0x4F06-table)/2)
			.short ((sc_0x4F07-table)/2)
			.short ((sc_0x4F08-table)/2)
			.short ((sc_0x4F09-table)/2)
			.short ((sc_0x4F0A-table)/2)
			.short ((sc_0x4F0B-table)/2)
			.short ((sc_0x4F0C-table)/2)
			.short ((sc_0x4F0D-table)/2)
			.short ((sc_0x4F0E-table)/2)
			.short ((sc_0x4F0F-table)/2)
			.short ((sc_0x4F10-table)/2)
			.short ((sc_0x4F11-table)/2)
			.short ((sc_0x4F12-table)/2)
			.short ((sc_0x4F13-table)/2)
			.short ((sc_0x4F14-table)/2)
			.short ((sc_0x4F15-table)/2)
			.short ((sc_0x4F16-table)/2)
			.short ((sc_0x4F17-table)/2)
			.short ((sc_0x4F18-table)/2)
			.short ((sc_0x4F19-table)/2)
			.short ((sc_0x4F1A-table)/2)
			.short ((sc_0x4F1B-table)/2)
			.short ((sc_0x4F1C-table)/2)
			.short ((sc_0x4F1D-table)/2)
			.short ((sc_0x4F1E-table)/2)
			.short ((sc_0x4F1F-table)/2)
			.short ((sc_0x4820-table)/2)
			.short ((sc_0x4821-table)/2)
			.short ((sc_0x4822-table)/2)
			.short ((sc_0x4823-table)/2)
			.short ((sc_0x4824-table)/2)
			.short ((sc_0x4825-table)/2)
			.short ((sc_0x4826-table)/2)
			.short ((sc_0x4827-table)/2)
			.short ((sc_0x4828-table)/2)
			.short ((sc_0x4829-table)/2)
			.short ((sc_0x482A-table)/2)
			.short ((sc_0x482B-table)/2)
			.short ((sc_0x482C-table)/2)
			.short ((sc_0x482D-table)/2)
			.short ((sc_0x482E-table)/2)
			.short ((sc_0x482F-table)/2)
			.short ((sc_0x4830-table)/2)
			.short ((sc_0x4831-table)/2)
			.short ((sc_0x4832-table)/2)
			.short ((sc_0x4833-table)/2)
			.short ((sc_0x4834-table)/2)
			.short ((sc_0x4835-table)/2)
			.short ((sc_0x4836-table)/2)
			.short ((sc_0x4837-table)/2)
			.short ((sc_0x4838-table)/2)
			.short ((sc_0x4839-table)/2)
			.short ((sc_0x483A-table)/2)
			.short ((sc_0x483B-table)/2)
			.short ((sc_0x483C-table)/2)
			.short ((sc_0x483D-table)/2)
			.short ((sc_0x483E-table)/2)
			.short ((sc_0x483F-table)/2)
			.short ((sc_0x4920-table)/2)
			.short ((sc_0x4921-table)/2)
			.short ((sc_0x4922-table)/2)
			.short ((sc_0x4923-table)/2)
			.short ((sc_0x4924-table)/2)
			.short ((sc_0x4925-table)/2)
			.short ((sc_0x4926-table)/2)
			.short ((sc_0x4927-table)/2)
			.short ((sc_0x4928-table)/2)
			.short ((sc_0x4929-table)/2)
			.short ((sc_0x492A-table)/2)
			.short ((sc_0x492B-table)/2)
			.short ((sc_0x492C-table)/2)
			.short ((sc_0x492D-table)/2)
			.short ((sc_0x492E-table)/2)
			.short ((sc_0x492F-table)/2)
			.short ((sc_0x4930-table)/2)
			.short ((sc_0x4931-table)/2)
			.short ((sc_0x4932-table)/2)
			.short ((sc_0x4933-table)/2)
			.short ((sc_0x4934-table)/2)
			.short ((sc_0x4935-table)/2)
			.short ((sc_0x4936-table)/2)
			.short ((sc_0x4937-table)/2)
			.short ((sc_0x4938-table)/2)
			.short ((sc_0x4939-table)/2)
			.short ((sc_0x493A-table)/2)
			.short ((sc_0x493B-table)/2)
			.short ((sc_0x493C-table)/2)
			.short ((sc_0x493D-table)/2)
			.short ((sc_0x493E-table)/2)
			.short ((sc_0x493F-table)/2)
			.short ((sc_0x4A20-table)/2)
			.short ((sc_0x4A21-table)/2)
			.short ((sc_0x4A22-table)/2)
			.short ((sc_0x4A23-table)/2)
			.short ((sc_0x4A24-table)/2)
			.short ((sc_0x4A25-table)/2)
			.short ((sc_0x4A26-table)/2)
			.short ((sc_0x4A27-table)/2)
			.short ((sc_0x4A28-table)/2)
			.short ((sc_0x4A29-table)/2)
			.short ((sc_0x4A2A-table)/2)
			.short ((sc_0x4A2B-table)/2)
			.short ((sc_0x4A2C-table)/2)
			.short ((sc_0x4A2D-table)/2)
			.short ((sc_0x4A2E-table)/2)
			.short ((sc_0x4A2F-table)/2)
			.short ((sc_0x4A30-table)/2)
			.short ((sc_0x4A31-table)/2)
			.short ((sc_0x4A32-table)/2)
			.short ((sc_0x4A33-table)/2)
			.short ((sc_0x4A34-table)/2)
			.short ((sc_0x4A35-table)/2)
			.short ((sc_0x4A36-table)/2)
			.short ((sc_0x4A37-table)/2)
			.short ((sc_0x4A38-table)/2)
			.short ((sc_0x4A39-table)/2)
			.short ((sc_0x4A3A-table)/2)
			.short ((sc_0x4A3B-table)/2)
			.short ((sc_0x4A3C-table)/2)
			.short ((sc_0x4A3D-table)/2)
			.short ((sc_0x4A3E-table)/2)
			.short ((sc_0x4A3F-table)/2)
			.short ((sc_0x4B20-table)/2)
			.short ((sc_0x4B21-table)/2)
			.short ((sc_0x4B22-table)/2)
			.short ((sc_0x4B23-table)/2)
			.short ((sc_0x4B24-table)/2)
			.short ((sc_0x4B25-table)/2)
			.short ((sc_0x4B26-table)/2)
			.short ((sc_0x4B27-table)/2)
			.short ((sc_0x4B28-table)/2)
			.short ((sc_0x4B29-table)/2)
			.short ((sc_0x4B2A-table)/2)
			.short ((sc_0x4B2B-table)/2)
			.short ((sc_0x4B2C-table)/2)
			.short ((sc_0x4B2D-table)/2)
			.short ((sc_0x4B2E-table)/2)
			.short ((sc_0x4B2F-table)/2)
			.short ((sc_0x4B30-table)/2)
			.short ((sc_0x4B31-table)/2)
			.short ((sc_0x4B32-table)/2)
			.short ((sc_0x4B33-table)/2)
			.short ((sc_0x4B34-table)/2)
			.short ((sc_0x4B35-table)/2)
			.short ((sc_0x4B36-table)/2)
			.short ((sc_0x4B37-table)/2)
			.short ((sc_0x4B38-table)/2)
			.short ((sc_0x4B39-table)/2)
			.short ((sc_0x4B3A-table)/2)
			.short ((sc_0x4B3B-table)/2)
			.short ((sc_0x4B3C-table)/2)
			.short ((sc_0x4B3D-table)/2)
			.short ((sc_0x4B3E-table)/2)
			.short ((sc_0x4B3F-table)/2)
			.short ((sc_0x4C20-table)/2)
			.short ((sc_0x4C21-table)/2)
			.short ((sc_0x4C22-table)/2)
			.short ((sc_0x4C23-table)/2)
			.short ((sc_0x4C24-table)/2)
			.short ((sc_0x4C25-table)/2)
			.short ((sc_0x4C26-table)/2)
			.short ((sc_0x4C27-table)/2)
			.short ((sc_0x4C28-table)/2)
			.short ((sc_0x4C29-table)/2)
			.short ((sc_0x4C2A-table)/2)
			.short ((sc_0x4C2B-table)/2)
			.short ((sc_0x4C2C-table)/2)
			.short ((sc_0x4C2D-table)/2)
			.short ((sc_0x4C2E-table)/2)
			.short ((sc_0x4C2F-table)/2)
			.short ((sc_0x4C30-table)/2)
			.short ((sc_0x4C31-table)/2)
			.short ((sc_0x4C32-table)/2)
			.short ((sc_0x4C33-table)/2)
			.short ((sc_0x4C34-table)/2)
			.short ((sc_0x4C35-table)/2)
			.short ((sc_0x4C36-table)/2)
			.short ((sc_0x4C37-table)/2)
			.short ((sc_0x4C38-table)/2)
			.short ((sc_0x4C39-table)/2)
			.short ((sc_0x4C3A-table)/2)
			.short ((sc_0x4C3B-table)/2)
			.short ((sc_0x4C3C-table)/2)
			.short ((sc_0x4C3D-table)/2)
			.short ((sc_0x4C3E-table)/2)
			.short ((sc_0x4C3F-table)/2)
			.short ((sc_0x4D20-table)/2)
			.short ((sc_0x4D21-table)/2)
			.short ((sc_0x4D22-table)/2)
			.short ((sc_0x4D23-table)/2)
			.short ((sc_0x4D24-table)/2)
			.short ((sc_0x4D25-table)/2)
			.short ((sc_0x4D26-table)/2)
			.short ((sc_0x4D27-table)/2)
			.short ((sc_0x4D28-table)/2)
			.short ((sc_0x4D29-table)/2)
			.short ((sc_0x4D2A-table)/2)
			.short ((sc_0x4D2B-table)/2)
			.short ((sc_0x4D2C-table)/2)
			.short ((sc_0x4D2D-table)/2)
			.short ((sc_0x4D2E-table)/2)
			.short ((sc_0x4D2F-table)/2)
			.short ((sc_0x4D30-table)/2)
			.short ((sc_0x4D31-table)/2)
			.short ((sc_0x4D32-table)/2)
			.short ((sc_0x4D33-table)/2)
			.short ((sc_0x4D34-table)/2)
			.short ((sc_0x4D35-table)/2)
			.short ((sc_0x4D36-table)/2)
			.short ((sc_0x4D37-table)/2)
			.short ((sc_0x4D38-table)/2)
			.short ((sc_0x4D39-table)/2)
			.short ((sc_0x4D3A-table)/2)
			.short ((sc_0x4D3B-table)/2)
			.short ((sc_0x4D3C-table)/2)
			.short ((sc_0x4D3D-table)/2)
			.short ((sc_0x4D3E-table)/2)
			.short ((sc_0x4D3F-table)/2)
			.short ((sc_0x4E20-table)/2)
			.short ((sc_0x4E21-table)/2)
			.short ((sc_0x4E22-table)/2)
			.short ((sc_0x4E23-table)/2)
			.short ((sc_0x4E24-table)/2)
			.short ((sc_0x4E25-table)/2)
			.short ((sc_0x4E26-table)/2)
			.short ((sc_0x4E27-table)/2)
			.short ((sc_0x4E28-table)/2)
			.short ((sc_0x4E29-table)/2)
			.short ((sc_0x4E2A-table)/2)
			.short ((sc_0x4E2B-table)/2)
			.short ((sc_0x4E2C-table)/2)
			.short ((sc_0x4E2D-table)/2)
			.short ((sc_0x4E2E-table)/2)
			.short ((sc_0x4E2F-table)/2)
			.short ((sc_0x4E30-table)/2)
			.short ((sc_0x4E31-table)/2)
			.short ((sc_0x4E32-table)/2)
			.short ((sc_0x4E33-table)/2)
			.short ((sc_0x4E34-table)/2)
			.short ((sc_0x4E35-table)/2)
			.short ((sc_0x4E36-table)/2)
			.short ((sc_0x4E37-table)/2)
			.short ((sc_0x4E38-table)/2)
			.short ((sc_0x4E39-table)/2)
			.short ((sc_0x4E3A-table)/2)
			.short ((sc_0x4E3B-table)/2)
			.short ((sc_0x4E3C-table)/2)
			.short ((sc_0x4E3D-table)/2)
			.short ((sc_0x4E3E-table)/2)
			.short ((sc_0x4E3F-table)/2)
			.short ((sc_0x4F20-table)/2)
			.short ((sc_0x4F21-table)/2)
			.short ((sc_0x4F22-table)/2)
			.short ((sc_0x4F23-table)/2)
			.short ((sc_0x4F24-table)/2)
			.short ((sc_0x4F25-table)/2)
			.short ((sc_0x4F26-table)/2)
			.short ((sc_0x4F27-table)/2)
			.short ((sc_0x4F28-table)/2)
			.short ((sc_0x4F29-table)/2)
			.short ((sc_0x4F2A-table)/2)
			.short ((sc_0x4F2B-table)/2)
			.short ((sc_0x4F2C-table)/2)
			.short ((sc_0x4F2D-table)/2)
			.short ((sc_0x4F2E-table)/2)
			.short ((sc_0x4F2F-table)/2)
			.short ((sc_0x4F30-table)/2)
			.short ((sc_0x4F31-table)/2)
			.short ((sc_0x4F32-table)/2)
			.short ((sc_0x4F33-table)/2)
			.short ((sc_0x4F34-table)/2)
			.short ((sc_0x4F35-table)/2)
			.short ((sc_0x4F36-table)/2)
			.short ((sc_0x4F37-table)/2)
			.short ((sc_0x4F38-table)/2)
			.short ((sc_0x4F39-table)/2)
			.short ((sc_0x4F3A-table)/2)
			.short ((sc_0x4F3B-table)/2)
			.short ((sc_0x4F3C-table)/2)
			.short ((sc_0x4F3D-table)/2)
			.short ((sc_0x4F3E-table)/2)
			.short ((sc_0x4F3F-table)/2)
			.short ((sc_0x4840-table)/2)
			.short ((sc_0x4841-table)/2)
			.short ((sc_0x4842-table)/2)
			.short ((sc_0x4843-table)/2)
			.short ((sc_0x4844-table)/2)
			.short ((sc_0x4845-table)/2)
			.short ((sc_0x4846-table)/2)
			.short ((sc_0x4847-table)/2)
			.short ((sc_0x4848-table)/2)
			.short ((sc_0x4849-table)/2)
			.short ((sc_0x484A-table)/2)
			.short ((sc_0x484B-table)/2)
			.short ((sc_0x484C-table)/2)
			.short ((sc_0x484D-table)/2)
			.short ((sc_0x484E-table)/2)
			.short ((sc_0x484F-table)/2)
			.short ((sc_0x4850-table)/2)
			.short ((sc_0x4851-table)/2)
			.short ((sc_0x4852-table)/2)
			.short ((sc_0x4853-table)/2)
			.short ((sc_0x4854-table)/2)
			.short ((sc_0x4855-table)/2)
			.short ((sc_0x4856-table)/2)
			.short ((sc_0x4857-table)/2)
			.short ((sc_0x4858-table)/2)
			.short ((sc_0x4859-table)/2)
			.short ((sc_0x485A-table)/2)
			.short ((sc_0x485B-table)/2)
			.short ((sc_0x485C-table)/2)
			.short ((sc_0x485D-table)/2)
			.short ((sc_0x485E-table)/2)
			.short ((sc_0x485F-table)/2)
			.short ((sc_0x4940-table)/2)
			.short ((sc_0x4941-table)/2)
			.short ((sc_0x4942-table)/2)
			.short ((sc_0x4943-table)/2)
			.short ((sc_0x4944-table)/2)
			.short ((sc_0x4945-table)/2)
			.short ((sc_0x4946-table)/2)
			.short ((sc_0x4947-table)/2)
			.short ((sc_0x4948-table)/2)
			.short ((sc_0x4949-table)/2)
			.short ((sc_0x494A-table)/2)
			.short ((sc_0x494B-table)/2)
			.short ((sc_0x494C-table)/2)
			.short ((sc_0x494D-table)/2)
			.short ((sc_0x494E-table)/2)
			.short ((sc_0x494F-table)/2)
			.short ((sc_0x4950-table)/2)
			.short ((sc_0x4951-table)/2)
			.short ((sc_0x4952-table)/2)
			.short ((sc_0x4953-table)/2)
			.short ((sc_0x4954-table)/2)
			.short ((sc_0x4955-table)/2)
			.short ((sc_0x4956-table)/2)
			.short ((sc_0x4957-table)/2)
			.short ((sc_0x4958-table)/2)
			.short ((sc_0x4959-table)/2)
			.short ((sc_0x495A-table)/2)
			.short ((sc_0x495B-table)/2)
			.short ((sc_0x495C-table)/2)
			.short ((sc_0x495D-table)/2)
			.short ((sc_0x495E-table)/2)
			.short ((sc_0x495F-table)/2)
			.short ((sc_0x4A40-table)/2)
			.short ((sc_0x4A41-table)/2)
			.short ((sc_0x4A42-table)/2)
			.short ((sc_0x4A43-table)/2)
			.short ((sc_0x4A44-table)/2)
			.short ((sc_0x4A45-table)/2)
			.short ((sc_0x4A46-table)/2)
			.short ((sc_0x4A47-table)/2)
			.short ((sc_0x4A48-table)/2)
			.short ((sc_0x4A49-table)/2)
			.short ((sc_0x4A4A-table)/2)
			.short ((sc_0x4A4B-table)/2)
			.short ((sc_0x4A4C-table)/2)
			.short ((sc_0x4A4D-table)/2)
			.short ((sc_0x4A4E-table)/2)
			.short ((sc_0x4A4F-table)/2)
			.short ((sc_0x4A50-table)/2)
			.short ((sc_0x4A51-table)/2)
			.short ((sc_0x4A52-table)/2)
			.short ((sc_0x4A53-table)/2)
			.short ((sc_0x4A54-table)/2)
			.short ((sc_0x4A55-table)/2)
			.short ((sc_0x4A56-table)/2)
			.short ((sc_0x4A57-table)/2)
			.short ((sc_0x4A58-table)/2)
			.short ((sc_0x4A59-table)/2)
			.short ((sc_0x4A5A-table)/2)
			.short ((sc_0x4A5B-table)/2)
			.short ((sc_0x4A5C-table)/2)
			.short ((sc_0x4A5D-table)/2)
			.short ((sc_0x4A5E-table)/2)
			.short ((sc_0x4A5F-table)/2)
			.short ((sc_0x4B40-table)/2)
			.short ((sc_0x4B41-table)/2)
			.short ((sc_0x4B42-table)/2)
			.short ((sc_0x4B43-table)/2)
			.short ((sc_0x4B44-table)/2)
			.short ((sc_0x4B45-table)/2)
			.short ((sc_0x4B46-table)/2)
			.short ((sc_0x4B47-table)/2)
			.short ((sc_0x4B48-table)/2)
			.short ((sc_0x4B49-table)/2)
			.short ((sc_0x4B4A-table)/2)
			.short ((sc_0x4B4B-table)/2)
			.short ((sc_0x4B4C-table)/2)
			.short ((sc_0x4B4D-table)/2)
			.short ((sc_0x4B4E-table)/2)
			.short ((sc_0x4B4F-table)/2)
			.short ((sc_0x4B50-table)/2)
			.short ((sc_0x4B51-table)/2)
			.short ((sc_0x4B52-table)/2)
			.short ((sc_0x4B53-table)/2)
			.short ((sc_0x4B54-table)/2)
			.short ((sc_0x4B55-table)/2)
			.short ((sc_0x4B56-table)/2)
			.short ((sc_0x4B57-table)/2)
			.short ((sc_0x4B58-table)/2)
			.short ((sc_0x4B59-table)/2)
			.short ((sc_0x4B5A-table)/2)
			.short ((sc_0x4B5B-table)/2)
			.short ((sc_0x4B5C-table)/2)
			.short ((sc_0x4B5D-table)/2)
			.short ((sc_0x4B5E-table)/2)
			.short ((sc_0x4B5F-table)/2)
			.short ((sc_0x4C40-table)/2)
			.short ((sc_0x4C41-table)/2)
			.short ((sc_0x4C42-table)/2)
			.short ((sc_0x4C43-table)/2)
			.short ((sc_0x4C44-table)/2)
			.short ((sc_0x4C45-table)/2)
			.short ((sc_0x4C46-table)/2)
			.short ((sc_0x4C47-table)/2)
			.short ((sc_0x4C48-table)/2)
			.short ((sc_0x4C49-table)/2)
			.short ((sc_0x4C4A-table)/2)
			.short ((sc_0x4C4B-table)/2)
			.short ((sc_0x4C4C-table)/2)
			.short ((sc_0x4C4D-table)/2)
			.short ((sc_0x4C4E-table)/2)
			.short ((sc_0x4C4F-table)/2)
			.short ((sc_0x4C50-table)/2)
			.short ((sc_0x4C51-table)/2)
			.short ((sc_0x4C52-table)/2)
			.short ((sc_0x4C53-table)/2)
			.short ((sc_0x4C54-table)/2)
			.short ((sc_0x4C55-table)/2)
			.short ((sc_0x4C56-table)/2)
			.short ((sc_0x4C57-table)/2)
			.short ((sc_0x4C58-table)/2)
			.short ((sc_0x4C59-table)/2)
			.short ((sc_0x4C5A-table)/2)
			.short ((sc_0x4C5B-table)/2)
			.short ((sc_0x4C5C-table)/2)
			.short ((sc_0x4C5D-table)/2)
			.short ((sc_0x4C5E-table)/2)
			.short ((sc_0x4C5F-table)/2)
			.short ((sc_0x4D40-table)/2)
			.short ((sc_0x4D41-table)/2)
			.short ((sc_0x4D42-table)/2)
			.short ((sc_0x4D43-table)/2)
			.short ((sc_0x4D44-table)/2)
			.short ((sc_0x4D45-table)/2)
			.short ((sc_0x4D46-table)/2)
			.short ((sc_0x4D47-table)/2)
			.short ((sc_0x4D48-table)/2)
			.short ((sc_0x4D49-table)/2)
			.short ((sc_0x4D4A-table)/2)
			.short ((sc_0x4D4B-table)/2)
			.short ((sc_0x4D4C-table)/2)
			.short ((sc_0x4D4D-table)/2)
			.short ((sc_0x4D4E-table)/2)
			.short ((sc_0x4D4F-table)/2)
			.short ((sc_0x4D50-table)/2)
			.short ((sc_0x4D51-table)/2)
			.short ((sc_0x4D52-table)/2)
			.short ((sc_0x4D53-table)/2)
			.short ((sc_0x4D54-table)/2)
			.short ((sc_0x4D55-table)/2)
			.short ((sc_0x4D56-table)/2)
			.short ((sc_0x4D57-table)/2)
			.short ((sc_0x4D58-table)/2)
			.short ((sc_0x4D59-table)/2)
			.short ((sc_0x4D5A-table)/2)
			.short ((sc_0x4D5B-table)/2)
			.short ((sc_0x4D5C-table)/2)
			.short ((sc_0x4D5D-table)/2)
			.short ((sc_0x4D5E-table)/2)
			.short ((sc_0x4D5F-table)/2)
			.short ((sc_0x4E40-table)/2)
			.short ((sc_0x4E41-table)/2)
			.short ((sc_0x4E42-table)/2)
			.short ((sc_0x4E43-table)/2)
			.short ((sc_0x4E44-table)/2)
			.short ((sc_0x4E45-table)/2)
			.short ((sc_0x4E46-table)/2)
			.short ((sc_0x4E47-table)/2)
			.short ((sc_0x4E48-table)/2)
			.short ((sc_0x4E49-table)/2)
			.short ((sc_0x4E4A-table)/2)
			.short ((sc_0x4E4B-table)/2)
			.short ((sc_0x4E4C-table)/2)
			.short ((sc_0x4E4D-table)/2)
			.short ((sc_0x4E4E-table)/2)
			.short ((sc_0x4E4F-table)/2)
			.short ((sc_0x4E50-table)/2)
			.short ((sc_0x4E51-table)/2)
			.short ((sc_0x4E52-table)/2)
			.short ((sc_0x4E53-table)/2)
			.short ((sc_0x4E54-table)/2)
			.short ((sc_0x4E55-table)/2)
			.short ((sc_0x4E56-table)/2)
			.short ((sc_0x4E57-table)/2)
			.short ((sc_0x4E58-table)/2)
			.short ((sc_0x4E59-table)/2)
			.short ((sc_0x4E5A-table)/2)
			.short ((sc_0x4E5B-table)/2)
			.short ((sc_0x4E5C-table)/2)
			.short ((sc_0x4E5D-table)/2)
			.short ((sc_0x4E5E-table)/2)
			.short ((sc_0x4E5F-table)/2)
			.short ((sc_0x4F40-table)/2)
			.short ((sc_0x4F41-table)/2)
			.short ((sc_0x4F42-table)/2)
			.short ((sc_0x4F43-table)/2)
			.short ((sc_0x4F44-table)/2)
			.short ((sc_0x4F45-table)/2)
			.short ((sc_0x4F46-table)/2)
			.short ((sc_0x4F47-table)/2)
			.short ((sc_0x4F48-table)/2)
			.short ((sc_0x4F49-table)/2)
			.short ((sc_0x4F4A-table)/2)
			.short ((sc_0x4F4B-table)/2)
			.short ((sc_0x4F4C-table)/2)
			.short ((sc_0x4F4D-table)/2)
			.short ((sc_0x4F4E-table)/2)
			.short ((sc_0x4F4F-table)/2)
			.short ((sc_0x4F50-table)/2)
			.short ((sc_0x4F51-table)/2)
			.short ((sc_0x4F52-table)/2)
			.short ((sc_0x4F53-table)/2)
			.short ((sc_0x4F54-table)/2)
			.short ((sc_0x4F55-table)/2)
			.short ((sc_0x4F56-table)/2)
			.short ((sc_0x4F57-table)/2)
			.short ((sc_0x4F58-table)/2)
			.short ((sc_0x4F59-table)/2)
			.short ((sc_0x4F5A-table)/2)
			.short ((sc_0x4F5B-table)/2)
			.short ((sc_0x4F5C-table)/2)
			.short ((sc_0x4F5D-table)/2)
			.short ((sc_0x4F5E-table)/2)
			.short ((sc_0x4F5F-table)/2)
			.short ((sc_0x4860-table)/2)
			.short ((sc_0x4861-table)/2)
			.short ((sc_0x4862-table)/2)
			.short ((sc_0x4863-table)/2)
			.short ((sc_0x4864-table)/2)
			.short ((sc_0x4865-table)/2)
			.short ((sc_0x4866-table)/2)
			.short ((sc_0x4867-table)/2)
			.short ((sc_0x4868-table)/2)
			.short ((sc_0x4869-table)/2)
			.short ((sc_0x486A-table)/2)
			.short ((sc_0x486B-table)/2)
			.short ((sc_0x486C-table)/2)
			.short ((sc_0x486D-table)/2)
			.short ((sc_0x486E-table)/2)
			.short ((sc_0x486F-table)/2)
			.short ((sc_0x4870-table)/2)
			.short ((sc_0x4871-table)/2)
			.short ((sc_0x4872-table)/2)
			.short ((sc_0x4873-table)/2)
			.short ((sc_0x4874-table)/2)
			.short ((sc_0x4875-table)/2)
			.short ((sc_0x4876-table)/2)
			.short ((sc_0x4877-table)/2)
			.short ((sc_0x4878-table)/2)
			.short ((sc_0x4879-table)/2)
			.short ((sc_0x487A-table)/2)
			.short ((sc_0x487B-table)/2)
			.short ((sc_0x487C-table)/2)
			.short ((sc_0x487D-table)/2)
			.short ((sc_0x487E-table)/2)
			.short ((sc_0x487F-table)/2)
			.short ((sc_0x4960-table)/2)
			.short ((sc_0x4961-table)/2)
			.short ((sc_0x4962-table)/2)
			.short ((sc_0x4963-table)/2)
			.short ((sc_0x4964-table)/2)
			.short ((sc_0x4965-table)/2)
			.short ((sc_0x4966-table)/2)
			.short ((sc_0x4967-table)/2)
			.short ((sc_0x4968-table)/2)
			.short ((sc_0x4969-table)/2)
			.short ((sc_0x496A-table)/2)
			.short ((sc_0x496B-table)/2)
			.short ((sc_0x496C-table)/2)
			.short ((sc_0x496D-table)/2)
			.short ((sc_0x496E-table)/2)
			.short ((sc_0x496F-table)/2)
			.short ((sc_0x4970-table)/2)
			.short ((sc_0x4971-table)/2)
			.short ((sc_0x4972-table)/2)
			.short ((sc_0x4973-table)/2)
			.short ((sc_0x4974-table)/2)
			.short ((sc_0x4975-table)/2)
			.short ((sc_0x4976-table)/2)
			.short ((sc_0x4977-table)/2)
			.short ((sc_0x4978-table)/2)
			.short ((sc_0x4979-table)/2)
			.short ((sc_0x497A-table)/2)
			.short ((sc_0x497B-table)/2)
			.short ((sc_0x497C-table)/2)
			.short ((sc_0x497D-table)/2)
			.short ((sc_0x497E-table)/2)
			.short ((sc_0x497F-table)/2)
			.short ((sc_0x4A60-table)/2)
			.short ((sc_0x4A61-table)/2)
			.short ((sc_0x4A62-table)/2)
			.short ((sc_0x4A63-table)/2)
			.short ((sc_0x4A64-table)/2)
			.short ((sc_0x4A65-table)/2)
			.short ((sc_0x4A66-table)/2)
			.short ((sc_0x4A67-table)/2)
			.short ((sc_0x4A68-table)/2)
			.short ((sc_0x4A69-table)/2)
			.short ((sc_0x4A6A-table)/2)
			.short ((sc_0x4A6B-table)/2)
			.short ((sc_0x4A6C-table)/2)
			.short ((sc_0x4A6D-table)/2)
			.short ((sc_0x4A6E-table)/2)
			.short ((sc_0x4A6F-table)/2)
			.short ((sc_0x4A70-table)/2)
			.short ((sc_0x4A71-table)/2)
			.short ((sc_0x4A72-table)/2)
			.short ((sc_0x4A73-table)/2)
			.short ((sc_0x4A74-table)/2)
			.short ((sc_0x4A75-table)/2)
			.short ((sc_0x4A76-table)/2)
			.short ((sc_0x4A77-table)/2)
			.short ((sc_0x4A78-table)/2)
			.short ((sc_0x4A79-table)/2)
			.short ((sc_0x4A7A-table)/2)
			.short ((sc_0x4A7B-table)/2)
			.short ((sc_0x4A7C-table)/2)
			.short ((sc_0x4A7D-table)/2)
			.short ((sc_0x4A7E-table)/2)
			.short ((sc_0x4A7F-table)/2)
			.short ((sc_0x4B60-table)/2)
			.short ((sc_0x4B61-table)/2)
			.short ((sc_0x4B62-table)/2)
			.short ((sc_0x4B63-table)/2)
			.short ((sc_0x4B64-table)/2)
			.short ((sc_0x4B65-table)/2)
			.short ((sc_0x4B66-table)/2)
			.short ((sc_0x4B67-table)/2)
			.short ((sc_0x4B68-table)/2)
			.short ((sc_0x4B69-table)/2)
			.short ((sc_0x4B6A-table)/2)
			.short ((sc_0x4B6B-table)/2)
			.short ((sc_0x4B6C-table)/2)
			.short ((sc_0x4B6D-table)/2)
			.short ((sc_0x4B6E-table)/2)
			.short ((sc_0x4B6F-table)/2)
			.short ((sc_0x4B70-table)/2)
			.short ((sc_0x4B71-table)/2)
			.short ((sc_0x4B72-table)/2)
			.short ((sc_0x4B73-table)/2)
			.short ((sc_0x4B74-table)/2)
			.short ((sc_0x4B75-table)/2)
			.short ((sc_0x4B76-table)/2)
			.short ((sc_0x4B77-table)/2)
			.short ((sc_0x4B78-table)/2)
			.short ((sc_0x4B79-table)/2)
			.short ((sc_0x4B7A-table)/2)
			.short ((sc_0x4B7B-table)/2)
			.short ((sc_0x4B7C-table)/2)
			.short ((sc_0x4B7D-table)/2)
			.short ((sc_0x4B7E-table)/2)
			.short ((sc_0x4B7F-table)/2)
			.short ((sc_0x4C60-table)/2)
			.short ((sc_0x4C61-table)/2)
			.short ((sc_0x4C62-table)/2)
			.short ((sc_0x4C63-table)/2)
			.short ((sc_0x4C64-table)/2)
			.short ((sc_0x4C65-table)/2)
			.short ((sc_0x4C66-table)/2)
			.short ((sc_0x4C67-table)/2)
			.short ((sc_0x4C68-table)/2)
			.short ((sc_0x4C69-table)/2)
			.short ((sc_0x4C6A-table)/2)
			.short ((sc_0x4C6B-table)/2)
			.short ((sc_0x4C6C-table)/2)
			.short ((sc_0x4C6D-table)/2)
			.short ((sc_0x4C6E-table)/2)
			.short ((sc_0x4C6F-table)/2)
			.short ((sc_0x4C70-table)/2)
			.short ((sc_0x4C71-table)/2)
			.short ((sc_0x4C72-table)/2)
			.short ((sc_0x4C73-table)/2)
			.short ((sc_0x4C74-table)/2)
			.short ((sc_0x4C75-table)/2)
			.short ((sc_0x4C76-table)/2)
			.short ((sc_0x4C77-table)/2)
			.short ((sc_0x4C78-table)/2)
			.short ((sc_0x4C79-table)/2)
			.short ((sc_0x4C7A-table)/2)
			.short ((sc_0x4C7B-table)/2)
			.short ((sc_0x4C7C-table)/2)
			.short ((sc_0x4C7D-table)/2)
			.short ((sc_0x4C7E-table)/2)
			.short ((sc_0x4C7F-table)/2)
			.short ((sc_0x4D60-table)/2)
			.short ((sc_0x4D61-table)/2)
			.short ((sc_0x4D62-table)/2)
			.short ((sc_0x4D63-table)/2)
			.short ((sc_0x4D64-table)/2)
			.short ((sc_0x4D65-table)/2)
			.short ((sc_0x4D66-table)/2)
			.short ((sc_0x4D67-table)/2)
			.short ((sc_0x4D68-table)/2)
			.short ((sc_0x4D69-table)/2)
			.short ((sc_0x4D6A-table)/2)
			.short ((sc_0x4D6B-table)/2)
			.short ((sc_0x4D6C-table)/2)
			.short ((sc_0x4D6D-table)/2)
			.short ((sc_0x4D6E-table)/2)
			.short ((sc_0x4D6F-table)/2)
			.short ((sc_0x4D70-table)/2)
			.short ((sc_0x4D71-table)/2)
			.short ((sc_0x4D72-table)/2)
			.short ((sc_0x4D73-table)/2)
			.short ((sc_0x4D74-table)/2)
			.short ((sc_0x4D75-table)/2)
			.short ((sc_0x4D76-table)/2)
			.short ((sc_0x4D77-table)/2)
			.short ((sc_0x4D78-table)/2)
			.short ((sc_0x4D79-table)/2)
			.short ((sc_0x4D7A-table)/2)
			.short ((sc_0x4D7B-table)/2)
			.short ((sc_0x4D7C-table)/2)
			.short ((sc_0x4D7D-table)/2)
			.short ((sc_0x4D7E-table)/2)
			.short ((sc_0x4D7F-table)/2)
			.short ((sc_0x4E60-table)/2)
			.short ((sc_0x4E61-table)/2)
			.short ((sc_0x4E62-table)/2)
			.short ((sc_0x4E63-table)/2)
			.short ((sc_0x4E64-table)/2)
			.short ((sc_0x4E65-table)/2)
			.short ((sc_0x4E66-table)/2)
			.short ((sc_0x4E67-table)/2)
			.short ((sc_0x4E68-table)/2)
			.short ((sc_0x4E69-table)/2)
			.short ((sc_0x4E6A-table)/2)
			.short ((sc_0x4E6B-table)/2)
			.short ((sc_0x4E6C-table)/2)
			.short ((sc_0x4E6D-table)/2)
			.short ((sc_0x4E6E-table)/2)
			.short ((sc_0x4E6F-table)/2)
			.short ((sc_0x4E70-table)/2)
			.short ((sc_0x4E71-table)/2)
			.short ((sc_0x4E72-table)/2)
			.short ((sc_0x4E73-table)/2)
			.short ((sc_0x4E74-table)/2)
			.short ((sc_0x4E75-table)/2)
			.short ((sc_0x4E76-table)/2)
			.short ((sc_0x4E77-table)/2)
			.short ((sc_0x4E78-table)/2)
			.short ((sc_0x4E79-table)/2)
			.short ((sc_0x4E7A-table)/2)
			.short ((sc_0x4E7B-table)/2)
			.short ((sc_0x4E7C-table)/2)
			.short ((sc_0x4E7D-table)/2)
			.short ((sc_0x4E7E-table)/2)
			.short ((sc_0x4E7F-table)/2)
			.short ((sc_0x4F60-table)/2)
			.short ((sc_0x4F61-table)/2)
			.short ((sc_0x4F62-table)/2)
			.short ((sc_0x4F63-table)/2)
			.short ((sc_0x4F64-table)/2)
			.short ((sc_0x4F65-table)/2)
			.short ((sc_0x4F66-table)/2)
			.short ((sc_0x4F67-table)/2)
			.short ((sc_0x4F68-table)/2)
			.short ((sc_0x4F69-table)/2)
			.short ((sc_0x4F6A-table)/2)
			.short ((sc_0x4F6B-table)/2)
			.short ((sc_0x4F6C-table)/2)
			.short ((sc_0x4F6D-table)/2)
			.short ((sc_0x4F6E-table)/2)
			.short ((sc_0x4F6F-table)/2)
			.short ((sc_0x4F70-table)/2)
			.short ((sc_0x4F71-table)/2)
			.short ((sc_0x4F72-table)/2)
			.short ((sc_0x4F73-table)/2)
			.short ((sc_0x4F74-table)/2)
			.short ((sc_0x4F75-table)/2)
			.short ((sc_0x4F76-table)/2)
			.short ((sc_0x4F77-table)/2)
			.short ((sc_0x4F78-table)/2)
			.short ((sc_0x4F79-table)/2)
			.short ((sc_0x4F7A-table)/2)
			.short ((sc_0x4F7B-table)/2)
			.short ((sc_0x4F7C-table)/2)
			.short ((sc_0x4F7D-table)/2)
			.short ((sc_0x4F7E-table)/2)
			.short ((sc_0x4F7F-table)/2)
			.short ((sc_0x4880-table)/2)
			.short ((sc_0x4881-table)/2)
			.short ((sc_0x4882-table)/2)
			.short ((sc_0x4883-table)/2)
			.short ((sc_0x4884-table)/2)
			.short ((sc_0x4885-table)/2)
			.short ((sc_0x4886-table)/2)
			.short ((sc_0x4887-table)/2)
			.short ((sc_0x4888-table)/2)
			.short ((sc_0x4889-table)/2)
			.short ((sc_0x488A-table)/2)
			.short ((sc_0x488B-table)/2)
			.short ((sc_0x488C-table)/2)
			.short ((sc_0x488D-table)/2)
			.short ((sc_0x488E-table)/2)
			.short ((sc_0x488F-table)/2)
			.short ((sc_0x4890-table)/2)
			.short ((sc_0x4891-table)/2)
			.short ((sc_0x4892-table)/2)
			.short ((sc_0x4893-table)/2)
			.short ((sc_0x4894-table)/2)
			.short ((sc_0x4895-table)/2)
			.short ((sc_0x4896-table)/2)
			.short ((sc_0x4897-table)/2)
			.short ((sc_0x4898-table)/2)
			.short ((sc_0x4899-table)/2)
			.short ((sc_0x489A-table)/2)
			.short ((sc_0x489B-table)/2)
			.short ((sc_0x489C-table)/2)
			.short ((sc_0x489D-table)/2)
			.short ((sc_0x489E-table)/2)
			.short ((sc_0x489F-table)/2)
			.short ((sc_0x4980-table)/2)
			.short ((sc_0x4981-table)/2)
			.short ((sc_0x4982-table)/2)
			.short ((sc_0x4983-table)/2)
			.short ((sc_0x4984-table)/2)
			.short ((sc_0x4985-table)/2)
			.short ((sc_0x4986-table)/2)
			.short ((sc_0x4987-table)/2)
			.short ((sc_0x4988-table)/2)
			.short ((sc_0x4989-table)/2)
			.short ((sc_0x498A-table)/2)
			.short ((sc_0x498B-table)/2)
			.short ((sc_0x498C-table)/2)
			.short ((sc_0x498D-table)/2)
			.short ((sc_0x498E-table)/2)
			.short ((sc_0x498F-table)/2)
			.short ((sc_0x4990-table)/2)
			.short ((sc_0x4991-table)/2)
			.short ((sc_0x4992-table)/2)
			.short ((sc_0x4993-table)/2)
			.short ((sc_0x4994-table)/2)
			.short ((sc_0x4995-table)/2)
			.short ((sc_0x4996-table)/2)
			.short ((sc_0x4997-table)/2)
			.short ((sc_0x4998-table)/2)
			.short ((sc_0x4999-table)/2)
			.short ((sc_0x499A-table)/2)
			.short ((sc_0x499B-table)/2)
			.short ((sc_0x499C-table)/2)
			.short ((sc_0x499D-table)/2)
			.short ((sc_0x499E-table)/2)
			.short ((sc_0x499F-table)/2)
			.short ((sc_0x4A80-table)/2)
			.short ((sc_0x4A81-table)/2)
			.short ((sc_0x4A82-table)/2)
			.short ((sc_0x4A83-table)/2)
			.short ((sc_0x4A84-table)/2)
			.short ((sc_0x4A85-table)/2)
			.short ((sc_0x4A86-table)/2)
			.short ((sc_0x4A87-table)/2)
			.short ((sc_0x4A88-table)/2)
			.short ((sc_0x4A89-table)/2)
			.short ((sc_0x4A8A-table)/2)
			.short ((sc_0x4A8B-table)/2)
			.short ((sc_0x4A8C-table)/2)
			.short ((sc_0x4A8D-table)/2)
			.short ((sc_0x4A8E-table)/2)
			.short ((sc_0x4A8F-table)/2)
			.short ((sc_0x4A90-table)/2)
			.short ((sc_0x4A91-table)/2)
			.short ((sc_0x4A92-table)/2)
			.short ((sc_0x4A93-table)/2)
			.short ((sc_0x4A94-table)/2)
			.short ((sc_0x4A95-table)/2)
			.short ((sc_0x4A96-table)/2)
			.short ((sc_0x4A97-table)/2)
			.short ((sc_0x4A98-table)/2)
			.short ((sc_0x4A99-table)/2)
			.short ((sc_0x4A9A-table)/2)
			.short ((sc_0x4A9B-table)/2)
			.short ((sc_0x4A9C-table)/2)
			.short ((sc_0x4A9D-table)/2)
			.short ((sc_0x4A9E-table)/2)
			.short ((sc_0x4A9F-table)/2)
			.short ((sc_0x4B80-table)/2)
			.short ((sc_0x4B81-table)/2)
			.short ((sc_0x4B82-table)/2)
			.short ((sc_0x4B83-table)/2)
			.short ((sc_0x4B84-table)/2)
			.short ((sc_0x4B85-table)/2)
			.short ((sc_0x4B86-table)/2)
			.short ((sc_0x4B87-table)/2)
			.short ((sc_0x4B88-table)/2)
			.short ((sc_0x4B89-table)/2)
			.short ((sc_0x4B8A-table)/2)
			.short ((sc_0x4B8B-table)/2)
			.short ((sc_0x4B8C-table)/2)
			.short ((sc_0x4B8D-table)/2)
			.short ((sc_0x4B8E-table)/2)
			.short ((sc_0x4B8F-table)/2)
			.short ((sc_0x4B90-table)/2)
			.short ((sc_0x4B91-table)/2)
			.short ((sc_0x4B92-table)/2)
			.short ((sc_0x4B93-table)/2)
			.short ((sc_0x4B94-table)/2)
			.short ((sc_0x4B95-table)/2)
			.short ((sc_0x4B96-table)/2)
			.short ((sc_0x4B97-table)/2)
			.short ((sc_0x4B98-table)/2)
			.short ((sc_0x4B99-table)/2)
			.short ((sc_0x4B9A-table)/2)
			.short ((sc_0x4B9B-table)/2)
			.short ((sc_0x4B9C-table)/2)
			.short ((sc_0x4B9D-table)/2)
			.short ((sc_0x4B9E-table)/2)
			.short ((sc_0x4B9F-table)/2)
			.short ((sc_0x4C80-table)/2)
			.short ((sc_0x4C81-table)/2)
			.short ((sc_0x4C82-table)/2)
			.short ((sc_0x4C83-table)/2)
			.short ((sc_0x4C84-table)/2)
			.short ((sc_0x4C85-table)/2)
			.short ((sc_0x4C86-table)/2)
			.short ((sc_0x4C87-table)/2)
			.short ((sc_0x4C88-table)/2)
			.short ((sc_0x4C89-table)/2)
			.short ((sc_0x4C8A-table)/2)
			.short ((sc_0x4C8B-table)/2)
			.short ((sc_0x4C8C-table)/2)
			.short ((sc_0x4C8D-table)/2)
			.short ((sc_0x4C8E-table)/2)
			.short ((sc_0x4C8F-table)/2)
			.short ((sc_0x4C90-table)/2)
			.short ((sc_0x4C91-table)/2)
			.short ((sc_0x4C92-table)/2)
			.short ((sc_0x4C93-table)/2)
			.short ((sc_0x4C94-table)/2)
			.short ((sc_0x4C95-table)/2)
			.short ((sc_0x4C96-table)/2)
			.short ((sc_0x4C97-table)/2)
			.short ((sc_0x4C98-table)/2)
			.short ((sc_0x4C99-table)/2)
			.short ((sc_0x4C9A-table)/2)
			.short ((sc_0x4C9B-table)/2)
			.short ((sc_0x4C9C-table)/2)
			.short ((sc_0x4C9D-table)/2)
			.short ((sc_0x4C9E-table)/2)
			.short ((sc_0x4C9F-table)/2)
			.short ((sc_0x4D80-table)/2)
			.short ((sc_0x4D81-table)/2)
			.short ((sc_0x4D82-table)/2)
			.short ((sc_0x4D83-table)/2)
			.short ((sc_0x4D84-table)/2)
			.short ((sc_0x4D85-table)/2)
			.short ((sc_0x4D86-table)/2)
			.short ((sc_0x4D87-table)/2)
			.short ((sc_0x4D88-table)/2)
			.short ((sc_0x4D89-table)/2)
			.short ((sc_0x4D8A-table)/2)
			.short ((sc_0x4D8B-table)/2)
			.short ((sc_0x4D8C-table)/2)
			.short ((sc_0x4D8D-table)/2)
			.short ((sc_0x4D8E-table)/2)
			.short ((sc_0x4D8F-table)/2)
			.short ((sc_0x4D90-table)/2)
			.short ((sc_0x4D91-table)/2)
			.short ((sc_0x4D92-table)/2)
			.short ((sc_0x4D93-table)/2)
			.short ((sc_0x4D94-table)/2)
			.short ((sc_0x4D95-table)/2)
			.short ((sc_0x4D96-table)/2)
			.short ((sc_0x4D97-table)/2)
			.short ((sc_0x4D98-table)/2)
			.short ((sc_0x4D99-table)/2)
			.short ((sc_0x4D9A-table)/2)
			.short ((sc_0x4D9B-table)/2)
			.short ((sc_0x4D9C-table)/2)
			.short ((sc_0x4D9D-table)/2)
			.short ((sc_0x4D9E-table)/2)
			.short ((sc_0x4D9F-table)/2)
			.short ((sc_0x4E80-table)/2)
			.short ((sc_0x4E81-table)/2)
			.short ((sc_0x4E82-table)/2)
			.short ((sc_0x4E83-table)/2)
			.short ((sc_0x4E84-table)/2)
			.short ((sc_0x4E85-table)/2)
			.short ((sc_0x4E86-table)/2)
			.short ((sc_0x4E87-table)/2)
			.short ((sc_0x4E88-table)/2)
			.short ((sc_0x4E89-table)/2)
			.short ((sc_0x4E8A-table)/2)
			.short ((sc_0x4E8B-table)/2)
			.short ((sc_0x4E8C-table)/2)
			.short ((sc_0x4E8D-table)/2)
			.short ((sc_0x4E8E-table)/2)
			.short ((sc_0x4E8F-table)/2)
			.short ((sc_0x4E90-table)/2)
			.short ((sc_0x4E91-table)/2)
			.short ((sc_0x4E92-table)/2)
			.short ((sc_0x4E93-table)/2)
			.short ((sc_0x4E94-table)/2)
			.short ((sc_0x4E95-table)/2)
			.short ((sc_0x4E96-table)/2)
			.short ((sc_0x4E97-table)/2)
			.short ((sc_0x4E98-table)/2)
			.short ((sc_0x4E99-table)/2)
			.short ((sc_0x4E9A-table)/2)
			.short ((sc_0x4E9B-table)/2)
			.short ((sc_0x4E9C-table)/2)
			.short ((sc_0x4E9D-table)/2)
			.short ((sc_0x4E9E-table)/2)
			.short ((sc_0x4E9F-table)/2)
			.short ((sc_0x4F80-table)/2)
			.short ((sc_0x4F81-table)/2)
			.short ((sc_0x4F82-table)/2)
			.short ((sc_0x4F83-table)/2)
			.short ((sc_0x4F84-table)/2)
			.short ((sc_0x4F85-table)/2)
			.short ((sc_0x4F86-table)/2)
			.short ((sc_0x4F87-table)/2)
			.short ((sc_0x4F88-table)/2)
			.short ((sc_0x4F89-table)/2)
			.short ((sc_0x4F8A-table)/2)
			.short ((sc_0x4F8B-table)/2)
			.short ((sc_0x4F8C-table)/2)
			.short ((sc_0x4F8D-table)/2)
			.short ((sc_0x4F8E-table)/2)
			.short ((sc_0x4F8F-table)/2)
			.short ((sc_0x4F90-table)/2)
			.short ((sc_0x4F91-table)/2)
			.short ((sc_0x4F92-table)/2)
			.short ((sc_0x4F93-table)/2)
			.short ((sc_0x4F94-table)/2)
			.short ((sc_0x4F95-table)/2)
			.short ((sc_0x4F96-table)/2)
			.short ((sc_0x4F97-table)/2)
			.short ((sc_0x4F98-table)/2)
			.short ((sc_0x4F99-table)/2)
			.short ((sc_0x4F9A-table)/2)
			.short ((sc_0x4F9B-table)/2)
			.short ((sc_0x4F9C-table)/2)
			.short ((sc_0x4F9D-table)/2)
			.short ((sc_0x4F9E-table)/2)
			.short ((sc_0x4F9F-table)/2)
			.short ((sc_0x48A0-table)/2)
			.short ((sc_0x48A1-table)/2)
			.short ((sc_0x48A2-table)/2)
			.short ((sc_0x48A3-table)/2)
			.short ((sc_0x48A4-table)/2)
			.short ((sc_0x48A5-table)/2)
			.short ((sc_0x48A6-table)/2)
			.short ((sc_0x48A7-table)/2)
			.short ((sc_0x48A8-table)/2)
			.short ((sc_0x48A9-table)/2)
			.short ((sc_0x48AA-table)/2)
			.short ((sc_0x48AB-table)/2)
			.short ((sc_0x48AC-table)/2)
			.short ((sc_0x48AD-table)/2)
			.short ((sc_0x48AE-table)/2)
			.short ((sc_0x48AF-table)/2)
			.short ((sc_0x48B0-table)/2)
			.short ((sc_0x48B1-table)/2)
			.short ((sc_0x48B2-table)/2)
			.short ((sc_0x48B3-table)/2)
			.short ((sc_0x48B4-table)/2)
			.short ((sc_0x48B5-table)/2)
			.short ((sc_0x48B6-table)/2)
			.short ((sc_0x48B7-table)/2)
			.short ((sc_0x48B8-table)/2)
			.short ((sc_0x48B9-table)/2)
			.short ((sc_0x48BA-table)/2)
			.short ((sc_0x48BB-table)/2)
			.short ((sc_0x48BC-table)/2)
			.short ((sc_0x48BD-table)/2)
			.short ((sc_0x48BE-table)/2)
			.short ((sc_0x48BF-table)/2)
			.short ((sc_0x49A0-table)/2)
			.short ((sc_0x49A1-table)/2)
			.short ((sc_0x49A2-table)/2)
			.short ((sc_0x49A3-table)/2)
			.short ((sc_0x49A4-table)/2)
			.short ((sc_0x49A5-table)/2)
			.short ((sc_0x49A6-table)/2)
			.short ((sc_0x49A7-table)/2)
			.short ((sc_0x49A8-table)/2)
			.short ((sc_0x49A9-table)/2)
			.short ((sc_0x49AA-table)/2)
			.short ((sc_0x49AB-table)/2)
			.short ((sc_0x49AC-table)/2)
			.short ((sc_0x49AD-table)/2)
			.short ((sc_0x49AE-table)/2)
			.short ((sc_0x49AF-table)/2)
			.short ((sc_0x49B0-table)/2)
			.short ((sc_0x49B1-table)/2)
			.short ((sc_0x49B2-table)/2)
			.short ((sc_0x49B3-table)/2)
			.short ((sc_0x49B4-table)/2)
			.short ((sc_0x49B5-table)/2)
			.short ((sc_0x49B6-table)/2)
			.short ((sc_0x49B7-table)/2)
			.short ((sc_0x49B8-table)/2)
			.short ((sc_0x49B9-table)/2)
			.short ((sc_0x49BA-table)/2)
			.short ((sc_0x49BB-table)/2)
			.short ((sc_0x49BC-table)/2)
			.short ((sc_0x49BD-table)/2)
			.short ((sc_0x49BE-table)/2)
			.short ((sc_0x49BF-table)/2)
			.short ((sc_0x4AA0-table)/2)
			.short ((sc_0x4AA1-table)/2)
			.short ((sc_0x4AA2-table)/2)
			.short ((sc_0x4AA3-table)/2)
			.short ((sc_0x4AA4-table)/2)
			.short ((sc_0x4AA5-table)/2)
			.short ((sc_0x4AA6-table)/2)
			.short ((sc_0x4AA7-table)/2)
			.short ((sc_0x4AA8-table)/2)
			.short ((sc_0x4AA9-table)/2)
			.short ((sc_0x4AAA-table)/2)
			.short ((sc_0x4AAB-table)/2)
			.short ((sc_0x4AAC-table)/2)
			.short ((sc_0x4AAD-table)/2)
			.short ((sc_0x4AAE-table)/2)
			.short ((sc_0x4AAF-table)/2)
			.short ((sc_0x4AB0-table)/2)
			.short ((sc_0x4AB1-table)/2)
			.short ((sc_0x4AB2-table)/2)
			.short ((sc_0x4AB3-table)/2)
			.short ((sc_0x4AB4-table)/2)
			.short ((sc_0x4AB5-table)/2)
			.short ((sc_0x4AB6-table)/2)
			.short ((sc_0x4AB7-table)/2)
			.short ((sc_0x4AB8-table)/2)
			.short ((sc_0x4AB9-table)/2)
			.short ((sc_0x4ABA-table)/2)
			.short ((sc_0x4ABB-table)/2)
			.short ((sc_0x4ABC-table)/2)
			.short ((sc_0x4ABD-table)/2)
			.short ((sc_0x4ABE-table)/2)
			.short ((sc_0x4ABF-table)/2)
			.short ((sc_0x4BA0-table)/2)
			.short ((sc_0x4BA1-table)/2)
			.short ((sc_0x4BA2-table)/2)
			.short ((sc_0x4BA3-table)/2)
			.short ((sc_0x4BA4-table)/2)
			.short ((sc_0x4BA5-table)/2)
			.short ((sc_0x4BA6-table)/2)
			.short ((sc_0x4BA7-table)/2)
			.short ((sc_0x4BA8-table)/2)
			.short ((sc_0x4BA9-table)/2)
			.short ((sc_0x4BAA-table)/2)
			.short ((sc_0x4BAB-table)/2)
			.short ((sc_0x4BAC-table)/2)
			.short ((sc_0x4BAD-table)/2)
			.short ((sc_0x4BAE-table)/2)
			.short ((sc_0x4BAF-table)/2)
			.short ((sc_0x4BB0-table)/2)
			.short ((sc_0x4BB1-table)/2)
			.short ((sc_0x4BB2-table)/2)
			.short ((sc_0x4BB3-table)/2)
			.short ((sc_0x4BB4-table)/2)
			.short ((sc_0x4BB5-table)/2)
			.short ((sc_0x4BB6-table)/2)
			.short ((sc_0x4BB7-table)/2)
			.short ((sc_0x4BB8-table)/2)
			.short ((sc_0x4BB9-table)/2)
			.short ((sc_0x4BBA-table)/2)
			.short ((sc_0x4BBB-table)/2)
			.short ((sc_0x4BBC-table)/2)
			.short ((sc_0x4BBD-table)/2)
			.short ((sc_0x4BBE-table)/2)
			.short ((sc_0x4BBF-table)/2)
			.short ((sc_0x4CA0-table)/2)
			.short ((sc_0x4CA1-table)/2)
			.short ((sc_0x4CA2-table)/2)
			.short ((sc_0x4CA3-table)/2)
			.short ((sc_0x4CA4-table)/2)
			.short ((sc_0x4CA5-table)/2)
			.short ((sc_0x4CA6-table)/2)
			.short ((sc_0x4CA7-table)/2)
			.short ((sc_0x4CA8-table)/2)
			.short ((sc_0x4CA9-table)/2)
			.short ((sc_0x4CAA-table)/2)
			.short ((sc_0x4CAB-table)/2)
			.short ((sc_0x4CAC-table)/2)
			.short ((sc_0x4CAD-table)/2)
			.short ((sc_0x4CAE-table)/2)
			.short ((sc_0x4CAF-table)/2)
			.short ((sc_0x4CB0-table)/2)
			.short ((sc_0x4CB1-table)/2)
			.short ((sc_0x4CB2-table)/2)
			.short ((sc_0x4CB3-table)/2)
			.short ((sc_0x4CB4-table)/2)
			.short ((sc_0x4CB5-table)/2)
			.short ((sc_0x4CB6-table)/2)
			.short ((sc_0x4CB7-table)/2)
			.short ((sc_0x4CB8-table)/2)
			.short ((sc_0x4CB9-table)/2)
			.short ((sc_0x4CBA-table)/2)
			.short ((sc_0x4CBB-table)/2)
			.short ((sc_0x4CBC-table)/2)
			.short ((sc_0x4CBD-table)/2)
			.short ((sc_0x4CBE-table)/2)
			.short ((sc_0x4CBF-table)/2)
			.short ((sc_0x4DA0-table)/2)
			.short ((sc_0x4DA1-table)/2)
			.short ((sc_0x4DA2-table)/2)
			.short ((sc_0x4DA3-table)/2)
			.short ((sc_0x4DA4-table)/2)
			.short ((sc_0x4DA5-table)/2)
			.short ((sc_0x4DA6-table)/2)
			.short ((sc_0x4DA7-table)/2)
			.short ((sc_0x4DA8-table)/2)
			.short ((sc_0x4DA9-table)/2)
			.short ((sc_0x4DAA-table)/2)
			.short ((sc_0x4DAB-table)/2)
			.short ((sc_0x4DAC-table)/2)
			.short ((sc_0x4DAD-table)/2)
			.short ((sc_0x4DAE-table)/2)
			.short ((sc_0x4DAF-table)/2)
			.short ((sc_0x4DB0-table)/2)
			.short ((sc_0x4DB1-table)/2)
			.short ((sc_0x4DB2-table)/2)
			.short ((sc_0x4DB3-table)/2)
			.short ((sc_0x4DB4-table)/2)
			.short ((sc_0x4DB5-table)/2)
			.short ((sc_0x4DB6-table)/2)
			.short ((sc_0x4DB7-table)/2)
			.short ((sc_0x4DB8-table)/2)
			.short ((sc_0x4DB9-table)/2)
			.short ((sc_0x4DBA-table)/2)
			.short ((sc_0x4DBB-table)/2)
			.short ((sc_0x4DBC-table)/2)
			.short ((sc_0x4DBD-table)/2)
			.short ((sc_0x4DBE-table)/2)
			.short ((sc_0x4DBF-table)/2)
			.short ((sc_0x4EA0-table)/2)
			.short ((sc_0x4EA1-table)/2)
			.short ((sc_0x4EA2-table)/2)
			.short ((sc_0x4EA3-table)/2)
			.short ((sc_0x4EA4-table)/2)
			.short ((sc_0x4EA5-table)/2)
			.short ((sc_0x4EA6-table)/2)
			.short ((sc_0x4EA7-table)/2)
			.short ((sc_0x4EA8-table)/2)
			.short ((sc_0x4EA9-table)/2)
			.short ((sc_0x4EAA-table)/2)
			.short ((sc_0x4EAB-table)/2)
			.short ((sc_0x4EAC-table)/2)
			.short ((sc_0x4EAD-table)/2)
			.short ((sc_0x4EAE-table)/2)
			.short ((sc_0x4EAF-table)/2)
			.short ((sc_0x4EB0-table)/2)
			.short ((sc_0x4EB1-table)/2)
			.short ((sc_0x4EB2-table)/2)
			.short ((sc_0x4EB3-table)/2)
			.short ((sc_0x4EB4-table)/2)
			.short ((sc_0x4EB5-table)/2)
			.short ((sc_0x4EB6-table)/2)
			.short ((sc_0x4EB7-table)/2)
			.short ((sc_0x4EB8-table)/2)
			.short ((sc_0x4EB9-table)/2)
			.short ((sc_0x4EBA-table)/2)
			.short ((sc_0x4EBB-table)/2)
			.short ((sc_0x4EBC-table)/2)
			.short ((sc_0x4EBD-table)/2)
			.short ((sc_0x4EBE-table)/2)
			.short ((sc_0x4EBF-table)/2)
			.short ((sc_0x4FA0-table)/2)
			.short ((sc_0x4FA1-table)/2)
			.short ((sc_0x4FA2-table)/2)
			.short ((sc_0x4FA3-table)/2)
			.short ((sc_0x4FA4-table)/2)
			.short ((sc_0x4FA5-table)/2)
			.short ((sc_0x4FA6-table)/2)
			.short ((sc_0x4FA7-table)/2)
			.short ((sc_0x4FA8-table)/2)
			.short ((sc_0x4FA9-table)/2)
			.short ((sc_0x4FAA-table)/2)
			.short ((sc_0x4FAB-table)/2)
			.short ((sc_0x4FAC-table)/2)
			.short ((sc_0x4FAD-table)/2)
			.short ((sc_0x4FAE-table)/2)
			.short ((sc_0x4FAF-table)/2)
			.short ((sc_0x4FB0-table)/2)
			.short ((sc_0x4FB1-table)/2)
			.short ((sc_0x4FB2-table)/2)
			.short ((sc_0x4FB3-table)/2)
			.short ((sc_0x4FB4-table)/2)
			.short ((sc_0x4FB5-table)/2)
			.short ((sc_0x4FB6-table)/2)
			.short ((sc_0x4FB7-table)/2)
			.short ((sc_0x4FB8-table)/2)
			.short ((sc_0x4FB9-table)/2)
			.short ((sc_0x4FBA-table)/2)
			.short ((sc_0x4FBB-table)/2)
			.short ((sc_0x4FBC-table)/2)
			.short ((sc_0x4FBD-table)/2)
			.short ((sc_0x4FBE-table)/2)
			.short ((sc_0x4FBF-table)/2)
			.short ((sc_0x48C0-table)/2)
			.short ((sc_0x48C1-table)/2)
			.short ((sc_0x48C2-table)/2)
			.short ((sc_0x48C3-table)/2)
			.short ((sc_0x48C4-table)/2)
			.short ((sc_0x48C5-table)/2)
			.short ((sc_0x48C6-table)/2)
			.short ((sc_0x48C7-table)/2)
			.short ((sc_0x48C8-table)/2)
			.short ((sc_0x48C9-table)/2)
			.short ((sc_0x48CA-table)/2)
			.short ((sc_0x48CB-table)/2)
			.short ((sc_0x48CC-table)/2)
			.short ((sc_0x48CD-table)/2)
			.short ((sc_0x48CE-table)/2)
			.short ((sc_0x48CF-table)/2)
			.short ((sc_0x48D0-table)/2)
			.short ((sc_0x48D1-table)/2)
			.short ((sc_0x48D2-table)/2)
			.short ((sc_0x48D3-table)/2)
			.short ((sc_0x48D4-table)/2)
			.short ((sc_0x48D5-table)/2)
			.short ((sc_0x48D6-table)/2)
			.short ((sc_0x48D7-table)/2)
			.short ((sc_0x48D8-table)/2)
			.short ((sc_0x48D9-table)/2)
			.short ((sc_0x48DA-table)/2)
			.short ((sc_0x48DB-table)/2)
			.short ((sc_0x48DC-table)/2)
			.short ((sc_0x48DD-table)/2)
			.short ((sc_0x48DE-table)/2)
			.short ((sc_0x48DF-table)/2)
			.short ((sc_0x49C0-table)/2)
			.short ((sc_0x49C1-table)/2)
			.short ((sc_0x49C2-table)/2)
			.short ((sc_0x49C3-table)/2)
			.short ((sc_0x49C4-table)/2)
			.short ((sc_0x49C5-table)/2)
			.short ((sc_0x49C6-table)/2)
			.short ((sc_0x49C7-table)/2)
			.short ((sc_0x49C8-table)/2)
			.short ((sc_0x49C9-table)/2)
			.short ((sc_0x49CA-table)/2)
			.short ((sc_0x49CB-table)/2)
			.short ((sc_0x49CC-table)/2)
			.short ((sc_0x49CD-table)/2)
			.short ((sc_0x49CE-table)/2)
			.short ((sc_0x49CF-table)/2)
			.short ((sc_0x49D0-table)/2)
			.short ((sc_0x49D1-table)/2)
			.short ((sc_0x49D2-table)/2)
			.short ((sc_0x49D3-table)/2)
			.short ((sc_0x49D4-table)/2)
			.short ((sc_0x49D5-table)/2)
			.short ((sc_0x49D6-table)/2)
			.short ((sc_0x49D7-table)/2)
			.short ((sc_0x49D8-table)/2)
			.short ((sc_0x49D9-table)/2)
			.short ((sc_0x49DA-table)/2)
			.short ((sc_0x49DB-table)/2)
			.short ((sc_0x49DC-table)/2)
			.short ((sc_0x49DD-table)/2)
			.short ((sc_0x49DE-table)/2)
			.short ((sc_0x49DF-table)/2)
			.short ((sc_0x4AC0-table)/2)
			.short ((sc_0x4AC1-table)/2)
			.short ((sc_0x4AC2-table)/2)
			.short ((sc_0x4AC3-table)/2)
			.short ((sc_0x4AC4-table)/2)
			.short ((sc_0x4AC5-table)/2)
			.short ((sc_0x4AC6-table)/2)
			.short ((sc_0x4AC7-table)/2)
			.short ((sc_0x4AC8-table)/2)
			.short ((sc_0x4AC9-table)/2)
			.short ((sc_0x4ACA-table)/2)
			.short ((sc_0x4ACB-table)/2)
			.short ((sc_0x4ACC-table)/2)
			.short ((sc_0x4ACD-table)/2)
			.short ((sc_0x4ACE-table)/2)
			.short ((sc_0x4ACF-table)/2)
			.short ((sc_0x4AD0-table)/2)
			.short ((sc_0x4AD1-table)/2)
			.short ((sc_0x4AD2-table)/2)
			.short ((sc_0x4AD3-table)/2)
			.short ((sc_0x4AD4-table)/2)
			.short ((sc_0x4AD5-table)/2)
			.short ((sc_0x4AD6-table)/2)
			.short ((sc_0x4AD7-table)/2)
			.short ((sc_0x4AD8-table)/2)
			.short ((sc_0x4AD9-table)/2)
			.short ((sc_0x4ADA-table)/2)
			.short ((sc_0x4ADB-table)/2)
			.short ((sc_0x4ADC-table)/2)
			.short ((sc_0x4ADD-table)/2)
			.short ((sc_0x4ADE-table)/2)
			.short ((sc_0x4ADF-table)/2)
			.short ((sc_0x4BC0-table)/2)
			.short ((sc_0x4BC1-table)/2)
			.short ((sc_0x4BC2-table)/2)
			.short ((sc_0x4BC3-table)/2)
			.short ((sc_0x4BC4-table)/2)
			.short ((sc_0x4BC5-table)/2)
			.short ((sc_0x4BC6-table)/2)
			.short ((sc_0x4BC7-table)/2)
			.short ((sc_0x4BC8-table)/2)
			.short ((sc_0x4BC9-table)/2)
			.short ((sc_0x4BCA-table)/2)
			.short ((sc_0x4BCB-table)/2)
			.short ((sc_0x4BCC-table)/2)
			.short ((sc_0x4BCD-table)/2)
			.short ((sc_0x4BCE-table)/2)
			.short ((sc_0x4BCF-table)/2)
			.short ((sc_0x4BD0-table)/2)
			.short ((sc_0x4BD1-table)/2)
			.short ((sc_0x4BD2-table)/2)
			.short ((sc_0x4BD3-table)/2)
			.short ((sc_0x4BD4-table)/2)
			.short ((sc_0x4BD5-table)/2)
			.short ((sc_0x4BD6-table)/2)
			.short ((sc_0x4BD7-table)/2)
			.short ((sc_0x4BD8-table)/2)
			.short ((sc_0x4BD9-table)/2)
			.short ((sc_0x4BDA-table)/2)
			.short ((sc_0x4BDB-table)/2)
			.short ((sc_0x4BDC-table)/2)
			.short ((sc_0x4BDD-table)/2)
			.short ((sc_0x4BDE-table)/2)
			.short ((sc_0x4BDF-table)/2)
			.short ((sc_0x4CC0-table)/2)
			.short ((sc_0x4CC1-table)/2)
			.short ((sc_0x4CC2-table)/2)
			.short ((sc_0x4CC3-table)/2)
			.short ((sc_0x4CC4-table)/2)
			.short ((sc_0x4CC5-table)/2)
			.short ((sc_0x4CC6-table)/2)
			.short ((sc_0x4CC7-table)/2)
			.short ((sc_0x4CC8-table)/2)
			.short ((sc_0x4CC9-table)/2)
			.short ((sc_0x4CCA-table)/2)
			.short ((sc_0x4CCB-table)/2)
			.short ((sc_0x4CCC-table)/2)
			.short ((sc_0x4CCD-table)/2)
			.short ((sc_0x4CCE-table)/2)
			.short ((sc_0x4CCF-table)/2)
			.short ((sc_0x4CD0-table)/2)
			.short ((sc_0x4CD1-table)/2)
			.short ((sc_0x4CD2-table)/2)
			.short ((sc_0x4CD3-table)/2)
			.short ((sc_0x4CD4-table)/2)
			.short ((sc_0x4CD5-table)/2)
			.short ((sc_0x4CD6-table)/2)
			.short ((sc_0x4CD7-table)/2)
			.short ((sc_0x4CD8-table)/2)
			.short ((sc_0x4CD9-table)/2)
			.short ((sc_0x4CDA-table)/2)
			.short ((sc_0x4CDB-table)/2)
			.short ((sc_0x4CDC-table)/2)
			.short ((sc_0x4CDD-table)/2)
			.short ((sc_0x4CDE-table)/2)
			.short ((sc_0x4CDF-table)/2)
			.short ((sc_0x4DC0-table)/2)
			.short ((sc_0x4DC1-table)/2)
			.short ((sc_0x4DC2-table)/2)
			.short ((sc_0x4DC3-table)/2)
			.short ((sc_0x4DC4-table)/2)
			.short ((sc_0x4DC5-table)/2)
			.short ((sc_0x4DC6-table)/2)
			.short ((sc_0x4DC7-table)/2)
			.short ((sc_0x4DC8-table)/2)
			.short ((sc_0x4DC9-table)/2)
			.short ((sc_0x4DCA-table)/2)
			.short ((sc_0x4DCB-table)/2)
			.short ((sc_0x4DCC-table)/2)
			.short ((sc_0x4DCD-table)/2)
			.short ((sc_0x4DCE-table)/2)
			.short ((sc_0x4DCF-table)/2)
			.short ((sc_0x4DD0-table)/2)
			.short ((sc_0x4DD1-table)/2)
			.short ((sc_0x4DD2-table)/2)
			.short ((sc_0x4DD3-table)/2)
			.short ((sc_0x4DD4-table)/2)
			.short ((sc_0x4DD5-table)/2)
			.short ((sc_0x4DD6-table)/2)
			.short ((sc_0x4DD7-table)/2)
			.short ((sc_0x4DD8-table)/2)
			.short ((sc_0x4DD9-table)/2)
			.short ((sc_0x4DDA-table)/2)
			.short ((sc_0x4DDB-table)/2)
			.short ((sc_0x4DDC-table)/2)
			.short ((sc_0x4DDD-table)/2)
			.short ((sc_0x4DDE-table)/2)
			.short ((sc_0x4DDF-table)/2)
			.short ((sc_0x4EC0-table)/2)
			.short ((sc_0x4EC1-table)/2)
			.short ((sc_0x4EC2-table)/2)
			.short ((sc_0x4EC3-table)/2)
			.short ((sc_0x4EC4-table)/2)
			.short ((sc_0x4EC5-table)/2)
			.short ((sc_0x4EC6-table)/2)
			.short ((sc_0x4EC7-table)/2)
			.short ((sc_0x4EC8-table)/2)
			.short ((sc_0x4EC9-table)/2)
			.short ((sc_0x4ECA-table)/2)
			.short ((sc_0x4ECB-table)/2)
			.short ((sc_0x4ECC-table)/2)
			.short ((sc_0x4ECD-table)/2)
			.short ((sc_0x4ECE-table)/2)
			.short ((sc_0x4ECF-table)/2)
			.short ((sc_0x4ED0-table)/2)
			.short ((sc_0x4ED1-table)/2)
			.short ((sc_0x4ED2-table)/2)
			.short ((sc_0x4ED3-table)/2)
			.short ((sc_0x4ED4-table)/2)
			.short ((sc_0x4ED5-table)/2)
			.short ((sc_0x4ED6-table)/2)
			.short ((sc_0x4ED7-table)/2)
			.short ((sc_0x4ED8-table)/2)
			.short ((sc_0x4ED9-table)/2)
			.short ((sc_0x4EDA-table)/2)
			.short ((sc_0x4EDB-table)/2)
			.short ((sc_0x4EDC-table)/2)
			.short ((sc_0x4EDD-table)/2)
			.short ((sc_0x4EDE-table)/2)
			.short ((sc_0x4EDF-table)/2)
			.short ((sc_0x4FC0-table)/2)
			.short ((sc_0x4FC1-table)/2)
			.short ((sc_0x4FC2-table)/2)
			.short ((sc_0x4FC3-table)/2)
			.short ((sc_0x4FC4-table)/2)
			.short ((sc_0x4FC5-table)/2)
			.short ((sc_0x4FC6-table)/2)
			.short ((sc_0x4FC7-table)/2)
			.short ((sc_0x4FC8-table)/2)
			.short ((sc_0x4FC9-table)/2)
			.short ((sc_0x4FCA-table)/2)
			.short ((sc_0x4FCB-table)/2)
			.short ((sc_0x4FCC-table)/2)
			.short ((sc_0x4FCD-table)/2)
			.short ((sc_0x4FCE-table)/2)
			.short ((sc_0x4FCF-table)/2)
			.short ((sc_0x4FD0-table)/2)
			.short ((sc_0x4FD1-table)/2)
			.short ((sc_0x4FD2-table)/2)
			.short ((sc_0x4FD3-table)/2)
			.short ((sc_0x4FD4-table)/2)
			.short ((sc_0x4FD5-table)/2)
			.short ((sc_0x4FD6-table)/2)
			.short ((sc_0x4FD7-table)/2)
			.short ((sc_0x4FD8-table)/2)
			.short ((sc_0x4FD9-table)/2)
			.short ((sc_0x4FDA-table)/2)
			.short ((sc_0x4FDB-table)/2)
			.short ((sc_0x4FDC-table)/2)
			.short ((sc_0x4FDD-table)/2)
			.short ((sc_0x4FDE-table)/2)
			.short ((sc_0x4FDF-table)/2)
			.short ((sc_0x48E0-table)/2)
			.short ((sc_0x48E1-table)/2)
			.short ((sc_0x48E2-table)/2)
			.short ((sc_0x48E3-table)/2)
			.short ((sc_0x48E4-table)/2)
			.short ((sc_0x48E5-table)/2)
			.short ((sc_0x48E6-table)/2)
			.short ((sc_0x48E7-table)/2)
			.short ((sc_0x48E8-table)/2)
			.short ((sc_0x48E9-table)/2)
			.short ((sc_0x48EA-table)/2)
			.short ((sc_0x48EB-table)/2)
			.short ((sc_0x48EC-table)/2)
			.short ((sc_0x48ED-table)/2)
			.short ((sc_0x48EE-table)/2)
			.short ((sc_0x48EF-table)/2)
			.short ((sc_0x48F0-table)/2)
			.short ((sc_0x48F1-table)/2)
			.short ((sc_0x48F2-table)/2)
			.short ((sc_0x48F3-table)/2)
			.short ((sc_0x48F4-table)/2)
			.short ((sc_0x48F5-table)/2)
			.short ((sc_0x48F6-table)/2)
			.short ((sc_0x48F7-table)/2)
			.short ((sc_0x48F8-table)/2)
			.short ((sc_0x48F9-table)/2)
			.short ((sc_0x48FA-table)/2)
			.short ((sc_0x48FB-table)/2)
			.short ((sc_0x48FC-table)/2)
			.short ((sc_0x48FD-table)/2)
			.short ((sc_0x48FE-table)/2)
			.short ((sc_0x48FF-table)/2)
			.short ((sc_0x49E0-table)/2)
			.short ((sc_0x49E1-table)/2)
			.short ((sc_0x49E2-table)/2)
			.short ((sc_0x49E3-table)/2)
			.short ((sc_0x49E4-table)/2)
			.short ((sc_0x49E5-table)/2)
			.short ((sc_0x49E6-table)/2)
			.short ((sc_0x49E7-table)/2)
			.short ((sc_0x49E8-table)/2)
			.short ((sc_0x49E9-table)/2)
			.short ((sc_0x49EA-table)/2)
			.short ((sc_0x49EB-table)/2)
			.short ((sc_0x49EC-table)/2)
			.short ((sc_0x49ED-table)/2)
			.short ((sc_0x49EE-table)/2)
			.short ((sc_0x49EF-table)/2)
			.short ((sc_0x49F0-table)/2)
			.short ((sc_0x49F1-table)/2)
			.short ((sc_0x49F2-table)/2)
			.short ((sc_0x49F3-table)/2)
			.short ((sc_0x49F4-table)/2)
			.short ((sc_0x49F5-table)/2)
			.short ((sc_0x49F6-table)/2)
			.short ((sc_0x49F7-table)/2)
			.short ((sc_0x49F8-table)/2)
			.short ((sc_0x49F9-table)/2)
			.short ((sc_0x49FA-table)/2)
			.short ((sc_0x49FB-table)/2)
			.short ((sc_0x49FC-table)/2)
			.short ((sc_0x49FD-table)/2)
			.short ((sc_0x49FE-table)/2)
			.short ((sc_0x49FF-table)/2)
			.short ((sc_0x4AE0-table)/2)
			.short ((sc_0x4AE1-table)/2)
			.short ((sc_0x4AE2-table)/2)
			.short ((sc_0x4AE3-table)/2)
			.short ((sc_0x4AE4-table)/2)
			.short ((sc_0x4AE5-table)/2)
			.short ((sc_0x4AE6-table)/2)
			.short ((sc_0x4AE7-table)/2)
			.short ((sc_0x4AE8-table)/2)
			.short ((sc_0x4AE9-table)/2)
			.short ((sc_0x4AEA-table)/2)
			.short ((sc_0x4AEB-table)/2)
			.short ((sc_0x4AEC-table)/2)
			.short ((sc_0x4AED-table)/2)
			.short ((sc_0x4AEE-table)/2)
			.short ((sc_0x4AEF-table)/2)
			.short ((sc_0x4AF0-table)/2)
			.short ((sc_0x4AF1-table)/2)
			.short ((sc_0x4AF2-table)/2)
			.short ((sc_0x4AF3-table)/2)
			.short ((sc_0x4AF4-table)/2)
			.short ((sc_0x4AF5-table)/2)
			.short ((sc_0x4AF6-table)/2)
			.short ((sc_0x4AF7-table)/2)
			.short ((sc_0x4AF8-table)/2)
			.short ((sc_0x4AF9-table)/2)
			.short ((sc_0x4AFA-table)/2)
			.short ((sc_0x4AFB-table)/2)
			.short ((sc_0x4AFC-table)/2)
			.short ((sc_0x4AFD-table)/2)
			.short ((sc_0x4AFE-table)/2)
			.short ((sc_0x4AFF-table)/2)
			.short ((sc_0x4BE0-table)/2)
			.short ((sc_0x4BE1-table)/2)
			.short ((sc_0x4BE2-table)/2)
			.short ((sc_0x4BE3-table)/2)
			.short ((sc_0x4BE4-table)/2)
			.short ((sc_0x4BE5-table)/2)
			.short ((sc_0x4BE6-table)/2)
			.short ((sc_0x4BE7-table)/2)
			.short ((sc_0x4BE8-table)/2)
			.short ((sc_0x4BE9-table)/2)
			.short ((sc_0x4BEA-table)/2)
			.short ((sc_0x4BEB-table)/2)
			.short ((sc_0x4BEC-table)/2)
			.short ((sc_0x4BED-table)/2)
			.short ((sc_0x4BEE-table)/2)
			.short ((sc_0x4BEF-table)/2)
			.short ((sc_0x4BF0-table)/2)
			.short ((sc_0x4BF1-table)/2)
			.short ((sc_0x4BF2-table)/2)
			.short ((sc_0x4BF3-table)/2)
			.short ((sc_0x4BF4-table)/2)
			.short ((sc_0x4BF5-table)/2)
			.short ((sc_0x4BF6-table)/2)
			.short ((sc_0x4BF7-table)/2)
			.short ((sc_0x4BF8-table)/2)
			.short ((sc_0x4BF9-table)/2)
			.short ((sc_0x4BFA-table)/2)
			.short ((sc_0x4BFB-table)/2)
			.short ((sc_0x4BFC-table)/2)
			.short ((sc_0x4BFD-table)/2)
			.short ((sc_0x4BFE-table)/2)
			.short ((sc_0x4BFF-table)/2)
			.short ((sc_0x4CE0-table)/2)
			.short ((sc_0x4CE1-table)/2)
			.short ((sc_0x4CE2-table)/2)
			.short ((sc_0x4CE3-table)/2)
			.short ((sc_0x4CE4-table)/2)
			.short ((sc_0x4CE5-table)/2)
			.short ((sc_0x4CE6-table)/2)
			.short ((sc_0x4CE7-table)/2)
			.short ((sc_0x4CE8-table)/2)
			.short ((sc_0x4CE9-table)/2)
			.short ((sc_0x4CEA-table)/2)
			.short ((sc_0x4CEB-table)/2)
			.short ((sc_0x4CEC-table)/2)
			.short ((sc_0x4CED-table)/2)
			.short ((sc_0x4CEE-table)/2)
			.short ((sc_0x4CEF-table)/2)
			.short ((sc_0x4CF0-table)/2)
			.short ((sc_0x4CF1-table)/2)
			.short ((sc_0x4CF2-table)/2)
			.short ((sc_0x4CF3-table)/2)
			.short ((sc_0x4CF4-table)/2)
			.short ((sc_0x4CF5-table)/2)
			.short ((sc_0x4CF6-table)/2)
			.short ((sc_0x4CF7-table)/2)
			.short ((sc_0x4CF8-table)/2)
			.short ((sc_0x4CF9-table)/2)
			.short ((sc_0x4CFA-table)/2)
			.short ((sc_0x4CFB-table)/2)
			.short ((sc_0x4CFC-table)/2)
			.short ((sc_0x4CFD-table)/2)
			.short ((sc_0x4CFE-table)/2)
			.short ((sc_0x4CFF-table)/2)
			.short ((sc_0x4DE0-table)/2)
			.short ((sc_0x4DE1-table)/2)
			.short ((sc_0x4DE2-table)/2)
			.short ((sc_0x4DE3-table)/2)
			.short ((sc_0x4DE4-table)/2)
			.short ((sc_0x4DE5-table)/2)
			.short ((sc_0x4DE6-table)/2)
			.short ((sc_0x4DE7-table)/2)
			.short ((sc_0x4DE8-table)/2)
			.short ((sc_0x4DE9-table)/2)
			.short ((sc_0x4DEA-table)/2)
			.short ((sc_0x4DEB-table)/2)
			.short ((sc_0x4DEC-table)/2)
			.short ((sc_0x4DED-table)/2)
			.short ((sc_0x4DEE-table)/2)
			.short ((sc_0x4DEF-table)/2)
			.short ((sc_0x4DF0-table)/2)
			.short ((sc_0x4DF1-table)/2)
			.short ((sc_0x4DF2-table)/2)
			.short ((sc_0x4DF3-table)/2)
			.short ((sc_0x4DF4-table)/2)
			.short ((sc_0x4DF5-table)/2)
			.short ((sc_0x4DF6-table)/2)
			.short ((sc_0x4DF7-table)/2)
			.short ((sc_0x4DF8-table)/2)
			.short ((sc_0x4DF9-table)/2)
			.short ((sc_0x4DFA-table)/2)
			.short ((sc_0x4DFB-table)/2)
			.short ((sc_0x4DFC-table)/2)
			.short ((sc_0x4DFD-table)/2)
			.short ((sc_0x4DFE-table)/2)
			.short ((sc_0x4DFF-table)/2)
			.short ((sc_0x4EE0-table)/2)
			.short ((sc_0x4EE1-table)/2)
			.short ((sc_0x4EE2-table)/2)
			.short ((sc_0x4EE3-table)/2)
			.short ((sc_0x4EE4-table)/2)
			.short ((sc_0x4EE5-table)/2)
			.short ((sc_0x4EE6-table)/2)
			.short ((sc_0x4EE7-table)/2)
			.short ((sc_0x4EE8-table)/2)
			.short ((sc_0x4EE9-table)/2)
			.short ((sc_0x4EEA-table)/2)
			.short ((sc_0x4EEB-table)/2)
			.short ((sc_0x4EEC-table)/2)
			.short ((sc_0x4EED-table)/2)
			.short ((sc_0x4EEE-table)/2)
			.short ((sc_0x4EEF-table)/2)
			.short ((sc_0x4EF0-table)/2)
			.short ((sc_0x4EF1-table)/2)
			.short ((sc_0x4EF2-table)/2)
			.short ((sc_0x4EF3-table)/2)
			.short ((sc_0x4EF4-table)/2)
			.short ((sc_0x4EF5-table)/2)
			.short ((sc_0x4EF6-table)/2)
			.short ((sc_0x4EF7-table)/2)
			.short ((sc_0x4EF8-table)/2)
			.short ((sc_0x4EF9-table)/2)
			.short ((sc_0x4EFA-table)/2)
			.short ((sc_0x4EFB-table)/2)
			.short ((sc_0x4EFC-table)/2)
			.short ((sc_0x4EFD-table)/2)
			.short ((sc_0x4EFE-table)/2)
			.short ((sc_0x4EFF-table)/2)
			.short ((sc_0x4FE0-table)/2)
			.short ((sc_0x4FE1-table)/2)
			.short ((sc_0x4FE2-table)/2)
			.short ((sc_0x4FE3-table)/2)
			.short ((sc_0x4FE4-table)/2)
			.short ((sc_0x4FE5-table)/2)
			.short ((sc_0x4FE6-table)/2)
			.short ((sc_0x4FE7-table)/2)
			.short ((sc_0x4FE8-table)/2)
			.short ((sc_0x4FE9-table)/2)
			.short ((sc_0x4FEA-table)/2)
			.short ((sc_0x4FEB-table)/2)
			.short ((sc_0x4FEC-table)/2)
			.short ((sc_0x4FED-table)/2)
			.short ((sc_0x4FEE-table)/2)
			.short ((sc_0x4FEF-table)/2)
			.short ((sc_0x4FF0-table)/2)
			.short ((sc_0x4FF1-table)/2)
			.short ((sc_0x4FF2-table)/2)
			.short ((sc_0x4FF3-table)/2)
			.short ((sc_0x4FF4-table)/2)
			.short ((sc_0x4FF5-table)/2)
			.short ((sc_0x4FF6-table)/2)
			.short ((sc_0x4FF7-table)/2)
			.short ((sc_0x4FF8-table)/2)
			.short ((sc_0x4FF9-table)/2)
			.short ((sc_0x4FFA-table)/2)
			.short ((sc_0x4FFB-table)/2)
			.short ((sc_0x4FFC-table)/2)
			.short ((sc_0x4FFD-table)/2)
			.short ((sc_0x4FFE-table)/2)
			.short ((sc_0x4FFF-table)/2)
			.short ((sc_0x5000-table)/2)
			.short ((sc_0x5001-table)/2)
			.short ((sc_0x5002-table)/2)
			.short ((sc_0x5003-table)/2)
			.short ((sc_0x5004-table)/2)
			.short ((sc_0x5005-table)/2)
			.short ((sc_0x5006-table)/2)
			.short ((sc_0x5007-table)/2)
			.short ((sc_0x5008-table)/2)
			.short ((sc_0x5009-table)/2)
			.short ((sc_0x500A-table)/2)
			.short ((sc_0x500B-table)/2)
			.short ((sc_0x500C-table)/2)
			.short ((sc_0x500D-table)/2)
			.short ((sc_0x500E-table)/2)
			.short ((sc_0x500F-table)/2)
			.short ((sc_0x5010-table)/2)
			.short ((sc_0x5011-table)/2)
			.short ((sc_0x5012-table)/2)
			.short ((sc_0x5013-table)/2)
			.short ((sc_0x5014-table)/2)
			.short ((sc_0x5015-table)/2)
			.short ((sc_0x5016-table)/2)
			.short ((sc_0x5017-table)/2)
			.short ((sc_0x5018-table)/2)
			.short ((sc_0x5019-table)/2)
			.short ((sc_0x501A-table)/2)
			.short ((sc_0x501B-table)/2)
			.short ((sc_0x501C-table)/2)
			.short ((sc_0x501D-table)/2)
			.short ((sc_0x501E-table)/2)
			.short ((sc_0x501F-table)/2)
			.short ((sc_0x5100-table)/2)
			.short ((sc_0x5101-table)/2)
			.short ((sc_0x5102-table)/2)
			.short ((sc_0x5103-table)/2)
			.short ((sc_0x5104-table)/2)
			.short ((sc_0x5105-table)/2)
			.short ((sc_0x5106-table)/2)
			.short ((sc_0x5107-table)/2)
			.short ((sc_0x5108-table)/2)
			.short ((sc_0x5109-table)/2)
			.short ((sc_0x510A-table)/2)
			.short ((sc_0x510B-table)/2)
			.short ((sc_0x510C-table)/2)
			.short ((sc_0x510D-table)/2)
			.short ((sc_0x510E-table)/2)
			.short ((sc_0x510F-table)/2)
			.short ((sc_0x5110-table)/2)
			.short ((sc_0x5111-table)/2)
			.short ((sc_0x5112-table)/2)
			.short ((sc_0x5113-table)/2)
			.short ((sc_0x5114-table)/2)
			.short ((sc_0x5115-table)/2)
			.short ((sc_0x5116-table)/2)
			.short ((sc_0x5117-table)/2)
			.short ((sc_0x5118-table)/2)
			.short ((sc_0x5119-table)/2)
			.short ((sc_0x511A-table)/2)
			.short ((sc_0x511B-table)/2)
			.short ((sc_0x511C-table)/2)
			.short ((sc_0x511D-table)/2)
			.short ((sc_0x511E-table)/2)
			.short ((sc_0x511F-table)/2)
			.short ((sc_0x5200-table)/2)
			.short ((sc_0x5201-table)/2)
			.short ((sc_0x5202-table)/2)
			.short ((sc_0x5203-table)/2)
			.short ((sc_0x5204-table)/2)
			.short ((sc_0x5205-table)/2)
			.short ((sc_0x5206-table)/2)
			.short ((sc_0x5207-table)/2)
			.short ((sc_0x5208-table)/2)
			.short ((sc_0x5209-table)/2)
			.short ((sc_0x520A-table)/2)
			.short ((sc_0x520B-table)/2)
			.short ((sc_0x520C-table)/2)
			.short ((sc_0x520D-table)/2)
			.short ((sc_0x520E-table)/2)
			.short ((sc_0x520F-table)/2)
			.short ((sc_0x5210-table)/2)
			.short ((sc_0x5211-table)/2)
			.short ((sc_0x5212-table)/2)
			.short ((sc_0x5213-table)/2)
			.short ((sc_0x5214-table)/2)
			.short ((sc_0x5215-table)/2)
			.short ((sc_0x5216-table)/2)
			.short ((sc_0x5217-table)/2)
			.short ((sc_0x5218-table)/2)
			.short ((sc_0x5219-table)/2)
			.short ((sc_0x521A-table)/2)
			.short ((sc_0x521B-table)/2)
			.short ((sc_0x521C-table)/2)
			.short ((sc_0x521D-table)/2)
			.short ((sc_0x521E-table)/2)
			.short ((sc_0x521F-table)/2)
			.short ((sc_0x5300-table)/2)
			.short ((sc_0x5301-table)/2)
			.short ((sc_0x5302-table)/2)
			.short ((sc_0x5303-table)/2)
			.short ((sc_0x5304-table)/2)
			.short ((sc_0x5305-table)/2)
			.short ((sc_0x5306-table)/2)
			.short ((sc_0x5307-table)/2)
			.short ((sc_0x5308-table)/2)
			.short ((sc_0x5309-table)/2)
			.short ((sc_0x530A-table)/2)
			.short ((sc_0x530B-table)/2)
			.short ((sc_0x530C-table)/2)
			.short ((sc_0x530D-table)/2)
			.short ((sc_0x530E-table)/2)
			.short ((sc_0x530F-table)/2)
			.short ((sc_0x5310-table)/2)
			.short ((sc_0x5311-table)/2)
			.short ((sc_0x5312-table)/2)
			.short ((sc_0x5313-table)/2)
			.short ((sc_0x5314-table)/2)
			.short ((sc_0x5315-table)/2)
			.short ((sc_0x5316-table)/2)
			.short ((sc_0x5317-table)/2)
			.short ((sc_0x5318-table)/2)
			.short ((sc_0x5319-table)/2)
			.short ((sc_0x531A-table)/2)
			.short ((sc_0x531B-table)/2)
			.short ((sc_0x531C-table)/2)
			.short ((sc_0x531D-table)/2)
			.short ((sc_0x531E-table)/2)
			.short ((sc_0x531F-table)/2)
			.short ((sc_0x5400-table)/2)
			.short ((sc_0x5401-table)/2)
			.short ((sc_0x5402-table)/2)
			.short ((sc_0x5403-table)/2)
			.short ((sc_0x5404-table)/2)
			.short ((sc_0x5405-table)/2)
			.short ((sc_0x5406-table)/2)
			.short ((sc_0x5407-table)/2)
			.short ((sc_0x5408-table)/2)
			.short ((sc_0x5409-table)/2)
			.short ((sc_0x540A-table)/2)
			.short ((sc_0x540B-table)/2)
			.short ((sc_0x540C-table)/2)
			.short ((sc_0x540D-table)/2)
			.short ((sc_0x540E-table)/2)
			.short ((sc_0x540F-table)/2)
			.short ((sc_0x5410-table)/2)
			.short ((sc_0x5411-table)/2)
			.short ((sc_0x5412-table)/2)
			.short ((sc_0x5413-table)/2)
			.short ((sc_0x5414-table)/2)
			.short ((sc_0x5415-table)/2)
			.short ((sc_0x5416-table)/2)
			.short ((sc_0x5417-table)/2)
			.short ((sc_0x5418-table)/2)
			.short ((sc_0x5419-table)/2)
			.short ((sc_0x541A-table)/2)
			.short ((sc_0x541B-table)/2)
			.short ((sc_0x541C-table)/2)
			.short ((sc_0x541D-table)/2)
			.short ((sc_0x541E-table)/2)
			.short ((sc_0x541F-table)/2)
			.short ((sc_0x5500-table)/2)
			.short ((sc_0x5501-table)/2)
			.short ((sc_0x5502-table)/2)
			.short ((sc_0x5503-table)/2)
			.short ((sc_0x5504-table)/2)
			.short ((sc_0x5505-table)/2)
			.short ((sc_0x5506-table)/2)
			.short ((sc_0x5507-table)/2)
			.short ((sc_0x5508-table)/2)
			.short ((sc_0x5509-table)/2)
			.short ((sc_0x550A-table)/2)
			.short ((sc_0x550B-table)/2)
			.short ((sc_0x550C-table)/2)
			.short ((sc_0x550D-table)/2)
			.short ((sc_0x550E-table)/2)
			.short ((sc_0x550F-table)/2)
			.short ((sc_0x5510-table)/2)
			.short ((sc_0x5511-table)/2)
			.short ((sc_0x5512-table)/2)
			.short ((sc_0x5513-table)/2)
			.short ((sc_0x5514-table)/2)
			.short ((sc_0x5515-table)/2)
			.short ((sc_0x5516-table)/2)
			.short ((sc_0x5517-table)/2)
			.short ((sc_0x5518-table)/2)
			.short ((sc_0x5519-table)/2)
			.short ((sc_0x551A-table)/2)
			.short ((sc_0x551B-table)/2)
			.short ((sc_0x551C-table)/2)
			.short ((sc_0x551D-table)/2)
			.short ((sc_0x551E-table)/2)
			.short ((sc_0x551F-table)/2)
			.short ((sc_0x5600-table)/2)
			.short ((sc_0x5601-table)/2)
			.short ((sc_0x5602-table)/2)
			.short ((sc_0x5603-table)/2)
			.short ((sc_0x5604-table)/2)
			.short ((sc_0x5605-table)/2)
			.short ((sc_0x5606-table)/2)
			.short ((sc_0x5607-table)/2)
			.short ((sc_0x5608-table)/2)
			.short ((sc_0x5609-table)/2)
			.short ((sc_0x560A-table)/2)
			.short ((sc_0x560B-table)/2)
			.short ((sc_0x560C-table)/2)
			.short ((sc_0x560D-table)/2)
			.short ((sc_0x560E-table)/2)
			.short ((sc_0x560F-table)/2)
			.short ((sc_0x5610-table)/2)
			.short ((sc_0x5611-table)/2)
			.short ((sc_0x5612-table)/2)
			.short ((sc_0x5613-table)/2)
			.short ((sc_0x5614-table)/2)
			.short ((sc_0x5615-table)/2)
			.short ((sc_0x5616-table)/2)
			.short ((sc_0x5617-table)/2)
			.short ((sc_0x5618-table)/2)
			.short ((sc_0x5619-table)/2)
			.short ((sc_0x561A-table)/2)
			.short ((sc_0x561B-table)/2)
			.short ((sc_0x561C-table)/2)
			.short ((sc_0x561D-table)/2)
			.short ((sc_0x561E-table)/2)
			.short ((sc_0x561F-table)/2)
			.short ((sc_0x5700-table)/2)
			.short ((sc_0x5701-table)/2)
			.short ((sc_0x5702-table)/2)
			.short ((sc_0x5703-table)/2)
			.short ((sc_0x5704-table)/2)
			.short ((sc_0x5705-table)/2)
			.short ((sc_0x5706-table)/2)
			.short ((sc_0x5707-table)/2)
			.short ((sc_0x5708-table)/2)
			.short ((sc_0x5709-table)/2)
			.short ((sc_0x570A-table)/2)
			.short ((sc_0x570B-table)/2)
			.short ((sc_0x570C-table)/2)
			.short ((sc_0x570D-table)/2)
			.short ((sc_0x570E-table)/2)
			.short ((sc_0x570F-table)/2)
			.short ((sc_0x5710-table)/2)
			.short ((sc_0x5711-table)/2)
			.short ((sc_0x5712-table)/2)
			.short ((sc_0x5713-table)/2)
			.short ((sc_0x5714-table)/2)
			.short ((sc_0x5715-table)/2)
			.short ((sc_0x5716-table)/2)
			.short ((sc_0x5717-table)/2)
			.short ((sc_0x5718-table)/2)
			.short ((sc_0x5719-table)/2)
			.short ((sc_0x571A-table)/2)
			.short ((sc_0x571B-table)/2)
			.short ((sc_0x571C-table)/2)
			.short ((sc_0x571D-table)/2)
			.short ((sc_0x571E-table)/2)
			.short ((sc_0x571F-table)/2)
			.short ((sc_0x5020-table)/2)
			.short ((sc_0x5021-table)/2)
			.short ((sc_0x5022-table)/2)
			.short ((sc_0x5023-table)/2)
			.short ((sc_0x5024-table)/2)
			.short ((sc_0x5025-table)/2)
			.short ((sc_0x5026-table)/2)
			.short ((sc_0x5027-table)/2)
			.short ((sc_0x5028-table)/2)
			.short ((sc_0x5029-table)/2)
			.short ((sc_0x502A-table)/2)
			.short ((sc_0x502B-table)/2)
			.short ((sc_0x502C-table)/2)
			.short ((sc_0x502D-table)/2)
			.short ((sc_0x502E-table)/2)
			.short ((sc_0x502F-table)/2)
			.short ((sc_0x5030-table)/2)
			.short ((sc_0x5031-table)/2)
			.short ((sc_0x5032-table)/2)
			.short ((sc_0x5033-table)/2)
			.short ((sc_0x5034-table)/2)
			.short ((sc_0x5035-table)/2)
			.short ((sc_0x5036-table)/2)
			.short ((sc_0x5037-table)/2)
			.short ((sc_0x5038-table)/2)
			.short ((sc_0x5039-table)/2)
			.short ((sc_0x503A-table)/2)
			.short ((sc_0x503B-table)/2)
			.short ((sc_0x503C-table)/2)
			.short ((sc_0x503D-table)/2)
			.short ((sc_0x503E-table)/2)
			.short ((sc_0x503F-table)/2)
			.short ((sc_0x5120-table)/2)
			.short ((sc_0x5121-table)/2)
			.short ((sc_0x5122-table)/2)
			.short ((sc_0x5123-table)/2)
			.short ((sc_0x5124-table)/2)
			.short ((sc_0x5125-table)/2)
			.short ((sc_0x5126-table)/2)
			.short ((sc_0x5127-table)/2)
			.short ((sc_0x5128-table)/2)
			.short ((sc_0x5129-table)/2)
			.short ((sc_0x512A-table)/2)
			.short ((sc_0x512B-table)/2)
			.short ((sc_0x512C-table)/2)
			.short ((sc_0x512D-table)/2)
			.short ((sc_0x512E-table)/2)
			.short ((sc_0x512F-table)/2)
			.short ((sc_0x5130-table)/2)
			.short ((sc_0x5131-table)/2)
			.short ((sc_0x5132-table)/2)
			.short ((sc_0x5133-table)/2)
			.short ((sc_0x5134-table)/2)
			.short ((sc_0x5135-table)/2)
			.short ((sc_0x5136-table)/2)
			.short ((sc_0x5137-table)/2)
			.short ((sc_0x5138-table)/2)
			.short ((sc_0x5139-table)/2)
			.short ((sc_0x513A-table)/2)
			.short ((sc_0x513B-table)/2)
			.short ((sc_0x513C-table)/2)
			.short ((sc_0x513D-table)/2)
			.short ((sc_0x513E-table)/2)
			.short ((sc_0x513F-table)/2)
			.short ((sc_0x5220-table)/2)
			.short ((sc_0x5221-table)/2)
			.short ((sc_0x5222-table)/2)
			.short ((sc_0x5223-table)/2)
			.short ((sc_0x5224-table)/2)
			.short ((sc_0x5225-table)/2)
			.short ((sc_0x5226-table)/2)
			.short ((sc_0x5227-table)/2)
			.short ((sc_0x5228-table)/2)
			.short ((sc_0x5229-table)/2)
			.short ((sc_0x522A-table)/2)
			.short ((sc_0x522B-table)/2)
			.short ((sc_0x522C-table)/2)
			.short ((sc_0x522D-table)/2)
			.short ((sc_0x522E-table)/2)
			.short ((sc_0x522F-table)/2)
			.short ((sc_0x5230-table)/2)
			.short ((sc_0x5231-table)/2)
			.short ((sc_0x5232-table)/2)
			.short ((sc_0x5233-table)/2)
			.short ((sc_0x5234-table)/2)
			.short ((sc_0x5235-table)/2)
			.short ((sc_0x5236-table)/2)
			.short ((sc_0x5237-table)/2)
			.short ((sc_0x5238-table)/2)
			.short ((sc_0x5239-table)/2)
			.short ((sc_0x523A-table)/2)
			.short ((sc_0x523B-table)/2)
			.short ((sc_0x523C-table)/2)
			.short ((sc_0x523D-table)/2)
			.short ((sc_0x523E-table)/2)
			.short ((sc_0x523F-table)/2)
			.short ((sc_0x5320-table)/2)
			.short ((sc_0x5321-table)/2)
			.short ((sc_0x5322-table)/2)
			.short ((sc_0x5323-table)/2)
			.short ((sc_0x5324-table)/2)
			.short ((sc_0x5325-table)/2)
			.short ((sc_0x5326-table)/2)
			.short ((sc_0x5327-table)/2)
			.short ((sc_0x5328-table)/2)
			.short ((sc_0x5329-table)/2)
			.short ((sc_0x532A-table)/2)
			.short ((sc_0x532B-table)/2)
			.short ((sc_0x532C-table)/2)
			.short ((sc_0x532D-table)/2)
			.short ((sc_0x532E-table)/2)
			.short ((sc_0x532F-table)/2)
			.short ((sc_0x5330-table)/2)
			.short ((sc_0x5331-table)/2)
			.short ((sc_0x5332-table)/2)
			.short ((sc_0x5333-table)/2)
			.short ((sc_0x5334-table)/2)
			.short ((sc_0x5335-table)/2)
			.short ((sc_0x5336-table)/2)
			.short ((sc_0x5337-table)/2)
			.short ((sc_0x5338-table)/2)
			.short ((sc_0x5339-table)/2)
			.short ((sc_0x533A-table)/2)
			.short ((sc_0x533B-table)/2)
			.short ((sc_0x533C-table)/2)
			.short ((sc_0x533D-table)/2)
			.short ((sc_0x533E-table)/2)
			.short ((sc_0x533F-table)/2)
			.short ((sc_0x5420-table)/2)
			.short ((sc_0x5421-table)/2)
			.short ((sc_0x5422-table)/2)
			.short ((sc_0x5423-table)/2)
			.short ((sc_0x5424-table)/2)
			.short ((sc_0x5425-table)/2)
			.short ((sc_0x5426-table)/2)
			.short ((sc_0x5427-table)/2)
			.short ((sc_0x5428-table)/2)
			.short ((sc_0x5429-table)/2)
			.short ((sc_0x542A-table)/2)
			.short ((sc_0x542B-table)/2)
			.short ((sc_0x542C-table)/2)
			.short ((sc_0x542D-table)/2)
			.short ((sc_0x542E-table)/2)
			.short ((sc_0x542F-table)/2)
			.short ((sc_0x5430-table)/2)
			.short ((sc_0x5431-table)/2)
			.short ((sc_0x5432-table)/2)
			.short ((sc_0x5433-table)/2)
			.short ((sc_0x5434-table)/2)
			.short ((sc_0x5435-table)/2)
			.short ((sc_0x5436-table)/2)
			.short ((sc_0x5437-table)/2)
			.short ((sc_0x5438-table)/2)
			.short ((sc_0x5439-table)/2)
			.short ((sc_0x543A-table)/2)
			.short ((sc_0x543B-table)/2)
			.short ((sc_0x543C-table)/2)
			.short ((sc_0x543D-table)/2)
			.short ((sc_0x543E-table)/2)
			.short ((sc_0x543F-table)/2)
			.short ((sc_0x5520-table)/2)
			.short ((sc_0x5521-table)/2)
			.short ((sc_0x5522-table)/2)
			.short ((sc_0x5523-table)/2)
			.short ((sc_0x5524-table)/2)
			.short ((sc_0x5525-table)/2)
			.short ((sc_0x5526-table)/2)
			.short ((sc_0x5527-table)/2)
			.short ((sc_0x5528-table)/2)
			.short ((sc_0x5529-table)/2)
			.short ((sc_0x552A-table)/2)
			.short ((sc_0x552B-table)/2)
			.short ((sc_0x552C-table)/2)
			.short ((sc_0x552D-table)/2)
			.short ((sc_0x552E-table)/2)
			.short ((sc_0x552F-table)/2)
			.short ((sc_0x5530-table)/2)
			.short ((sc_0x5531-table)/2)
			.short ((sc_0x5532-table)/2)
			.short ((sc_0x5533-table)/2)
			.short ((sc_0x5534-table)/2)
			.short ((sc_0x5535-table)/2)
			.short ((sc_0x5536-table)/2)
			.short ((sc_0x5537-table)/2)
			.short ((sc_0x5538-table)/2)
			.short ((sc_0x5539-table)/2)
			.short ((sc_0x553A-table)/2)
			.short ((sc_0x553B-table)/2)
			.short ((sc_0x553C-table)/2)
			.short ((sc_0x553D-table)/2)
			.short ((sc_0x553E-table)/2)
			.short ((sc_0x553F-table)/2)
			.short ((sc_0x5620-table)/2)
			.short ((sc_0x5621-table)/2)
			.short ((sc_0x5622-table)/2)
			.short ((sc_0x5623-table)/2)
			.short ((sc_0x5624-table)/2)
			.short ((sc_0x5625-table)/2)
			.short ((sc_0x5626-table)/2)
			.short ((sc_0x5627-table)/2)
			.short ((sc_0x5628-table)/2)
			.short ((sc_0x5629-table)/2)
			.short ((sc_0x562A-table)/2)
			.short ((sc_0x562B-table)/2)
			.short ((sc_0x562C-table)/2)
			.short ((sc_0x562D-table)/2)
			.short ((sc_0x562E-table)/2)
			.short ((sc_0x562F-table)/2)
			.short ((sc_0x5630-table)/2)
			.short ((sc_0x5631-table)/2)
			.short ((sc_0x5632-table)/2)
			.short ((sc_0x5633-table)/2)
			.short ((sc_0x5634-table)/2)
			.short ((sc_0x5635-table)/2)
			.short ((sc_0x5636-table)/2)
			.short ((sc_0x5637-table)/2)
			.short ((sc_0x5638-table)/2)
			.short ((sc_0x5639-table)/2)
			.short ((sc_0x563A-table)/2)
			.short ((sc_0x563B-table)/2)
			.short ((sc_0x563C-table)/2)
			.short ((sc_0x563D-table)/2)
			.short ((sc_0x563E-table)/2)
			.short ((sc_0x563F-table)/2)
			.short ((sc_0x5720-table)/2)
			.short ((sc_0x5721-table)/2)
			.short ((sc_0x5722-table)/2)
			.short ((sc_0x5723-table)/2)
			.short ((sc_0x5724-table)/2)
			.short ((sc_0x5725-table)/2)
			.short ((sc_0x5726-table)/2)
			.short ((sc_0x5727-table)/2)
			.short ((sc_0x5728-table)/2)
			.short ((sc_0x5729-table)/2)
			.short ((sc_0x572A-table)/2)
			.short ((sc_0x572B-table)/2)
			.short ((sc_0x572C-table)/2)
			.short ((sc_0x572D-table)/2)
			.short ((sc_0x572E-table)/2)
			.short ((sc_0x572F-table)/2)
			.short ((sc_0x5730-table)/2)
			.short ((sc_0x5731-table)/2)
			.short ((sc_0x5732-table)/2)
			.short ((sc_0x5733-table)/2)
			.short ((sc_0x5734-table)/2)
			.short ((sc_0x5735-table)/2)
			.short ((sc_0x5736-table)/2)
			.short ((sc_0x5737-table)/2)
			.short ((sc_0x5738-table)/2)
			.short ((sc_0x5739-table)/2)
			.short ((sc_0x573A-table)/2)
			.short ((sc_0x573B-table)/2)
			.short ((sc_0x573C-table)/2)
			.short ((sc_0x573D-table)/2)
			.short ((sc_0x573E-table)/2)
			.short ((sc_0x573F-table)/2)
			.short ((sc_0x5040-table)/2)
			.short ((sc_0x5041-table)/2)
			.short ((sc_0x5042-table)/2)
			.short ((sc_0x5043-table)/2)
			.short ((sc_0x5044-table)/2)
			.short ((sc_0x5045-table)/2)
			.short ((sc_0x5046-table)/2)
			.short ((sc_0x5047-table)/2)
			.short ((sc_0x5048-table)/2)
			.short ((sc_0x5049-table)/2)
			.short ((sc_0x504A-table)/2)
			.short ((sc_0x504B-table)/2)
			.short ((sc_0x504C-table)/2)
			.short ((sc_0x504D-table)/2)
			.short ((sc_0x504E-table)/2)
			.short ((sc_0x504F-table)/2)
			.short ((sc_0x5050-table)/2)
			.short ((sc_0x5051-table)/2)
			.short ((sc_0x5052-table)/2)
			.short ((sc_0x5053-table)/2)
			.short ((sc_0x5054-table)/2)
			.short ((sc_0x5055-table)/2)
			.short ((sc_0x5056-table)/2)
			.short ((sc_0x5057-table)/2)
			.short ((sc_0x5058-table)/2)
			.short ((sc_0x5059-table)/2)
			.short ((sc_0x505A-table)/2)
			.short ((sc_0x505B-table)/2)
			.short ((sc_0x505C-table)/2)
			.short ((sc_0x505D-table)/2)
			.short ((sc_0x505E-table)/2)
			.short ((sc_0x505F-table)/2)
			.short ((sc_0x5140-table)/2)
			.short ((sc_0x5141-table)/2)
			.short ((sc_0x5142-table)/2)
			.short ((sc_0x5143-table)/2)
			.short ((sc_0x5144-table)/2)
			.short ((sc_0x5145-table)/2)
			.short ((sc_0x5146-table)/2)
			.short ((sc_0x5147-table)/2)
			.short ((sc_0x5148-table)/2)
			.short ((sc_0x5149-table)/2)
			.short ((sc_0x514A-table)/2)
			.short ((sc_0x514B-table)/2)
			.short ((sc_0x514C-table)/2)
			.short ((sc_0x514D-table)/2)
			.short ((sc_0x514E-table)/2)
			.short ((sc_0x514F-table)/2)
			.short ((sc_0x5150-table)/2)
			.short ((sc_0x5151-table)/2)
			.short ((sc_0x5152-table)/2)
			.short ((sc_0x5153-table)/2)
			.short ((sc_0x5154-table)/2)
			.short ((sc_0x5155-table)/2)
			.short ((sc_0x5156-table)/2)
			.short ((sc_0x5157-table)/2)
			.short ((sc_0x5158-table)/2)
			.short ((sc_0x5159-table)/2)
			.short ((sc_0x515A-table)/2)
			.short ((sc_0x515B-table)/2)
			.short ((sc_0x515C-table)/2)
			.short ((sc_0x515D-table)/2)
			.short ((sc_0x515E-table)/2)
			.short ((sc_0x515F-table)/2)
			.short ((sc_0x5240-table)/2)
			.short ((sc_0x5241-table)/2)
			.short ((sc_0x5242-table)/2)
			.short ((sc_0x5243-table)/2)
			.short ((sc_0x5244-table)/2)
			.short ((sc_0x5245-table)/2)
			.short ((sc_0x5246-table)/2)
			.short ((sc_0x5247-table)/2)
			.short ((sc_0x5248-table)/2)
			.short ((sc_0x5249-table)/2)
			.short ((sc_0x524A-table)/2)
			.short ((sc_0x524B-table)/2)
			.short ((sc_0x524C-table)/2)
			.short ((sc_0x524D-table)/2)
			.short ((sc_0x524E-table)/2)
			.short ((sc_0x524F-table)/2)
			.short ((sc_0x5250-table)/2)
			.short ((sc_0x5251-table)/2)
			.short ((sc_0x5252-table)/2)
			.short ((sc_0x5253-table)/2)
			.short ((sc_0x5254-table)/2)
			.short ((sc_0x5255-table)/2)
			.short ((sc_0x5256-table)/2)
			.short ((sc_0x5257-table)/2)
			.short ((sc_0x5258-table)/2)
			.short ((sc_0x5259-table)/2)
			.short ((sc_0x525A-table)/2)
			.short ((sc_0x525B-table)/2)
			.short ((sc_0x525C-table)/2)
			.short ((sc_0x525D-table)/2)
			.short ((sc_0x525E-table)/2)
			.short ((sc_0x525F-table)/2)
			.short ((sc_0x5340-table)/2)
			.short ((sc_0x5341-table)/2)
			.short ((sc_0x5342-table)/2)
			.short ((sc_0x5343-table)/2)
			.short ((sc_0x5344-table)/2)
			.short ((sc_0x5345-table)/2)
			.short ((sc_0x5346-table)/2)
			.short ((sc_0x5347-table)/2)
			.short ((sc_0x5348-table)/2)
			.short ((sc_0x5349-table)/2)
			.short ((sc_0x534A-table)/2)
			.short ((sc_0x534B-table)/2)
			.short ((sc_0x534C-table)/2)
			.short ((sc_0x534D-table)/2)
			.short ((sc_0x534E-table)/2)
			.short ((sc_0x534F-table)/2)
			.short ((sc_0x5350-table)/2)
			.short ((sc_0x5351-table)/2)
			.short ((sc_0x5352-table)/2)
			.short ((sc_0x5353-table)/2)
			.short ((sc_0x5354-table)/2)
			.short ((sc_0x5355-table)/2)
			.short ((sc_0x5356-table)/2)
			.short ((sc_0x5357-table)/2)
			.short ((sc_0x5358-table)/2)
			.short ((sc_0x5359-table)/2)
			.short ((sc_0x535A-table)/2)
			.short ((sc_0x535B-table)/2)
			.short ((sc_0x535C-table)/2)
			.short ((sc_0x535D-table)/2)
			.short ((sc_0x535E-table)/2)
			.short ((sc_0x535F-table)/2)
			.short ((sc_0x5440-table)/2)
			.short ((sc_0x5441-table)/2)
			.short ((sc_0x5442-table)/2)
			.short ((sc_0x5443-table)/2)
			.short ((sc_0x5444-table)/2)
			.short ((sc_0x5445-table)/2)
			.short ((sc_0x5446-table)/2)
			.short ((sc_0x5447-table)/2)
			.short ((sc_0x5448-table)/2)
			.short ((sc_0x5449-table)/2)
			.short ((sc_0x544A-table)/2)
			.short ((sc_0x544B-table)/2)
			.short ((sc_0x544C-table)/2)
			.short ((sc_0x544D-table)/2)
			.short ((sc_0x544E-table)/2)
			.short ((sc_0x544F-table)/2)
			.short ((sc_0x5450-table)/2)
			.short ((sc_0x5451-table)/2)
			.short ((sc_0x5452-table)/2)
			.short ((sc_0x5453-table)/2)
			.short ((sc_0x5454-table)/2)
			.short ((sc_0x5455-table)/2)
			.short ((sc_0x5456-table)/2)
			.short ((sc_0x5457-table)/2)
			.short ((sc_0x5458-table)/2)
			.short ((sc_0x5459-table)/2)
			.short ((sc_0x545A-table)/2)
			.short ((sc_0x545B-table)/2)
			.short ((sc_0x545C-table)/2)
			.short ((sc_0x545D-table)/2)
			.short ((sc_0x545E-table)/2)
			.short ((sc_0x545F-table)/2)
			.short ((sc_0x5540-table)/2)
			.short ((sc_0x5541-table)/2)
			.short ((sc_0x5542-table)/2)
			.short ((sc_0x5543-table)/2)
			.short ((sc_0x5544-table)/2)
			.short ((sc_0x5545-table)/2)
			.short ((sc_0x5546-table)/2)
			.short ((sc_0x5547-table)/2)
			.short ((sc_0x5548-table)/2)
			.short ((sc_0x5549-table)/2)
			.short ((sc_0x554A-table)/2)
			.short ((sc_0x554B-table)/2)
			.short ((sc_0x554C-table)/2)
			.short ((sc_0x554D-table)/2)
			.short ((sc_0x554E-table)/2)
			.short ((sc_0x554F-table)/2)
			.short ((sc_0x5550-table)/2)
			.short ((sc_0x5551-table)/2)
			.short ((sc_0x5552-table)/2)
			.short ((sc_0x5553-table)/2)
			.short ((sc_0x5554-table)/2)
			.short ((sc_0x5555-table)/2)
			.short ((sc_0x5556-table)/2)
			.short ((sc_0x5557-table)/2)
			.short ((sc_0x5558-table)/2)
			.short ((sc_0x5559-table)/2)
			.short ((sc_0x555A-table)/2)
			.short ((sc_0x555B-table)/2)
			.short ((sc_0x555C-table)/2)
			.short ((sc_0x555D-table)/2)
			.short ((sc_0x555E-table)/2)
			.short ((sc_0x555F-table)/2)
			.short ((sc_0x5640-table)/2)
			.short ((sc_0x5641-table)/2)
			.short ((sc_0x5642-table)/2)
			.short ((sc_0x5643-table)/2)
			.short ((sc_0x5644-table)/2)
			.short ((sc_0x5645-table)/2)
			.short ((sc_0x5646-table)/2)
			.short ((sc_0x5647-table)/2)
			.short ((sc_0x5648-table)/2)
			.short ((sc_0x5649-table)/2)
			.short ((sc_0x564A-table)/2)
			.short ((sc_0x564B-table)/2)
			.short ((sc_0x564C-table)/2)
			.short ((sc_0x564D-table)/2)
			.short ((sc_0x564E-table)/2)
			.short ((sc_0x564F-table)/2)
			.short ((sc_0x5650-table)/2)
			.short ((sc_0x5651-table)/2)
			.short ((sc_0x5652-table)/2)
			.short ((sc_0x5653-table)/2)
			.short ((sc_0x5654-table)/2)
			.short ((sc_0x5655-table)/2)
			.short ((sc_0x5656-table)/2)
			.short ((sc_0x5657-table)/2)
			.short ((sc_0x5658-table)/2)
			.short ((sc_0x5659-table)/2)
			.short ((sc_0x565A-table)/2)
			.short ((sc_0x565B-table)/2)
			.short ((sc_0x565C-table)/2)
			.short ((sc_0x565D-table)/2)
			.short ((sc_0x565E-table)/2)
			.short ((sc_0x565F-table)/2)
			.short ((sc_0x5740-table)/2)
			.short ((sc_0x5741-table)/2)
			.short ((sc_0x5742-table)/2)
			.short ((sc_0x5743-table)/2)
			.short ((sc_0x5744-table)/2)
			.short ((sc_0x5745-table)/2)
			.short ((sc_0x5746-table)/2)
			.short ((sc_0x5747-table)/2)
			.short ((sc_0x5748-table)/2)
			.short ((sc_0x5749-table)/2)
			.short ((sc_0x574A-table)/2)
			.short ((sc_0x574B-table)/2)
			.short ((sc_0x574C-table)/2)
			.short ((sc_0x574D-table)/2)
			.short ((sc_0x574E-table)/2)
			.short ((sc_0x574F-table)/2)
			.short ((sc_0x5750-table)/2)
			.short ((sc_0x5751-table)/2)
			.short ((sc_0x5752-table)/2)
			.short ((sc_0x5753-table)/2)
			.short ((sc_0x5754-table)/2)
			.short ((sc_0x5755-table)/2)
			.short ((sc_0x5756-table)/2)
			.short ((sc_0x5757-table)/2)
			.short ((sc_0x5758-table)/2)
			.short ((sc_0x5759-table)/2)
			.short ((sc_0x575A-table)/2)
			.short ((sc_0x575B-table)/2)
			.short ((sc_0x575C-table)/2)
			.short ((sc_0x575D-table)/2)
			.short ((sc_0x575E-table)/2)
			.short ((sc_0x575F-table)/2)
			.short ((sc_0x5060-table)/2)
			.short ((sc_0x5061-table)/2)
			.short ((sc_0x5062-table)/2)
			.short ((sc_0x5063-table)/2)
			.short ((sc_0x5064-table)/2)
			.short ((sc_0x5065-table)/2)
			.short ((sc_0x5066-table)/2)
			.short ((sc_0x5067-table)/2)
			.short ((sc_0x5068-table)/2)
			.short ((sc_0x5069-table)/2)
			.short ((sc_0x506A-table)/2)
			.short ((sc_0x506B-table)/2)
			.short ((sc_0x506C-table)/2)
			.short ((sc_0x506D-table)/2)
			.short ((sc_0x506E-table)/2)
			.short ((sc_0x506F-table)/2)
			.short ((sc_0x5070-table)/2)
			.short ((sc_0x5071-table)/2)
			.short ((sc_0x5072-table)/2)
			.short ((sc_0x5073-table)/2)
			.short ((sc_0x5074-table)/2)
			.short ((sc_0x5075-table)/2)
			.short ((sc_0x5076-table)/2)
			.short ((sc_0x5077-table)/2)
			.short ((sc_0x5078-table)/2)
			.short ((sc_0x5079-table)/2)
			.short ((sc_0x507A-table)/2)
			.short ((sc_0x507B-table)/2)
			.short ((sc_0x507C-table)/2)
			.short ((sc_0x507D-table)/2)
			.short ((sc_0x507E-table)/2)
			.short ((sc_0x507F-table)/2)
			.short ((sc_0x5160-table)/2)
			.short ((sc_0x5161-table)/2)
			.short ((sc_0x5162-table)/2)
			.short ((sc_0x5163-table)/2)
			.short ((sc_0x5164-table)/2)
			.short ((sc_0x5165-table)/2)
			.short ((sc_0x5166-table)/2)
			.short ((sc_0x5167-table)/2)
			.short ((sc_0x5168-table)/2)
			.short ((sc_0x5169-table)/2)
			.short ((sc_0x516A-table)/2)
			.short ((sc_0x516B-table)/2)
			.short ((sc_0x516C-table)/2)
			.short ((sc_0x516D-table)/2)
			.short ((sc_0x516E-table)/2)
			.short ((sc_0x516F-table)/2)
			.short ((sc_0x5170-table)/2)
			.short ((sc_0x5171-table)/2)
			.short ((sc_0x5172-table)/2)
			.short ((sc_0x5173-table)/2)
			.short ((sc_0x5174-table)/2)
			.short ((sc_0x5175-table)/2)
			.short ((sc_0x5176-table)/2)
			.short ((sc_0x5177-table)/2)
			.short ((sc_0x5178-table)/2)
			.short ((sc_0x5179-table)/2)
			.short ((sc_0x517A-table)/2)
			.short ((sc_0x517B-table)/2)
			.short ((sc_0x517C-table)/2)
			.short ((sc_0x517D-table)/2)
			.short ((sc_0x517E-table)/2)
			.short ((sc_0x517F-table)/2)
			.short ((sc_0x5260-table)/2)
			.short ((sc_0x5261-table)/2)
			.short ((sc_0x5262-table)/2)
			.short ((sc_0x5263-table)/2)
			.short ((sc_0x5264-table)/2)
			.short ((sc_0x5265-table)/2)
			.short ((sc_0x5266-table)/2)
			.short ((sc_0x5267-table)/2)
			.short ((sc_0x5268-table)/2)
			.short ((sc_0x5269-table)/2)
			.short ((sc_0x526A-table)/2)
			.short ((sc_0x526B-table)/2)
			.short ((sc_0x526C-table)/2)
			.short ((sc_0x526D-table)/2)
			.short ((sc_0x526E-table)/2)
			.short ((sc_0x526F-table)/2)
			.short ((sc_0x5270-table)/2)
			.short ((sc_0x5271-table)/2)
			.short ((sc_0x5272-table)/2)
			.short ((sc_0x5273-table)/2)
			.short ((sc_0x5274-table)/2)
			.short ((sc_0x5275-table)/2)
			.short ((sc_0x5276-table)/2)
			.short ((sc_0x5277-table)/2)
			.short ((sc_0x5278-table)/2)
			.short ((sc_0x5279-table)/2)
			.short ((sc_0x527A-table)/2)
			.short ((sc_0x527B-table)/2)
			.short ((sc_0x527C-table)/2)
			.short ((sc_0x527D-table)/2)
			.short ((sc_0x527E-table)/2)
			.short ((sc_0x527F-table)/2)
			.short ((sc_0x5360-table)/2)
			.short ((sc_0x5361-table)/2)
			.short ((sc_0x5362-table)/2)
			.short ((sc_0x5363-table)/2)
			.short ((sc_0x5364-table)/2)
			.short ((sc_0x5365-table)/2)
			.short ((sc_0x5366-table)/2)
			.short ((sc_0x5367-table)/2)
			.short ((sc_0x5368-table)/2)
			.short ((sc_0x5369-table)/2)
			.short ((sc_0x536A-table)/2)
			.short ((sc_0x536B-table)/2)
			.short ((sc_0x536C-table)/2)
			.short ((sc_0x536D-table)/2)
			.short ((sc_0x536E-table)/2)
			.short ((sc_0x536F-table)/2)
			.short ((sc_0x5370-table)/2)
			.short ((sc_0x5371-table)/2)
			.short ((sc_0x5372-table)/2)
			.short ((sc_0x5373-table)/2)
			.short ((sc_0x5374-table)/2)
			.short ((sc_0x5375-table)/2)
			.short ((sc_0x5376-table)/2)
			.short ((sc_0x5377-table)/2)
			.short ((sc_0x5378-table)/2)
			.short ((sc_0x5379-table)/2)
			.short ((sc_0x537A-table)/2)
			.short ((sc_0x537B-table)/2)
			.short ((sc_0x537C-table)/2)
			.short ((sc_0x537D-table)/2)
			.short ((sc_0x537E-table)/2)
			.short ((sc_0x537F-table)/2)
			.short ((sc_0x5460-table)/2)
			.short ((sc_0x5461-table)/2)
			.short ((sc_0x5462-table)/2)
			.short ((sc_0x5463-table)/2)
			.short ((sc_0x5464-table)/2)
			.short ((sc_0x5465-table)/2)
			.short ((sc_0x5466-table)/2)
			.short ((sc_0x5467-table)/2)
			.short ((sc_0x5468-table)/2)
			.short ((sc_0x5469-table)/2)
			.short ((sc_0x546A-table)/2)
			.short ((sc_0x546B-table)/2)
			.short ((sc_0x546C-table)/2)
			.short ((sc_0x546D-table)/2)
			.short ((sc_0x546E-table)/2)
			.short ((sc_0x546F-table)/2)
			.short ((sc_0x5470-table)/2)
			.short ((sc_0x5471-table)/2)
			.short ((sc_0x5472-table)/2)
			.short ((sc_0x5473-table)/2)
			.short ((sc_0x5474-table)/2)
			.short ((sc_0x5475-table)/2)
			.short ((sc_0x5476-table)/2)
			.short ((sc_0x5477-table)/2)
			.short ((sc_0x5478-table)/2)
			.short ((sc_0x5479-table)/2)
			.short ((sc_0x547A-table)/2)
			.short ((sc_0x547B-table)/2)
			.short ((sc_0x547C-table)/2)
			.short ((sc_0x547D-table)/2)
			.short ((sc_0x547E-table)/2)
			.short ((sc_0x547F-table)/2)
			.short ((sc_0x5560-table)/2)
			.short ((sc_0x5561-table)/2)
			.short ((sc_0x5562-table)/2)
			.short ((sc_0x5563-table)/2)
			.short ((sc_0x5564-table)/2)
			.short ((sc_0x5565-table)/2)
			.short ((sc_0x5566-table)/2)
			.short ((sc_0x5567-table)/2)
			.short ((sc_0x5568-table)/2)
			.short ((sc_0x5569-table)/2)
			.short ((sc_0x556A-table)/2)
			.short ((sc_0x556B-table)/2)
			.short ((sc_0x556C-table)/2)
			.short ((sc_0x556D-table)/2)
			.short ((sc_0x556E-table)/2)
			.short ((sc_0x556F-table)/2)
			.short ((sc_0x5570-table)/2)
			.short ((sc_0x5571-table)/2)
			.short ((sc_0x5572-table)/2)
			.short ((sc_0x5573-table)/2)
			.short ((sc_0x5574-table)/2)
			.short ((sc_0x5575-table)/2)
			.short ((sc_0x5576-table)/2)
			.short ((sc_0x5577-table)/2)
			.short ((sc_0x5578-table)/2)
			.short ((sc_0x5579-table)/2)
			.short ((sc_0x557A-table)/2)
			.short ((sc_0x557B-table)/2)
			.short ((sc_0x557C-table)/2)
			.short ((sc_0x557D-table)/2)
			.short ((sc_0x557E-table)/2)
			.short ((sc_0x557F-table)/2)
			.short ((sc_0x5660-table)/2)
			.short ((sc_0x5661-table)/2)
			.short ((sc_0x5662-table)/2)
			.short ((sc_0x5663-table)/2)
			.short ((sc_0x5664-table)/2)
			.short ((sc_0x5665-table)/2)
			.short ((sc_0x5666-table)/2)
			.short ((sc_0x5667-table)/2)
			.short ((sc_0x5668-table)/2)
			.short ((sc_0x5669-table)/2)
			.short ((sc_0x566A-table)/2)
			.short ((sc_0x566B-table)/2)
			.short ((sc_0x566C-table)/2)
			.short ((sc_0x566D-table)/2)
			.short ((sc_0x566E-table)/2)
			.short ((sc_0x566F-table)/2)
			.short ((sc_0x5670-table)/2)
			.short ((sc_0x5671-table)/2)
			.short ((sc_0x5672-table)/2)
			.short ((sc_0x5673-table)/2)
			.short ((sc_0x5674-table)/2)
			.short ((sc_0x5675-table)/2)
			.short ((sc_0x5676-table)/2)
			.short ((sc_0x5677-table)/2)
			.short ((sc_0x5678-table)/2)
			.short ((sc_0x5679-table)/2)
			.short ((sc_0x567A-table)/2)
			.short ((sc_0x567B-table)/2)
			.short ((sc_0x567C-table)/2)
			.short ((sc_0x567D-table)/2)
			.short ((sc_0x567E-table)/2)
			.short ((sc_0x567F-table)/2)
			.short ((sc_0x5760-table)/2)
			.short ((sc_0x5761-table)/2)
			.short ((sc_0x5762-table)/2)
			.short ((sc_0x5763-table)/2)
			.short ((sc_0x5764-table)/2)
			.short ((sc_0x5765-table)/2)
			.short ((sc_0x5766-table)/2)
			.short ((sc_0x5767-table)/2)
			.short ((sc_0x5768-table)/2)
			.short ((sc_0x5769-table)/2)
			.short ((sc_0x576A-table)/2)
			.short ((sc_0x576B-table)/2)
			.short ((sc_0x576C-table)/2)
			.short ((sc_0x576D-table)/2)
			.short ((sc_0x576E-table)/2)
			.short ((sc_0x576F-table)/2)
			.short ((sc_0x5770-table)/2)
			.short ((sc_0x5771-table)/2)
			.short ((sc_0x5772-table)/2)
			.short ((sc_0x5773-table)/2)
			.short ((sc_0x5774-table)/2)
			.short ((sc_0x5775-table)/2)
			.short ((sc_0x5776-table)/2)
			.short ((sc_0x5777-table)/2)
			.short ((sc_0x5778-table)/2)
			.short ((sc_0x5779-table)/2)
			.short ((sc_0x577A-table)/2)
			.short ((sc_0x577B-table)/2)
			.short ((sc_0x577C-table)/2)
			.short ((sc_0x577D-table)/2)
			.short ((sc_0x577E-table)/2)
			.short ((sc_0x577F-table)/2)
			.short ((sc_0x5080-table)/2)
			.short ((sc_0x5081-table)/2)
			.short ((sc_0x5082-table)/2)
			.short ((sc_0x5083-table)/2)
			.short ((sc_0x5084-table)/2)
			.short ((sc_0x5085-table)/2)
			.short ((sc_0x5086-table)/2)
			.short ((sc_0x5087-table)/2)
			.short ((sc_0x5088-table)/2)
			.short ((sc_0x5089-table)/2)
			.short ((sc_0x508A-table)/2)
			.short ((sc_0x508B-table)/2)
			.short ((sc_0x508C-table)/2)
			.short ((sc_0x508D-table)/2)
			.short ((sc_0x508E-table)/2)
			.short ((sc_0x508F-table)/2)
			.short ((sc_0x5090-table)/2)
			.short ((sc_0x5091-table)/2)
			.short ((sc_0x5092-table)/2)
			.short ((sc_0x5093-table)/2)
			.short ((sc_0x5094-table)/2)
			.short ((sc_0x5095-table)/2)
			.short ((sc_0x5096-table)/2)
			.short ((sc_0x5097-table)/2)
			.short ((sc_0x5098-table)/2)
			.short ((sc_0x5099-table)/2)
			.short ((sc_0x509A-table)/2)
			.short ((sc_0x509B-table)/2)
			.short ((sc_0x509C-table)/2)
			.short ((sc_0x509D-table)/2)
			.short ((sc_0x509E-table)/2)
			.short ((sc_0x509F-table)/2)
			.short ((sc_0x5180-table)/2)
			.short ((sc_0x5181-table)/2)
			.short ((sc_0x5182-table)/2)
			.short ((sc_0x5183-table)/2)
			.short ((sc_0x5184-table)/2)
			.short ((sc_0x5185-table)/2)
			.short ((sc_0x5186-table)/2)
			.short ((sc_0x5187-table)/2)
			.short ((sc_0x5188-table)/2)
			.short ((sc_0x5189-table)/2)
			.short ((sc_0x518A-table)/2)
			.short ((sc_0x518B-table)/2)
			.short ((sc_0x518C-table)/2)
			.short ((sc_0x518D-table)/2)
			.short ((sc_0x518E-table)/2)
			.short ((sc_0x518F-table)/2)
			.short ((sc_0x5190-table)/2)
			.short ((sc_0x5191-table)/2)
			.short ((sc_0x5192-table)/2)
			.short ((sc_0x5193-table)/2)
			.short ((sc_0x5194-table)/2)
			.short ((sc_0x5195-table)/2)
			.short ((sc_0x5196-table)/2)
			.short ((sc_0x5197-table)/2)
			.short ((sc_0x5198-table)/2)
			.short ((sc_0x5199-table)/2)
			.short ((sc_0x519A-table)/2)
			.short ((sc_0x519B-table)/2)
			.short ((sc_0x519C-table)/2)
			.short ((sc_0x519D-table)/2)
			.short ((sc_0x519E-table)/2)
			.short ((sc_0x519F-table)/2)
			.short ((sc_0x5280-table)/2)
			.short ((sc_0x5281-table)/2)
			.short ((sc_0x5282-table)/2)
			.short ((sc_0x5283-table)/2)
			.short ((sc_0x5284-table)/2)
			.short ((sc_0x5285-table)/2)
			.short ((sc_0x5286-table)/2)
			.short ((sc_0x5287-table)/2)
			.short ((sc_0x5288-table)/2)
			.short ((sc_0x5289-table)/2)
			.short ((sc_0x528A-table)/2)
			.short ((sc_0x528B-table)/2)
			.short ((sc_0x528C-table)/2)
			.short ((sc_0x528D-table)/2)
			.short ((sc_0x528E-table)/2)
			.short ((sc_0x528F-table)/2)
			.short ((sc_0x5290-table)/2)
			.short ((sc_0x5291-table)/2)
			.short ((sc_0x5292-table)/2)
			.short ((sc_0x5293-table)/2)
			.short ((sc_0x5294-table)/2)
			.short ((sc_0x5295-table)/2)
			.short ((sc_0x5296-table)/2)
			.short ((sc_0x5297-table)/2)
			.short ((sc_0x5298-table)/2)
			.short ((sc_0x5299-table)/2)
			.short ((sc_0x529A-table)/2)
			.short ((sc_0x529B-table)/2)
			.short ((sc_0x529C-table)/2)
			.short ((sc_0x529D-table)/2)
			.short ((sc_0x529E-table)/2)
			.short ((sc_0x529F-table)/2)
			.short ((sc_0x5380-table)/2)
			.short ((sc_0x5381-table)/2)
			.short ((sc_0x5382-table)/2)
			.short ((sc_0x5383-table)/2)
			.short ((sc_0x5384-table)/2)
			.short ((sc_0x5385-table)/2)
			.short ((sc_0x5386-table)/2)
			.short ((sc_0x5387-table)/2)
			.short ((sc_0x5388-table)/2)
			.short ((sc_0x5389-table)/2)
			.short ((sc_0x538A-table)/2)
			.short ((sc_0x538B-table)/2)
			.short ((sc_0x538C-table)/2)
			.short ((sc_0x538D-table)/2)
			.short ((sc_0x538E-table)/2)
			.short ((sc_0x538F-table)/2)
			.short ((sc_0x5390-table)/2)
			.short ((sc_0x5391-table)/2)
			.short ((sc_0x5392-table)/2)
			.short ((sc_0x5393-table)/2)
			.short ((sc_0x5394-table)/2)
			.short ((sc_0x5395-table)/2)
			.short ((sc_0x5396-table)/2)
			.short ((sc_0x5397-table)/2)
			.short ((sc_0x5398-table)/2)
			.short ((sc_0x5399-table)/2)
			.short ((sc_0x539A-table)/2)
			.short ((sc_0x539B-table)/2)
			.short ((sc_0x539C-table)/2)
			.short ((sc_0x539D-table)/2)
			.short ((sc_0x539E-table)/2)
			.short ((sc_0x539F-table)/2)
			.short ((sc_0x5480-table)/2)
			.short ((sc_0x5481-table)/2)
			.short ((sc_0x5482-table)/2)
			.short ((sc_0x5483-table)/2)
			.short ((sc_0x5484-table)/2)
			.short ((sc_0x5485-table)/2)
			.short ((sc_0x5486-table)/2)
			.short ((sc_0x5487-table)/2)
			.short ((sc_0x5488-table)/2)
			.short ((sc_0x5489-table)/2)
			.short ((sc_0x548A-table)/2)
			.short ((sc_0x548B-table)/2)
			.short ((sc_0x548C-table)/2)
			.short ((sc_0x548D-table)/2)
			.short ((sc_0x548E-table)/2)
			.short ((sc_0x548F-table)/2)
			.short ((sc_0x5490-table)/2)
			.short ((sc_0x5491-table)/2)
			.short ((sc_0x5492-table)/2)
			.short ((sc_0x5493-table)/2)
			.short ((sc_0x5494-table)/2)
			.short ((sc_0x5495-table)/2)
			.short ((sc_0x5496-table)/2)
			.short ((sc_0x5497-table)/2)
			.short ((sc_0x5498-table)/2)
			.short ((sc_0x5499-table)/2)
			.short ((sc_0x549A-table)/2)
			.short ((sc_0x549B-table)/2)
			.short ((sc_0x549C-table)/2)
			.short ((sc_0x549D-table)/2)
			.short ((sc_0x549E-table)/2)
			.short ((sc_0x549F-table)/2)
			.short ((sc_0x5580-table)/2)
			.short ((sc_0x5581-table)/2)
			.short ((sc_0x5582-table)/2)
			.short ((sc_0x5583-table)/2)
			.short ((sc_0x5584-table)/2)
			.short ((sc_0x5585-table)/2)
			.short ((sc_0x5586-table)/2)
			.short ((sc_0x5587-table)/2)
			.short ((sc_0x5588-table)/2)
			.short ((sc_0x5589-table)/2)
			.short ((sc_0x558A-table)/2)
			.short ((sc_0x558B-table)/2)
			.short ((sc_0x558C-table)/2)
			.short ((sc_0x558D-table)/2)
			.short ((sc_0x558E-table)/2)
			.short ((sc_0x558F-table)/2)
			.short ((sc_0x5590-table)/2)
			.short ((sc_0x5591-table)/2)
			.short ((sc_0x5592-table)/2)
			.short ((sc_0x5593-table)/2)
			.short ((sc_0x5594-table)/2)
			.short ((sc_0x5595-table)/2)
			.short ((sc_0x5596-table)/2)
			.short ((sc_0x5597-table)/2)
			.short ((sc_0x5598-table)/2)
			.short ((sc_0x5599-table)/2)
			.short ((sc_0x559A-table)/2)
			.short ((sc_0x559B-table)/2)
			.short ((sc_0x559C-table)/2)
			.short ((sc_0x559D-table)/2)
			.short ((sc_0x559E-table)/2)
			.short ((sc_0x559F-table)/2)
			.short ((sc_0x5680-table)/2)
			.short ((sc_0x5681-table)/2)
			.short ((sc_0x5682-table)/2)
			.short ((sc_0x5683-table)/2)
			.short ((sc_0x5684-table)/2)
			.short ((sc_0x5685-table)/2)
			.short ((sc_0x5686-table)/2)
			.short ((sc_0x5687-table)/2)
			.short ((sc_0x5688-table)/2)
			.short ((sc_0x5689-table)/2)
			.short ((sc_0x568A-table)/2)
			.short ((sc_0x568B-table)/2)
			.short ((sc_0x568C-table)/2)
			.short ((sc_0x568D-table)/2)
			.short ((sc_0x568E-table)/2)
			.short ((sc_0x568F-table)/2)
			.short ((sc_0x5690-table)/2)
			.short ((sc_0x5691-table)/2)
			.short ((sc_0x5692-table)/2)
			.short ((sc_0x5693-table)/2)
			.short ((sc_0x5694-table)/2)
			.short ((sc_0x5695-table)/2)
			.short ((sc_0x5696-table)/2)
			.short ((sc_0x5697-table)/2)
			.short ((sc_0x5698-table)/2)
			.short ((sc_0x5699-table)/2)
			.short ((sc_0x569A-table)/2)
			.short ((sc_0x569B-table)/2)
			.short ((sc_0x569C-table)/2)
			.short ((sc_0x569D-table)/2)
			.short ((sc_0x569E-table)/2)
			.short ((sc_0x569F-table)/2)
			.short ((sc_0x5780-table)/2)
			.short ((sc_0x5781-table)/2)
			.short ((sc_0x5782-table)/2)
			.short ((sc_0x5783-table)/2)
			.short ((sc_0x5784-table)/2)
			.short ((sc_0x5785-table)/2)
			.short ((sc_0x5786-table)/2)
			.short ((sc_0x5787-table)/2)
			.short ((sc_0x5788-table)/2)
			.short ((sc_0x5789-table)/2)
			.short ((sc_0x578A-table)/2)
			.short ((sc_0x578B-table)/2)
			.short ((sc_0x578C-table)/2)
			.short ((sc_0x578D-table)/2)
			.short ((sc_0x578E-table)/2)
			.short ((sc_0x578F-table)/2)
			.short ((sc_0x5790-table)/2)
			.short ((sc_0x5791-table)/2)
			.short ((sc_0x5792-table)/2)
			.short ((sc_0x5793-table)/2)
			.short ((sc_0x5794-table)/2)
			.short ((sc_0x5795-table)/2)
			.short ((sc_0x5796-table)/2)
			.short ((sc_0x5797-table)/2)
			.short ((sc_0x5798-table)/2)
			.short ((sc_0x5799-table)/2)
			.short ((sc_0x579A-table)/2)
			.short ((sc_0x579B-table)/2)
			.short ((sc_0x579C-table)/2)
			.short ((sc_0x579D-table)/2)
			.short ((sc_0x579E-table)/2)
			.short ((sc_0x579F-table)/2)
			.short ((sc_0x50A0-table)/2)
			.short ((sc_0x50A1-table)/2)
			.short ((sc_0x50A2-table)/2)
			.short ((sc_0x50A3-table)/2)
			.short ((sc_0x50A4-table)/2)
			.short ((sc_0x50A5-table)/2)
			.short ((sc_0x50A6-table)/2)
			.short ((sc_0x50A7-table)/2)
			.short ((sc_0x50A8-table)/2)
			.short ((sc_0x50A9-table)/2)
			.short ((sc_0x50AA-table)/2)
			.short ((sc_0x50AB-table)/2)
			.short ((sc_0x50AC-table)/2)
			.short ((sc_0x50AD-table)/2)
			.short ((sc_0x50AE-table)/2)
			.short ((sc_0x50AF-table)/2)
			.short ((sc_0x50B0-table)/2)
			.short ((sc_0x50B1-table)/2)
			.short ((sc_0x50B2-table)/2)
			.short ((sc_0x50B3-table)/2)
			.short ((sc_0x50B4-table)/2)
			.short ((sc_0x50B5-table)/2)
			.short ((sc_0x50B6-table)/2)
			.short ((sc_0x50B7-table)/2)
			.short ((sc_0x50B8-table)/2)
			.short ((sc_0x50B9-table)/2)
			.short ((sc_0x50BA-table)/2)
			.short ((sc_0x50BB-table)/2)
			.short ((sc_0x50BC-table)/2)
			.short ((sc_0x50BD-table)/2)
			.short ((sc_0x50BE-table)/2)
			.short ((sc_0x50BF-table)/2)
			.short ((sc_0x51A0-table)/2)
			.short ((sc_0x51A1-table)/2)
			.short ((sc_0x51A2-table)/2)
			.short ((sc_0x51A3-table)/2)
			.short ((sc_0x51A4-table)/2)
			.short ((sc_0x51A5-table)/2)
			.short ((sc_0x51A6-table)/2)
			.short ((sc_0x51A7-table)/2)
			.short ((sc_0x51A8-table)/2)
			.short ((sc_0x51A9-table)/2)
			.short ((sc_0x51AA-table)/2)
			.short ((sc_0x51AB-table)/2)
			.short ((sc_0x51AC-table)/2)
			.short ((sc_0x51AD-table)/2)
			.short ((sc_0x51AE-table)/2)
			.short ((sc_0x51AF-table)/2)
			.short ((sc_0x51B0-table)/2)
			.short ((sc_0x51B1-table)/2)
			.short ((sc_0x51B2-table)/2)
			.short ((sc_0x51B3-table)/2)
			.short ((sc_0x51B4-table)/2)
			.short ((sc_0x51B5-table)/2)
			.short ((sc_0x51B6-table)/2)
			.short ((sc_0x51B7-table)/2)
			.short ((sc_0x51B8-table)/2)
			.short ((sc_0x51B9-table)/2)
			.short ((sc_0x51BA-table)/2)
			.short ((sc_0x51BB-table)/2)
			.short ((sc_0x51BC-table)/2)
			.short ((sc_0x51BD-table)/2)
			.short ((sc_0x51BE-table)/2)
			.short ((sc_0x51BF-table)/2)
			.short ((sc_0x52A0-table)/2)
			.short ((sc_0x52A1-table)/2)
			.short ((sc_0x52A2-table)/2)
			.short ((sc_0x52A3-table)/2)
			.short ((sc_0x52A4-table)/2)
			.short ((sc_0x52A5-table)/2)
			.short ((sc_0x52A6-table)/2)
			.short ((sc_0x52A7-table)/2)
			.short ((sc_0x52A8-table)/2)
			.short ((sc_0x52A9-table)/2)
			.short ((sc_0x52AA-table)/2)
			.short ((sc_0x52AB-table)/2)
			.short ((sc_0x52AC-table)/2)
			.short ((sc_0x52AD-table)/2)
			.short ((sc_0x52AE-table)/2)
			.short ((sc_0x52AF-table)/2)
			.short ((sc_0x52B0-table)/2)
			.short ((sc_0x52B1-table)/2)
			.short ((sc_0x52B2-table)/2)
			.short ((sc_0x52B3-table)/2)
			.short ((sc_0x52B4-table)/2)
			.short ((sc_0x52B5-table)/2)
			.short ((sc_0x52B6-table)/2)
			.short ((sc_0x52B7-table)/2)
			.short ((sc_0x52B8-table)/2)
			.short ((sc_0x52B9-table)/2)
			.short ((sc_0x52BA-table)/2)
			.short ((sc_0x52BB-table)/2)
			.short ((sc_0x52BC-table)/2)
			.short ((sc_0x52BD-table)/2)
			.short ((sc_0x52BE-table)/2)
			.short ((sc_0x52BF-table)/2)
			.short ((sc_0x53A0-table)/2)
			.short ((sc_0x53A1-table)/2)
			.short ((sc_0x53A2-table)/2)
			.short ((sc_0x53A3-table)/2)
			.short ((sc_0x53A4-table)/2)
			.short ((sc_0x53A5-table)/2)
			.short ((sc_0x53A6-table)/2)
			.short ((sc_0x53A7-table)/2)
			.short ((sc_0x53A8-table)/2)
			.short ((sc_0x53A9-table)/2)
			.short ((sc_0x53AA-table)/2)
			.short ((sc_0x53AB-table)/2)
			.short ((sc_0x53AC-table)/2)
			.short ((sc_0x53AD-table)/2)
			.short ((sc_0x53AE-table)/2)
			.short ((sc_0x53AF-table)/2)
			.short ((sc_0x53B0-table)/2)
			.short ((sc_0x53B1-table)/2)
			.short ((sc_0x53B2-table)/2)
			.short ((sc_0x53B3-table)/2)
			.short ((sc_0x53B4-table)/2)
			.short ((sc_0x53B5-table)/2)
			.short ((sc_0x53B6-table)/2)
			.short ((sc_0x53B7-table)/2)
			.short ((sc_0x53B8-table)/2)
			.short ((sc_0x53B9-table)/2)
			.short ((sc_0x53BA-table)/2)
			.short ((sc_0x53BB-table)/2)
			.short ((sc_0x53BC-table)/2)
			.short ((sc_0x53BD-table)/2)
			.short ((sc_0x53BE-table)/2)
			.short ((sc_0x53BF-table)/2)
			.short ((sc_0x54A0-table)/2)
			.short ((sc_0x54A1-table)/2)
			.short ((sc_0x54A2-table)/2)
			.short ((sc_0x54A3-table)/2)
			.short ((sc_0x54A4-table)/2)
			.short ((sc_0x54A5-table)/2)
			.short ((sc_0x54A6-table)/2)
			.short ((sc_0x54A7-table)/2)
			.short ((sc_0x54A8-table)/2)
			.short ((sc_0x54A9-table)/2)
			.short ((sc_0x54AA-table)/2)
			.short ((sc_0x54AB-table)/2)
			.short ((sc_0x54AC-table)/2)
			.short ((sc_0x54AD-table)/2)
			.short ((sc_0x54AE-table)/2)
			.short ((sc_0x54AF-table)/2)
			.short ((sc_0x54B0-table)/2)
			.short ((sc_0x54B1-table)/2)
			.short ((sc_0x54B2-table)/2)
			.short ((sc_0x54B3-table)/2)
			.short ((sc_0x54B4-table)/2)
			.short ((sc_0x54B5-table)/2)
			.short ((sc_0x54B6-table)/2)
			.short ((sc_0x54B7-table)/2)
			.short ((sc_0x54B8-table)/2)
			.short ((sc_0x54B9-table)/2)
			.short ((sc_0x54BA-table)/2)
			.short ((sc_0x54BB-table)/2)
			.short ((sc_0x54BC-table)/2)
			.short ((sc_0x54BD-table)/2)
			.short ((sc_0x54BE-table)/2)
			.short ((sc_0x54BF-table)/2)
			.short ((sc_0x55A0-table)/2)
			.short ((sc_0x55A1-table)/2)
			.short ((sc_0x55A2-table)/2)
			.short ((sc_0x55A3-table)/2)
			.short ((sc_0x55A4-table)/2)
			.short ((sc_0x55A5-table)/2)
			.short ((sc_0x55A6-table)/2)
			.short ((sc_0x55A7-table)/2)
			.short ((sc_0x55A8-table)/2)
			.short ((sc_0x55A9-table)/2)
			.short ((sc_0x55AA-table)/2)
			.short ((sc_0x55AB-table)/2)
			.short ((sc_0x55AC-table)/2)
			.short ((sc_0x55AD-table)/2)
			.short ((sc_0x55AE-table)/2)
			.short ((sc_0x55AF-table)/2)
			.short ((sc_0x55B0-table)/2)
			.short ((sc_0x55B1-table)/2)
			.short ((sc_0x55B2-table)/2)
			.short ((sc_0x55B3-table)/2)
			.short ((sc_0x55B4-table)/2)
			.short ((sc_0x55B5-table)/2)
			.short ((sc_0x55B6-table)/2)
			.short ((sc_0x55B7-table)/2)
			.short ((sc_0x55B8-table)/2)
			.short ((sc_0x55B9-table)/2)
			.short ((sc_0x55BA-table)/2)
			.short ((sc_0x55BB-table)/2)
			.short ((sc_0x55BC-table)/2)
			.short ((sc_0x55BD-table)/2)
			.short ((sc_0x55BE-table)/2)
			.short ((sc_0x55BF-table)/2)
			.short ((sc_0x56A0-table)/2)
			.short ((sc_0x56A1-table)/2)
			.short ((sc_0x56A2-table)/2)
			.short ((sc_0x56A3-table)/2)
			.short ((sc_0x56A4-table)/2)
			.short ((sc_0x56A5-table)/2)
			.short ((sc_0x56A6-table)/2)
			.short ((sc_0x56A7-table)/2)
			.short ((sc_0x56A8-table)/2)
			.short ((sc_0x56A9-table)/2)
			.short ((sc_0x56AA-table)/2)
			.short ((sc_0x56AB-table)/2)
			.short ((sc_0x56AC-table)/2)
			.short ((sc_0x56AD-table)/2)
			.short ((sc_0x56AE-table)/2)
			.short ((sc_0x56AF-table)/2)
			.short ((sc_0x56B0-table)/2)
			.short ((sc_0x56B1-table)/2)
			.short ((sc_0x56B2-table)/2)
			.short ((sc_0x56B3-table)/2)
			.short ((sc_0x56B4-table)/2)
			.short ((sc_0x56B5-table)/2)
			.short ((sc_0x56B6-table)/2)
			.short ((sc_0x56B7-table)/2)
			.short ((sc_0x56B8-table)/2)
			.short ((sc_0x56B9-table)/2)
			.short ((sc_0x56BA-table)/2)
			.short ((sc_0x56BB-table)/2)
			.short ((sc_0x56BC-table)/2)
			.short ((sc_0x56BD-table)/2)
			.short ((sc_0x56BE-table)/2)
			.short ((sc_0x56BF-table)/2)
			.short ((sc_0x57A0-table)/2)
			.short ((sc_0x57A1-table)/2)
			.short ((sc_0x57A2-table)/2)
			.short ((sc_0x57A3-table)/2)
			.short ((sc_0x57A4-table)/2)
			.short ((sc_0x57A5-table)/2)
			.short ((sc_0x57A6-table)/2)
			.short ((sc_0x57A7-table)/2)
			.short ((sc_0x57A8-table)/2)
			.short ((sc_0x57A9-table)/2)
			.short ((sc_0x57AA-table)/2)
			.short ((sc_0x57AB-table)/2)
			.short ((sc_0x57AC-table)/2)
			.short ((sc_0x57AD-table)/2)
			.short ((sc_0x57AE-table)/2)
			.short ((sc_0x57AF-table)/2)
			.short ((sc_0x57B0-table)/2)
			.short ((sc_0x57B1-table)/2)
			.short ((sc_0x57B2-table)/2)
			.short ((sc_0x57B3-table)/2)
			.short ((sc_0x57B4-table)/2)
			.short ((sc_0x57B5-table)/2)
			.short ((sc_0x57B6-table)/2)
			.short ((sc_0x57B7-table)/2)
			.short ((sc_0x57B8-table)/2)
			.short ((sc_0x57B9-table)/2)
			.short ((sc_0x57BA-table)/2)
			.short ((sc_0x57BB-table)/2)
			.short ((sc_0x57BC-table)/2)
			.short ((sc_0x57BD-table)/2)
			.short ((sc_0x57BE-table)/2)
			.short ((sc_0x57BF-table)/2)
			.short ((sc_0x50C0-table)/2)
			.short ((sc_0x50C1-table)/2)
			.short ((sc_0x50C2-table)/2)
			.short ((sc_0x50C3-table)/2)
			.short ((sc_0x50C4-table)/2)
			.short ((sc_0x50C5-table)/2)
			.short ((sc_0x50C6-table)/2)
			.short ((sc_0x50C7-table)/2)
			.short ((sc_0x50C8-table)/2)
			.short ((sc_0x50C9-table)/2)
			.short ((sc_0x50CA-table)/2)
			.short ((sc_0x50CB-table)/2)
			.short ((sc_0x50CC-table)/2)
			.short ((sc_0x50CD-table)/2)
			.short ((sc_0x50CE-table)/2)
			.short ((sc_0x50CF-table)/2)
			.short ((sc_0x50D0-table)/2)
			.short ((sc_0x50D1-table)/2)
			.short ((sc_0x50D2-table)/2)
			.short ((sc_0x50D3-table)/2)
			.short ((sc_0x50D4-table)/2)
			.short ((sc_0x50D5-table)/2)
			.short ((sc_0x50D6-table)/2)
			.short ((sc_0x50D7-table)/2)
			.short ((sc_0x50D8-table)/2)
			.short ((sc_0x50D9-table)/2)
			.short ((sc_0x50DA-table)/2)
			.short ((sc_0x50DB-table)/2)
			.short ((sc_0x50DC-table)/2)
			.short ((sc_0x50DD-table)/2)
			.short ((sc_0x50DE-table)/2)
			.short ((sc_0x50DF-table)/2)
			.short ((sc_0x51C0-table)/2)
			.short ((sc_0x51C1-table)/2)
			.short ((sc_0x51C2-table)/2)
			.short ((sc_0x51C3-table)/2)
			.short ((sc_0x51C4-table)/2)
			.short ((sc_0x51C5-table)/2)
			.short ((sc_0x51C6-table)/2)
			.short ((sc_0x51C7-table)/2)
			.short ((sc_0x51C8-table)/2)
			.short ((sc_0x51C9-table)/2)
			.short ((sc_0x51CA-table)/2)
			.short ((sc_0x51CB-table)/2)
			.short ((sc_0x51CC-table)/2)
			.short ((sc_0x51CD-table)/2)
			.short ((sc_0x51CE-table)/2)
			.short ((sc_0x51CF-table)/2)
			.short ((sc_0x51D0-table)/2)
			.short ((sc_0x51D1-table)/2)
			.short ((sc_0x51D2-table)/2)
			.short ((sc_0x51D3-table)/2)
			.short ((sc_0x51D4-table)/2)
			.short ((sc_0x51D5-table)/2)
			.short ((sc_0x51D6-table)/2)
			.short ((sc_0x51D7-table)/2)
			.short ((sc_0x51D8-table)/2)
			.short ((sc_0x51D9-table)/2)
			.short ((sc_0x51DA-table)/2)
			.short ((sc_0x51DB-table)/2)
			.short ((sc_0x51DC-table)/2)
			.short ((sc_0x51DD-table)/2)
			.short ((sc_0x51DE-table)/2)
			.short ((sc_0x51DF-table)/2)
			.short ((sc_0x52C0-table)/2)
			.short ((sc_0x52C1-table)/2)
			.short ((sc_0x52C2-table)/2)
			.short ((sc_0x52C3-table)/2)
			.short ((sc_0x52C4-table)/2)
			.short ((sc_0x52C5-table)/2)
			.short ((sc_0x52C6-table)/2)
			.short ((sc_0x52C7-table)/2)
			.short ((sc_0x52C8-table)/2)
			.short ((sc_0x52C9-table)/2)
			.short ((sc_0x52CA-table)/2)
			.short ((sc_0x52CB-table)/2)
			.short ((sc_0x52CC-table)/2)
			.short ((sc_0x52CD-table)/2)
			.short ((sc_0x52CE-table)/2)
			.short ((sc_0x52CF-table)/2)
			.short ((sc_0x52D0-table)/2)
			.short ((sc_0x52D1-table)/2)
			.short ((sc_0x52D2-table)/2)
			.short ((sc_0x52D3-table)/2)
			.short ((sc_0x52D4-table)/2)
			.short ((sc_0x52D5-table)/2)
			.short ((sc_0x52D6-table)/2)
			.short ((sc_0x52D7-table)/2)
			.short ((sc_0x52D8-table)/2)
			.short ((sc_0x52D9-table)/2)
			.short ((sc_0x52DA-table)/2)
			.short ((sc_0x52DB-table)/2)
			.short ((sc_0x52DC-table)/2)
			.short ((sc_0x52DD-table)/2)
			.short ((sc_0x52DE-table)/2)
			.short ((sc_0x52DF-table)/2)
			.short ((sc_0x53C0-table)/2)
			.short ((sc_0x53C1-table)/2)
			.short ((sc_0x53C2-table)/2)
			.short ((sc_0x53C3-table)/2)
			.short ((sc_0x53C4-table)/2)
			.short ((sc_0x53C5-table)/2)
			.short ((sc_0x53C6-table)/2)
			.short ((sc_0x53C7-table)/2)
			.short ((sc_0x53C8-table)/2)
			.short ((sc_0x53C9-table)/2)
			.short ((sc_0x53CA-table)/2)
			.short ((sc_0x53CB-table)/2)
			.short ((sc_0x53CC-table)/2)
			.short ((sc_0x53CD-table)/2)
			.short ((sc_0x53CE-table)/2)
			.short ((sc_0x53CF-table)/2)
			.short ((sc_0x53D0-table)/2)
			.short ((sc_0x53D1-table)/2)
			.short ((sc_0x53D2-table)/2)
			.short ((sc_0x53D3-table)/2)
			.short ((sc_0x53D4-table)/2)
			.short ((sc_0x53D5-table)/2)
			.short ((sc_0x53D6-table)/2)
			.short ((sc_0x53D7-table)/2)
			.short ((sc_0x53D8-table)/2)
			.short ((sc_0x53D9-table)/2)
			.short ((sc_0x53DA-table)/2)
			.short ((sc_0x53DB-table)/2)
			.short ((sc_0x53DC-table)/2)
			.short ((sc_0x53DD-table)/2)
			.short ((sc_0x53DE-table)/2)
			.short ((sc_0x53DF-table)/2)
			.short ((sc_0x54C0-table)/2)
			.short ((sc_0x54C1-table)/2)
			.short ((sc_0x54C2-table)/2)
			.short ((sc_0x54C3-table)/2)
			.short ((sc_0x54C4-table)/2)
			.short ((sc_0x54C5-table)/2)
			.short ((sc_0x54C6-table)/2)
			.short ((sc_0x54C7-table)/2)
			.short ((sc_0x54C8-table)/2)
			.short ((sc_0x54C9-table)/2)
			.short ((sc_0x54CA-table)/2)
			.short ((sc_0x54CB-table)/2)
			.short ((sc_0x54CC-table)/2)
			.short ((sc_0x54CD-table)/2)
			.short ((sc_0x54CE-table)/2)
			.short ((sc_0x54CF-table)/2)
			.short ((sc_0x54D0-table)/2)
			.short ((sc_0x54D1-table)/2)
			.short ((sc_0x54D2-table)/2)
			.short ((sc_0x54D3-table)/2)
			.short ((sc_0x54D4-table)/2)
			.short ((sc_0x54D5-table)/2)
			.short ((sc_0x54D6-table)/2)
			.short ((sc_0x54D7-table)/2)
			.short ((sc_0x54D8-table)/2)
			.short ((sc_0x54D9-table)/2)
			.short ((sc_0x54DA-table)/2)
			.short ((sc_0x54DB-table)/2)
			.short ((sc_0x54DC-table)/2)
			.short ((sc_0x54DD-table)/2)
			.short ((sc_0x54DE-table)/2)
			.short ((sc_0x54DF-table)/2)
			.short ((sc_0x55C0-table)/2)
			.short ((sc_0x55C1-table)/2)
			.short ((sc_0x55C2-table)/2)
			.short ((sc_0x55C3-table)/2)
			.short ((sc_0x55C4-table)/2)
			.short ((sc_0x55C5-table)/2)
			.short ((sc_0x55C6-table)/2)
			.short ((sc_0x55C7-table)/2)
			.short ((sc_0x55C8-table)/2)
			.short ((sc_0x55C9-table)/2)
			.short ((sc_0x55CA-table)/2)
			.short ((sc_0x55CB-table)/2)
			.short ((sc_0x55CC-table)/2)
			.short ((sc_0x55CD-table)/2)
			.short ((sc_0x55CE-table)/2)
			.short ((sc_0x55CF-table)/2)
			.short ((sc_0x55D0-table)/2)
			.short ((sc_0x55D1-table)/2)
			.short ((sc_0x55D2-table)/2)
			.short ((sc_0x55D3-table)/2)
			.short ((sc_0x55D4-table)/2)
			.short ((sc_0x55D5-table)/2)
			.short ((sc_0x55D6-table)/2)
			.short ((sc_0x55D7-table)/2)
			.short ((sc_0x55D8-table)/2)
			.short ((sc_0x55D9-table)/2)
			.short ((sc_0x55DA-table)/2)
			.short ((sc_0x55DB-table)/2)
			.short ((sc_0x55DC-table)/2)
			.short ((sc_0x55DD-table)/2)
			.short ((sc_0x55DE-table)/2)
			.short ((sc_0x55DF-table)/2)
			.short ((sc_0x56C0-table)/2)
			.short ((sc_0x56C1-table)/2)
			.short ((sc_0x56C2-table)/2)
			.short ((sc_0x56C3-table)/2)
			.short ((sc_0x56C4-table)/2)
			.short ((sc_0x56C5-table)/2)
			.short ((sc_0x56C6-table)/2)
			.short ((sc_0x56C7-table)/2)
			.short ((sc_0x56C8-table)/2)
			.short ((sc_0x56C9-table)/2)
			.short ((sc_0x56CA-table)/2)
			.short ((sc_0x56CB-table)/2)
			.short ((sc_0x56CC-table)/2)
			.short ((sc_0x56CD-table)/2)
			.short ((sc_0x56CE-table)/2)
			.short ((sc_0x56CF-table)/2)
			.short ((sc_0x56D0-table)/2)
			.short ((sc_0x56D1-table)/2)
			.short ((sc_0x56D2-table)/2)
			.short ((sc_0x56D3-table)/2)
			.short ((sc_0x56D4-table)/2)
			.short ((sc_0x56D5-table)/2)
			.short ((sc_0x56D6-table)/2)
			.short ((sc_0x56D7-table)/2)
			.short ((sc_0x56D8-table)/2)
			.short ((sc_0x56D9-table)/2)
			.short ((sc_0x56DA-table)/2)
			.short ((sc_0x56DB-table)/2)
			.short ((sc_0x56DC-table)/2)
			.short ((sc_0x56DD-table)/2)
			.short ((sc_0x56DE-table)/2)
			.short ((sc_0x56DF-table)/2)
			.short ((sc_0x57C0-table)/2)
			.short ((sc_0x57C1-table)/2)
			.short ((sc_0x57C2-table)/2)
			.short ((sc_0x57C3-table)/2)
			.short ((sc_0x57C4-table)/2)
			.short ((sc_0x57C5-table)/2)
			.short ((sc_0x57C6-table)/2)
			.short ((sc_0x57C7-table)/2)
			.short ((sc_0x57C8-table)/2)
			.short ((sc_0x57C9-table)/2)
			.short ((sc_0x57CA-table)/2)
			.short ((sc_0x57CB-table)/2)
			.short ((sc_0x57CC-table)/2)
			.short ((sc_0x57CD-table)/2)
			.short ((sc_0x57CE-table)/2)
			.short ((sc_0x57CF-table)/2)
			.short ((sc_0x57D0-table)/2)
			.short ((sc_0x57D1-table)/2)
			.short ((sc_0x57D2-table)/2)
			.short ((sc_0x57D3-table)/2)
			.short ((sc_0x57D4-table)/2)
			.short ((sc_0x57D5-table)/2)
			.short ((sc_0x57D6-table)/2)
			.short ((sc_0x57D7-table)/2)
			.short ((sc_0x57D8-table)/2)
			.short ((sc_0x57D9-table)/2)
			.short ((sc_0x57DA-table)/2)
			.short ((sc_0x57DB-table)/2)
			.short ((sc_0x57DC-table)/2)
			.short ((sc_0x57DD-table)/2)
			.short ((sc_0x57DE-table)/2)
			.short ((sc_0x57DF-table)/2)
			.short ((sc_0x50E0-table)/2)
			.short ((sc_0x50E1-table)/2)
			.short ((sc_0x50E2-table)/2)
			.short ((sc_0x50E3-table)/2)
			.short ((sc_0x50E4-table)/2)
			.short ((sc_0x50E5-table)/2)
			.short ((sc_0x50E6-table)/2)
			.short ((sc_0x50E7-table)/2)
			.short ((sc_0x50E8-table)/2)
			.short ((sc_0x50E9-table)/2)
			.short ((sc_0x50EA-table)/2)
			.short ((sc_0x50EB-table)/2)
			.short ((sc_0x50EC-table)/2)
			.short ((sc_0x50ED-table)/2)
			.short ((sc_0x50EE-table)/2)
			.short ((sc_0x50EF-table)/2)
			.short ((sc_0x50F0-table)/2)
			.short ((sc_0x50F1-table)/2)
			.short ((sc_0x50F2-table)/2)
			.short ((sc_0x50F3-table)/2)
			.short ((sc_0x50F4-table)/2)
			.short ((sc_0x50F5-table)/2)
			.short ((sc_0x50F6-table)/2)
			.short ((sc_0x50F7-table)/2)
			.short ((sc_0x50F8-table)/2)
			.short ((sc_0x50F9-table)/2)
			.short ((sc_0x50FA-table)/2)
			.short ((sc_0x50FB-table)/2)
			.short ((sc_0x50FC-table)/2)
			.short ((sc_0x50FD-table)/2)
			.short ((sc_0x50FE-table)/2)
			.short ((sc_0x50FF-table)/2)
			.short ((sc_0x51E0-table)/2)
			.short ((sc_0x51E1-table)/2)
			.short ((sc_0x51E2-table)/2)
			.short ((sc_0x51E3-table)/2)
			.short ((sc_0x51E4-table)/2)
			.short ((sc_0x51E5-table)/2)
			.short ((sc_0x51E6-table)/2)
			.short ((sc_0x51E7-table)/2)
			.short ((sc_0x51E8-table)/2)
			.short ((sc_0x51E9-table)/2)
			.short ((sc_0x51EA-table)/2)
			.short ((sc_0x51EB-table)/2)
			.short ((sc_0x51EC-table)/2)
			.short ((sc_0x51ED-table)/2)
			.short ((sc_0x51EE-table)/2)
			.short ((sc_0x51EF-table)/2)
			.short ((sc_0x51F0-table)/2)
			.short ((sc_0x51F1-table)/2)
			.short ((sc_0x51F2-table)/2)
			.short ((sc_0x51F3-table)/2)
			.short ((sc_0x51F4-table)/2)
			.short ((sc_0x51F5-table)/2)
			.short ((sc_0x51F6-table)/2)
			.short ((sc_0x51F7-table)/2)
			.short ((sc_0x51F8-table)/2)
			.short ((sc_0x51F9-table)/2)
			.short ((sc_0x51FA-table)/2)
			.short ((sc_0x51FB-table)/2)
			.short ((sc_0x51FC-table)/2)
			.short ((sc_0x51FD-table)/2)
			.short ((sc_0x51FE-table)/2)
			.short ((sc_0x51FF-table)/2)
			.short ((sc_0x52E0-table)/2)
			.short ((sc_0x52E1-table)/2)
			.short ((sc_0x52E2-table)/2)
			.short ((sc_0x52E3-table)/2)
			.short ((sc_0x52E4-table)/2)
			.short ((sc_0x52E5-table)/2)
			.short ((sc_0x52E6-table)/2)
			.short ((sc_0x52E7-table)/2)
			.short ((sc_0x52E8-table)/2)
			.short ((sc_0x52E9-table)/2)
			.short ((sc_0x52EA-table)/2)
			.short ((sc_0x52EB-table)/2)
			.short ((sc_0x52EC-table)/2)
			.short ((sc_0x52ED-table)/2)
			.short ((sc_0x52EE-table)/2)
			.short ((sc_0x52EF-table)/2)
			.short ((sc_0x52F0-table)/2)
			.short ((sc_0x52F1-table)/2)
			.short ((sc_0x52F2-table)/2)
			.short ((sc_0x52F3-table)/2)
			.short ((sc_0x52F4-table)/2)
			.short ((sc_0x52F5-table)/2)
			.short ((sc_0x52F6-table)/2)
			.short ((sc_0x52F7-table)/2)
			.short ((sc_0x52F8-table)/2)
			.short ((sc_0x52F9-table)/2)
			.short ((sc_0x52FA-table)/2)
			.short ((sc_0x52FB-table)/2)
			.short ((sc_0x52FC-table)/2)
			.short ((sc_0x52FD-table)/2)
			.short ((sc_0x52FE-table)/2)
			.short ((sc_0x52FF-table)/2)
			.short ((sc_0x53E0-table)/2)
			.short ((sc_0x53E1-table)/2)
			.short ((sc_0x53E2-table)/2)
			.short ((sc_0x53E3-table)/2)
			.short ((sc_0x53E4-table)/2)
			.short ((sc_0x53E5-table)/2)
			.short ((sc_0x53E6-table)/2)
			.short ((sc_0x53E7-table)/2)
			.short ((sc_0x53E8-table)/2)
			.short ((sc_0x53E9-table)/2)
			.short ((sc_0x53EA-table)/2)
			.short ((sc_0x53EB-table)/2)
			.short ((sc_0x53EC-table)/2)
			.short ((sc_0x53ED-table)/2)
			.short ((sc_0x53EE-table)/2)
			.short ((sc_0x53EF-table)/2)
			.short ((sc_0x53F0-table)/2)
			.short ((sc_0x53F1-table)/2)
			.short ((sc_0x53F2-table)/2)
			.short ((sc_0x53F3-table)/2)
			.short ((sc_0x53F4-table)/2)
			.short ((sc_0x53F5-table)/2)
			.short ((sc_0x53F6-table)/2)
			.short ((sc_0x53F7-table)/2)
			.short ((sc_0x53F8-table)/2)
			.short ((sc_0x53F9-table)/2)
			.short ((sc_0x53FA-table)/2)
			.short ((sc_0x53FB-table)/2)
			.short ((sc_0x53FC-table)/2)
			.short ((sc_0x53FD-table)/2)
			.short ((sc_0x53FE-table)/2)
			.short ((sc_0x53FF-table)/2)
			.short ((sc_0x54E0-table)/2)
			.short ((sc_0x54E1-table)/2)
			.short ((sc_0x54E2-table)/2)
			.short ((sc_0x54E3-table)/2)
			.short ((sc_0x54E4-table)/2)
			.short ((sc_0x54E5-table)/2)
			.short ((sc_0x54E6-table)/2)
			.short ((sc_0x54E7-table)/2)
			.short ((sc_0x54E8-table)/2)
			.short ((sc_0x54E9-table)/2)
			.short ((sc_0x54EA-table)/2)
			.short ((sc_0x54EB-table)/2)
			.short ((sc_0x54EC-table)/2)
			.short ((sc_0x54ED-table)/2)
			.short ((sc_0x54EE-table)/2)
			.short ((sc_0x54EF-table)/2)
			.short ((sc_0x54F0-table)/2)
			.short ((sc_0x54F1-table)/2)
			.short ((sc_0x54F2-table)/2)
			.short ((sc_0x54F3-table)/2)
			.short ((sc_0x54F4-table)/2)
			.short ((sc_0x54F5-table)/2)
			.short ((sc_0x54F6-table)/2)
			.short ((sc_0x54F7-table)/2)
			.short ((sc_0x54F8-table)/2)
			.short ((sc_0x54F9-table)/2)
			.short ((sc_0x54FA-table)/2)
			.short ((sc_0x54FB-table)/2)
			.short ((sc_0x54FC-table)/2)
			.short ((sc_0x54FD-table)/2)
			.short ((sc_0x54FE-table)/2)
			.short ((sc_0x54FF-table)/2)
			.short ((sc_0x55E0-table)/2)
			.short ((sc_0x55E1-table)/2)
			.short ((sc_0x55E2-table)/2)
			.short ((sc_0x55E3-table)/2)
			.short ((sc_0x55E4-table)/2)
			.short ((sc_0x55E5-table)/2)
			.short ((sc_0x55E6-table)/2)
			.short ((sc_0x55E7-table)/2)
			.short ((sc_0x55E8-table)/2)
			.short ((sc_0x55E9-table)/2)
			.short ((sc_0x55EA-table)/2)
			.short ((sc_0x55EB-table)/2)
			.short ((sc_0x55EC-table)/2)
			.short ((sc_0x55ED-table)/2)
			.short ((sc_0x55EE-table)/2)
			.short ((sc_0x55EF-table)/2)
			.short ((sc_0x55F0-table)/2)
			.short ((sc_0x55F1-table)/2)
			.short ((sc_0x55F2-table)/2)
			.short ((sc_0x55F3-table)/2)
			.short ((sc_0x55F4-table)/2)
			.short ((sc_0x55F5-table)/2)
			.short ((sc_0x55F6-table)/2)
			.short ((sc_0x55F7-table)/2)
			.short ((sc_0x55F8-table)/2)
			.short ((sc_0x55F9-table)/2)
			.short ((sc_0x55FA-table)/2)
			.short ((sc_0x55FB-table)/2)
			.short ((sc_0x55FC-table)/2)
			.short ((sc_0x55FD-table)/2)
			.short ((sc_0x55FE-table)/2)
			.short ((sc_0x55FF-table)/2)
			.short ((sc_0x56E0-table)/2)
			.short ((sc_0x56E1-table)/2)
			.short ((sc_0x56E2-table)/2)
			.short ((sc_0x56E3-table)/2)
			.short ((sc_0x56E4-table)/2)
			.short ((sc_0x56E5-table)/2)
			.short ((sc_0x56E6-table)/2)
			.short ((sc_0x56E7-table)/2)
			.short ((sc_0x56E8-table)/2)
			.short ((sc_0x56E9-table)/2)
			.short ((sc_0x56EA-table)/2)
			.short ((sc_0x56EB-table)/2)
			.short ((sc_0x56EC-table)/2)
			.short ((sc_0x56ED-table)/2)
			.short ((sc_0x56EE-table)/2)
			.short ((sc_0x56EF-table)/2)
			.short ((sc_0x56F0-table)/2)
			.short ((sc_0x56F1-table)/2)
			.short ((sc_0x56F2-table)/2)
			.short ((sc_0x56F3-table)/2)
			.short ((sc_0x56F4-table)/2)
			.short ((sc_0x56F5-table)/2)
			.short ((sc_0x56F6-table)/2)
			.short ((sc_0x56F7-table)/2)
			.short ((sc_0x56F8-table)/2)
			.short ((sc_0x56F9-table)/2)
			.short ((sc_0x56FA-table)/2)
			.short ((sc_0x56FB-table)/2)
			.short ((sc_0x56FC-table)/2)
			.short ((sc_0x56FD-table)/2)
			.short ((sc_0x56FE-table)/2)
			.short ((sc_0x56FF-table)/2)
			.short ((sc_0x57E0-table)/2)
			.short ((sc_0x57E1-table)/2)
			.short ((sc_0x57E2-table)/2)
			.short ((sc_0x57E3-table)/2)
			.short ((sc_0x57E4-table)/2)
			.short ((sc_0x57E5-table)/2)
			.short ((sc_0x57E6-table)/2)
			.short ((sc_0x57E7-table)/2)
			.short ((sc_0x57E8-table)/2)
			.short ((sc_0x57E9-table)/2)
			.short ((sc_0x57EA-table)/2)
			.short ((sc_0x57EB-table)/2)
			.short ((sc_0x57EC-table)/2)
			.short ((sc_0x57ED-table)/2)
			.short ((sc_0x57EE-table)/2)
			.short ((sc_0x57EF-table)/2)
			.short ((sc_0x57F0-table)/2)
			.short ((sc_0x57F1-table)/2)
			.short ((sc_0x57F2-table)/2)
			.short ((sc_0x57F3-table)/2)
			.short ((sc_0x57F4-table)/2)
			.short ((sc_0x57F5-table)/2)
			.short ((sc_0x57F6-table)/2)
			.short ((sc_0x57F7-table)/2)
			.short ((sc_0x57F8-table)/2)
			.short ((sc_0x57F9-table)/2)
			.short ((sc_0x57FA-table)/2)
			.short ((sc_0x57FB-table)/2)
			.short ((sc_0x57FC-table)/2)
			.short ((sc_0x57FD-table)/2)
			.short ((sc_0x57FE-table)/2)
			.short ((sc_0x57FF-table)/2)

sc_0x4000:
			mov r1, #0x4000
			mov r2, #0x5800
			b sc_out
sc_0x4001:
			mov r1, #0x4001
			mov r2, #0x5801
			b sc_out
sc_0x4002:
			mov r1, #0x4002
			mov r2, #0x5802
			b sc_out
sc_0x4003:
			mov r1, #0x4003
			mov r2, #0x5803
			b sc_out
sc_0x4004:
			mov r1, #0x4004
			mov r2, #0x5804
			b sc_out
sc_0x4005:
			mov r1, #0x4005
			mov r2, #0x5805
			b sc_out
sc_0x4006:
			mov r1, #0x4006
			mov r2, #0x5806
			b sc_out
sc_0x4007:
			mov r1, #0x4007
			mov r2, #0x5807
			b sc_out
sc_0x4008:
			mov r1, #0x4008
			mov r2, #0x5808
			b sc_out
sc_0x4009:
			mov r1, #0x4009
			mov r2, #0x5809
			b sc_out
sc_0x400A:
			mov r1, #0x400A
			mov r2, #0x580A
			b sc_out
sc_0x400B:
			mov r1, #0x400B
			mov r2, #0x580B
			b sc_out
sc_0x400C:
			mov r1, #0x400C
			mov r2, #0x580C
			b sc_out
sc_0x400D:
			mov r1, #0x400D
			mov r2, #0x580D
			b sc_out
sc_0x400E:
			mov r1, #0x400E
			mov r2, #0x580E
			b sc_out
sc_0x400F:
			mov r1, #0x400F
			mov r2, #0x580F
			b sc_out
sc_0x4010:
			mov r1, #0x4010
			mov r2, #0x5810
			b sc_out
sc_0x4011:
			mov r1, #0x4011
			mov r2, #0x5811
			b sc_out
sc_0x4012:
			mov r1, #0x4012
			mov r2, #0x5812
			b sc_out
sc_0x4013:
			mov r1, #0x4013
			mov r2, #0x5813
			b sc_out
sc_0x4014:
			mov r1, #0x4014
			mov r2, #0x5814
			b sc_out
sc_0x4015:
			mov r1, #0x4015
			mov r2, #0x5815
			b sc_out
sc_0x4016:
			mov r1, #0x4016
			mov r2, #0x5816
			b sc_out
sc_0x4017:
			mov r1, #0x4017
			mov r2, #0x5817
			b sc_out
sc_0x4018:
			mov r1, #0x4018
			mov r2, #0x5818
			b sc_out
sc_0x4019:
			mov r1, #0x4019
			mov r2, #0x5819
			b sc_out
sc_0x401A:
			mov r1, #0x401A
			mov r2, #0x581A
			b sc_out
sc_0x401B:
			mov r1, #0x401B
			mov r2, #0x581B
			b sc_out
sc_0x401C:
			mov r1, #0x401C
			mov r2, #0x581C
			b sc_out
sc_0x401D:
			mov r1, #0x401D
			mov r2, #0x581D
			b sc_out
sc_0x401E:
			mov r1, #0x401E
			mov r2, #0x581E
			b sc_out
sc_0x401F:
			mov r1, #0x401F
			mov r2, #0x581F
			b sc_out
sc_0x4100:
			mov r1, #0x4100
			mov r2, #0x5800
			b sc_out
sc_0x4101:
			mov r1, #0x4101
			mov r2, #0x5801
			b sc_out
sc_0x4102:
			mov r1, #0x4102
			mov r2, #0x5802
			b sc_out
sc_0x4103:
			mov r1, #0x4103
			mov r2, #0x5803
			b sc_out
sc_0x4104:
			mov r1, #0x4104
			mov r2, #0x5804
			b sc_out
sc_0x4105:
			mov r1, #0x4105
			mov r2, #0x5805
			b sc_out
sc_0x4106:
			mov r1, #0x4106
			mov r2, #0x5806
			b sc_out
sc_0x4107:
			mov r1, #0x4107
			mov r2, #0x5807
			b sc_out
sc_0x4108:
			mov r1, #0x4108
			mov r2, #0x5808
			b sc_out
sc_0x4109:
			mov r1, #0x4109
			mov r2, #0x5809
			b sc_out
sc_0x410A:
			mov r1, #0x410A
			mov r2, #0x580A
			b sc_out
sc_0x410B:
			mov r1, #0x410B
			mov r2, #0x580B
			b sc_out
sc_0x410C:
			mov r1, #0x410C
			mov r2, #0x580C
			b sc_out
sc_0x410D:
			mov r1, #0x410D
			mov r2, #0x580D
			b sc_out
sc_0x410E:
			mov r1, #0x410E
			mov r2, #0x580E
			b sc_out
sc_0x410F:
			mov r1, #0x410F
			mov r2, #0x580F
			b sc_out
sc_0x4110:
			mov r1, #0x4110
			mov r2, #0x5810
			b sc_out
sc_0x4111:
			mov r1, #0x4111
			mov r2, #0x5811
			b sc_out
sc_0x4112:
			mov r1, #0x4112
			mov r2, #0x5812
			b sc_out
sc_0x4113:
			mov r1, #0x4113
			mov r2, #0x5813
			b sc_out
sc_0x4114:
			mov r1, #0x4114
			mov r2, #0x5814
			b sc_out
sc_0x4115:
			mov r1, #0x4115
			mov r2, #0x5815
			b sc_out
sc_0x4116:
			mov r1, #0x4116
			mov r2, #0x5816
			b sc_out
sc_0x4117:
			mov r1, #0x4117
			mov r2, #0x5817
			b sc_out
sc_0x4118:
			mov r1, #0x4118
			mov r2, #0x5818
			b sc_out
sc_0x4119:
			mov r1, #0x4119
			mov r2, #0x5819
			b sc_out
sc_0x411A:
			mov r1, #0x411A
			mov r2, #0x581A
			b sc_out
sc_0x411B:
			mov r1, #0x411B
			mov r2, #0x581B
			b sc_out
sc_0x411C:
			mov r1, #0x411C
			mov r2, #0x581C
			b sc_out
sc_0x411D:
			mov r1, #0x411D
			mov r2, #0x581D
			b sc_out
sc_0x411E:
			mov r1, #0x411E
			mov r2, #0x581E
			b sc_out
sc_0x411F:
			mov r1, #0x411F
			mov r2, #0x581F
			b sc_out
sc_0x4200:
			mov r1, #0x4200
			mov r2, #0x5800
			b sc_out
sc_0x4201:
			mov r1, #0x4201
			mov r2, #0x5801
			b sc_out
sc_0x4202:
			mov r1, #0x4202
			mov r2, #0x5802
			b sc_out
sc_0x4203:
			mov r1, #0x4203
			mov r2, #0x5803
			b sc_out
sc_0x4204:
			mov r1, #0x4204
			mov r2, #0x5804
			b sc_out
sc_0x4205:
			mov r1, #0x4205
			mov r2, #0x5805
			b sc_out
sc_0x4206:
			mov r1, #0x4206
			mov r2, #0x5806
			b sc_out
sc_0x4207:
			mov r1, #0x4207
			mov r2, #0x5807
			b sc_out
sc_0x4208:
			mov r1, #0x4208
			mov r2, #0x5808
			b sc_out
sc_0x4209:
			mov r1, #0x4209
			mov r2, #0x5809
			b sc_out
sc_0x420A:
			mov r1, #0x420A
			mov r2, #0x580A
			b sc_out
sc_0x420B:
			mov r1, #0x420B
			mov r2, #0x580B
			b sc_out
sc_0x420C:
			mov r1, #0x420C
			mov r2, #0x580C
			b sc_out
sc_0x420D:
			mov r1, #0x420D
			mov r2, #0x580D
			b sc_out
sc_0x420E:
			mov r1, #0x420E
			mov r2, #0x580E
			b sc_out
sc_0x420F:
			mov r1, #0x420F
			mov r2, #0x580F
			b sc_out
sc_0x4210:
			mov r1, #0x4210
			mov r2, #0x5810
			b sc_out
sc_0x4211:
			mov r1, #0x4211
			mov r2, #0x5811
			b sc_out
sc_0x4212:
			mov r1, #0x4212
			mov r2, #0x5812
			b sc_out
sc_0x4213:
			mov r1, #0x4213
			mov r2, #0x5813
			b sc_out
sc_0x4214:
			mov r1, #0x4214
			mov r2, #0x5814
			b sc_out
sc_0x4215:
			mov r1, #0x4215
			mov r2, #0x5815
			b sc_out
sc_0x4216:
			mov r1, #0x4216
			mov r2, #0x5816
			b sc_out
sc_0x4217:
			mov r1, #0x4217
			mov r2, #0x5817
			b sc_out
sc_0x4218:
			mov r1, #0x4218
			mov r2, #0x5818
			b sc_out
sc_0x4219:
			mov r1, #0x4219
			mov r2, #0x5819
			b sc_out
sc_0x421A:
			mov r1, #0x421A
			mov r2, #0x581A
			b sc_out
sc_0x421B:
			mov r1, #0x421B
			mov r2, #0x581B
			b sc_out
sc_0x421C:
			mov r1, #0x421C
			mov r2, #0x581C
			b sc_out
sc_0x421D:
			mov r1, #0x421D
			mov r2, #0x581D
			b sc_out
sc_0x421E:
			mov r1, #0x421E
			mov r2, #0x581E
			b sc_out
sc_0x421F:
			mov r1, #0x421F
			mov r2, #0x581F
			b sc_out
sc_0x4300:
			mov r1, #0x4300
			mov r2, #0x5800
			b sc_out
sc_0x4301:
			mov r1, #0x4301
			mov r2, #0x5801
			b sc_out
sc_0x4302:
			mov r1, #0x4302
			mov r2, #0x5802
			b sc_out
sc_0x4303:
			mov r1, #0x4303
			mov r2, #0x5803
			b sc_out
sc_0x4304:
			mov r1, #0x4304
			mov r2, #0x5804
			b sc_out
sc_0x4305:
			mov r1, #0x4305
			mov r2, #0x5805
			b sc_out
sc_0x4306:
			mov r1, #0x4306
			mov r2, #0x5806
			b sc_out
sc_0x4307:
			mov r1, #0x4307
			mov r2, #0x5807
			b sc_out
sc_0x4308:
			mov r1, #0x4308
			mov r2, #0x5808
			b sc_out
sc_0x4309:
			mov r1, #0x4309
			mov r2, #0x5809
			b sc_out
sc_0x430A:
			mov r1, #0x430A
			mov r2, #0x580A
			b sc_out
sc_0x430B:
			mov r1, #0x430B
			mov r2, #0x580B
			b sc_out
sc_0x430C:
			mov r1, #0x430C
			mov r2, #0x580C
			b sc_out
sc_0x430D:
			mov r1, #0x430D
			mov r2, #0x580D
			b sc_out
sc_0x430E:
			mov r1, #0x430E
			mov r2, #0x580E
			b sc_out
sc_0x430F:
			mov r1, #0x430F
			mov r2, #0x580F
			b sc_out
sc_0x4310:
			mov r1, #0x4310
			mov r2, #0x5810
			b sc_out
sc_0x4311:
			mov r1, #0x4311
			mov r2, #0x5811
			b sc_out
sc_0x4312:
			mov r1, #0x4312
			mov r2, #0x5812
			b sc_out
sc_0x4313:
			mov r1, #0x4313
			mov r2, #0x5813
			b sc_out
sc_0x4314:
			mov r1, #0x4314
			mov r2, #0x5814
			b sc_out
sc_0x4315:
			mov r1, #0x4315
			mov r2, #0x5815
			b sc_out
sc_0x4316:
			mov r1, #0x4316
			mov r2, #0x5816
			b sc_out
sc_0x4317:
			mov r1, #0x4317
			mov r2, #0x5817
			b sc_out
sc_0x4318:
			mov r1, #0x4318
			mov r2, #0x5818
			b sc_out
sc_0x4319:
			mov r1, #0x4319
			mov r2, #0x5819
			b sc_out
sc_0x431A:
			mov r1, #0x431A
			mov r2, #0x581A
			b sc_out
sc_0x431B:
			mov r1, #0x431B
			mov r2, #0x581B
			b sc_out
sc_0x431C:
			mov r1, #0x431C
			mov r2, #0x581C
			b sc_out
sc_0x431D:
			mov r1, #0x431D
			mov r2, #0x581D
			b sc_out
sc_0x431E:
			mov r1, #0x431E
			mov r2, #0x581E
			b sc_out
sc_0x431F:
			mov r1, #0x431F
			mov r2, #0x581F
			b sc_out
sc_0x4400:
			mov r1, #0x4400
			mov r2, #0x5800
			b sc_out
sc_0x4401:
			mov r1, #0x4401
			mov r2, #0x5801
			b sc_out
sc_0x4402:
			mov r1, #0x4402
			mov r2, #0x5802
			b sc_out
sc_0x4403:
			mov r1, #0x4403
			mov r2, #0x5803
			b sc_out
sc_0x4404:
			mov r1, #0x4404
			mov r2, #0x5804
			b sc_out
sc_0x4405:
			mov r1, #0x4405
			mov r2, #0x5805
			b sc_out
sc_0x4406:
			mov r1, #0x4406
			mov r2, #0x5806
			b sc_out
sc_0x4407:
			mov r1, #0x4407
			mov r2, #0x5807
			b sc_out
sc_0x4408:
			mov r1, #0x4408
			mov r2, #0x5808
			b sc_out
sc_0x4409:
			mov r1, #0x4409
			mov r2, #0x5809
			b sc_out
sc_0x440A:
			mov r1, #0x440A
			mov r2, #0x580A
			b sc_out
sc_0x440B:
			mov r1, #0x440B
			mov r2, #0x580B
			b sc_out
sc_0x440C:
			mov r1, #0x440C
			mov r2, #0x580C
			b sc_out
sc_0x440D:
			mov r1, #0x440D
			mov r2, #0x580D
			b sc_out
sc_0x440E:
			mov r1, #0x440E
			mov r2, #0x580E
			b sc_out
sc_0x440F:
			mov r1, #0x440F
			mov r2, #0x580F
			b sc_out
sc_0x4410:
			mov r1, #0x4410
			mov r2, #0x5810
			b sc_out
sc_0x4411:
			mov r1, #0x4411
			mov r2, #0x5811
			b sc_out
sc_0x4412:
			mov r1, #0x4412
			mov r2, #0x5812
			b sc_out
sc_0x4413:
			mov r1, #0x4413
			mov r2, #0x5813
			b sc_out
sc_0x4414:
			mov r1, #0x4414
			mov r2, #0x5814
			b sc_out
sc_0x4415:
			mov r1, #0x4415
			mov r2, #0x5815
			b sc_out
sc_0x4416:
			mov r1, #0x4416
			mov r2, #0x5816
			b sc_out
sc_0x4417:
			mov r1, #0x4417
			mov r2, #0x5817
			b sc_out
sc_0x4418:
			mov r1, #0x4418
			mov r2, #0x5818
			b sc_out
sc_0x4419:
			mov r1, #0x4419
			mov r2, #0x5819
			b sc_out
sc_0x441A:
			mov r1, #0x441A
			mov r2, #0x581A
			b sc_out
sc_0x441B:
			mov r1, #0x441B
			mov r2, #0x581B
			b sc_out
sc_0x441C:
			mov r1, #0x441C
			mov r2, #0x581C
			b sc_out
sc_0x441D:
			mov r1, #0x441D
			mov r2, #0x581D
			b sc_out
sc_0x441E:
			mov r1, #0x441E
			mov r2, #0x581E
			b sc_out
sc_0x441F:
			mov r1, #0x441F
			mov r2, #0x581F
			b sc_out
sc_0x4500:
			mov r1, #0x4500
			mov r2, #0x5800
			b sc_out
sc_0x4501:
			mov r1, #0x4501
			mov r2, #0x5801
			b sc_out
sc_0x4502:
			mov r1, #0x4502
			mov r2, #0x5802
			b sc_out
sc_0x4503:
			mov r1, #0x4503
			mov r2, #0x5803
			b sc_out
sc_0x4504:
			mov r1, #0x4504
			mov r2, #0x5804
			b sc_out
sc_0x4505:
			mov r1, #0x4505
			mov r2, #0x5805
			b sc_out
sc_0x4506:
			mov r1, #0x4506
			mov r2, #0x5806
			b sc_out
sc_0x4507:
			mov r1, #0x4507
			mov r2, #0x5807
			b sc_out
sc_0x4508:
			mov r1, #0x4508
			mov r2, #0x5808
			b sc_out
sc_0x4509:
			mov r1, #0x4509
			mov r2, #0x5809
			b sc_out
sc_0x450A:
			mov r1, #0x450A
			mov r2, #0x580A
			b sc_out
sc_0x450B:
			mov r1, #0x450B
			mov r2, #0x580B
			b sc_out
sc_0x450C:
			mov r1, #0x450C
			mov r2, #0x580C
			b sc_out
sc_0x450D:
			mov r1, #0x450D
			mov r2, #0x580D
			b sc_out
sc_0x450E:
			mov r1, #0x450E
			mov r2, #0x580E
			b sc_out
sc_0x450F:
			mov r1, #0x450F
			mov r2, #0x580F
			b sc_out
sc_0x4510:
			mov r1, #0x4510
			mov r2, #0x5810
			b sc_out
sc_0x4511:
			mov r1, #0x4511
			mov r2, #0x5811
			b sc_out
sc_0x4512:
			mov r1, #0x4512
			mov r2, #0x5812
			b sc_out
sc_0x4513:
			mov r1, #0x4513
			mov r2, #0x5813
			b sc_out
sc_0x4514:
			mov r1, #0x4514
			mov r2, #0x5814
			b sc_out
sc_0x4515:
			mov r1, #0x4515
			mov r2, #0x5815
			b sc_out
sc_0x4516:
			mov r1, #0x4516
			mov r2, #0x5816
			b sc_out
sc_0x4517:
			mov r1, #0x4517
			mov r2, #0x5817
			b sc_out
sc_0x4518:
			mov r1, #0x4518
			mov r2, #0x5818
			b sc_out
sc_0x4519:
			mov r1, #0x4519
			mov r2, #0x5819
			b sc_out
sc_0x451A:
			mov r1, #0x451A
			mov r2, #0x581A
			b sc_out
sc_0x451B:
			mov r1, #0x451B
			mov r2, #0x581B
			b sc_out
sc_0x451C:
			mov r1, #0x451C
			mov r2, #0x581C
			b sc_out
sc_0x451D:
			mov r1, #0x451D
			mov r2, #0x581D
			b sc_out
sc_0x451E:
			mov r1, #0x451E
			mov r2, #0x581E
			b sc_out
sc_0x451F:
			mov r1, #0x451F
			mov r2, #0x581F
			b sc_out
sc_0x4600:
			mov r1, #0x4600
			mov r2, #0x5800
			b sc_out
sc_0x4601:
			mov r1, #0x4601
			mov r2, #0x5801
			b sc_out
sc_0x4602:
			mov r1, #0x4602
			mov r2, #0x5802
			b sc_out
sc_0x4603:
			mov r1, #0x4603
			mov r2, #0x5803
			b sc_out
sc_0x4604:
			mov r1, #0x4604
			mov r2, #0x5804
			b sc_out
sc_0x4605:
			mov r1, #0x4605
			mov r2, #0x5805
			b sc_out
sc_0x4606:
			mov r1, #0x4606
			mov r2, #0x5806
			b sc_out
sc_0x4607:
			mov r1, #0x4607
			mov r2, #0x5807
			b sc_out
sc_0x4608:
			mov r1, #0x4608
			mov r2, #0x5808
			b sc_out
sc_0x4609:
			mov r1, #0x4609
			mov r2, #0x5809
			b sc_out
sc_0x460A:
			mov r1, #0x460A
			mov r2, #0x580A
			b sc_out
sc_0x460B:
			mov r1, #0x460B
			mov r2, #0x580B
			b sc_out
sc_0x460C:
			mov r1, #0x460C
			mov r2, #0x580C
			b sc_out
sc_0x460D:
			mov r1, #0x460D
			mov r2, #0x580D
			b sc_out
sc_0x460E:
			mov r1, #0x460E
			mov r2, #0x580E
			b sc_out
sc_0x460F:
			mov r1, #0x460F
			mov r2, #0x580F
			b sc_out
sc_0x4610:
			mov r1, #0x4610
			mov r2, #0x5810
			b sc_out
sc_0x4611:
			mov r1, #0x4611
			mov r2, #0x5811
			b sc_out
sc_0x4612:
			mov r1, #0x4612
			mov r2, #0x5812
			b sc_out
sc_0x4613:
			mov r1, #0x4613
			mov r2, #0x5813
			b sc_out
sc_0x4614:
			mov r1, #0x4614
			mov r2, #0x5814
			b sc_out
sc_0x4615:
			mov r1, #0x4615
			mov r2, #0x5815
			b sc_out
sc_0x4616:
			mov r1, #0x4616
			mov r2, #0x5816
			b sc_out
sc_0x4617:
			mov r1, #0x4617
			mov r2, #0x5817
			b sc_out
sc_0x4618:
			mov r1, #0x4618
			mov r2, #0x5818
			b sc_out
sc_0x4619:
			mov r1, #0x4619
			mov r2, #0x5819
			b sc_out
sc_0x461A:
			mov r1, #0x461A
			mov r2, #0x581A
			b sc_out
sc_0x461B:
			mov r1, #0x461B
			mov r2, #0x581B
			b sc_out
sc_0x461C:
			mov r1, #0x461C
			mov r2, #0x581C
			b sc_out
sc_0x461D:
			mov r1, #0x461D
			mov r2, #0x581D
			b sc_out
sc_0x461E:
			mov r1, #0x461E
			mov r2, #0x581E
			b sc_out
sc_0x461F:
			mov r1, #0x461F
			mov r2, #0x581F
			b sc_out
sc_0x4700:
			mov r1, #0x4700
			mov r2, #0x5800
			b sc_out
sc_0x4701:
			mov r1, #0x4701
			mov r2, #0x5801
			b sc_out
sc_0x4702:
			mov r1, #0x4702
			mov r2, #0x5802
			b sc_out
sc_0x4703:
			mov r1, #0x4703
			mov r2, #0x5803
			b sc_out
sc_0x4704:
			mov r1, #0x4704
			mov r2, #0x5804
			b sc_out
sc_0x4705:
			mov r1, #0x4705
			mov r2, #0x5805
			b sc_out
sc_0x4706:
			mov r1, #0x4706
			mov r2, #0x5806
			b sc_out
sc_0x4707:
			mov r1, #0x4707
			mov r2, #0x5807
			b sc_out
sc_0x4708:
			mov r1, #0x4708
			mov r2, #0x5808
			b sc_out
sc_0x4709:
			mov r1, #0x4709
			mov r2, #0x5809
			b sc_out
sc_0x470A:
			mov r1, #0x470A
			mov r2, #0x580A
			b sc_out
sc_0x470B:
			mov r1, #0x470B
			mov r2, #0x580B
			b sc_out
sc_0x470C:
			mov r1, #0x470C
			mov r2, #0x580C
			b sc_out
sc_0x470D:
			mov r1, #0x470D
			mov r2, #0x580D
			b sc_out
sc_0x470E:
			mov r1, #0x470E
			mov r2, #0x580E
			b sc_out
sc_0x470F:
			mov r1, #0x470F
			mov r2, #0x580F
			b sc_out
sc_0x4710:
			mov r1, #0x4710
			mov r2, #0x5810
			b sc_out
sc_0x4711:
			mov r1, #0x4711
			mov r2, #0x5811
			b sc_out
sc_0x4712:
			mov r1, #0x4712
			mov r2, #0x5812
			b sc_out
sc_0x4713:
			mov r1, #0x4713
			mov r2, #0x5813
			b sc_out
sc_0x4714:
			mov r1, #0x4714
			mov r2, #0x5814
			b sc_out
sc_0x4715:
			mov r1, #0x4715
			mov r2, #0x5815
			b sc_out
sc_0x4716:
			mov r1, #0x4716
			mov r2, #0x5816
			b sc_out
sc_0x4717:
			mov r1, #0x4717
			mov r2, #0x5817
			b sc_out
sc_0x4718:
			mov r1, #0x4718
			mov r2, #0x5818
			b sc_out
sc_0x4719:
			mov r1, #0x4719
			mov r2, #0x5819
			b sc_out
sc_0x471A:
			mov r1, #0x471A
			mov r2, #0x581A
			b sc_out
sc_0x471B:
			mov r1, #0x471B
			mov r2, #0x581B
			b sc_out
sc_0x471C:
			mov r1, #0x471C
			mov r2, #0x581C
			b sc_out
sc_0x471D:
			mov r1, #0x471D
			mov r2, #0x581D
			b sc_out
sc_0x471E:
			mov r1, #0x471E
			mov r2, #0x581E
			b sc_out
sc_0x471F:
			mov r1, #0x471F
			mov r2, #0x581F
			b sc_out
sc_0x4020:
			mov r1, #0x4020
			mov r2, #0x5820
			b sc_out
sc_0x4021:
			mov r1, #0x4021
			mov r2, #0x5821
			b sc_out
sc_0x4022:
			mov r1, #0x4022
			mov r2, #0x5822
			b sc_out
sc_0x4023:
			mov r1, #0x4023
			mov r2, #0x5823
			b sc_out
sc_0x4024:
			mov r1, #0x4024
			mov r2, #0x5824
			b sc_out
sc_0x4025:
			mov r1, #0x4025
			mov r2, #0x5825
			b sc_out
sc_0x4026:
			mov r1, #0x4026
			mov r2, #0x5826
			b sc_out
sc_0x4027:
			mov r1, #0x4027
			mov r2, #0x5827
			b sc_out
sc_0x4028:
			mov r1, #0x4028
			mov r2, #0x5828
			b sc_out
sc_0x4029:
			mov r1, #0x4029
			mov r2, #0x5829
			b sc_out
sc_0x402A:
			mov r1, #0x402A
			mov r2, #0x582A
			b sc_out
sc_0x402B:
			mov r1, #0x402B
			mov r2, #0x582B
			b sc_out
sc_0x402C:
			mov r1, #0x402C
			mov r2, #0x582C
			b sc_out
sc_0x402D:
			mov r1, #0x402D
			mov r2, #0x582D
			b sc_out
sc_0x402E:
			mov r1, #0x402E
			mov r2, #0x582E
			b sc_out
sc_0x402F:
			mov r1, #0x402F
			mov r2, #0x582F
			b sc_out
sc_0x4030:
			mov r1, #0x4030
			mov r2, #0x5830
			b sc_out
sc_0x4031:
			mov r1, #0x4031
			mov r2, #0x5831
			b sc_out
sc_0x4032:
			mov r1, #0x4032
			mov r2, #0x5832
			b sc_out
sc_0x4033:
			mov r1, #0x4033
			mov r2, #0x5833
			b sc_out
sc_0x4034:
			mov r1, #0x4034
			mov r2, #0x5834
			b sc_out
sc_0x4035:
			mov r1, #0x4035
			mov r2, #0x5835
			b sc_out
sc_0x4036:
			mov r1, #0x4036
			mov r2, #0x5836
			b sc_out
sc_0x4037:
			mov r1, #0x4037
			mov r2, #0x5837
			b sc_out
sc_0x4038:
			mov r1, #0x4038
			mov r2, #0x5838
			b sc_out
sc_0x4039:
			mov r1, #0x4039
			mov r2, #0x5839
			b sc_out
sc_0x403A:
			mov r1, #0x403A
			mov r2, #0x583A
			b sc_out
sc_0x403B:
			mov r1, #0x403B
			mov r2, #0x583B
			b sc_out
sc_0x403C:
			mov r1, #0x403C
			mov r2, #0x583C
			b sc_out
sc_0x403D:
			mov r1, #0x403D
			mov r2, #0x583D
			b sc_out
sc_0x403E:
			mov r1, #0x403E
			mov r2, #0x583E
			b sc_out
sc_0x403F:
			mov r1, #0x403F
			mov r2, #0x583F
			b sc_out
sc_0x4120:
			mov r1, #0x4120
			mov r2, #0x5820
			b sc_out
sc_0x4121:
			mov r1, #0x4121
			mov r2, #0x5821
			b sc_out
sc_0x4122:
			mov r1, #0x4122
			mov r2, #0x5822
			b sc_out
sc_0x4123:
			mov r1, #0x4123
			mov r2, #0x5823
			b sc_out
sc_0x4124:
			mov r1, #0x4124
			mov r2, #0x5824
			b sc_out
sc_0x4125:
			mov r1, #0x4125
			mov r2, #0x5825
			b sc_out
sc_0x4126:
			mov r1, #0x4126
			mov r2, #0x5826
			b sc_out
sc_0x4127:
			mov r1, #0x4127
			mov r2, #0x5827
			b sc_out
sc_0x4128:
			mov r1, #0x4128
			mov r2, #0x5828
			b sc_out
sc_0x4129:
			mov r1, #0x4129
			mov r2, #0x5829
			b sc_out
sc_0x412A:
			mov r1, #0x412A
			mov r2, #0x582A
			b sc_out
sc_0x412B:
			mov r1, #0x412B
			mov r2, #0x582B
			b sc_out
sc_0x412C:
			mov r1, #0x412C
			mov r2, #0x582C
			b sc_out
sc_0x412D:
			mov r1, #0x412D
			mov r2, #0x582D
			b sc_out
sc_0x412E:
			mov r1, #0x412E
			mov r2, #0x582E
			b sc_out
sc_0x412F:
			mov r1, #0x412F
			mov r2, #0x582F
			b sc_out
sc_0x4130:
			mov r1, #0x4130
			mov r2, #0x5830
			b sc_out
sc_0x4131:
			mov r1, #0x4131
			mov r2, #0x5831
			b sc_out
sc_0x4132:
			mov r1, #0x4132
			mov r2, #0x5832
			b sc_out
sc_0x4133:
			mov r1, #0x4133
			mov r2, #0x5833
			b sc_out
sc_0x4134:
			mov r1, #0x4134
			mov r2, #0x5834
			b sc_out
sc_0x4135:
			mov r1, #0x4135
			mov r2, #0x5835
			b sc_out
sc_0x4136:
			mov r1, #0x4136
			mov r2, #0x5836
			b sc_out
sc_0x4137:
			mov r1, #0x4137
			mov r2, #0x5837
			b sc_out
sc_0x4138:
			mov r1, #0x4138
			mov r2, #0x5838
			b sc_out
sc_0x4139:
			mov r1, #0x4139
			mov r2, #0x5839
			b sc_out
sc_0x413A:
			mov r1, #0x413A
			mov r2, #0x583A
			b sc_out
sc_0x413B:
			mov r1, #0x413B
			mov r2, #0x583B
			b sc_out
sc_0x413C:
			mov r1, #0x413C
			mov r2, #0x583C
			b sc_out
sc_0x413D:
			mov r1, #0x413D
			mov r2, #0x583D
			b sc_out
sc_0x413E:
			mov r1, #0x413E
			mov r2, #0x583E
			b sc_out
sc_0x413F:
			mov r1, #0x413F
			mov r2, #0x583F
			b sc_out
sc_0x4220:
			mov r1, #0x4220
			mov r2, #0x5820
			b sc_out
sc_0x4221:
			mov r1, #0x4221
			mov r2, #0x5821
			b sc_out
sc_0x4222:
			mov r1, #0x4222
			mov r2, #0x5822
			b sc_out
sc_0x4223:
			mov r1, #0x4223
			mov r2, #0x5823
			b sc_out
sc_0x4224:
			mov r1, #0x4224
			mov r2, #0x5824
			b sc_out
sc_0x4225:
			mov r1, #0x4225
			mov r2, #0x5825
			b sc_out
sc_0x4226:
			mov r1, #0x4226
			mov r2, #0x5826
			b sc_out
sc_0x4227:
			mov r1, #0x4227
			mov r2, #0x5827
			b sc_out
sc_0x4228:
			mov r1, #0x4228
			mov r2, #0x5828
			b sc_out
sc_0x4229:
			mov r1, #0x4229
			mov r2, #0x5829
			b sc_out
sc_0x422A:
			mov r1, #0x422A
			mov r2, #0x582A
			b sc_out
sc_0x422B:
			mov r1, #0x422B
			mov r2, #0x582B
			b sc_out
sc_0x422C:
			mov r1, #0x422C
			mov r2, #0x582C
			b sc_out
sc_0x422D:
			mov r1, #0x422D
			mov r2, #0x582D
			b sc_out
sc_0x422E:
			mov r1, #0x422E
			mov r2, #0x582E
			b sc_out
sc_0x422F:
			mov r1, #0x422F
			mov r2, #0x582F
			b sc_out
sc_0x4230:
			mov r1, #0x4230
			mov r2, #0x5830
			b sc_out
sc_0x4231:
			mov r1, #0x4231
			mov r2, #0x5831
			b sc_out
sc_0x4232:
			mov r1, #0x4232
			mov r2, #0x5832
			b sc_out
sc_0x4233:
			mov r1, #0x4233
			mov r2, #0x5833
			b sc_out
sc_0x4234:
			mov r1, #0x4234
			mov r2, #0x5834
			b sc_out
sc_0x4235:
			mov r1, #0x4235
			mov r2, #0x5835
			b sc_out
sc_0x4236:
			mov r1, #0x4236
			mov r2, #0x5836
			b sc_out
sc_0x4237:
			mov r1, #0x4237
			mov r2, #0x5837
			b sc_out
sc_0x4238:
			mov r1, #0x4238
			mov r2, #0x5838
			b sc_out
sc_0x4239:
			mov r1, #0x4239
			mov r2, #0x5839
			b sc_out
sc_0x423A:
			mov r1, #0x423A
			mov r2, #0x583A
			b sc_out
sc_0x423B:
			mov r1, #0x423B
			mov r2, #0x583B
			b sc_out
sc_0x423C:
			mov r1, #0x423C
			mov r2, #0x583C
			b sc_out
sc_0x423D:
			mov r1, #0x423D
			mov r2, #0x583D
			b sc_out
sc_0x423E:
			mov r1, #0x423E
			mov r2, #0x583E
			b sc_out
sc_0x423F:
			mov r1, #0x423F
			mov r2, #0x583F
			b sc_out
sc_0x4320:
			mov r1, #0x4320
			mov r2, #0x5820
			b sc_out
sc_0x4321:
			mov r1, #0x4321
			mov r2, #0x5821
			b sc_out
sc_0x4322:
			mov r1, #0x4322
			mov r2, #0x5822
			b sc_out
sc_0x4323:
			mov r1, #0x4323
			mov r2, #0x5823
			b sc_out
sc_0x4324:
			mov r1, #0x4324
			mov r2, #0x5824
			b sc_out
sc_0x4325:
			mov r1, #0x4325
			mov r2, #0x5825
			b sc_out
sc_0x4326:
			mov r1, #0x4326
			mov r2, #0x5826
			b sc_out
sc_0x4327:
			mov r1, #0x4327
			mov r2, #0x5827
			b sc_out
sc_0x4328:
			mov r1, #0x4328
			mov r2, #0x5828
			b sc_out
sc_0x4329:
			mov r1, #0x4329
			mov r2, #0x5829
			b sc_out
sc_0x432A:
			mov r1, #0x432A
			mov r2, #0x582A
			b sc_out
sc_0x432B:
			mov r1, #0x432B
			mov r2, #0x582B
			b sc_out
sc_0x432C:
			mov r1, #0x432C
			mov r2, #0x582C
			b sc_out
sc_0x432D:
			mov r1, #0x432D
			mov r2, #0x582D
			b sc_out
sc_0x432E:
			mov r1, #0x432E
			mov r2, #0x582E
			b sc_out
sc_0x432F:
			mov r1, #0x432F
			mov r2, #0x582F
			b sc_out
sc_0x4330:
			mov r1, #0x4330
			mov r2, #0x5830
			b sc_out
sc_0x4331:
			mov r1, #0x4331
			mov r2, #0x5831
			b sc_out
sc_0x4332:
			mov r1, #0x4332
			mov r2, #0x5832
			b sc_out
sc_0x4333:
			mov r1, #0x4333
			mov r2, #0x5833
			b sc_out
sc_0x4334:
			mov r1, #0x4334
			mov r2, #0x5834
			b sc_out
sc_0x4335:
			mov r1, #0x4335
			mov r2, #0x5835
			b sc_out
sc_0x4336:
			mov r1, #0x4336
			mov r2, #0x5836
			b sc_out
sc_0x4337:
			mov r1, #0x4337
			mov r2, #0x5837
			b sc_out
sc_0x4338:
			mov r1, #0x4338
			mov r2, #0x5838
			b sc_out
sc_0x4339:
			mov r1, #0x4339
			mov r2, #0x5839
			b sc_out
sc_0x433A:
			mov r1, #0x433A
			mov r2, #0x583A
			b sc_out
sc_0x433B:
			mov r1, #0x433B
			mov r2, #0x583B
			b sc_out
sc_0x433C:
			mov r1, #0x433C
			mov r2, #0x583C
			b sc_out
sc_0x433D:
			mov r1, #0x433D
			mov r2, #0x583D
			b sc_out
sc_0x433E:
			mov r1, #0x433E
			mov r2, #0x583E
			b sc_out
sc_0x433F:
			mov r1, #0x433F
			mov r2, #0x583F
			b sc_out
sc_0x4420:
			mov r1, #0x4420
			mov r2, #0x5820
			b sc_out
sc_0x4421:
			mov r1, #0x4421
			mov r2, #0x5821
			b sc_out
sc_0x4422:
			mov r1, #0x4422
			mov r2, #0x5822
			b sc_out
sc_0x4423:
			mov r1, #0x4423
			mov r2, #0x5823
			b sc_out
sc_0x4424:
			mov r1, #0x4424
			mov r2, #0x5824
			b sc_out
sc_0x4425:
			mov r1, #0x4425
			mov r2, #0x5825
			b sc_out
sc_0x4426:
			mov r1, #0x4426
			mov r2, #0x5826
			b sc_out
sc_0x4427:
			mov r1, #0x4427
			mov r2, #0x5827
			b sc_out
sc_0x4428:
			mov r1, #0x4428
			mov r2, #0x5828
			b sc_out
sc_0x4429:
			mov r1, #0x4429
			mov r2, #0x5829
			b sc_out
sc_0x442A:
			mov r1, #0x442A
			mov r2, #0x582A
			b sc_out
sc_0x442B:
			mov r1, #0x442B
			mov r2, #0x582B
			b sc_out
sc_0x442C:
			mov r1, #0x442C
			mov r2, #0x582C
			b sc_out
sc_0x442D:
			mov r1, #0x442D
			mov r2, #0x582D
			b sc_out
sc_0x442E:
			mov r1, #0x442E
			mov r2, #0x582E
			b sc_out
sc_0x442F:
			mov r1, #0x442F
			mov r2, #0x582F
			b sc_out
sc_0x4430:
			mov r1, #0x4430
			mov r2, #0x5830
			b sc_out
sc_0x4431:
			mov r1, #0x4431
			mov r2, #0x5831
			b sc_out
sc_0x4432:
			mov r1, #0x4432
			mov r2, #0x5832
			b sc_out
sc_0x4433:
			mov r1, #0x4433
			mov r2, #0x5833
			b sc_out
sc_0x4434:
			mov r1, #0x4434
			mov r2, #0x5834
			b sc_out
sc_0x4435:
			mov r1, #0x4435
			mov r2, #0x5835
			b sc_out
sc_0x4436:
			mov r1, #0x4436
			mov r2, #0x5836
			b sc_out
sc_0x4437:
			mov r1, #0x4437
			mov r2, #0x5837
			b sc_out
sc_0x4438:
			mov r1, #0x4438
			mov r2, #0x5838
			b sc_out
sc_0x4439:
			mov r1, #0x4439
			mov r2, #0x5839
			b sc_out
sc_0x443A:
			mov r1, #0x443A
			mov r2, #0x583A
			b sc_out
sc_0x443B:
			mov r1, #0x443B
			mov r2, #0x583B
			b sc_out
sc_0x443C:
			mov r1, #0x443C
			mov r2, #0x583C
			b sc_out
sc_0x443D:
			mov r1, #0x443D
			mov r2, #0x583D
			b sc_out
sc_0x443E:
			mov r1, #0x443E
			mov r2, #0x583E
			b sc_out
sc_0x443F:
			mov r1, #0x443F
			mov r2, #0x583F
			b sc_out
sc_0x4520:
			mov r1, #0x4520
			mov r2, #0x5820
			b sc_out
sc_0x4521:
			mov r1, #0x4521
			mov r2, #0x5821
			b sc_out
sc_0x4522:
			mov r1, #0x4522
			mov r2, #0x5822
			b sc_out
sc_0x4523:
			mov r1, #0x4523
			mov r2, #0x5823
			b sc_out
sc_0x4524:
			mov r1, #0x4524
			mov r2, #0x5824
			b sc_out
sc_0x4525:
			mov r1, #0x4525
			mov r2, #0x5825
			b sc_out
sc_0x4526:
			mov r1, #0x4526
			mov r2, #0x5826
			b sc_out
sc_0x4527:
			mov r1, #0x4527
			mov r2, #0x5827
			b sc_out
sc_0x4528:
			mov r1, #0x4528
			mov r2, #0x5828
			b sc_out
sc_0x4529:
			mov r1, #0x4529
			mov r2, #0x5829
			b sc_out
sc_0x452A:
			mov r1, #0x452A
			mov r2, #0x582A
			b sc_out
sc_0x452B:
			mov r1, #0x452B
			mov r2, #0x582B
			b sc_out
sc_0x452C:
			mov r1, #0x452C
			mov r2, #0x582C
			b sc_out
sc_0x452D:
			mov r1, #0x452D
			mov r2, #0x582D
			b sc_out
sc_0x452E:
			mov r1, #0x452E
			mov r2, #0x582E
			b sc_out
sc_0x452F:
			mov r1, #0x452F
			mov r2, #0x582F
			b sc_out
sc_0x4530:
			mov r1, #0x4530
			mov r2, #0x5830
			b sc_out
sc_0x4531:
			mov r1, #0x4531
			mov r2, #0x5831
			b sc_out
sc_0x4532:
			mov r1, #0x4532
			mov r2, #0x5832
			b sc_out
sc_0x4533:
			mov r1, #0x4533
			mov r2, #0x5833
			b sc_out
sc_0x4534:
			mov r1, #0x4534
			mov r2, #0x5834
			b sc_out
sc_0x4535:
			mov r1, #0x4535
			mov r2, #0x5835
			b sc_out
sc_0x4536:
			mov r1, #0x4536
			mov r2, #0x5836
			b sc_out
sc_0x4537:
			mov r1, #0x4537
			mov r2, #0x5837
			b sc_out
sc_0x4538:
			mov r1, #0x4538
			mov r2, #0x5838
			b sc_out
sc_0x4539:
			mov r1, #0x4539
			mov r2, #0x5839
			b sc_out
sc_0x453A:
			mov r1, #0x453A
			mov r2, #0x583A
			b sc_out
sc_0x453B:
			mov r1, #0x453B
			mov r2, #0x583B
			b sc_out
sc_0x453C:
			mov r1, #0x453C
			mov r2, #0x583C
			b sc_out
sc_0x453D:
			mov r1, #0x453D
			mov r2, #0x583D
			b sc_out
sc_0x453E:
			mov r1, #0x453E
			mov r2, #0x583E
			b sc_out
sc_0x453F:
			mov r1, #0x453F
			mov r2, #0x583F
			b sc_out
sc_0x4620:
			mov r1, #0x4620
			mov r2, #0x5820
			b sc_out
sc_0x4621:
			mov r1, #0x4621
			mov r2, #0x5821
			b sc_out
sc_0x4622:
			mov r1, #0x4622
			mov r2, #0x5822
			b sc_out
sc_0x4623:
			mov r1, #0x4623
			mov r2, #0x5823
			b sc_out
sc_0x4624:
			mov r1, #0x4624
			mov r2, #0x5824
			b sc_out
sc_0x4625:
			mov r1, #0x4625
			mov r2, #0x5825
			b sc_out
sc_0x4626:
			mov r1, #0x4626
			mov r2, #0x5826
			b sc_out
sc_0x4627:
			mov r1, #0x4627
			mov r2, #0x5827
			b sc_out
sc_0x4628:
			mov r1, #0x4628
			mov r2, #0x5828
			b sc_out
sc_0x4629:
			mov r1, #0x4629
			mov r2, #0x5829
			b sc_out
sc_0x462A:
			mov r1, #0x462A
			mov r2, #0x582A
			b sc_out
sc_0x462B:
			mov r1, #0x462B
			mov r2, #0x582B
			b sc_out
sc_0x462C:
			mov r1, #0x462C
			mov r2, #0x582C
			b sc_out
sc_0x462D:
			mov r1, #0x462D
			mov r2, #0x582D
			b sc_out
sc_0x462E:
			mov r1, #0x462E
			mov r2, #0x582E
			b sc_out
sc_0x462F:
			mov r1, #0x462F
			mov r2, #0x582F
			b sc_out
sc_0x4630:
			mov r1, #0x4630
			mov r2, #0x5830
			b sc_out
sc_0x4631:
			mov r1, #0x4631
			mov r2, #0x5831
			b sc_out
sc_0x4632:
			mov r1, #0x4632
			mov r2, #0x5832
			b sc_out
sc_0x4633:
			mov r1, #0x4633
			mov r2, #0x5833
			b sc_out
sc_0x4634:
			mov r1, #0x4634
			mov r2, #0x5834
			b sc_out
sc_0x4635:
			mov r1, #0x4635
			mov r2, #0x5835
			b sc_out
sc_0x4636:
			mov r1, #0x4636
			mov r2, #0x5836
			b sc_out
sc_0x4637:
			mov r1, #0x4637
			mov r2, #0x5837
			b sc_out
sc_0x4638:
			mov r1, #0x4638
			mov r2, #0x5838
			b sc_out
sc_0x4639:
			mov r1, #0x4639
			mov r2, #0x5839
			b sc_out
sc_0x463A:
			mov r1, #0x463A
			mov r2, #0x583A
			b sc_out
sc_0x463B:
			mov r1, #0x463B
			mov r2, #0x583B
			b sc_out
sc_0x463C:
			mov r1, #0x463C
			mov r2, #0x583C
			b sc_out
sc_0x463D:
			mov r1, #0x463D
			mov r2, #0x583D
			b sc_out
sc_0x463E:
			mov r1, #0x463E
			mov r2, #0x583E
			b sc_out
sc_0x463F:
			mov r1, #0x463F
			mov r2, #0x583F
			b sc_out
sc_0x4720:
			mov r1, #0x4720
			mov r2, #0x5820
			b sc_out
sc_0x4721:
			mov r1, #0x4721
			mov r2, #0x5821
			b sc_out
sc_0x4722:
			mov r1, #0x4722
			mov r2, #0x5822
			b sc_out
sc_0x4723:
			mov r1, #0x4723
			mov r2, #0x5823
			b sc_out
sc_0x4724:
			mov r1, #0x4724
			mov r2, #0x5824
			b sc_out
sc_0x4725:
			mov r1, #0x4725
			mov r2, #0x5825
			b sc_out
sc_0x4726:
			mov r1, #0x4726
			mov r2, #0x5826
			b sc_out
sc_0x4727:
			mov r1, #0x4727
			mov r2, #0x5827
			b sc_out
sc_0x4728:
			mov r1, #0x4728
			mov r2, #0x5828
			b sc_out
sc_0x4729:
			mov r1, #0x4729
			mov r2, #0x5829
			b sc_out
sc_0x472A:
			mov r1, #0x472A
			mov r2, #0x582A
			b sc_out
sc_0x472B:
			mov r1, #0x472B
			mov r2, #0x582B
			b sc_out
sc_0x472C:
			mov r1, #0x472C
			mov r2, #0x582C
			b sc_out
sc_0x472D:
			mov r1, #0x472D
			mov r2, #0x582D
			b sc_out
sc_0x472E:
			mov r1, #0x472E
			mov r2, #0x582E
			b sc_out
sc_0x472F:
			mov r1, #0x472F
			mov r2, #0x582F
			b sc_out
sc_0x4730:
			mov r1, #0x4730
			mov r2, #0x5830
			b sc_out
sc_0x4731:
			mov r1, #0x4731
			mov r2, #0x5831
			b sc_out
sc_0x4732:
			mov r1, #0x4732
			mov r2, #0x5832
			b sc_out
sc_0x4733:
			mov r1, #0x4733
			mov r2, #0x5833
			b sc_out
sc_0x4734:
			mov r1, #0x4734
			mov r2, #0x5834
			b sc_out
sc_0x4735:
			mov r1, #0x4735
			mov r2, #0x5835
			b sc_out
sc_0x4736:
			mov r1, #0x4736
			mov r2, #0x5836
			b sc_out
sc_0x4737:
			mov r1, #0x4737
			mov r2, #0x5837
			b sc_out
sc_0x4738:
			mov r1, #0x4738
			mov r2, #0x5838
			b sc_out
sc_0x4739:
			mov r1, #0x4739
			mov r2, #0x5839
			b sc_out
sc_0x473A:
			mov r1, #0x473A
			mov r2, #0x583A
			b sc_out
sc_0x473B:
			mov r1, #0x473B
			mov r2, #0x583B
			b sc_out
sc_0x473C:
			mov r1, #0x473C
			mov r2, #0x583C
			b sc_out
sc_0x473D:
			mov r1, #0x473D
			mov r2, #0x583D
			b sc_out
sc_0x473E:
			mov r1, #0x473E
			mov r2, #0x583E
			b sc_out
sc_0x473F:
			mov r1, #0x473F
			mov r2, #0x583F
			b sc_out
sc_0x4040:
			mov r1, #0x4040
			mov r2, #0x5840
			b sc_out
sc_0x4041:
			mov r1, #0x4041
			mov r2, #0x5841
			b sc_out
sc_0x4042:
			mov r1, #0x4042
			mov r2, #0x5842
			b sc_out
sc_0x4043:
			mov r1, #0x4043
			mov r2, #0x5843
			b sc_out
sc_0x4044:
			mov r1, #0x4044
			mov r2, #0x5844
			b sc_out
sc_0x4045:
			mov r1, #0x4045
			mov r2, #0x5845
			b sc_out
sc_0x4046:
			mov r1, #0x4046
			mov r2, #0x5846
			b sc_out
sc_0x4047:
			mov r1, #0x4047
			mov r2, #0x5847
			b sc_out
sc_0x4048:
			mov r1, #0x4048
			mov r2, #0x5848
			b sc_out
sc_0x4049:
			mov r1, #0x4049
			mov r2, #0x5849
			b sc_out
sc_0x404A:
			mov r1, #0x404A
			mov r2, #0x584A
			b sc_out
sc_0x404B:
			mov r1, #0x404B
			mov r2, #0x584B
			b sc_out
sc_0x404C:
			mov r1, #0x404C
			mov r2, #0x584C
			b sc_out
sc_0x404D:
			mov r1, #0x404D
			mov r2, #0x584D
			b sc_out
sc_0x404E:
			mov r1, #0x404E
			mov r2, #0x584E
			b sc_out
sc_0x404F:
			mov r1, #0x404F
			mov r2, #0x584F
			b sc_out
sc_0x4050:
			mov r1, #0x4050
			mov r2, #0x5850
			b sc_out
sc_0x4051:
			mov r1, #0x4051
			mov r2, #0x5851
			b sc_out
sc_0x4052:
			mov r1, #0x4052
			mov r2, #0x5852
			b sc_out
sc_0x4053:
			mov r1, #0x4053
			mov r2, #0x5853
			b sc_out
sc_0x4054:
			mov r1, #0x4054
			mov r2, #0x5854
			b sc_out
sc_0x4055:
			mov r1, #0x4055
			mov r2, #0x5855
			b sc_out
sc_0x4056:
			mov r1, #0x4056
			mov r2, #0x5856
			b sc_out
sc_0x4057:
			mov r1, #0x4057
			mov r2, #0x5857
			b sc_out
sc_0x4058:
			mov r1, #0x4058
			mov r2, #0x5858
			b sc_out
sc_0x4059:
			mov r1, #0x4059
			mov r2, #0x5859
			b sc_out
sc_0x405A:
			mov r1, #0x405A
			mov r2, #0x585A
			b sc_out
sc_0x405B:
			mov r1, #0x405B
			mov r2, #0x585B
			b sc_out
sc_0x405C:
			mov r1, #0x405C
			mov r2, #0x585C
			b sc_out
sc_0x405D:
			mov r1, #0x405D
			mov r2, #0x585D
			b sc_out
sc_0x405E:
			mov r1, #0x405E
			mov r2, #0x585E
			b sc_out
sc_0x405F:
			mov r1, #0x405F
			mov r2, #0x585F
			b sc_out
sc_0x4140:
			mov r1, #0x4140
			mov r2, #0x5840
			b sc_out
sc_0x4141:
			mov r1, #0x4141
			mov r2, #0x5841
			b sc_out
sc_0x4142:
			mov r1, #0x4142
			mov r2, #0x5842
			b sc_out
sc_0x4143:
			mov r1, #0x4143
			mov r2, #0x5843
			b sc_out
sc_0x4144:
			mov r1, #0x4144
			mov r2, #0x5844
			b sc_out
sc_0x4145:
			mov r1, #0x4145
			mov r2, #0x5845
			b sc_out
sc_0x4146:
			mov r1, #0x4146
			mov r2, #0x5846
			b sc_out
sc_0x4147:
			mov r1, #0x4147
			mov r2, #0x5847
			b sc_out
sc_0x4148:
			mov r1, #0x4148
			mov r2, #0x5848
			b sc_out
sc_0x4149:
			mov r1, #0x4149
			mov r2, #0x5849
			b sc_out
sc_0x414A:
			mov r1, #0x414A
			mov r2, #0x584A
			b sc_out
sc_0x414B:
			mov r1, #0x414B
			mov r2, #0x584B
			b sc_out
sc_0x414C:
			mov r1, #0x414C
			mov r2, #0x584C
			b sc_out
sc_0x414D:
			mov r1, #0x414D
			mov r2, #0x584D
			b sc_out
sc_0x414E:
			mov r1, #0x414E
			mov r2, #0x584E
			b sc_out
sc_0x414F:
			mov r1, #0x414F
			mov r2, #0x584F
			b sc_out
sc_0x4150:
			mov r1, #0x4150
			mov r2, #0x5850
			b sc_out
sc_0x4151:
			mov r1, #0x4151
			mov r2, #0x5851
			b sc_out
sc_0x4152:
			mov r1, #0x4152
			mov r2, #0x5852
			b sc_out
sc_0x4153:
			mov r1, #0x4153
			mov r2, #0x5853
			b sc_out
sc_0x4154:
			mov r1, #0x4154
			mov r2, #0x5854
			b sc_out
sc_0x4155:
			mov r1, #0x4155
			mov r2, #0x5855
			b sc_out
sc_0x4156:
			mov r1, #0x4156
			mov r2, #0x5856
			b sc_out
sc_0x4157:
			mov r1, #0x4157
			mov r2, #0x5857
			b sc_out
sc_0x4158:
			mov r1, #0x4158
			mov r2, #0x5858
			b sc_out
sc_0x4159:
			mov r1, #0x4159
			mov r2, #0x5859
			b sc_out
sc_0x415A:
			mov r1, #0x415A
			mov r2, #0x585A
			b sc_out
sc_0x415B:
			mov r1, #0x415B
			mov r2, #0x585B
			b sc_out
sc_0x415C:
			mov r1, #0x415C
			mov r2, #0x585C
			b sc_out
sc_0x415D:
			mov r1, #0x415D
			mov r2, #0x585D
			b sc_out
sc_0x415E:
			mov r1, #0x415E
			mov r2, #0x585E
			b sc_out
sc_0x415F:
			mov r1, #0x415F
			mov r2, #0x585F
			b sc_out
sc_0x4240:
			mov r1, #0x4240
			mov r2, #0x5840
			b sc_out
sc_0x4241:
			mov r1, #0x4241
			mov r2, #0x5841
			b sc_out
sc_0x4242:
			mov r1, #0x4242
			mov r2, #0x5842
			b sc_out
sc_0x4243:
			mov r1, #0x4243
			mov r2, #0x5843
			b sc_out
sc_0x4244:
			mov r1, #0x4244
			mov r2, #0x5844
			b sc_out
sc_0x4245:
			mov r1, #0x4245
			mov r2, #0x5845
			b sc_out
sc_0x4246:
			mov r1, #0x4246
			mov r2, #0x5846
			b sc_out
sc_0x4247:
			mov r1, #0x4247
			mov r2, #0x5847
			b sc_out
sc_0x4248:
			mov r1, #0x4248
			mov r2, #0x5848
			b sc_out
sc_0x4249:
			mov r1, #0x4249
			mov r2, #0x5849
			b sc_out
sc_0x424A:
			mov r1, #0x424A
			mov r2, #0x584A
			b sc_out
sc_0x424B:
			mov r1, #0x424B
			mov r2, #0x584B
			b sc_out
sc_0x424C:
			mov r1, #0x424C
			mov r2, #0x584C
			b sc_out
sc_0x424D:
			mov r1, #0x424D
			mov r2, #0x584D
			b sc_out
sc_0x424E:
			mov r1, #0x424E
			mov r2, #0x584E
			b sc_out
sc_0x424F:
			mov r1, #0x424F
			mov r2, #0x584F
			b sc_out
sc_0x4250:
			mov r1, #0x4250
			mov r2, #0x5850
			b sc_out
sc_0x4251:
			mov r1, #0x4251
			mov r2, #0x5851
			b sc_out
sc_0x4252:
			mov r1, #0x4252
			mov r2, #0x5852
			b sc_out
sc_0x4253:
			mov r1, #0x4253
			mov r2, #0x5853
			b sc_out
sc_0x4254:
			mov r1, #0x4254
			mov r2, #0x5854
			b sc_out
sc_0x4255:
			mov r1, #0x4255
			mov r2, #0x5855
			b sc_out
sc_0x4256:
			mov r1, #0x4256
			mov r2, #0x5856
			b sc_out
sc_0x4257:
			mov r1, #0x4257
			mov r2, #0x5857
			b sc_out
sc_0x4258:
			mov r1, #0x4258
			mov r2, #0x5858
			b sc_out
sc_0x4259:
			mov r1, #0x4259
			mov r2, #0x5859
			b sc_out
sc_0x425A:
			mov r1, #0x425A
			mov r2, #0x585A
			b sc_out
sc_0x425B:
			mov r1, #0x425B
			mov r2, #0x585B
			b sc_out
sc_0x425C:
			mov r1, #0x425C
			mov r2, #0x585C
			b sc_out
sc_0x425D:
			mov r1, #0x425D
			mov r2, #0x585D
			b sc_out
sc_0x425E:
			mov r1, #0x425E
			mov r2, #0x585E
			b sc_out
sc_0x425F:
			mov r1, #0x425F
			mov r2, #0x585F
			b sc_out
sc_0x4340:
			mov r1, #0x4340
			mov r2, #0x5840
			b sc_out
sc_0x4341:
			mov r1, #0x4341
			mov r2, #0x5841
			b sc_out
sc_0x4342:
			mov r1, #0x4342
			mov r2, #0x5842
			b sc_out
sc_0x4343:
			mov r1, #0x4343
			mov r2, #0x5843
			b sc_out
sc_0x4344:
			mov r1, #0x4344
			mov r2, #0x5844
			b sc_out
sc_0x4345:
			mov r1, #0x4345
			mov r2, #0x5845
			b sc_out
sc_0x4346:
			mov r1, #0x4346
			mov r2, #0x5846
			b sc_out
sc_0x4347:
			mov r1, #0x4347
			mov r2, #0x5847
			b sc_out
sc_0x4348:
			mov r1, #0x4348
			mov r2, #0x5848
			b sc_out
sc_0x4349:
			mov r1, #0x4349
			mov r2, #0x5849
			b sc_out
sc_0x434A:
			mov r1, #0x434A
			mov r2, #0x584A
			b sc_out
sc_0x434B:
			mov r1, #0x434B
			mov r2, #0x584B
			b sc_out
sc_0x434C:
			mov r1, #0x434C
			mov r2, #0x584C
			b sc_out
sc_0x434D:
			mov r1, #0x434D
			mov r2, #0x584D
			b sc_out
sc_0x434E:
			mov r1, #0x434E
			mov r2, #0x584E
			b sc_out
sc_0x434F:
			mov r1, #0x434F
			mov r2, #0x584F
			b sc_out
sc_0x4350:
			mov r1, #0x4350
			mov r2, #0x5850
			b sc_out
sc_0x4351:
			mov r1, #0x4351
			mov r2, #0x5851
			b sc_out
sc_0x4352:
			mov r1, #0x4352
			mov r2, #0x5852
			b sc_out
sc_0x4353:
			mov r1, #0x4353
			mov r2, #0x5853
			b sc_out
sc_0x4354:
			mov r1, #0x4354
			mov r2, #0x5854
			b sc_out
sc_0x4355:
			mov r1, #0x4355
			mov r2, #0x5855
			b sc_out
sc_0x4356:
			mov r1, #0x4356
			mov r2, #0x5856
			b sc_out
sc_0x4357:
			mov r1, #0x4357
			mov r2, #0x5857
			b sc_out
sc_0x4358:
			mov r1, #0x4358
			mov r2, #0x5858
			b sc_out
sc_0x4359:
			mov r1, #0x4359
			mov r2, #0x5859
			b sc_out
sc_0x435A:
			mov r1, #0x435A
			mov r2, #0x585A
			b sc_out
sc_0x435B:
			mov r1, #0x435B
			mov r2, #0x585B
			b sc_out
sc_0x435C:
			mov r1, #0x435C
			mov r2, #0x585C
			b sc_out
sc_0x435D:
			mov r1, #0x435D
			mov r2, #0x585D
			b sc_out
sc_0x435E:
			mov r1, #0x435E
			mov r2, #0x585E
			b sc_out
sc_0x435F:
			mov r1, #0x435F
			mov r2, #0x585F
			b sc_out
sc_0x4440:
			mov r1, #0x4440
			mov r2, #0x5840
			b sc_out
sc_0x4441:
			mov r1, #0x4441
			mov r2, #0x5841
			b sc_out
sc_0x4442:
			mov r1, #0x4442
			mov r2, #0x5842
			b sc_out
sc_0x4443:
			mov r1, #0x4443
			mov r2, #0x5843
			b sc_out
sc_0x4444:
			mov r1, #0x4444
			mov r2, #0x5844
			b sc_out
sc_0x4445:
			mov r1, #0x4445
			mov r2, #0x5845
			b sc_out
sc_0x4446:
			mov r1, #0x4446
			mov r2, #0x5846
			b sc_out
sc_0x4447:
			mov r1, #0x4447
			mov r2, #0x5847
			b sc_out
sc_0x4448:
			mov r1, #0x4448
			mov r2, #0x5848
			b sc_out
sc_0x4449:
			mov r1, #0x4449
			mov r2, #0x5849
			b sc_out
sc_0x444A:
			mov r1, #0x444A
			mov r2, #0x584A
			b sc_out
sc_0x444B:
			mov r1, #0x444B
			mov r2, #0x584B
			b sc_out
sc_0x444C:
			mov r1, #0x444C
			mov r2, #0x584C
			b sc_out
sc_0x444D:
			mov r1, #0x444D
			mov r2, #0x584D
			b sc_out
sc_0x444E:
			mov r1, #0x444E
			mov r2, #0x584E
			b sc_out
sc_0x444F:
			mov r1, #0x444F
			mov r2, #0x584F
			b sc_out
sc_0x4450:
			mov r1, #0x4450
			mov r2, #0x5850
			b sc_out
sc_0x4451:
			mov r1, #0x4451
			mov r2, #0x5851
			b sc_out
sc_0x4452:
			mov r1, #0x4452
			mov r2, #0x5852
			b sc_out
sc_0x4453:
			mov r1, #0x4453
			mov r2, #0x5853
			b sc_out
sc_0x4454:
			mov r1, #0x4454
			mov r2, #0x5854
			b sc_out
sc_0x4455:
			mov r1, #0x4455
			mov r2, #0x5855
			b sc_out
sc_0x4456:
			mov r1, #0x4456
			mov r2, #0x5856
			b sc_out
sc_0x4457:
			mov r1, #0x4457
			mov r2, #0x5857
			b sc_out
sc_0x4458:
			mov r1, #0x4458
			mov r2, #0x5858
			b sc_out
sc_0x4459:
			mov r1, #0x4459
			mov r2, #0x5859
			b sc_out
sc_0x445A:
			mov r1, #0x445A
			mov r2, #0x585A
			b sc_out
sc_0x445B:
			mov r1, #0x445B
			mov r2, #0x585B
			b sc_out
sc_0x445C:
			mov r1, #0x445C
			mov r2, #0x585C
			b sc_out
sc_0x445D:
			mov r1, #0x445D
			mov r2, #0x585D
			b sc_out
sc_0x445E:
			mov r1, #0x445E
			mov r2, #0x585E
			b sc_out
sc_0x445F:
			mov r1, #0x445F
			mov r2, #0x585F
			b sc_out
sc_0x4540:
			mov r1, #0x4540
			mov r2, #0x5840
			b sc_out
sc_0x4541:
			mov r1, #0x4541
			mov r2, #0x5841
			b sc_out
sc_0x4542:
			mov r1, #0x4542
			mov r2, #0x5842
			b sc_out
sc_0x4543:
			mov r1, #0x4543
			mov r2, #0x5843
			b sc_out
sc_0x4544:
			mov r1, #0x4544
			mov r2, #0x5844
			b sc_out
sc_0x4545:
			mov r1, #0x4545
			mov r2, #0x5845
			b sc_out
sc_0x4546:
			mov r1, #0x4546
			mov r2, #0x5846
			b sc_out
sc_0x4547:
			mov r1, #0x4547
			mov r2, #0x5847
			b sc_out
sc_0x4548:
			mov r1, #0x4548
			mov r2, #0x5848
			b sc_out
sc_0x4549:
			mov r1, #0x4549
			mov r2, #0x5849
			b sc_out
sc_0x454A:
			mov r1, #0x454A
			mov r2, #0x584A
			b sc_out
sc_0x454B:
			mov r1, #0x454B
			mov r2, #0x584B
			b sc_out
sc_0x454C:
			mov r1, #0x454C
			mov r2, #0x584C
			b sc_out
sc_0x454D:
			mov r1, #0x454D
			mov r2, #0x584D
			b sc_out
sc_0x454E:
			mov r1, #0x454E
			mov r2, #0x584E
			b sc_out
sc_0x454F:
			mov r1, #0x454F
			mov r2, #0x584F
			b sc_out
sc_0x4550:
			mov r1, #0x4550
			mov r2, #0x5850
			b sc_out
sc_0x4551:
			mov r1, #0x4551
			mov r2, #0x5851
			b sc_out
sc_0x4552:
			mov r1, #0x4552
			mov r2, #0x5852
			b sc_out
sc_0x4553:
			mov r1, #0x4553
			mov r2, #0x5853
			b sc_out
sc_0x4554:
			mov r1, #0x4554
			mov r2, #0x5854
			b sc_out
sc_0x4555:
			mov r1, #0x4555
			mov r2, #0x5855
			b sc_out
sc_0x4556:
			mov r1, #0x4556
			mov r2, #0x5856
			b sc_out
sc_0x4557:
			mov r1, #0x4557
			mov r2, #0x5857
			b sc_out
sc_0x4558:
			mov r1, #0x4558
			mov r2, #0x5858
			b sc_out
sc_0x4559:
			mov r1, #0x4559
			mov r2, #0x5859
			b sc_out
sc_0x455A:
			mov r1, #0x455A
			mov r2, #0x585A
			b sc_out
sc_0x455B:
			mov r1, #0x455B
			mov r2, #0x585B
			b sc_out
sc_0x455C:
			mov r1, #0x455C
			mov r2, #0x585C
			b sc_out
sc_0x455D:
			mov r1, #0x455D
			mov r2, #0x585D
			b sc_out
sc_0x455E:
			mov r1, #0x455E
			mov r2, #0x585E
			b sc_out
sc_0x455F:
			mov r1, #0x455F
			mov r2, #0x585F
			b sc_out
sc_0x4640:
			mov r1, #0x4640
			mov r2, #0x5840
			b sc_out
sc_0x4641:
			mov r1, #0x4641
			mov r2, #0x5841
			b sc_out
sc_0x4642:
			mov r1, #0x4642
			mov r2, #0x5842
			b sc_out
sc_0x4643:
			mov r1, #0x4643
			mov r2, #0x5843
			b sc_out
sc_0x4644:
			mov r1, #0x4644
			mov r2, #0x5844
			b sc_out
sc_0x4645:
			mov r1, #0x4645
			mov r2, #0x5845
			b sc_out
sc_0x4646:
			mov r1, #0x4646
			mov r2, #0x5846
			b sc_out
sc_0x4647:
			mov r1, #0x4647
			mov r2, #0x5847
			b sc_out
sc_0x4648:
			mov r1, #0x4648
			mov r2, #0x5848
			b sc_out
sc_0x4649:
			mov r1, #0x4649
			mov r2, #0x5849
			b sc_out
sc_0x464A:
			mov r1, #0x464A
			mov r2, #0x584A
			b sc_out
sc_0x464B:
			mov r1, #0x464B
			mov r2, #0x584B
			b sc_out
sc_0x464C:
			mov r1, #0x464C
			mov r2, #0x584C
			b sc_out
sc_0x464D:
			mov r1, #0x464D
			mov r2, #0x584D
			b sc_out
sc_0x464E:
			mov r1, #0x464E
			mov r2, #0x584E
			b sc_out
sc_0x464F:
			mov r1, #0x464F
			mov r2, #0x584F
			b sc_out
sc_0x4650:
			mov r1, #0x4650
			mov r2, #0x5850
			b sc_out
sc_0x4651:
			mov r1, #0x4651
			mov r2, #0x5851
			b sc_out
sc_0x4652:
			mov r1, #0x4652
			mov r2, #0x5852
			b sc_out
sc_0x4653:
			mov r1, #0x4653
			mov r2, #0x5853
			b sc_out
sc_0x4654:
			mov r1, #0x4654
			mov r2, #0x5854
			b sc_out
sc_0x4655:
			mov r1, #0x4655
			mov r2, #0x5855
			b sc_out
sc_0x4656:
			mov r1, #0x4656
			mov r2, #0x5856
			b sc_out
sc_0x4657:
			mov r1, #0x4657
			mov r2, #0x5857
			b sc_out
sc_0x4658:
			mov r1, #0x4658
			mov r2, #0x5858
			b sc_out
sc_0x4659:
			mov r1, #0x4659
			mov r2, #0x5859
			b sc_out
sc_0x465A:
			mov r1, #0x465A
			mov r2, #0x585A
			b sc_out
sc_0x465B:
			mov r1, #0x465B
			mov r2, #0x585B
			b sc_out
sc_0x465C:
			mov r1, #0x465C
			mov r2, #0x585C
			b sc_out
sc_0x465D:
			mov r1, #0x465D
			mov r2, #0x585D
			b sc_out
sc_0x465E:
			mov r1, #0x465E
			mov r2, #0x585E
			b sc_out
sc_0x465F:
			mov r1, #0x465F
			mov r2, #0x585F
			b sc_out
sc_0x4740:
			mov r1, #0x4740
			mov r2, #0x5840
			b sc_out
sc_0x4741:
			mov r1, #0x4741
			mov r2, #0x5841
			b sc_out
sc_0x4742:
			mov r1, #0x4742
			mov r2, #0x5842
			b sc_out
sc_0x4743:
			mov r1, #0x4743
			mov r2, #0x5843
			b sc_out
sc_0x4744:
			mov r1, #0x4744
			mov r2, #0x5844
			b sc_out
sc_0x4745:
			mov r1, #0x4745
			mov r2, #0x5845
			b sc_out
sc_0x4746:
			mov r1, #0x4746
			mov r2, #0x5846
			b sc_out
sc_0x4747:
			mov r1, #0x4747
			mov r2, #0x5847
			b sc_out
sc_0x4748:
			mov r1, #0x4748
			mov r2, #0x5848
			b sc_out
sc_0x4749:
			mov r1, #0x4749
			mov r2, #0x5849
			b sc_out
sc_0x474A:
			mov r1, #0x474A
			mov r2, #0x584A
			b sc_out
sc_0x474B:
			mov r1, #0x474B
			mov r2, #0x584B
			b sc_out
sc_0x474C:
			mov r1, #0x474C
			mov r2, #0x584C
			b sc_out
sc_0x474D:
			mov r1, #0x474D
			mov r2, #0x584D
			b sc_out
sc_0x474E:
			mov r1, #0x474E
			mov r2, #0x584E
			b sc_out
sc_0x474F:
			mov r1, #0x474F
			mov r2, #0x584F
			b sc_out
sc_0x4750:
			mov r1, #0x4750
			mov r2, #0x5850
			b sc_out
sc_0x4751:
			mov r1, #0x4751
			mov r2, #0x5851
			b sc_out
sc_0x4752:
			mov r1, #0x4752
			mov r2, #0x5852
			b sc_out
sc_0x4753:
			mov r1, #0x4753
			mov r2, #0x5853
			b sc_out
sc_0x4754:
			mov r1, #0x4754
			mov r2, #0x5854
			b sc_out
sc_0x4755:
			mov r1, #0x4755
			mov r2, #0x5855
			b sc_out
sc_0x4756:
			mov r1, #0x4756
			mov r2, #0x5856
			b sc_out
sc_0x4757:
			mov r1, #0x4757
			mov r2, #0x5857
			b sc_out
sc_0x4758:
			mov r1, #0x4758
			mov r2, #0x5858
			b sc_out
sc_0x4759:
			mov r1, #0x4759
			mov r2, #0x5859
			b sc_out
sc_0x475A:
			mov r1, #0x475A
			mov r2, #0x585A
			b sc_out
sc_0x475B:
			mov r1, #0x475B
			mov r2, #0x585B
			b sc_out
sc_0x475C:
			mov r1, #0x475C
			mov r2, #0x585C
			b sc_out
sc_0x475D:
			mov r1, #0x475D
			mov r2, #0x585D
			b sc_out
sc_0x475E:
			mov r1, #0x475E
			mov r2, #0x585E
			b sc_out
sc_0x475F:
			mov r1, #0x475F
			mov r2, #0x585F
			b sc_out
sc_0x4060:
			mov r1, #0x4060
			mov r2, #0x5860
			b sc_out
sc_0x4061:
			mov r1, #0x4061
			mov r2, #0x5861
			b sc_out
sc_0x4062:
			mov r1, #0x4062
			mov r2, #0x5862
			b sc_out
sc_0x4063:
			mov r1, #0x4063
			mov r2, #0x5863
			b sc_out
sc_0x4064:
			mov r1, #0x4064
			mov r2, #0x5864
			b sc_out
sc_0x4065:
			mov r1, #0x4065
			mov r2, #0x5865
			b sc_out
sc_0x4066:
			mov r1, #0x4066
			mov r2, #0x5866
			b sc_out
sc_0x4067:
			mov r1, #0x4067
			mov r2, #0x5867
			b sc_out
sc_0x4068:
			mov r1, #0x4068
			mov r2, #0x5868
			b sc_out
sc_0x4069:
			mov r1, #0x4069
			mov r2, #0x5869
			b sc_out
sc_0x406A:
			mov r1, #0x406A
			mov r2, #0x586A
			b sc_out
sc_0x406B:
			mov r1, #0x406B
			mov r2, #0x586B
			b sc_out
sc_0x406C:
			mov r1, #0x406C
			mov r2, #0x586C
			b sc_out
sc_0x406D:
			mov r1, #0x406D
			mov r2, #0x586D
			b sc_out
sc_0x406E:
			mov r1, #0x406E
			mov r2, #0x586E
			b sc_out
sc_0x406F:
			mov r1, #0x406F
			mov r2, #0x586F
			b sc_out
sc_0x4070:
			mov r1, #0x4070
			mov r2, #0x5870
			b sc_out
sc_0x4071:
			mov r1, #0x4071
			mov r2, #0x5871
			b sc_out
sc_0x4072:
			mov r1, #0x4072
			mov r2, #0x5872
			b sc_out
sc_0x4073:
			mov r1, #0x4073
			mov r2, #0x5873
			b sc_out
sc_0x4074:
			mov r1, #0x4074
			mov r2, #0x5874
			b sc_out
sc_0x4075:
			mov r1, #0x4075
			mov r2, #0x5875
			b sc_out
sc_0x4076:
			mov r1, #0x4076
			mov r2, #0x5876
			b sc_out
sc_0x4077:
			mov r1, #0x4077
			mov r2, #0x5877
			b sc_out
sc_0x4078:
			mov r1, #0x4078
			mov r2, #0x5878
			b sc_out
sc_0x4079:
			mov r1, #0x4079
			mov r2, #0x5879
			b sc_out
sc_0x407A:
			mov r1, #0x407A
			mov r2, #0x587A
			b sc_out
sc_0x407B:
			mov r1, #0x407B
			mov r2, #0x587B
			b sc_out
sc_0x407C:
			mov r1, #0x407C
			mov r2, #0x587C
			b sc_out
sc_0x407D:
			mov r1, #0x407D
			mov r2, #0x587D
			b sc_out
sc_0x407E:
			mov r1, #0x407E
			mov r2, #0x587E
			b sc_out
sc_0x407F:
			mov r1, #0x407F
			mov r2, #0x587F
			b sc_out
sc_0x4160:
			mov r1, #0x4160
			mov r2, #0x5860
			b sc_out
sc_0x4161:
			mov r1, #0x4161
			mov r2, #0x5861
			b sc_out
sc_0x4162:
			mov r1, #0x4162
			mov r2, #0x5862
			b sc_out
sc_0x4163:
			mov r1, #0x4163
			mov r2, #0x5863
			b sc_out
sc_0x4164:
			mov r1, #0x4164
			mov r2, #0x5864
			b sc_out
sc_0x4165:
			mov r1, #0x4165
			mov r2, #0x5865
			b sc_out
sc_0x4166:
			mov r1, #0x4166
			mov r2, #0x5866
			b sc_out
sc_0x4167:
			mov r1, #0x4167
			mov r2, #0x5867
			b sc_out
sc_0x4168:
			mov r1, #0x4168
			mov r2, #0x5868
			b sc_out
sc_0x4169:
			mov r1, #0x4169
			mov r2, #0x5869
			b sc_out
sc_0x416A:
			mov r1, #0x416A
			mov r2, #0x586A
			b sc_out
sc_0x416B:
			mov r1, #0x416B
			mov r2, #0x586B
			b sc_out
sc_0x416C:
			mov r1, #0x416C
			mov r2, #0x586C
			b sc_out
sc_0x416D:
			mov r1, #0x416D
			mov r2, #0x586D
			b sc_out
sc_0x416E:
			mov r1, #0x416E
			mov r2, #0x586E
			b sc_out
sc_0x416F:
			mov r1, #0x416F
			mov r2, #0x586F
			b sc_out
sc_0x4170:
			mov r1, #0x4170
			mov r2, #0x5870
			b sc_out
sc_0x4171:
			mov r1, #0x4171
			mov r2, #0x5871
			b sc_out
sc_0x4172:
			mov r1, #0x4172
			mov r2, #0x5872
			b sc_out
sc_0x4173:
			mov r1, #0x4173
			mov r2, #0x5873
			b sc_out
sc_0x4174:
			mov r1, #0x4174
			mov r2, #0x5874
			b sc_out
sc_0x4175:
			mov r1, #0x4175
			mov r2, #0x5875
			b sc_out
sc_0x4176:
			mov r1, #0x4176
			mov r2, #0x5876
			b sc_out
sc_0x4177:
			mov r1, #0x4177
			mov r2, #0x5877
			b sc_out
sc_0x4178:
			mov r1, #0x4178
			mov r2, #0x5878
			b sc_out
sc_0x4179:
			mov r1, #0x4179
			mov r2, #0x5879
			b sc_out
sc_0x417A:
			mov r1, #0x417A
			mov r2, #0x587A
			b sc_out
sc_0x417B:
			mov r1, #0x417B
			mov r2, #0x587B
			b sc_out
sc_0x417C:
			mov r1, #0x417C
			mov r2, #0x587C
			b sc_out
sc_0x417D:
			mov r1, #0x417D
			mov r2, #0x587D
			b sc_out
sc_0x417E:
			mov r1, #0x417E
			mov r2, #0x587E
			b sc_out
sc_0x417F:
			mov r1, #0x417F
			mov r2, #0x587F
			b sc_out
sc_0x4260:
			mov r1, #0x4260
			mov r2, #0x5860
			b sc_out
sc_0x4261:
			mov r1, #0x4261
			mov r2, #0x5861
			b sc_out
sc_0x4262:
			mov r1, #0x4262
			mov r2, #0x5862
			b sc_out
sc_0x4263:
			mov r1, #0x4263
			mov r2, #0x5863
			b sc_out
sc_0x4264:
			mov r1, #0x4264
			mov r2, #0x5864
			b sc_out
sc_0x4265:
			mov r1, #0x4265
			mov r2, #0x5865
			b sc_out
sc_0x4266:
			mov r1, #0x4266
			mov r2, #0x5866
			b sc_out
sc_0x4267:
			mov r1, #0x4267
			mov r2, #0x5867
			b sc_out
sc_0x4268:
			mov r1, #0x4268
			mov r2, #0x5868
			b sc_out
sc_0x4269:
			mov r1, #0x4269
			mov r2, #0x5869
			b sc_out
sc_0x426A:
			mov r1, #0x426A
			mov r2, #0x586A
			b sc_out
sc_0x426B:
			mov r1, #0x426B
			mov r2, #0x586B
			b sc_out
sc_0x426C:
			mov r1, #0x426C
			mov r2, #0x586C
			b sc_out
sc_0x426D:
			mov r1, #0x426D
			mov r2, #0x586D
			b sc_out
sc_0x426E:
			mov r1, #0x426E
			mov r2, #0x586E
			b sc_out
sc_0x426F:
			mov r1, #0x426F
			mov r2, #0x586F
			b sc_out
sc_0x4270:
			mov r1, #0x4270
			mov r2, #0x5870
			b sc_out
sc_0x4271:
			mov r1, #0x4271
			mov r2, #0x5871
			b sc_out
sc_0x4272:
			mov r1, #0x4272
			mov r2, #0x5872
			b sc_out
sc_0x4273:
			mov r1, #0x4273
			mov r2, #0x5873
			b sc_out
sc_0x4274:
			mov r1, #0x4274
			mov r2, #0x5874
			b sc_out
sc_0x4275:
			mov r1, #0x4275
			mov r2, #0x5875
			b sc_out
sc_0x4276:
			mov r1, #0x4276
			mov r2, #0x5876
			b sc_out
sc_0x4277:
			mov r1, #0x4277
			mov r2, #0x5877
			b sc_out
sc_0x4278:
			mov r1, #0x4278
			mov r2, #0x5878
			b sc_out
sc_0x4279:
			mov r1, #0x4279
			mov r2, #0x5879
			b sc_out
sc_0x427A:
			mov r1, #0x427A
			mov r2, #0x587A
			b sc_out
sc_0x427B:
			mov r1, #0x427B
			mov r2, #0x587B
			b sc_out
sc_0x427C:
			mov r1, #0x427C
			mov r2, #0x587C
			b sc_out
sc_0x427D:
			mov r1, #0x427D
			mov r2, #0x587D
			b sc_out
sc_0x427E:
			mov r1, #0x427E
			mov r2, #0x587E
			b sc_out
sc_0x427F:
			mov r1, #0x427F
			mov r2, #0x587F
			b sc_out
sc_0x4360:
			mov r1, #0x4360
			mov r2, #0x5860
			b sc_out
sc_0x4361:
			mov r1, #0x4361
			mov r2, #0x5861
			b sc_out
sc_0x4362:
			mov r1, #0x4362
			mov r2, #0x5862
			b sc_out
sc_0x4363:
			mov r1, #0x4363
			mov r2, #0x5863
			b sc_out
sc_0x4364:
			mov r1, #0x4364
			mov r2, #0x5864
			b sc_out
sc_0x4365:
			mov r1, #0x4365
			mov r2, #0x5865
			b sc_out
sc_0x4366:
			mov r1, #0x4366
			mov r2, #0x5866
			b sc_out
sc_0x4367:
			mov r1, #0x4367
			mov r2, #0x5867
			b sc_out
sc_0x4368:
			mov r1, #0x4368
			mov r2, #0x5868
			b sc_out
sc_0x4369:
			mov r1, #0x4369
			mov r2, #0x5869
			b sc_out
sc_0x436A:
			mov r1, #0x436A
			mov r2, #0x586A
			b sc_out
sc_0x436B:
			mov r1, #0x436B
			mov r2, #0x586B
			b sc_out
sc_0x436C:
			mov r1, #0x436C
			mov r2, #0x586C
			b sc_out
sc_0x436D:
			mov r1, #0x436D
			mov r2, #0x586D
			b sc_out
sc_0x436E:
			mov r1, #0x436E
			mov r2, #0x586E
			b sc_out
sc_0x436F:
			mov r1, #0x436F
			mov r2, #0x586F
			b sc_out
sc_0x4370:
			mov r1, #0x4370
			mov r2, #0x5870
			b sc_out
sc_0x4371:
			mov r1, #0x4371
			mov r2, #0x5871
			b sc_out
sc_0x4372:
			mov r1, #0x4372
			mov r2, #0x5872
			b sc_out
sc_0x4373:
			mov r1, #0x4373
			mov r2, #0x5873
			b sc_out
sc_0x4374:
			mov r1, #0x4374
			mov r2, #0x5874
			b sc_out
sc_0x4375:
			mov r1, #0x4375
			mov r2, #0x5875
			b sc_out
sc_0x4376:
			mov r1, #0x4376
			mov r2, #0x5876
			b sc_out
sc_0x4377:
			mov r1, #0x4377
			mov r2, #0x5877
			b sc_out
sc_0x4378:
			mov r1, #0x4378
			mov r2, #0x5878
			b sc_out
sc_0x4379:
			mov r1, #0x4379
			mov r2, #0x5879
			b sc_out
sc_0x437A:
			mov r1, #0x437A
			mov r2, #0x587A
			b sc_out
sc_0x437B:
			mov r1, #0x437B
			mov r2, #0x587B
			b sc_out
sc_0x437C:
			mov r1, #0x437C
			mov r2, #0x587C
			b sc_out
sc_0x437D:
			mov r1, #0x437D
			mov r2, #0x587D
			b sc_out
sc_0x437E:
			mov r1, #0x437E
			mov r2, #0x587E
			b sc_out
sc_0x437F:
			mov r1, #0x437F
			mov r2, #0x587F
			b sc_out
sc_0x4460:
			mov r1, #0x4460
			mov r2, #0x5860
			b sc_out
sc_0x4461:
			mov r1, #0x4461
			mov r2, #0x5861
			b sc_out
sc_0x4462:
			mov r1, #0x4462
			mov r2, #0x5862
			b sc_out
sc_0x4463:
			mov r1, #0x4463
			mov r2, #0x5863
			b sc_out
sc_0x4464:
			mov r1, #0x4464
			mov r2, #0x5864
			b sc_out
sc_0x4465:
			mov r1, #0x4465
			mov r2, #0x5865
			b sc_out
sc_0x4466:
			mov r1, #0x4466
			mov r2, #0x5866
			b sc_out
sc_0x4467:
			mov r1, #0x4467
			mov r2, #0x5867
			b sc_out
sc_0x4468:
			mov r1, #0x4468
			mov r2, #0x5868
			b sc_out
sc_0x4469:
			mov r1, #0x4469
			mov r2, #0x5869
			b sc_out
sc_0x446A:
			mov r1, #0x446A
			mov r2, #0x586A
			b sc_out
sc_0x446B:
			mov r1, #0x446B
			mov r2, #0x586B
			b sc_out
sc_0x446C:
			mov r1, #0x446C
			mov r2, #0x586C
			b sc_out
sc_0x446D:
			mov r1, #0x446D
			mov r2, #0x586D
			b sc_out
sc_0x446E:
			mov r1, #0x446E
			mov r2, #0x586E
			b sc_out
sc_0x446F:
			mov r1, #0x446F
			mov r2, #0x586F
			b sc_out
sc_0x4470:
			mov r1, #0x4470
			mov r2, #0x5870
			b sc_out
sc_0x4471:
			mov r1, #0x4471
			mov r2, #0x5871
			b sc_out
sc_0x4472:
			mov r1, #0x4472
			mov r2, #0x5872
			b sc_out
sc_0x4473:
			mov r1, #0x4473
			mov r2, #0x5873
			b sc_out
sc_0x4474:
			mov r1, #0x4474
			mov r2, #0x5874
			b sc_out
sc_0x4475:
			mov r1, #0x4475
			mov r2, #0x5875
			b sc_out
sc_0x4476:
			mov r1, #0x4476
			mov r2, #0x5876
			b sc_out
sc_0x4477:
			mov r1, #0x4477
			mov r2, #0x5877
			b sc_out
sc_0x4478:
			mov r1, #0x4478
			mov r2, #0x5878
			b sc_out
sc_0x4479:
			mov r1, #0x4479
			mov r2, #0x5879
			b sc_out
sc_0x447A:
			mov r1, #0x447A
			mov r2, #0x587A
			b sc_out
sc_0x447B:
			mov r1, #0x447B
			mov r2, #0x587B
			b sc_out
sc_0x447C:
			mov r1, #0x447C
			mov r2, #0x587C
			b sc_out
sc_0x447D:
			mov r1, #0x447D
			mov r2, #0x587D
			b sc_out
sc_0x447E:
			mov r1, #0x447E
			mov r2, #0x587E
			b sc_out
sc_0x447F:
			mov r1, #0x447F
			mov r2, #0x587F
			b sc_out
sc_0x4560:
			mov r1, #0x4560
			mov r2, #0x5860
			b sc_out
sc_0x4561:
			mov r1, #0x4561
			mov r2, #0x5861
			b sc_out
sc_0x4562:
			mov r1, #0x4562
			mov r2, #0x5862
			b sc_out
sc_0x4563:
			mov r1, #0x4563
			mov r2, #0x5863
			b sc_out
sc_0x4564:
			mov r1, #0x4564
			mov r2, #0x5864
			b sc_out
sc_0x4565:
			mov r1, #0x4565
			mov r2, #0x5865
			b sc_out
sc_0x4566:
			mov r1, #0x4566
			mov r2, #0x5866
			b sc_out
sc_0x4567:
			mov r1, #0x4567
			mov r2, #0x5867
			b sc_out
sc_0x4568:
			mov r1, #0x4568
			mov r2, #0x5868
			b sc_out
sc_0x4569:
			mov r1, #0x4569
			mov r2, #0x5869
			b sc_out
sc_0x456A:
			mov r1, #0x456A
			mov r2, #0x586A
			b sc_out
sc_0x456B:
			mov r1, #0x456B
			mov r2, #0x586B
			b sc_out
sc_0x456C:
			mov r1, #0x456C
			mov r2, #0x586C
			b sc_out
sc_0x456D:
			mov r1, #0x456D
			mov r2, #0x586D
			b sc_out
sc_0x456E:
			mov r1, #0x456E
			mov r2, #0x586E
			b sc_out
sc_0x456F:
			mov r1, #0x456F
			mov r2, #0x586F
			b sc_out
sc_0x4570:
			mov r1, #0x4570
			mov r2, #0x5870
			b sc_out
sc_0x4571:
			mov r1, #0x4571
			mov r2, #0x5871
			b sc_out
sc_0x4572:
			mov r1, #0x4572
			mov r2, #0x5872
			b sc_out
sc_0x4573:
			mov r1, #0x4573
			mov r2, #0x5873
			b sc_out
sc_0x4574:
			mov r1, #0x4574
			mov r2, #0x5874
			b sc_out
sc_0x4575:
			mov r1, #0x4575
			mov r2, #0x5875
			b sc_out
sc_0x4576:
			mov r1, #0x4576
			mov r2, #0x5876
			b sc_out
sc_0x4577:
			mov r1, #0x4577
			mov r2, #0x5877
			b sc_out
sc_0x4578:
			mov r1, #0x4578
			mov r2, #0x5878
			b sc_out
sc_0x4579:
			mov r1, #0x4579
			mov r2, #0x5879
			b sc_out
sc_0x457A:
			mov r1, #0x457A
			mov r2, #0x587A
			b sc_out
sc_0x457B:
			mov r1, #0x457B
			mov r2, #0x587B
			b sc_out
sc_0x457C:
			mov r1, #0x457C
			mov r2, #0x587C
			b sc_out
sc_0x457D:
			mov r1, #0x457D
			mov r2, #0x587D
			b sc_out
sc_0x457E:
			mov r1, #0x457E
			mov r2, #0x587E
			b sc_out
sc_0x457F:
			mov r1, #0x457F
			mov r2, #0x587F
			b sc_out
sc_0x4660:
			mov r1, #0x4660
			mov r2, #0x5860
			b sc_out
sc_0x4661:
			mov r1, #0x4661
			mov r2, #0x5861
			b sc_out
sc_0x4662:
			mov r1, #0x4662
			mov r2, #0x5862
			b sc_out
sc_0x4663:
			mov r1, #0x4663
			mov r2, #0x5863
			b sc_out
sc_0x4664:
			mov r1, #0x4664
			mov r2, #0x5864
			b sc_out
sc_0x4665:
			mov r1, #0x4665
			mov r2, #0x5865
			b sc_out
sc_0x4666:
			mov r1, #0x4666
			mov r2, #0x5866
			b sc_out
sc_0x4667:
			mov r1, #0x4667
			mov r2, #0x5867
			b sc_out
sc_0x4668:
			mov r1, #0x4668
			mov r2, #0x5868
			b sc_out
sc_0x4669:
			mov r1, #0x4669
			mov r2, #0x5869
			b sc_out
sc_0x466A:
			mov r1, #0x466A
			mov r2, #0x586A
			b sc_out
sc_0x466B:
			mov r1, #0x466B
			mov r2, #0x586B
			b sc_out
sc_0x466C:
			mov r1, #0x466C
			mov r2, #0x586C
			b sc_out
sc_0x466D:
			mov r1, #0x466D
			mov r2, #0x586D
			b sc_out
sc_0x466E:
			mov r1, #0x466E
			mov r2, #0x586E
			b sc_out
sc_0x466F:
			mov r1, #0x466F
			mov r2, #0x586F
			b sc_out
sc_0x4670:
			mov r1, #0x4670
			mov r2, #0x5870
			b sc_out
sc_0x4671:
			mov r1, #0x4671
			mov r2, #0x5871
			b sc_out
sc_0x4672:
			mov r1, #0x4672
			mov r2, #0x5872
			b sc_out
sc_0x4673:
			mov r1, #0x4673
			mov r2, #0x5873
			b sc_out
sc_0x4674:
			mov r1, #0x4674
			mov r2, #0x5874
			b sc_out
sc_0x4675:
			mov r1, #0x4675
			mov r2, #0x5875
			b sc_out
sc_0x4676:
			mov r1, #0x4676
			mov r2, #0x5876
			b sc_out
sc_0x4677:
			mov r1, #0x4677
			mov r2, #0x5877
			b sc_out
sc_0x4678:
			mov r1, #0x4678
			mov r2, #0x5878
			b sc_out
sc_0x4679:
			mov r1, #0x4679
			mov r2, #0x5879
			b sc_out
sc_0x467A:
			mov r1, #0x467A
			mov r2, #0x587A
			b sc_out
sc_0x467B:
			mov r1, #0x467B
			mov r2, #0x587B
			b sc_out
sc_0x467C:
			mov r1, #0x467C
			mov r2, #0x587C
			b sc_out
sc_0x467D:
			mov r1, #0x467D
			mov r2, #0x587D
			b sc_out
sc_0x467E:
			mov r1, #0x467E
			mov r2, #0x587E
			b sc_out
sc_0x467F:
			mov r1, #0x467F
			mov r2, #0x587F
			b sc_out
sc_0x4760:
			mov r1, #0x4760
			mov r2, #0x5860
			b sc_out
sc_0x4761:
			mov r1, #0x4761
			mov r2, #0x5861
			b sc_out
sc_0x4762:
			mov r1, #0x4762
			mov r2, #0x5862
			b sc_out
sc_0x4763:
			mov r1, #0x4763
			mov r2, #0x5863
			b sc_out
sc_0x4764:
			mov r1, #0x4764
			mov r2, #0x5864
			b sc_out
sc_0x4765:
			mov r1, #0x4765
			mov r2, #0x5865
			b sc_out
sc_0x4766:
			mov r1, #0x4766
			mov r2, #0x5866
			b sc_out
sc_0x4767:
			mov r1, #0x4767
			mov r2, #0x5867
			b sc_out
sc_0x4768:
			mov r1, #0x4768
			mov r2, #0x5868
			b sc_out
sc_0x4769:
			mov r1, #0x4769
			mov r2, #0x5869
			b sc_out
sc_0x476A:
			mov r1, #0x476A
			mov r2, #0x586A
			b sc_out
sc_0x476B:
			mov r1, #0x476B
			mov r2, #0x586B
			b sc_out
sc_0x476C:
			mov r1, #0x476C
			mov r2, #0x586C
			b sc_out
sc_0x476D:
			mov r1, #0x476D
			mov r2, #0x586D
			b sc_out
sc_0x476E:
			mov r1, #0x476E
			mov r2, #0x586E
			b sc_out
sc_0x476F:
			mov r1, #0x476F
			mov r2, #0x586F
			b sc_out
sc_0x4770:
			mov r1, #0x4770
			mov r2, #0x5870
			b sc_out
sc_0x4771:
			mov r1, #0x4771
			mov r2, #0x5871
			b sc_out
sc_0x4772:
			mov r1, #0x4772
			mov r2, #0x5872
			b sc_out
sc_0x4773:
			mov r1, #0x4773
			mov r2, #0x5873
			b sc_out
sc_0x4774:
			mov r1, #0x4774
			mov r2, #0x5874
			b sc_out
sc_0x4775:
			mov r1, #0x4775
			mov r2, #0x5875
			b sc_out
sc_0x4776:
			mov r1, #0x4776
			mov r2, #0x5876
			b sc_out
sc_0x4777:
			mov r1, #0x4777
			mov r2, #0x5877
			b sc_out
sc_0x4778:
			mov r1, #0x4778
			mov r2, #0x5878
			b sc_out
sc_0x4779:
			mov r1, #0x4779
			mov r2, #0x5879
			b sc_out
sc_0x477A:
			mov r1, #0x477A
			mov r2, #0x587A
			b sc_out
sc_0x477B:
			mov r1, #0x477B
			mov r2, #0x587B
			b sc_out
sc_0x477C:
			mov r1, #0x477C
			mov r2, #0x587C
			b sc_out
sc_0x477D:
			mov r1, #0x477D
			mov r2, #0x587D
			b sc_out
sc_0x477E:
			mov r1, #0x477E
			mov r2, #0x587E
			b sc_out
sc_0x477F:
			mov r1, #0x477F
			mov r2, #0x587F
			b sc_out
sc_0x4080:
			mov r1, #0x4080
			mov r2, #0x5880
			b sc_out
sc_0x4081:
			mov r1, #0x4081
			mov r2, #0x5881
			b sc_out
sc_0x4082:
			mov r1, #0x4082
			mov r2, #0x5882
			b sc_out
sc_0x4083:
			mov r1, #0x4083
			mov r2, #0x5883
			b sc_out
sc_0x4084:
			mov r1, #0x4084
			mov r2, #0x5884
			b sc_out
sc_0x4085:
			mov r1, #0x4085
			mov r2, #0x5885
			b sc_out
sc_0x4086:
			mov r1, #0x4086
			mov r2, #0x5886
			b sc_out
sc_0x4087:
			mov r1, #0x4087
			mov r2, #0x5887
			b sc_out
sc_0x4088:
			mov r1, #0x4088
			mov r2, #0x5888
			b sc_out
sc_0x4089:
			mov r1, #0x4089
			mov r2, #0x5889
			b sc_out
sc_0x408A:
			mov r1, #0x408A
			mov r2, #0x588A
			b sc_out
sc_0x408B:
			mov r1, #0x408B
			mov r2, #0x588B
			b sc_out
sc_0x408C:
			mov r1, #0x408C
			mov r2, #0x588C
			b sc_out
sc_0x408D:
			mov r1, #0x408D
			mov r2, #0x588D
			b sc_out
sc_0x408E:
			mov r1, #0x408E
			mov r2, #0x588E
			b sc_out
sc_0x408F:
			mov r1, #0x408F
			mov r2, #0x588F
			b sc_out
sc_0x4090:
			mov r1, #0x4090
			mov r2, #0x5890
			b sc_out
sc_0x4091:
			mov r1, #0x4091
			mov r2, #0x5891
			b sc_out
sc_0x4092:
			mov r1, #0x4092
			mov r2, #0x5892
			b sc_out
sc_0x4093:
			mov r1, #0x4093
			mov r2, #0x5893
			b sc_out
sc_0x4094:
			mov r1, #0x4094
			mov r2, #0x5894
			b sc_out
sc_0x4095:
			mov r1, #0x4095
			mov r2, #0x5895
			b sc_out
sc_0x4096:
			mov r1, #0x4096
			mov r2, #0x5896
			b sc_out
sc_0x4097:
			mov r1, #0x4097
			mov r2, #0x5897
			b sc_out
sc_0x4098:
			mov r1, #0x4098
			mov r2, #0x5898
			b sc_out
sc_0x4099:
			mov r1, #0x4099
			mov r2, #0x5899
			b sc_out
sc_0x409A:
			mov r1, #0x409A
			mov r2, #0x589A
			b sc_out
sc_0x409B:
			mov r1, #0x409B
			mov r2, #0x589B
			b sc_out
sc_0x409C:
			mov r1, #0x409C
			mov r2, #0x589C
			b sc_out
sc_0x409D:
			mov r1, #0x409D
			mov r2, #0x589D
			b sc_out
sc_0x409E:
			mov r1, #0x409E
			mov r2, #0x589E
			b sc_out
sc_0x409F:
			mov r1, #0x409F
			mov r2, #0x589F
			b sc_out
sc_0x4180:
			mov r1, #0x4180
			mov r2, #0x5880
			b sc_out
sc_0x4181:
			mov r1, #0x4181
			mov r2, #0x5881
			b sc_out
sc_0x4182:
			mov r1, #0x4182
			mov r2, #0x5882
			b sc_out
sc_0x4183:
			mov r1, #0x4183
			mov r2, #0x5883
			b sc_out
sc_0x4184:
			mov r1, #0x4184
			mov r2, #0x5884
			b sc_out
sc_0x4185:
			mov r1, #0x4185
			mov r2, #0x5885
			b sc_out
sc_0x4186:
			mov r1, #0x4186
			mov r2, #0x5886
			b sc_out
sc_0x4187:
			mov r1, #0x4187
			mov r2, #0x5887
			b sc_out
sc_0x4188:
			mov r1, #0x4188
			mov r2, #0x5888
			b sc_out
sc_0x4189:
			mov r1, #0x4189
			mov r2, #0x5889
			b sc_out
sc_0x418A:
			mov r1, #0x418A
			mov r2, #0x588A
			b sc_out
sc_0x418B:
			mov r1, #0x418B
			mov r2, #0x588B
			b sc_out
sc_0x418C:
			mov r1, #0x418C
			mov r2, #0x588C
			b sc_out
sc_0x418D:
			mov r1, #0x418D
			mov r2, #0x588D
			b sc_out
sc_0x418E:
			mov r1, #0x418E
			mov r2, #0x588E
			b sc_out
sc_0x418F:
			mov r1, #0x418F
			mov r2, #0x588F
			b sc_out
sc_0x4190:
			mov r1, #0x4190
			mov r2, #0x5890
			b sc_out
sc_0x4191:
			mov r1, #0x4191
			mov r2, #0x5891
			b sc_out
sc_0x4192:
			mov r1, #0x4192
			mov r2, #0x5892
			b sc_out
sc_0x4193:
			mov r1, #0x4193
			mov r2, #0x5893
			b sc_out
sc_0x4194:
			mov r1, #0x4194
			mov r2, #0x5894
			b sc_out
sc_0x4195:
			mov r1, #0x4195
			mov r2, #0x5895
			b sc_out
sc_0x4196:
			mov r1, #0x4196
			mov r2, #0x5896
			b sc_out
sc_0x4197:
			mov r1, #0x4197
			mov r2, #0x5897
			b sc_out
sc_0x4198:
			mov r1, #0x4198
			mov r2, #0x5898
			b sc_out
sc_0x4199:
			mov r1, #0x4199
			mov r2, #0x5899
			b sc_out
sc_0x419A:
			mov r1, #0x419A
			mov r2, #0x589A
			b sc_out
sc_0x419B:
			mov r1, #0x419B
			mov r2, #0x589B
			b sc_out
sc_0x419C:
			mov r1, #0x419C
			mov r2, #0x589C
			b sc_out
sc_0x419D:
			mov r1, #0x419D
			mov r2, #0x589D
			b sc_out
sc_0x419E:
			mov r1, #0x419E
			mov r2, #0x589E
			b sc_out
sc_0x419F:
			mov r1, #0x419F
			mov r2, #0x589F
			b sc_out
sc_0x4280:
			mov r1, #0x4280
			mov r2, #0x5880
			b sc_out
sc_0x4281:
			mov r1, #0x4281
			mov r2, #0x5881
			b sc_out
sc_0x4282:
			mov r1, #0x4282
			mov r2, #0x5882
			b sc_out
sc_0x4283:
			mov r1, #0x4283
			mov r2, #0x5883
			b sc_out
sc_0x4284:
			mov r1, #0x4284
			mov r2, #0x5884
			b sc_out
sc_0x4285:
			mov r1, #0x4285
			mov r2, #0x5885
			b sc_out
sc_0x4286:
			mov r1, #0x4286
			mov r2, #0x5886
			b sc_out
sc_0x4287:
			mov r1, #0x4287
			mov r2, #0x5887
			b sc_out
sc_0x4288:
			mov r1, #0x4288
			mov r2, #0x5888
			b sc_out
sc_0x4289:
			mov r1, #0x4289
			mov r2, #0x5889
			b sc_out
sc_0x428A:
			mov r1, #0x428A
			mov r2, #0x588A
			b sc_out
sc_0x428B:
			mov r1, #0x428B
			mov r2, #0x588B
			b sc_out
sc_0x428C:
			mov r1, #0x428C
			mov r2, #0x588C
			b sc_out
sc_0x428D:
			mov r1, #0x428D
			mov r2, #0x588D
			b sc_out
sc_0x428E:
			mov r1, #0x428E
			mov r2, #0x588E
			b sc_out
sc_0x428F:
			mov r1, #0x428F
			mov r2, #0x588F
			b sc_out
sc_0x4290:
			mov r1, #0x4290
			mov r2, #0x5890
			b sc_out
sc_0x4291:
			mov r1, #0x4291
			mov r2, #0x5891
			b sc_out
sc_0x4292:
			mov r1, #0x4292
			mov r2, #0x5892
			b sc_out
sc_0x4293:
			mov r1, #0x4293
			mov r2, #0x5893
			b sc_out
sc_0x4294:
			mov r1, #0x4294
			mov r2, #0x5894
			b sc_out
sc_0x4295:
			mov r1, #0x4295
			mov r2, #0x5895
			b sc_out
sc_0x4296:
			mov r1, #0x4296
			mov r2, #0x5896
			b sc_out
sc_0x4297:
			mov r1, #0x4297
			mov r2, #0x5897
			b sc_out
sc_0x4298:
			mov r1, #0x4298
			mov r2, #0x5898
			b sc_out
sc_0x4299:
			mov r1, #0x4299
			mov r2, #0x5899
			b sc_out
sc_0x429A:
			mov r1, #0x429A
			mov r2, #0x589A
			b sc_out
sc_0x429B:
			mov r1, #0x429B
			mov r2, #0x589B
			b sc_out
sc_0x429C:
			mov r1, #0x429C
			mov r2, #0x589C
			b sc_out
sc_0x429D:
			mov r1, #0x429D
			mov r2, #0x589D
			b sc_out
sc_0x429E:
			mov r1, #0x429E
			mov r2, #0x589E
			b sc_out
sc_0x429F:
			mov r1, #0x429F
			mov r2, #0x589F
			b sc_out
sc_0x4380:
			mov r1, #0x4380
			mov r2, #0x5880
			b sc_out
sc_0x4381:
			mov r1, #0x4381
			mov r2, #0x5881
			b sc_out
sc_0x4382:
			mov r1, #0x4382
			mov r2, #0x5882
			b sc_out
sc_0x4383:
			mov r1, #0x4383
			mov r2, #0x5883
			b sc_out
sc_0x4384:
			mov r1, #0x4384
			mov r2, #0x5884
			b sc_out
sc_0x4385:
			mov r1, #0x4385
			mov r2, #0x5885
			b sc_out
sc_0x4386:
			mov r1, #0x4386
			mov r2, #0x5886
			b sc_out
sc_0x4387:
			mov r1, #0x4387
			mov r2, #0x5887
			b sc_out
sc_0x4388:
			mov r1, #0x4388
			mov r2, #0x5888
			b sc_out
sc_0x4389:
			mov r1, #0x4389
			mov r2, #0x5889
			b sc_out
sc_0x438A:
			mov r1, #0x438A
			mov r2, #0x588A
			b sc_out
sc_0x438B:
			mov r1, #0x438B
			mov r2, #0x588B
			b sc_out
sc_0x438C:
			mov r1, #0x438C
			mov r2, #0x588C
			b sc_out
sc_0x438D:
			mov r1, #0x438D
			mov r2, #0x588D
			b sc_out
sc_0x438E:
			mov r1, #0x438E
			mov r2, #0x588E
			b sc_out
sc_0x438F:
			mov r1, #0x438F
			mov r2, #0x588F
			b sc_out
sc_0x4390:
			mov r1, #0x4390
			mov r2, #0x5890
			b sc_out
sc_0x4391:
			mov r1, #0x4391
			mov r2, #0x5891
			b sc_out
sc_0x4392:
			mov r1, #0x4392
			mov r2, #0x5892
			b sc_out
sc_0x4393:
			mov r1, #0x4393
			mov r2, #0x5893
			b sc_out
sc_0x4394:
			mov r1, #0x4394
			mov r2, #0x5894
			b sc_out
sc_0x4395:
			mov r1, #0x4395
			mov r2, #0x5895
			b sc_out
sc_0x4396:
			mov r1, #0x4396
			mov r2, #0x5896
			b sc_out
sc_0x4397:
			mov r1, #0x4397
			mov r2, #0x5897
			b sc_out
sc_0x4398:
			mov r1, #0x4398
			mov r2, #0x5898
			b sc_out
sc_0x4399:
			mov r1, #0x4399
			mov r2, #0x5899
			b sc_out
sc_0x439A:
			mov r1, #0x439A
			mov r2, #0x589A
			b sc_out
sc_0x439B:
			mov r1, #0x439B
			mov r2, #0x589B
			b sc_out
sc_0x439C:
			mov r1, #0x439C
			mov r2, #0x589C
			b sc_out
sc_0x439D:
			mov r1, #0x439D
			mov r2, #0x589D
			b sc_out
sc_0x439E:
			mov r1, #0x439E
			mov r2, #0x589E
			b sc_out
sc_0x439F:
			mov r1, #0x439F
			mov r2, #0x589F
			b sc_out
sc_0x4480:
			mov r1, #0x4480
			mov r2, #0x5880
			b sc_out
sc_0x4481:
			mov r1, #0x4481
			mov r2, #0x5881
			b sc_out
sc_0x4482:
			mov r1, #0x4482
			mov r2, #0x5882
			b sc_out
sc_0x4483:
			mov r1, #0x4483
			mov r2, #0x5883
			b sc_out
sc_0x4484:
			mov r1, #0x4484
			mov r2, #0x5884
			b sc_out
sc_0x4485:
			mov r1, #0x4485
			mov r2, #0x5885
			b sc_out
sc_0x4486:
			mov r1, #0x4486
			mov r2, #0x5886
			b sc_out
sc_0x4487:
			mov r1, #0x4487
			mov r2, #0x5887
			b sc_out
sc_0x4488:
			mov r1, #0x4488
			mov r2, #0x5888
			b sc_out
sc_0x4489:
			mov r1, #0x4489
			mov r2, #0x5889
			b sc_out
sc_0x448A:
			mov r1, #0x448A
			mov r2, #0x588A
			b sc_out
sc_0x448B:
			mov r1, #0x448B
			mov r2, #0x588B
			b sc_out
sc_0x448C:
			mov r1, #0x448C
			mov r2, #0x588C
			b sc_out
sc_0x448D:
			mov r1, #0x448D
			mov r2, #0x588D
			b sc_out
sc_0x448E:
			mov r1, #0x448E
			mov r2, #0x588E
			b sc_out
sc_0x448F:
			mov r1, #0x448F
			mov r2, #0x588F
			b sc_out
sc_0x4490:
			mov r1, #0x4490
			mov r2, #0x5890
			b sc_out
sc_0x4491:
			mov r1, #0x4491
			mov r2, #0x5891
			b sc_out
sc_0x4492:
			mov r1, #0x4492
			mov r2, #0x5892
			b sc_out
sc_0x4493:
			mov r1, #0x4493
			mov r2, #0x5893
			b sc_out
sc_0x4494:
			mov r1, #0x4494
			mov r2, #0x5894
			b sc_out
sc_0x4495:
			mov r1, #0x4495
			mov r2, #0x5895
			b sc_out
sc_0x4496:
			mov r1, #0x4496
			mov r2, #0x5896
			b sc_out
sc_0x4497:
			mov r1, #0x4497
			mov r2, #0x5897
			b sc_out
sc_0x4498:
			mov r1, #0x4498
			mov r2, #0x5898
			b sc_out
sc_0x4499:
			mov r1, #0x4499
			mov r2, #0x5899
			b sc_out
sc_0x449A:
			mov r1, #0x449A
			mov r2, #0x589A
			b sc_out
sc_0x449B:
			mov r1, #0x449B
			mov r2, #0x589B
			b sc_out
sc_0x449C:
			mov r1, #0x449C
			mov r2, #0x589C
			b sc_out
sc_0x449D:
			mov r1, #0x449D
			mov r2, #0x589D
			b sc_out
sc_0x449E:
			mov r1, #0x449E
			mov r2, #0x589E
			b sc_out
sc_0x449F:
			mov r1, #0x449F
			mov r2, #0x589F
			b sc_out
sc_0x4580:
			mov r1, #0x4580
			mov r2, #0x5880
			b sc_out
sc_0x4581:
			mov r1, #0x4581
			mov r2, #0x5881
			b sc_out
sc_0x4582:
			mov r1, #0x4582
			mov r2, #0x5882
			b sc_out
sc_0x4583:
			mov r1, #0x4583
			mov r2, #0x5883
			b sc_out
sc_0x4584:
			mov r1, #0x4584
			mov r2, #0x5884
			b sc_out
sc_0x4585:
			mov r1, #0x4585
			mov r2, #0x5885
			b sc_out
sc_0x4586:
			mov r1, #0x4586
			mov r2, #0x5886
			b sc_out
sc_0x4587:
			mov r1, #0x4587
			mov r2, #0x5887
			b sc_out
sc_0x4588:
			mov r1, #0x4588
			mov r2, #0x5888
			b sc_out
sc_0x4589:
			mov r1, #0x4589
			mov r2, #0x5889
			b sc_out
sc_0x458A:
			mov r1, #0x458A
			mov r2, #0x588A
			b sc_out
sc_0x458B:
			mov r1, #0x458B
			mov r2, #0x588B
			b sc_out
sc_0x458C:
			mov r1, #0x458C
			mov r2, #0x588C
			b sc_out
sc_0x458D:
			mov r1, #0x458D
			mov r2, #0x588D
			b sc_out
sc_0x458E:
			mov r1, #0x458E
			mov r2, #0x588E
			b sc_out
sc_0x458F:
			mov r1, #0x458F
			mov r2, #0x588F
			b sc_out
sc_0x4590:
			mov r1, #0x4590
			mov r2, #0x5890
			b sc_out
sc_0x4591:
			mov r1, #0x4591
			mov r2, #0x5891
			b sc_out
sc_0x4592:
			mov r1, #0x4592
			mov r2, #0x5892
			b sc_out
sc_0x4593:
			mov r1, #0x4593
			mov r2, #0x5893
			b sc_out
sc_0x4594:
			mov r1, #0x4594
			mov r2, #0x5894
			b sc_out
sc_0x4595:
			mov r1, #0x4595
			mov r2, #0x5895
			b sc_out
sc_0x4596:
			mov r1, #0x4596
			mov r2, #0x5896
			b sc_out
sc_0x4597:
			mov r1, #0x4597
			mov r2, #0x5897
			b sc_out
sc_0x4598:
			mov r1, #0x4598
			mov r2, #0x5898
			b sc_out
sc_0x4599:
			mov r1, #0x4599
			mov r2, #0x5899
			b sc_out
sc_0x459A:
			mov r1, #0x459A
			mov r2, #0x589A
			b sc_out
sc_0x459B:
			mov r1, #0x459B
			mov r2, #0x589B
			b sc_out
sc_0x459C:
			mov r1, #0x459C
			mov r2, #0x589C
			b sc_out
sc_0x459D:
			mov r1, #0x459D
			mov r2, #0x589D
			b sc_out
sc_0x459E:
			mov r1, #0x459E
			mov r2, #0x589E
			b sc_out
sc_0x459F:
			mov r1, #0x459F
			mov r2, #0x589F
			b sc_out
sc_0x4680:
			mov r1, #0x4680
			mov r2, #0x5880
			b sc_out
sc_0x4681:
			mov r1, #0x4681
			mov r2, #0x5881
			b sc_out
sc_0x4682:
			mov r1, #0x4682
			mov r2, #0x5882
			b sc_out
sc_0x4683:
			mov r1, #0x4683
			mov r2, #0x5883
			b sc_out
sc_0x4684:
			mov r1, #0x4684
			mov r2, #0x5884
			b sc_out
sc_0x4685:
			mov r1, #0x4685
			mov r2, #0x5885
			b sc_out
sc_0x4686:
			mov r1, #0x4686
			mov r2, #0x5886
			b sc_out
sc_0x4687:
			mov r1, #0x4687
			mov r2, #0x5887
			b sc_out
sc_0x4688:
			mov r1, #0x4688
			mov r2, #0x5888
			b sc_out
sc_0x4689:
			mov r1, #0x4689
			mov r2, #0x5889
			b sc_out
sc_0x468A:
			mov r1, #0x468A
			mov r2, #0x588A
			b sc_out
sc_0x468B:
			mov r1, #0x468B
			mov r2, #0x588B
			b sc_out
sc_0x468C:
			mov r1, #0x468C
			mov r2, #0x588C
			b sc_out
sc_0x468D:
			mov r1, #0x468D
			mov r2, #0x588D
			b sc_out
sc_0x468E:
			mov r1, #0x468E
			mov r2, #0x588E
			b sc_out
sc_0x468F:
			mov r1, #0x468F
			mov r2, #0x588F
			b sc_out
sc_0x4690:
			mov r1, #0x4690
			mov r2, #0x5890
			b sc_out
sc_0x4691:
			mov r1, #0x4691
			mov r2, #0x5891
			b sc_out
sc_0x4692:
			mov r1, #0x4692
			mov r2, #0x5892
			b sc_out
sc_0x4693:
			mov r1, #0x4693
			mov r2, #0x5893
			b sc_out
sc_0x4694:
			mov r1, #0x4694
			mov r2, #0x5894
			b sc_out
sc_0x4695:
			mov r1, #0x4695
			mov r2, #0x5895
			b sc_out
sc_0x4696:
			mov r1, #0x4696
			mov r2, #0x5896
			b sc_out
sc_0x4697:
			mov r1, #0x4697
			mov r2, #0x5897
			b sc_out
sc_0x4698:
			mov r1, #0x4698
			mov r2, #0x5898
			b sc_out
sc_0x4699:
			mov r1, #0x4699
			mov r2, #0x5899
			b sc_out
sc_0x469A:
			mov r1, #0x469A
			mov r2, #0x589A
			b sc_out
sc_0x469B:
			mov r1, #0x469B
			mov r2, #0x589B
			b sc_out
sc_0x469C:
			mov r1, #0x469C
			mov r2, #0x589C
			b sc_out
sc_0x469D:
			mov r1, #0x469D
			mov r2, #0x589D
			b sc_out
sc_0x469E:
			mov r1, #0x469E
			mov r2, #0x589E
			b sc_out
sc_0x469F:
			mov r1, #0x469F
			mov r2, #0x589F
			b sc_out
sc_0x4780:
			mov r1, #0x4780
			mov r2, #0x5880
			b sc_out
sc_0x4781:
			mov r1, #0x4781
			mov r2, #0x5881
			b sc_out
sc_0x4782:
			mov r1, #0x4782
			mov r2, #0x5882
			b sc_out
sc_0x4783:
			mov r1, #0x4783
			mov r2, #0x5883
			b sc_out
sc_0x4784:
			mov r1, #0x4784
			mov r2, #0x5884
			b sc_out
sc_0x4785:
			mov r1, #0x4785
			mov r2, #0x5885
			b sc_out
sc_0x4786:
			mov r1, #0x4786
			mov r2, #0x5886
			b sc_out
sc_0x4787:
			mov r1, #0x4787
			mov r2, #0x5887
			b sc_out
sc_0x4788:
			mov r1, #0x4788
			mov r2, #0x5888
			b sc_out
sc_0x4789:
			mov r1, #0x4789
			mov r2, #0x5889
			b sc_out
sc_0x478A:
			mov r1, #0x478A
			mov r2, #0x588A
			b sc_out
sc_0x478B:
			mov r1, #0x478B
			mov r2, #0x588B
			b sc_out
sc_0x478C:
			mov r1, #0x478C
			mov r2, #0x588C
			b sc_out
sc_0x478D:
			mov r1, #0x478D
			mov r2, #0x588D
			b sc_out
sc_0x478E:
			mov r1, #0x478E
			mov r2, #0x588E
			b sc_out
sc_0x478F:
			mov r1, #0x478F
			mov r2, #0x588F
			b sc_out
sc_0x4790:
			mov r1, #0x4790
			mov r2, #0x5890
			b sc_out
sc_0x4791:
			mov r1, #0x4791
			mov r2, #0x5891
			b sc_out
sc_0x4792:
			mov r1, #0x4792
			mov r2, #0x5892
			b sc_out
sc_0x4793:
			mov r1, #0x4793
			mov r2, #0x5893
			b sc_out
sc_0x4794:
			mov r1, #0x4794
			mov r2, #0x5894
			b sc_out
sc_0x4795:
			mov r1, #0x4795
			mov r2, #0x5895
			b sc_out
sc_0x4796:
			mov r1, #0x4796
			mov r2, #0x5896
			b sc_out
sc_0x4797:
			mov r1, #0x4797
			mov r2, #0x5897
			b sc_out
sc_0x4798:
			mov r1, #0x4798
			mov r2, #0x5898
			b sc_out
sc_0x4799:
			mov r1, #0x4799
			mov r2, #0x5899
			b sc_out
sc_0x479A:
			mov r1, #0x479A
			mov r2, #0x589A
			b sc_out
sc_0x479B:
			mov r1, #0x479B
			mov r2, #0x589B
			b sc_out
sc_0x479C:
			mov r1, #0x479C
			mov r2, #0x589C
			b sc_out
sc_0x479D:
			mov r1, #0x479D
			mov r2, #0x589D
			b sc_out
sc_0x479E:
			mov r1, #0x479E
			mov r2, #0x589E
			b sc_out
sc_0x479F:
			mov r1, #0x479F
			mov r2, #0x589F
			b sc_out
sc_0x40A0:
			mov r1, #0x40A0
			mov r2, #0x58A0
			b sc_out
sc_0x40A1:
			mov r1, #0x40A1
			mov r2, #0x58A1
			b sc_out
sc_0x40A2:
			mov r1, #0x40A2
			mov r2, #0x58A2
			b sc_out
sc_0x40A3:
			mov r1, #0x40A3
			mov r2, #0x58A3
			b sc_out
sc_0x40A4:
			mov r1, #0x40A4
			mov r2, #0x58A4
			b sc_out
sc_0x40A5:
			mov r1, #0x40A5
			mov r2, #0x58A5
			b sc_out
sc_0x40A6:
			mov r1, #0x40A6
			mov r2, #0x58A6
			b sc_out
sc_0x40A7:
			mov r1, #0x40A7
			mov r2, #0x58A7
			b sc_out
sc_0x40A8:
			mov r1, #0x40A8
			mov r2, #0x58A8
			b sc_out
sc_0x40A9:
			mov r1, #0x40A9
			mov r2, #0x58A9
			b sc_out
sc_0x40AA:
			mov r1, #0x40AA
			mov r2, #0x58AA
			b sc_out
sc_0x40AB:
			mov r1, #0x40AB
			mov r2, #0x58AB
			b sc_out
sc_0x40AC:
			mov r1, #0x40AC
			mov r2, #0x58AC
			b sc_out
sc_0x40AD:
			mov r1, #0x40AD
			mov r2, #0x58AD
			b sc_out
sc_0x40AE:
			mov r1, #0x40AE
			mov r2, #0x58AE
			b sc_out
sc_0x40AF:
			mov r1, #0x40AF
			mov r2, #0x58AF
			b sc_out
sc_0x40B0:
			mov r1, #0x40B0
			mov r2, #0x58B0
			b sc_out
sc_0x40B1:
			mov r1, #0x40B1
			mov r2, #0x58B1
			b sc_out
sc_0x40B2:
			mov r1, #0x40B2
			mov r2, #0x58B2
			b sc_out
sc_0x40B3:
			mov r1, #0x40B3
			mov r2, #0x58B3
			b sc_out
sc_0x40B4:
			mov r1, #0x40B4
			mov r2, #0x58B4
			b sc_out
sc_0x40B5:
			mov r1, #0x40B5
			mov r2, #0x58B5
			b sc_out
sc_0x40B6:
			mov r1, #0x40B6
			mov r2, #0x58B6
			b sc_out
sc_0x40B7:
			mov r1, #0x40B7
			mov r2, #0x58B7
			b sc_out
sc_0x40B8:
			mov r1, #0x40B8
			mov r2, #0x58B8
			b sc_out
sc_0x40B9:
			mov r1, #0x40B9
			mov r2, #0x58B9
			b sc_out
sc_0x40BA:
			mov r1, #0x40BA
			mov r2, #0x58BA
			b sc_out
sc_0x40BB:
			mov r1, #0x40BB
			mov r2, #0x58BB
			b sc_out
sc_0x40BC:
			mov r1, #0x40BC
			mov r2, #0x58BC
			b sc_out
sc_0x40BD:
			mov r1, #0x40BD
			mov r2, #0x58BD
			b sc_out
sc_0x40BE:
			mov r1, #0x40BE
			mov r2, #0x58BE
			b sc_out
sc_0x40BF:
			mov r1, #0x40BF
			mov r2, #0x58BF
			b sc_out
sc_0x41A0:
			mov r1, #0x41A0
			mov r2, #0x58A0
			b sc_out
sc_0x41A1:
			mov r1, #0x41A1
			mov r2, #0x58A1
			b sc_out
sc_0x41A2:
			mov r1, #0x41A2
			mov r2, #0x58A2
			b sc_out
sc_0x41A3:
			mov r1, #0x41A3
			mov r2, #0x58A3
			b sc_out
sc_0x41A4:
			mov r1, #0x41A4
			mov r2, #0x58A4
			b sc_out
sc_0x41A5:
			mov r1, #0x41A5
			mov r2, #0x58A5
			b sc_out
sc_0x41A6:
			mov r1, #0x41A6
			mov r2, #0x58A6
			b sc_out
sc_0x41A7:
			mov r1, #0x41A7
			mov r2, #0x58A7
			b sc_out
sc_0x41A8:
			mov r1, #0x41A8
			mov r2, #0x58A8
			b sc_out
sc_0x41A9:
			mov r1, #0x41A9
			mov r2, #0x58A9
			b sc_out
sc_0x41AA:
			mov r1, #0x41AA
			mov r2, #0x58AA
			b sc_out
sc_0x41AB:
			mov r1, #0x41AB
			mov r2, #0x58AB
			b sc_out
sc_0x41AC:
			mov r1, #0x41AC
			mov r2, #0x58AC
			b sc_out
sc_0x41AD:
			mov r1, #0x41AD
			mov r2, #0x58AD
			b sc_out
sc_0x41AE:
			mov r1, #0x41AE
			mov r2, #0x58AE
			b sc_out
sc_0x41AF:
			mov r1, #0x41AF
			mov r2, #0x58AF
			b sc_out
sc_0x41B0:
			mov r1, #0x41B0
			mov r2, #0x58B0
			b sc_out
sc_0x41B1:
			mov r1, #0x41B1
			mov r2, #0x58B1
			b sc_out
sc_0x41B2:
			mov r1, #0x41B2
			mov r2, #0x58B2
			b sc_out
sc_0x41B3:
			mov r1, #0x41B3
			mov r2, #0x58B3
			b sc_out
sc_0x41B4:
			mov r1, #0x41B4
			mov r2, #0x58B4
			b sc_out
sc_0x41B5:
			mov r1, #0x41B5
			mov r2, #0x58B5
			b sc_out
sc_0x41B6:
			mov r1, #0x41B6
			mov r2, #0x58B6
			b sc_out
sc_0x41B7:
			mov r1, #0x41B7
			mov r2, #0x58B7
			b sc_out
sc_0x41B8:
			mov r1, #0x41B8
			mov r2, #0x58B8
			b sc_out
sc_0x41B9:
			mov r1, #0x41B9
			mov r2, #0x58B9
			b sc_out
sc_0x41BA:
			mov r1, #0x41BA
			mov r2, #0x58BA
			b sc_out
sc_0x41BB:
			mov r1, #0x41BB
			mov r2, #0x58BB
			b sc_out
sc_0x41BC:
			mov r1, #0x41BC
			mov r2, #0x58BC
			b sc_out
sc_0x41BD:
			mov r1, #0x41BD
			mov r2, #0x58BD
			b sc_out
sc_0x41BE:
			mov r1, #0x41BE
			mov r2, #0x58BE
			b sc_out
sc_0x41BF:
			mov r1, #0x41BF
			mov r2, #0x58BF
			b sc_out
sc_0x42A0:
			mov r1, #0x42A0
			mov r2, #0x58A0
			b sc_out
sc_0x42A1:
			mov r1, #0x42A1
			mov r2, #0x58A1
			b sc_out
sc_0x42A2:
			mov r1, #0x42A2
			mov r2, #0x58A2
			b sc_out
sc_0x42A3:
			mov r1, #0x42A3
			mov r2, #0x58A3
			b sc_out
sc_0x42A4:
			mov r1, #0x42A4
			mov r2, #0x58A4
			b sc_out
sc_0x42A5:
			mov r1, #0x42A5
			mov r2, #0x58A5
			b sc_out
sc_0x42A6:
			mov r1, #0x42A6
			mov r2, #0x58A6
			b sc_out
sc_0x42A7:
			mov r1, #0x42A7
			mov r2, #0x58A7
			b sc_out
sc_0x42A8:
			mov r1, #0x42A8
			mov r2, #0x58A8
			b sc_out
sc_0x42A9:
			mov r1, #0x42A9
			mov r2, #0x58A9
			b sc_out
sc_0x42AA:
			mov r1, #0x42AA
			mov r2, #0x58AA
			b sc_out
sc_0x42AB:
			mov r1, #0x42AB
			mov r2, #0x58AB
			b sc_out
sc_0x42AC:
			mov r1, #0x42AC
			mov r2, #0x58AC
			b sc_out
sc_0x42AD:
			mov r1, #0x42AD
			mov r2, #0x58AD
			b sc_out
sc_0x42AE:
			mov r1, #0x42AE
			mov r2, #0x58AE
			b sc_out
sc_0x42AF:
			mov r1, #0x42AF
			mov r2, #0x58AF
			b sc_out
sc_0x42B0:
			mov r1, #0x42B0
			mov r2, #0x58B0
			b sc_out
sc_0x42B1:
			mov r1, #0x42B1
			mov r2, #0x58B1
			b sc_out
sc_0x42B2:
			mov r1, #0x42B2
			mov r2, #0x58B2
			b sc_out
sc_0x42B3:
			mov r1, #0x42B3
			mov r2, #0x58B3
			b sc_out
sc_0x42B4:
			mov r1, #0x42B4
			mov r2, #0x58B4
			b sc_out
sc_0x42B5:
			mov r1, #0x42B5
			mov r2, #0x58B5
			b sc_out
sc_0x42B6:
			mov r1, #0x42B6
			mov r2, #0x58B6
			b sc_out
sc_0x42B7:
			mov r1, #0x42B7
			mov r2, #0x58B7
			b sc_out
sc_0x42B8:
			mov r1, #0x42B8
			mov r2, #0x58B8
			b sc_out
sc_0x42B9:
			mov r1, #0x42B9
			mov r2, #0x58B9
			b sc_out
sc_0x42BA:
			mov r1, #0x42BA
			mov r2, #0x58BA
			b sc_out
sc_0x42BB:
			mov r1, #0x42BB
			mov r2, #0x58BB
			b sc_out
sc_0x42BC:
			mov r1, #0x42BC
			mov r2, #0x58BC
			b sc_out
sc_0x42BD:
			mov r1, #0x42BD
			mov r2, #0x58BD
			b sc_out
sc_0x42BE:
			mov r1, #0x42BE
			mov r2, #0x58BE
			b sc_out
sc_0x42BF:
			mov r1, #0x42BF
			mov r2, #0x58BF
			b sc_out
sc_0x43A0:
			mov r1, #0x43A0
			mov r2, #0x58A0
			b sc_out
sc_0x43A1:
			mov r1, #0x43A1
			mov r2, #0x58A1
			b sc_out
sc_0x43A2:
			mov r1, #0x43A2
			mov r2, #0x58A2
			b sc_out
sc_0x43A3:
			mov r1, #0x43A3
			mov r2, #0x58A3
			b sc_out
sc_0x43A4:
			mov r1, #0x43A4
			mov r2, #0x58A4
			b sc_out
sc_0x43A5:
			mov r1, #0x43A5
			mov r2, #0x58A5
			b sc_out
sc_0x43A6:
			mov r1, #0x43A6
			mov r2, #0x58A6
			b sc_out
sc_0x43A7:
			mov r1, #0x43A7
			mov r2, #0x58A7
			b sc_out
sc_0x43A8:
			mov r1, #0x43A8
			mov r2, #0x58A8
			b sc_out
sc_0x43A9:
			mov r1, #0x43A9
			mov r2, #0x58A9
			b sc_out
sc_0x43AA:
			mov r1, #0x43AA
			mov r2, #0x58AA
			b sc_out
sc_0x43AB:
			mov r1, #0x43AB
			mov r2, #0x58AB
			b sc_out
sc_0x43AC:
			mov r1, #0x43AC
			mov r2, #0x58AC
			b sc_out
sc_0x43AD:
			mov r1, #0x43AD
			mov r2, #0x58AD
			b sc_out
sc_0x43AE:
			mov r1, #0x43AE
			mov r2, #0x58AE
			b sc_out
sc_0x43AF:
			mov r1, #0x43AF
			mov r2, #0x58AF
			b sc_out
sc_0x43B0:
			mov r1, #0x43B0
			mov r2, #0x58B0
			b sc_out
sc_0x43B1:
			mov r1, #0x43B1
			mov r2, #0x58B1
			b sc_out
sc_0x43B2:
			mov r1, #0x43B2
			mov r2, #0x58B2
			b sc_out
sc_0x43B3:
			mov r1, #0x43B3
			mov r2, #0x58B3
			b sc_out
sc_0x43B4:
			mov r1, #0x43B4
			mov r2, #0x58B4
			b sc_out
sc_0x43B5:
			mov r1, #0x43B5
			mov r2, #0x58B5
			b sc_out
sc_0x43B6:
			mov r1, #0x43B6
			mov r2, #0x58B6
			b sc_out
sc_0x43B7:
			mov r1, #0x43B7
			mov r2, #0x58B7
			b sc_out
sc_0x43B8:
			mov r1, #0x43B8
			mov r2, #0x58B8
			b sc_out
sc_0x43B9:
			mov r1, #0x43B9
			mov r2, #0x58B9
			b sc_out
sc_0x43BA:
			mov r1, #0x43BA
			mov r2, #0x58BA
			b sc_out
sc_0x43BB:
			mov r1, #0x43BB
			mov r2, #0x58BB
			b sc_out
sc_0x43BC:
			mov r1, #0x43BC
			mov r2, #0x58BC
			b sc_out
sc_0x43BD:
			mov r1, #0x43BD
			mov r2, #0x58BD
			b sc_out
sc_0x43BE:
			mov r1, #0x43BE
			mov r2, #0x58BE
			b sc_out
sc_0x43BF:
			mov r1, #0x43BF
			mov r2, #0x58BF
			b sc_out
sc_0x44A0:
			mov r1, #0x44A0
			mov r2, #0x58A0
			b sc_out
sc_0x44A1:
			mov r1, #0x44A1
			mov r2, #0x58A1
			b sc_out
sc_0x44A2:
			mov r1, #0x44A2
			mov r2, #0x58A2
			b sc_out
sc_0x44A3:
			mov r1, #0x44A3
			mov r2, #0x58A3
			b sc_out
sc_0x44A4:
			mov r1, #0x44A4
			mov r2, #0x58A4
			b sc_out
sc_0x44A5:
			mov r1, #0x44A5
			mov r2, #0x58A5
			b sc_out
sc_0x44A6:
			mov r1, #0x44A6
			mov r2, #0x58A6
			b sc_out
sc_0x44A7:
			mov r1, #0x44A7
			mov r2, #0x58A7
			b sc_out
sc_0x44A8:
			mov r1, #0x44A8
			mov r2, #0x58A8
			b sc_out
sc_0x44A9:
			mov r1, #0x44A9
			mov r2, #0x58A9
			b sc_out
sc_0x44AA:
			mov r1, #0x44AA
			mov r2, #0x58AA
			b sc_out
sc_0x44AB:
			mov r1, #0x44AB
			mov r2, #0x58AB
			b sc_out
sc_0x44AC:
			mov r1, #0x44AC
			mov r2, #0x58AC
			b sc_out
sc_0x44AD:
			mov r1, #0x44AD
			mov r2, #0x58AD
			b sc_out
sc_0x44AE:
			mov r1, #0x44AE
			mov r2, #0x58AE
			b sc_out
sc_0x44AF:
			mov r1, #0x44AF
			mov r2, #0x58AF
			b sc_out
sc_0x44B0:
			mov r1, #0x44B0
			mov r2, #0x58B0
			b sc_out
sc_0x44B1:
			mov r1, #0x44B1
			mov r2, #0x58B1
			b sc_out
sc_0x44B2:
			mov r1, #0x44B2
			mov r2, #0x58B2
			b sc_out
sc_0x44B3:
			mov r1, #0x44B3
			mov r2, #0x58B3
			b sc_out
sc_0x44B4:
			mov r1, #0x44B4
			mov r2, #0x58B4
			b sc_out
sc_0x44B5:
			mov r1, #0x44B5
			mov r2, #0x58B5
			b sc_out
sc_0x44B6:
			mov r1, #0x44B6
			mov r2, #0x58B6
			b sc_out
sc_0x44B7:
			mov r1, #0x44B7
			mov r2, #0x58B7
			b sc_out
sc_0x44B8:
			mov r1, #0x44B8
			mov r2, #0x58B8
			b sc_out
sc_0x44B9:
			mov r1, #0x44B9
			mov r2, #0x58B9
			b sc_out
sc_0x44BA:
			mov r1, #0x44BA
			mov r2, #0x58BA
			b sc_out
sc_0x44BB:
			mov r1, #0x44BB
			mov r2, #0x58BB
			b sc_out
sc_0x44BC:
			mov r1, #0x44BC
			mov r2, #0x58BC
			b sc_out
sc_0x44BD:
			mov r1, #0x44BD
			mov r2, #0x58BD
			b sc_out
sc_0x44BE:
			mov r1, #0x44BE
			mov r2, #0x58BE
			b sc_out
sc_0x44BF:
			mov r1, #0x44BF
			mov r2, #0x58BF
			b sc_out
sc_0x45A0:
			mov r1, #0x45A0
			mov r2, #0x58A0
			b sc_out
sc_0x45A1:
			mov r1, #0x45A1
			mov r2, #0x58A1
			b sc_out
sc_0x45A2:
			mov r1, #0x45A2
			mov r2, #0x58A2
			b sc_out
sc_0x45A3:
			mov r1, #0x45A3
			mov r2, #0x58A3
			b sc_out
sc_0x45A4:
			mov r1, #0x45A4
			mov r2, #0x58A4
			b sc_out
sc_0x45A5:
			mov r1, #0x45A5
			mov r2, #0x58A5
			b sc_out
sc_0x45A6:
			mov r1, #0x45A6
			mov r2, #0x58A6
			b sc_out
sc_0x45A7:
			mov r1, #0x45A7
			mov r2, #0x58A7
			b sc_out
sc_0x45A8:
			mov r1, #0x45A8
			mov r2, #0x58A8
			b sc_out
sc_0x45A9:
			mov r1, #0x45A9
			mov r2, #0x58A9
			b sc_out
sc_0x45AA:
			mov r1, #0x45AA
			mov r2, #0x58AA
			b sc_out
sc_0x45AB:
			mov r1, #0x45AB
			mov r2, #0x58AB
			b sc_out
sc_0x45AC:
			mov r1, #0x45AC
			mov r2, #0x58AC
			b sc_out
sc_0x45AD:
			mov r1, #0x45AD
			mov r2, #0x58AD
			b sc_out
sc_0x45AE:
			mov r1, #0x45AE
			mov r2, #0x58AE
			b sc_out
sc_0x45AF:
			mov r1, #0x45AF
			mov r2, #0x58AF
			b sc_out
sc_0x45B0:
			mov r1, #0x45B0
			mov r2, #0x58B0
			b sc_out
sc_0x45B1:
			mov r1, #0x45B1
			mov r2, #0x58B1
			b sc_out
sc_0x45B2:
			mov r1, #0x45B2
			mov r2, #0x58B2
			b sc_out
sc_0x45B3:
			mov r1, #0x45B3
			mov r2, #0x58B3
			b sc_out
sc_0x45B4:
			mov r1, #0x45B4
			mov r2, #0x58B4
			b sc_out
sc_0x45B5:
			mov r1, #0x45B5
			mov r2, #0x58B5
			b sc_out
sc_0x45B6:
			mov r1, #0x45B6
			mov r2, #0x58B6
			b sc_out
sc_0x45B7:
			mov r1, #0x45B7
			mov r2, #0x58B7
			b sc_out
sc_0x45B8:
			mov r1, #0x45B8
			mov r2, #0x58B8
			b sc_out
sc_0x45B9:
			mov r1, #0x45B9
			mov r2, #0x58B9
			b sc_out
sc_0x45BA:
			mov r1, #0x45BA
			mov r2, #0x58BA
			b sc_out
sc_0x45BB:
			mov r1, #0x45BB
			mov r2, #0x58BB
			b sc_out
sc_0x45BC:
			mov r1, #0x45BC
			mov r2, #0x58BC
			b sc_out
sc_0x45BD:
			mov r1, #0x45BD
			mov r2, #0x58BD
			b sc_out
sc_0x45BE:
			mov r1, #0x45BE
			mov r2, #0x58BE
			b sc_out
sc_0x45BF:
			mov r1, #0x45BF
			mov r2, #0x58BF
			b sc_out
sc_0x46A0:
			mov r1, #0x46A0
			mov r2, #0x58A0
			b sc_out
sc_0x46A1:
			mov r1, #0x46A1
			mov r2, #0x58A1
			b sc_out
sc_0x46A2:
			mov r1, #0x46A2
			mov r2, #0x58A2
			b sc_out
sc_0x46A3:
			mov r1, #0x46A3
			mov r2, #0x58A3
			b sc_out
sc_0x46A4:
			mov r1, #0x46A4
			mov r2, #0x58A4
			b sc_out
sc_0x46A5:
			mov r1, #0x46A5
			mov r2, #0x58A5
			b sc_out
sc_0x46A6:
			mov r1, #0x46A6
			mov r2, #0x58A6
			b sc_out
sc_0x46A7:
			mov r1, #0x46A7
			mov r2, #0x58A7
			b sc_out
sc_0x46A8:
			mov r1, #0x46A8
			mov r2, #0x58A8
			b sc_out
sc_0x46A9:
			mov r1, #0x46A9
			mov r2, #0x58A9
			b sc_out
sc_0x46AA:
			mov r1, #0x46AA
			mov r2, #0x58AA
			b sc_out
sc_0x46AB:
			mov r1, #0x46AB
			mov r2, #0x58AB
			b sc_out
sc_0x46AC:
			mov r1, #0x46AC
			mov r2, #0x58AC
			b sc_out
sc_0x46AD:
			mov r1, #0x46AD
			mov r2, #0x58AD
			b sc_out
sc_0x46AE:
			mov r1, #0x46AE
			mov r2, #0x58AE
			b sc_out
sc_0x46AF:
			mov r1, #0x46AF
			mov r2, #0x58AF
			b sc_out
sc_0x46B0:
			mov r1, #0x46B0
			mov r2, #0x58B0
			b sc_out
sc_0x46B1:
			mov r1, #0x46B1
			mov r2, #0x58B1
			b sc_out
sc_0x46B2:
			mov r1, #0x46B2
			mov r2, #0x58B2
			b sc_out
sc_0x46B3:
			mov r1, #0x46B3
			mov r2, #0x58B3
			b sc_out
sc_0x46B4:
			mov r1, #0x46B4
			mov r2, #0x58B4
			b sc_out
sc_0x46B5:
			mov r1, #0x46B5
			mov r2, #0x58B5
			b sc_out
sc_0x46B6:
			mov r1, #0x46B6
			mov r2, #0x58B6
			b sc_out
sc_0x46B7:
			mov r1, #0x46B7
			mov r2, #0x58B7
			b sc_out
sc_0x46B8:
			mov r1, #0x46B8
			mov r2, #0x58B8
			b sc_out
sc_0x46B9:
			mov r1, #0x46B9
			mov r2, #0x58B9
			b sc_out
sc_0x46BA:
			mov r1, #0x46BA
			mov r2, #0x58BA
			b sc_out
sc_0x46BB:
			mov r1, #0x46BB
			mov r2, #0x58BB
			b sc_out
sc_0x46BC:
			mov r1, #0x46BC
			mov r2, #0x58BC
			b sc_out
sc_0x46BD:
			mov r1, #0x46BD
			mov r2, #0x58BD
			b sc_out
sc_0x46BE:
			mov r1, #0x46BE
			mov r2, #0x58BE
			b sc_out
sc_0x46BF:
			mov r1, #0x46BF
			mov r2, #0x58BF
			b sc_out
sc_0x47A0:
			mov r1, #0x47A0
			mov r2, #0x58A0
			b sc_out
sc_0x47A1:
			mov r1, #0x47A1
			mov r2, #0x58A1
			b sc_out
sc_0x47A2:
			mov r1, #0x47A2
			mov r2, #0x58A2
			b sc_out
sc_0x47A3:
			mov r1, #0x47A3
			mov r2, #0x58A3
			b sc_out
sc_0x47A4:
			mov r1, #0x47A4
			mov r2, #0x58A4
			b sc_out
sc_0x47A5:
			mov r1, #0x47A5
			mov r2, #0x58A5
			b sc_out
sc_0x47A6:
			mov r1, #0x47A6
			mov r2, #0x58A6
			b sc_out
sc_0x47A7:
			mov r1, #0x47A7
			mov r2, #0x58A7
			b sc_out
sc_0x47A8:
			mov r1, #0x47A8
			mov r2, #0x58A8
			b sc_out
sc_0x47A9:
			mov r1, #0x47A9
			mov r2, #0x58A9
			b sc_out
sc_0x47AA:
			mov r1, #0x47AA
			mov r2, #0x58AA
			b sc_out
sc_0x47AB:
			mov r1, #0x47AB
			mov r2, #0x58AB
			b sc_out
sc_0x47AC:
			mov r1, #0x47AC
			mov r2, #0x58AC
			b sc_out
sc_0x47AD:
			mov r1, #0x47AD
			mov r2, #0x58AD
			b sc_out
sc_0x47AE:
			mov r1, #0x47AE
			mov r2, #0x58AE
			b sc_out
sc_0x47AF:
			mov r1, #0x47AF
			mov r2, #0x58AF
			b sc_out
sc_0x47B0:
			mov r1, #0x47B0
			mov r2, #0x58B0
			b sc_out
sc_0x47B1:
			mov r1, #0x47B1
			mov r2, #0x58B1
			b sc_out
sc_0x47B2:
			mov r1, #0x47B2
			mov r2, #0x58B2
			b sc_out
sc_0x47B3:
			mov r1, #0x47B3
			mov r2, #0x58B3
			b sc_out
sc_0x47B4:
			mov r1, #0x47B4
			mov r2, #0x58B4
			b sc_out
sc_0x47B5:
			mov r1, #0x47B5
			mov r2, #0x58B5
			b sc_out
sc_0x47B6:
			mov r1, #0x47B6
			mov r2, #0x58B6
			b sc_out
sc_0x47B7:
			mov r1, #0x47B7
			mov r2, #0x58B7
			b sc_out
sc_0x47B8:
			mov r1, #0x47B8
			mov r2, #0x58B8
			b sc_out
sc_0x47B9:
			mov r1, #0x47B9
			mov r2, #0x58B9
			b sc_out
sc_0x47BA:
			mov r1, #0x47BA
			mov r2, #0x58BA
			b sc_out
sc_0x47BB:
			mov r1, #0x47BB
			mov r2, #0x58BB
			b sc_out
sc_0x47BC:
			mov r1, #0x47BC
			mov r2, #0x58BC
			b sc_out
sc_0x47BD:
			mov r1, #0x47BD
			mov r2, #0x58BD
			b sc_out
sc_0x47BE:
			mov r1, #0x47BE
			mov r2, #0x58BE
			b sc_out
sc_0x47BF:
			mov r1, #0x47BF
			mov r2, #0x58BF
			b sc_out
sc_0x40C0:
			mov r1, #0x40C0
			mov r2, #0x58C0
			b sc_out
sc_0x40C1:
			mov r1, #0x40C1
			mov r2, #0x58C1
			b sc_out
sc_0x40C2:
			mov r1, #0x40C2
			mov r2, #0x58C2
			b sc_out
sc_0x40C3:
			mov r1, #0x40C3
			mov r2, #0x58C3
			b sc_out
sc_0x40C4:
			mov r1, #0x40C4
			mov r2, #0x58C4
			b sc_out
sc_0x40C5:
			mov r1, #0x40C5
			mov r2, #0x58C5
			b sc_out
sc_0x40C6:
			mov r1, #0x40C6
			mov r2, #0x58C6
			b sc_out
sc_0x40C7:
			mov r1, #0x40C7
			mov r2, #0x58C7
			b sc_out
sc_0x40C8:
			mov r1, #0x40C8
			mov r2, #0x58C8
			b sc_out
sc_0x40C9:
			mov r1, #0x40C9
			mov r2, #0x58C9
			b sc_out
sc_0x40CA:
			mov r1, #0x40CA
			mov r2, #0x58CA
			b sc_out
sc_0x40CB:
			mov r1, #0x40CB
			mov r2, #0x58CB
			b sc_out
sc_0x40CC:
			mov r1, #0x40CC
			mov r2, #0x58CC
			b sc_out
sc_0x40CD:
			mov r1, #0x40CD
			mov r2, #0x58CD
			b sc_out
sc_0x40CE:
			mov r1, #0x40CE
			mov r2, #0x58CE
			b sc_out
sc_0x40CF:
			mov r1, #0x40CF
			mov r2, #0x58CF
			b sc_out
sc_0x40D0:
			mov r1, #0x40D0
			mov r2, #0x58D0
			b sc_out
sc_0x40D1:
			mov r1, #0x40D1
			mov r2, #0x58D1
			b sc_out
sc_0x40D2:
			mov r1, #0x40D2
			mov r2, #0x58D2
			b sc_out
sc_0x40D3:
			mov r1, #0x40D3
			mov r2, #0x58D3
			b sc_out
sc_0x40D4:
			mov r1, #0x40D4
			mov r2, #0x58D4
			b sc_out
sc_0x40D5:
			mov r1, #0x40D5
			mov r2, #0x58D5
			b sc_out
sc_0x40D6:
			mov r1, #0x40D6
			mov r2, #0x58D6
			b sc_out
sc_0x40D7:
			mov r1, #0x40D7
			mov r2, #0x58D7
			b sc_out
sc_0x40D8:
			mov r1, #0x40D8
			mov r2, #0x58D8
			b sc_out
sc_0x40D9:
			mov r1, #0x40D9
			mov r2, #0x58D9
			b sc_out
sc_0x40DA:
			mov r1, #0x40DA
			mov r2, #0x58DA
			b sc_out
sc_0x40DB:
			mov r1, #0x40DB
			mov r2, #0x58DB
			b sc_out
sc_0x40DC:
			mov r1, #0x40DC
			mov r2, #0x58DC
			b sc_out
sc_0x40DD:
			mov r1, #0x40DD
			mov r2, #0x58DD
			b sc_out
sc_0x40DE:
			mov r1, #0x40DE
			mov r2, #0x58DE
			b sc_out
sc_0x40DF:
			mov r1, #0x40DF
			mov r2, #0x58DF
			b sc_out
sc_0x41C0:
			mov r1, #0x41C0
			mov r2, #0x58C0
			b sc_out
sc_0x41C1:
			mov r1, #0x41C1
			mov r2, #0x58C1
			b sc_out
sc_0x41C2:
			mov r1, #0x41C2
			mov r2, #0x58C2
			b sc_out
sc_0x41C3:
			mov r1, #0x41C3
			mov r2, #0x58C3
			b sc_out
sc_0x41C4:
			mov r1, #0x41C4
			mov r2, #0x58C4
			b sc_out
sc_0x41C5:
			mov r1, #0x41C5
			mov r2, #0x58C5
			b sc_out
sc_0x41C6:
			mov r1, #0x41C6
			mov r2, #0x58C6
			b sc_out
sc_0x41C7:
			mov r1, #0x41C7
			mov r2, #0x58C7
			b sc_out
sc_0x41C8:
			mov r1, #0x41C8
			mov r2, #0x58C8
			b sc_out
sc_0x41C9:
			mov r1, #0x41C9
			mov r2, #0x58C9
			b sc_out
sc_0x41CA:
			mov r1, #0x41CA
			mov r2, #0x58CA
			b sc_out
sc_0x41CB:
			mov r1, #0x41CB
			mov r2, #0x58CB
			b sc_out
sc_0x41CC:
			mov r1, #0x41CC
			mov r2, #0x58CC
			b sc_out
sc_0x41CD:
			mov r1, #0x41CD
			mov r2, #0x58CD
			b sc_out
sc_0x41CE:
			mov r1, #0x41CE
			mov r2, #0x58CE
			b sc_out
sc_0x41CF:
			mov r1, #0x41CF
			mov r2, #0x58CF
			b sc_out
sc_0x41D0:
			mov r1, #0x41D0
			mov r2, #0x58D0
			b sc_out
sc_0x41D1:
			mov r1, #0x41D1
			mov r2, #0x58D1
			b sc_out
sc_0x41D2:
			mov r1, #0x41D2
			mov r2, #0x58D2
			b sc_out
sc_0x41D3:
			mov r1, #0x41D3
			mov r2, #0x58D3
			b sc_out
sc_0x41D4:
			mov r1, #0x41D4
			mov r2, #0x58D4
			b sc_out
sc_0x41D5:
			mov r1, #0x41D5
			mov r2, #0x58D5
			b sc_out
sc_0x41D6:
			mov r1, #0x41D6
			mov r2, #0x58D6
			b sc_out
sc_0x41D7:
			mov r1, #0x41D7
			mov r2, #0x58D7
			b sc_out
sc_0x41D8:
			mov r1, #0x41D8
			mov r2, #0x58D8
			b sc_out
sc_0x41D9:
			mov r1, #0x41D9
			mov r2, #0x58D9
			b sc_out
sc_0x41DA:
			mov r1, #0x41DA
			mov r2, #0x58DA
			b sc_out
sc_0x41DB:
			mov r1, #0x41DB
			mov r2, #0x58DB
			b sc_out
sc_0x41DC:
			mov r1, #0x41DC
			mov r2, #0x58DC
			b sc_out
sc_0x41DD:
			mov r1, #0x41DD
			mov r2, #0x58DD
			b sc_out
sc_0x41DE:
			mov r1, #0x41DE
			mov r2, #0x58DE
			b sc_out
sc_0x41DF:
			mov r1, #0x41DF
			mov r2, #0x58DF
			b sc_out
sc_0x42C0:
			mov r1, #0x42C0
			mov r2, #0x58C0
			b sc_out
sc_0x42C1:
			mov r1, #0x42C1
			mov r2, #0x58C1
			b sc_out
sc_0x42C2:
			mov r1, #0x42C2
			mov r2, #0x58C2
			b sc_out
sc_0x42C3:
			mov r1, #0x42C3
			mov r2, #0x58C3
			b sc_out
sc_0x42C4:
			mov r1, #0x42C4
			mov r2, #0x58C4
			b sc_out
sc_0x42C5:
			mov r1, #0x42C5
			mov r2, #0x58C5
			b sc_out
sc_0x42C6:
			mov r1, #0x42C6
			mov r2, #0x58C6
			b sc_out
sc_0x42C7:
			mov r1, #0x42C7
			mov r2, #0x58C7
			b sc_out
sc_0x42C8:
			mov r1, #0x42C8
			mov r2, #0x58C8
			b sc_out
sc_0x42C9:
			mov r1, #0x42C9
			mov r2, #0x58C9
			b sc_out
sc_0x42CA:
			mov r1, #0x42CA
			mov r2, #0x58CA
			b sc_out
sc_0x42CB:
			mov r1, #0x42CB
			mov r2, #0x58CB
			b sc_out
sc_0x42CC:
			mov r1, #0x42CC
			mov r2, #0x58CC
			b sc_out
sc_0x42CD:
			mov r1, #0x42CD
			mov r2, #0x58CD
			b sc_out
sc_0x42CE:
			mov r1, #0x42CE
			mov r2, #0x58CE
			b sc_out
sc_0x42CF:
			mov r1, #0x42CF
			mov r2, #0x58CF
			b sc_out
sc_0x42D0:
			mov r1, #0x42D0
			mov r2, #0x58D0
			b sc_out
sc_0x42D1:
			mov r1, #0x42D1
			mov r2, #0x58D1
			b sc_out
sc_0x42D2:
			mov r1, #0x42D2
			mov r2, #0x58D2
			b sc_out
sc_0x42D3:
			mov r1, #0x42D3
			mov r2, #0x58D3
			b sc_out
sc_0x42D4:
			mov r1, #0x42D4
			mov r2, #0x58D4
			b sc_out
sc_0x42D5:
			mov r1, #0x42D5
			mov r2, #0x58D5
			b sc_out
sc_0x42D6:
			mov r1, #0x42D6
			mov r2, #0x58D6
			b sc_out
sc_0x42D7:
			mov r1, #0x42D7
			mov r2, #0x58D7
			b sc_out
sc_0x42D8:
			mov r1, #0x42D8
			mov r2, #0x58D8
			b sc_out
sc_0x42D9:
			mov r1, #0x42D9
			mov r2, #0x58D9
			b sc_out
sc_0x42DA:
			mov r1, #0x42DA
			mov r2, #0x58DA
			b sc_out
sc_0x42DB:
			mov r1, #0x42DB
			mov r2, #0x58DB
			b sc_out
sc_0x42DC:
			mov r1, #0x42DC
			mov r2, #0x58DC
			b sc_out
sc_0x42DD:
			mov r1, #0x42DD
			mov r2, #0x58DD
			b sc_out
sc_0x42DE:
			mov r1, #0x42DE
			mov r2, #0x58DE
			b sc_out
sc_0x42DF:
			mov r1, #0x42DF
			mov r2, #0x58DF
			b sc_out
sc_0x43C0:
			mov r1, #0x43C0
			mov r2, #0x58C0
			b sc_out
sc_0x43C1:
			mov r1, #0x43C1
			mov r2, #0x58C1
			b sc_out
sc_0x43C2:
			mov r1, #0x43C2
			mov r2, #0x58C2
			b sc_out
sc_0x43C3:
			mov r1, #0x43C3
			mov r2, #0x58C3
			b sc_out
sc_0x43C4:
			mov r1, #0x43C4
			mov r2, #0x58C4
			b sc_out
sc_0x43C5:
			mov r1, #0x43C5
			mov r2, #0x58C5
			b sc_out
sc_0x43C6:
			mov r1, #0x43C6
			mov r2, #0x58C6
			b sc_out
sc_0x43C7:
			mov r1, #0x43C7
			mov r2, #0x58C7
			b sc_out
sc_0x43C8:
			mov r1, #0x43C8
			mov r2, #0x58C8
			b sc_out
sc_0x43C9:
			mov r1, #0x43C9
			mov r2, #0x58C9
			b sc_out
sc_0x43CA:
			mov r1, #0x43CA
			mov r2, #0x58CA
			b sc_out
sc_0x43CB:
			mov r1, #0x43CB
			mov r2, #0x58CB
			b sc_out
sc_0x43CC:
			mov r1, #0x43CC
			mov r2, #0x58CC
			b sc_out
sc_0x43CD:
			mov r1, #0x43CD
			mov r2, #0x58CD
			b sc_out
sc_0x43CE:
			mov r1, #0x43CE
			mov r2, #0x58CE
			b sc_out
sc_0x43CF:
			mov r1, #0x43CF
			mov r2, #0x58CF
			b sc_out
sc_0x43D0:
			mov r1, #0x43D0
			mov r2, #0x58D0
			b sc_out
sc_0x43D1:
			mov r1, #0x43D1
			mov r2, #0x58D1
			b sc_out
sc_0x43D2:
			mov r1, #0x43D2
			mov r2, #0x58D2
			b sc_out
sc_0x43D3:
			mov r1, #0x43D3
			mov r2, #0x58D3
			b sc_out
sc_0x43D4:
			mov r1, #0x43D4
			mov r2, #0x58D4
			b sc_out
sc_0x43D5:
			mov r1, #0x43D5
			mov r2, #0x58D5
			b sc_out
sc_0x43D6:
			mov r1, #0x43D6
			mov r2, #0x58D6
			b sc_out
sc_0x43D7:
			mov r1, #0x43D7
			mov r2, #0x58D7
			b sc_out
sc_0x43D8:
			mov r1, #0x43D8
			mov r2, #0x58D8
			b sc_out
sc_0x43D9:
			mov r1, #0x43D9
			mov r2, #0x58D9
			b sc_out
sc_0x43DA:
			mov r1, #0x43DA
			mov r2, #0x58DA
			b sc_out
sc_0x43DB:
			mov r1, #0x43DB
			mov r2, #0x58DB
			b sc_out
sc_0x43DC:
			mov r1, #0x43DC
			mov r2, #0x58DC
			b sc_out
sc_0x43DD:
			mov r1, #0x43DD
			mov r2, #0x58DD
			b sc_out
sc_0x43DE:
			mov r1, #0x43DE
			mov r2, #0x58DE
			b sc_out
sc_0x43DF:
			mov r1, #0x43DF
			mov r2, #0x58DF
			b sc_out
sc_0x44C0:
			mov r1, #0x44C0
			mov r2, #0x58C0
			b sc_out
sc_0x44C1:
			mov r1, #0x44C1
			mov r2, #0x58C1
			b sc_out
sc_0x44C2:
			mov r1, #0x44C2
			mov r2, #0x58C2
			b sc_out
sc_0x44C3:
			mov r1, #0x44C3
			mov r2, #0x58C3
			b sc_out
sc_0x44C4:
			mov r1, #0x44C4
			mov r2, #0x58C4
			b sc_out
sc_0x44C5:
			mov r1, #0x44C5
			mov r2, #0x58C5
			b sc_out
sc_0x44C6:
			mov r1, #0x44C6
			mov r2, #0x58C6
			b sc_out
sc_0x44C7:
			mov r1, #0x44C7
			mov r2, #0x58C7
			b sc_out
sc_0x44C8:
			mov r1, #0x44C8
			mov r2, #0x58C8
			b sc_out
sc_0x44C9:
			mov r1, #0x44C9
			mov r2, #0x58C9
			b sc_out
sc_0x44CA:
			mov r1, #0x44CA
			mov r2, #0x58CA
			b sc_out
sc_0x44CB:
			mov r1, #0x44CB
			mov r2, #0x58CB
			b sc_out
sc_0x44CC:
			mov r1, #0x44CC
			mov r2, #0x58CC
			b sc_out
sc_0x44CD:
			mov r1, #0x44CD
			mov r2, #0x58CD
			b sc_out
sc_0x44CE:
			mov r1, #0x44CE
			mov r2, #0x58CE
			b sc_out
sc_0x44CF:
			mov r1, #0x44CF
			mov r2, #0x58CF
			b sc_out
sc_0x44D0:
			mov r1, #0x44D0
			mov r2, #0x58D0
			b sc_out
sc_0x44D1:
			mov r1, #0x44D1
			mov r2, #0x58D1
			b sc_out
sc_0x44D2:
			mov r1, #0x44D2
			mov r2, #0x58D2
			b sc_out
sc_0x44D3:
			mov r1, #0x44D3
			mov r2, #0x58D3
			b sc_out
sc_0x44D4:
			mov r1, #0x44D4
			mov r2, #0x58D4
			b sc_out
sc_0x44D5:
			mov r1, #0x44D5
			mov r2, #0x58D5
			b sc_out
sc_0x44D6:
			mov r1, #0x44D6
			mov r2, #0x58D6
			b sc_out
sc_0x44D7:
			mov r1, #0x44D7
			mov r2, #0x58D7
			b sc_out
sc_0x44D8:
			mov r1, #0x44D8
			mov r2, #0x58D8
			b sc_out
sc_0x44D9:
			mov r1, #0x44D9
			mov r2, #0x58D9
			b sc_out
sc_0x44DA:
			mov r1, #0x44DA
			mov r2, #0x58DA
			b sc_out
sc_0x44DB:
			mov r1, #0x44DB
			mov r2, #0x58DB
			b sc_out
sc_0x44DC:
			mov r1, #0x44DC
			mov r2, #0x58DC
			b sc_out
sc_0x44DD:
			mov r1, #0x44DD
			mov r2, #0x58DD
			b sc_out
sc_0x44DE:
			mov r1, #0x44DE
			mov r2, #0x58DE
			b sc_out
sc_0x44DF:
			mov r1, #0x44DF
			mov r2, #0x58DF
			b sc_out
sc_0x45C0:
			mov r1, #0x45C0
			mov r2, #0x58C0
			b sc_out
sc_0x45C1:
			mov r1, #0x45C1
			mov r2, #0x58C1
			b sc_out
sc_0x45C2:
			mov r1, #0x45C2
			mov r2, #0x58C2
			b sc_out
sc_0x45C3:
			mov r1, #0x45C3
			mov r2, #0x58C3
			b sc_out
sc_0x45C4:
			mov r1, #0x45C4
			mov r2, #0x58C4
			b sc_out
sc_0x45C5:
			mov r1, #0x45C5
			mov r2, #0x58C5
			b sc_out
sc_0x45C6:
			mov r1, #0x45C6
			mov r2, #0x58C6
			b sc_out
sc_0x45C7:
			mov r1, #0x45C7
			mov r2, #0x58C7
			b sc_out
sc_0x45C8:
			mov r1, #0x45C8
			mov r2, #0x58C8
			b sc_out
sc_0x45C9:
			mov r1, #0x45C9
			mov r2, #0x58C9
			b sc_out
sc_0x45CA:
			mov r1, #0x45CA
			mov r2, #0x58CA
			b sc_out
sc_0x45CB:
			mov r1, #0x45CB
			mov r2, #0x58CB
			b sc_out
sc_0x45CC:
			mov r1, #0x45CC
			mov r2, #0x58CC
			b sc_out
sc_0x45CD:
			mov r1, #0x45CD
			mov r2, #0x58CD
			b sc_out
sc_0x45CE:
			mov r1, #0x45CE
			mov r2, #0x58CE
			b sc_out
sc_0x45CF:
			mov r1, #0x45CF
			mov r2, #0x58CF
			b sc_out
sc_0x45D0:
			mov r1, #0x45D0
			mov r2, #0x58D0
			b sc_out
sc_0x45D1:
			mov r1, #0x45D1
			mov r2, #0x58D1
			b sc_out
sc_0x45D2:
			mov r1, #0x45D2
			mov r2, #0x58D2
			b sc_out
sc_0x45D3:
			mov r1, #0x45D3
			mov r2, #0x58D3
			b sc_out
sc_0x45D4:
			mov r1, #0x45D4
			mov r2, #0x58D4
			b sc_out
sc_0x45D5:
			mov r1, #0x45D5
			mov r2, #0x58D5
			b sc_out
sc_0x45D6:
			mov r1, #0x45D6
			mov r2, #0x58D6
			b sc_out
sc_0x45D7:
			mov r1, #0x45D7
			mov r2, #0x58D7
			b sc_out
sc_0x45D8:
			mov r1, #0x45D8
			mov r2, #0x58D8
			b sc_out
sc_0x45D9:
			mov r1, #0x45D9
			mov r2, #0x58D9
			b sc_out
sc_0x45DA:
			mov r1, #0x45DA
			mov r2, #0x58DA
			b sc_out
sc_0x45DB:
			mov r1, #0x45DB
			mov r2, #0x58DB
			b sc_out
sc_0x45DC:
			mov r1, #0x45DC
			mov r2, #0x58DC
			b sc_out
sc_0x45DD:
			mov r1, #0x45DD
			mov r2, #0x58DD
			b sc_out
sc_0x45DE:
			mov r1, #0x45DE
			mov r2, #0x58DE
			b sc_out
sc_0x45DF:
			mov r1, #0x45DF
			mov r2, #0x58DF
			b sc_out
sc_0x46C0:
			mov r1, #0x46C0
			mov r2, #0x58C0
			b sc_out
sc_0x46C1:
			mov r1, #0x46C1
			mov r2, #0x58C1
			b sc_out
sc_0x46C2:
			mov r1, #0x46C2
			mov r2, #0x58C2
			b sc_out
sc_0x46C3:
			mov r1, #0x46C3
			mov r2, #0x58C3
			b sc_out
sc_0x46C4:
			mov r1, #0x46C4
			mov r2, #0x58C4
			b sc_out
sc_0x46C5:
			mov r1, #0x46C5
			mov r2, #0x58C5
			b sc_out
sc_0x46C6:
			mov r1, #0x46C6
			mov r2, #0x58C6
			b sc_out
sc_0x46C7:
			mov r1, #0x46C7
			mov r2, #0x58C7
			b sc_out
sc_0x46C8:
			mov r1, #0x46C8
			mov r2, #0x58C8
			b sc_out
sc_0x46C9:
			mov r1, #0x46C9
			mov r2, #0x58C9
			b sc_out
sc_0x46CA:
			mov r1, #0x46CA
			mov r2, #0x58CA
			b sc_out
sc_0x46CB:
			mov r1, #0x46CB
			mov r2, #0x58CB
			b sc_out
sc_0x46CC:
			mov r1, #0x46CC
			mov r2, #0x58CC
			b sc_out
sc_0x46CD:
			mov r1, #0x46CD
			mov r2, #0x58CD
			b sc_out
sc_0x46CE:
			mov r1, #0x46CE
			mov r2, #0x58CE
			b sc_out
sc_0x46CF:
			mov r1, #0x46CF
			mov r2, #0x58CF
			b sc_out
sc_0x46D0:
			mov r1, #0x46D0
			mov r2, #0x58D0
			b sc_out
sc_0x46D1:
			mov r1, #0x46D1
			mov r2, #0x58D1
			b sc_out
sc_0x46D2:
			mov r1, #0x46D2
			mov r2, #0x58D2
			b sc_out
sc_0x46D3:
			mov r1, #0x46D3
			mov r2, #0x58D3
			b sc_out
sc_0x46D4:
			mov r1, #0x46D4
			mov r2, #0x58D4
			b sc_out
sc_0x46D5:
			mov r1, #0x46D5
			mov r2, #0x58D5
			b sc_out
sc_0x46D6:
			mov r1, #0x46D6
			mov r2, #0x58D6
			b sc_out
sc_0x46D7:
			mov r1, #0x46D7
			mov r2, #0x58D7
			b sc_out
sc_0x46D8:
			mov r1, #0x46D8
			mov r2, #0x58D8
			b sc_out
sc_0x46D9:
			mov r1, #0x46D9
			mov r2, #0x58D9
			b sc_out
sc_0x46DA:
			mov r1, #0x46DA
			mov r2, #0x58DA
			b sc_out
sc_0x46DB:
			mov r1, #0x46DB
			mov r2, #0x58DB
			b sc_out
sc_0x46DC:
			mov r1, #0x46DC
			mov r2, #0x58DC
			b sc_out
sc_0x46DD:
			mov r1, #0x46DD
			mov r2, #0x58DD
			b sc_out
sc_0x46DE:
			mov r1, #0x46DE
			mov r2, #0x58DE
			b sc_out
sc_0x46DF:
			mov r1, #0x46DF
			mov r2, #0x58DF
			b sc_out
sc_0x47C0:
			mov r1, #0x47C0
			mov r2, #0x58C0
			b sc_out
sc_0x47C1:
			mov r1, #0x47C1
			mov r2, #0x58C1
			b sc_out
sc_0x47C2:
			mov r1, #0x47C2
			mov r2, #0x58C2
			b sc_out
sc_0x47C3:
			mov r1, #0x47C3
			mov r2, #0x58C3
			b sc_out
sc_0x47C4:
			mov r1, #0x47C4
			mov r2, #0x58C4
			b sc_out
sc_0x47C5:
			mov r1, #0x47C5
			mov r2, #0x58C5
			b sc_out
sc_0x47C6:
			mov r1, #0x47C6
			mov r2, #0x58C6
			b sc_out
sc_0x47C7:
			mov r1, #0x47C7
			mov r2, #0x58C7
			b sc_out
sc_0x47C8:
			mov r1, #0x47C8
			mov r2, #0x58C8
			b sc_out
sc_0x47C9:
			mov r1, #0x47C9
			mov r2, #0x58C9
			b sc_out
sc_0x47CA:
			mov r1, #0x47CA
			mov r2, #0x58CA
			b sc_out
sc_0x47CB:
			mov r1, #0x47CB
			mov r2, #0x58CB
			b sc_out
sc_0x47CC:
			mov r1, #0x47CC
			mov r2, #0x58CC
			b sc_out
sc_0x47CD:
			mov r1, #0x47CD
			mov r2, #0x58CD
			b sc_out
sc_0x47CE:
			mov r1, #0x47CE
			mov r2, #0x58CE
			b sc_out
sc_0x47CF:
			mov r1, #0x47CF
			mov r2, #0x58CF
			b sc_out
sc_0x47D0:
			mov r1, #0x47D0
			mov r2, #0x58D0
			b sc_out
sc_0x47D1:
			mov r1, #0x47D1
			mov r2, #0x58D1
			b sc_out
sc_0x47D2:
			mov r1, #0x47D2
			mov r2, #0x58D2
			b sc_out
sc_0x47D3:
			mov r1, #0x47D3
			mov r2, #0x58D3
			b sc_out
sc_0x47D4:
			mov r1, #0x47D4
			mov r2, #0x58D4
			b sc_out
sc_0x47D5:
			mov r1, #0x47D5
			mov r2, #0x58D5
			b sc_out
sc_0x47D6:
			mov r1, #0x47D6
			mov r2, #0x58D6
			b sc_out
sc_0x47D7:
			mov r1, #0x47D7
			mov r2, #0x58D7
			b sc_out
sc_0x47D8:
			mov r1, #0x47D8
			mov r2, #0x58D8
			b sc_out
sc_0x47D9:
			mov r1, #0x47D9
			mov r2, #0x58D9
			b sc_out
sc_0x47DA:
			mov r1, #0x47DA
			mov r2, #0x58DA
			b sc_out
sc_0x47DB:
			mov r1, #0x47DB
			mov r2, #0x58DB
			b sc_out
sc_0x47DC:
			mov r1, #0x47DC
			mov r2, #0x58DC
			b sc_out
sc_0x47DD:
			mov r1, #0x47DD
			mov r2, #0x58DD
			b sc_out
sc_0x47DE:
			mov r1, #0x47DE
			mov r2, #0x58DE
			b sc_out
sc_0x47DF:
			mov r1, #0x47DF
			mov r2, #0x58DF
			b sc_out
sc_0x40E0:
			mov r1, #0x40E0
			mov r2, #0x58E0
			b sc_out
sc_0x40E1:
			mov r1, #0x40E1
			mov r2, #0x58E1
			b sc_out
sc_0x40E2:
			mov r1, #0x40E2
			mov r2, #0x58E2
			b sc_out
sc_0x40E3:
			mov r1, #0x40E3
			mov r2, #0x58E3
			b sc_out
sc_0x40E4:
			mov r1, #0x40E4
			mov r2, #0x58E4
			b sc_out
sc_0x40E5:
			mov r1, #0x40E5
			mov r2, #0x58E5
			b sc_out
sc_0x40E6:
			mov r1, #0x40E6
			mov r2, #0x58E6
			b sc_out
sc_0x40E7:
			mov r1, #0x40E7
			mov r2, #0x58E7
			b sc_out
sc_0x40E8:
			mov r1, #0x40E8
			mov r2, #0x58E8
			b sc_out
sc_0x40E9:
			mov r1, #0x40E9
			mov r2, #0x58E9
			b sc_out
sc_0x40EA:
			mov r1, #0x40EA
			mov r2, #0x58EA
			b sc_out
sc_0x40EB:
			mov r1, #0x40EB
			mov r2, #0x58EB
			b sc_out
sc_0x40EC:
			mov r1, #0x40EC
			mov r2, #0x58EC
			b sc_out
sc_0x40ED:
			mov r1, #0x40ED
			mov r2, #0x58ED
			b sc_out
sc_0x40EE:
			mov r1, #0x40EE
			mov r2, #0x58EE
			b sc_out
sc_0x40EF:
			mov r1, #0x40EF
			mov r2, #0x58EF
			b sc_out
sc_0x40F0:
			mov r1, #0x40F0
			mov r2, #0x58F0
			b sc_out
sc_0x40F1:
			mov r1, #0x40F1
			mov r2, #0x58F1
			b sc_out
sc_0x40F2:
			mov r1, #0x40F2
			mov r2, #0x58F2
			b sc_out
sc_0x40F3:
			mov r1, #0x40F3
			mov r2, #0x58F3
			b sc_out
sc_0x40F4:
			mov r1, #0x40F4
			mov r2, #0x58F4
			b sc_out
sc_0x40F5:
			mov r1, #0x40F5
			mov r2, #0x58F5
			b sc_out
sc_0x40F6:
			mov r1, #0x40F6
			mov r2, #0x58F6
			b sc_out
sc_0x40F7:
			mov r1, #0x40F7
			mov r2, #0x58F7
			b sc_out
sc_0x40F8:
			mov r1, #0x40F8
			mov r2, #0x58F8
			b sc_out
sc_0x40F9:
			mov r1, #0x40F9
			mov r2, #0x58F9
			b sc_out
sc_0x40FA:
			mov r1, #0x40FA
			mov r2, #0x58FA
			b sc_out
sc_0x40FB:
			mov r1, #0x40FB
			mov r2, #0x58FB
			b sc_out
sc_0x40FC:
			mov r1, #0x40FC
			mov r2, #0x58FC
			b sc_out
sc_0x40FD:
			mov r1, #0x40FD
			mov r2, #0x58FD
			b sc_out
sc_0x40FE:
			mov r1, #0x40FE
			mov r2, #0x58FE
			b sc_out
sc_0x40FF:
			mov r1, #0x40FF
			mov r2, #0x58FF
			b sc_out
sc_0x41E0:
			mov r1, #0x41E0
			mov r2, #0x58E0
			b sc_out
sc_0x41E1:
			mov r1, #0x41E1
			mov r2, #0x58E1
			b sc_out
sc_0x41E2:
			mov r1, #0x41E2
			mov r2, #0x58E2
			b sc_out
sc_0x41E3:
			mov r1, #0x41E3
			mov r2, #0x58E3
			b sc_out
sc_0x41E4:
			mov r1, #0x41E4
			mov r2, #0x58E4
			b sc_out
sc_0x41E5:
			mov r1, #0x41E5
			mov r2, #0x58E5
			b sc_out
sc_0x41E6:
			mov r1, #0x41E6
			mov r2, #0x58E6
			b sc_out
sc_0x41E7:
			mov r1, #0x41E7
			mov r2, #0x58E7
			b sc_out
sc_0x41E8:
			mov r1, #0x41E8
			mov r2, #0x58E8
			b sc_out
sc_0x41E9:
			mov r1, #0x41E9
			mov r2, #0x58E9
			b sc_out
sc_0x41EA:
			mov r1, #0x41EA
			mov r2, #0x58EA
			b sc_out
sc_0x41EB:
			mov r1, #0x41EB
			mov r2, #0x58EB
			b sc_out
sc_0x41EC:
			mov r1, #0x41EC
			mov r2, #0x58EC
			b sc_out
sc_0x41ED:
			mov r1, #0x41ED
			mov r2, #0x58ED
			b sc_out
sc_0x41EE:
			mov r1, #0x41EE
			mov r2, #0x58EE
			b sc_out
sc_0x41EF:
			mov r1, #0x41EF
			mov r2, #0x58EF
			b sc_out
sc_0x41F0:
			mov r1, #0x41F0
			mov r2, #0x58F0
			b sc_out
sc_0x41F1:
			mov r1, #0x41F1
			mov r2, #0x58F1
			b sc_out
sc_0x41F2:
			mov r1, #0x41F2
			mov r2, #0x58F2
			b sc_out
sc_0x41F3:
			mov r1, #0x41F3
			mov r2, #0x58F3
			b sc_out
sc_0x41F4:
			mov r1, #0x41F4
			mov r2, #0x58F4
			b sc_out
sc_0x41F5:
			mov r1, #0x41F5
			mov r2, #0x58F5
			b sc_out
sc_0x41F6:
			mov r1, #0x41F6
			mov r2, #0x58F6
			b sc_out
sc_0x41F7:
			mov r1, #0x41F7
			mov r2, #0x58F7
			b sc_out
sc_0x41F8:
			mov r1, #0x41F8
			mov r2, #0x58F8
			b sc_out
sc_0x41F9:
			mov r1, #0x41F9
			mov r2, #0x58F9
			b sc_out
sc_0x41FA:
			mov r1, #0x41FA
			mov r2, #0x58FA
			b sc_out
sc_0x41FB:
			mov r1, #0x41FB
			mov r2, #0x58FB
			b sc_out
sc_0x41FC:
			mov r1, #0x41FC
			mov r2, #0x58FC
			b sc_out
sc_0x41FD:
			mov r1, #0x41FD
			mov r2, #0x58FD
			b sc_out
sc_0x41FE:
			mov r1, #0x41FE
			mov r2, #0x58FE
			b sc_out
sc_0x41FF:
			mov r1, #0x41FF
			mov r2, #0x58FF
			b sc_out
sc_0x42E0:
			mov r1, #0x42E0
			mov r2, #0x58E0
			b sc_out
sc_0x42E1:
			mov r1, #0x42E1
			mov r2, #0x58E1
			b sc_out
sc_0x42E2:
			mov r1, #0x42E2
			mov r2, #0x58E2
			b sc_out
sc_0x42E3:
			mov r1, #0x42E3
			mov r2, #0x58E3
			b sc_out
sc_0x42E4:
			mov r1, #0x42E4
			mov r2, #0x58E4
			b sc_out
sc_0x42E5:
			mov r1, #0x42E5
			mov r2, #0x58E5
			b sc_out
sc_0x42E6:
			mov r1, #0x42E6
			mov r2, #0x58E6
			b sc_out
sc_0x42E7:
			mov r1, #0x42E7
			mov r2, #0x58E7
			b sc_out
sc_0x42E8:
			mov r1, #0x42E8
			mov r2, #0x58E8
			b sc_out
sc_0x42E9:
			mov r1, #0x42E9
			mov r2, #0x58E9
			b sc_out
sc_0x42EA:
			mov r1, #0x42EA
			mov r2, #0x58EA
			b sc_out
sc_0x42EB:
			mov r1, #0x42EB
			mov r2, #0x58EB
			b sc_out
sc_0x42EC:
			mov r1, #0x42EC
			mov r2, #0x58EC
			b sc_out
sc_0x42ED:
			mov r1, #0x42ED
			mov r2, #0x58ED
			b sc_out
sc_0x42EE:
			mov r1, #0x42EE
			mov r2, #0x58EE
			b sc_out
sc_0x42EF:
			mov r1, #0x42EF
			mov r2, #0x58EF
			b sc_out
sc_0x42F0:
			mov r1, #0x42F0
			mov r2, #0x58F0
			b sc_out
sc_0x42F1:
			mov r1, #0x42F1
			mov r2, #0x58F1
			b sc_out
sc_0x42F2:
			mov r1, #0x42F2
			mov r2, #0x58F2
			b sc_out
sc_0x42F3:
			mov r1, #0x42F3
			mov r2, #0x58F3
			b sc_out
sc_0x42F4:
			mov r1, #0x42F4
			mov r2, #0x58F4
			b sc_out
sc_0x42F5:
			mov r1, #0x42F5
			mov r2, #0x58F5
			b sc_out
sc_0x42F6:
			mov r1, #0x42F6
			mov r2, #0x58F6
			b sc_out
sc_0x42F7:
			mov r1, #0x42F7
			mov r2, #0x58F7
			b sc_out
sc_0x42F8:
			mov r1, #0x42F8
			mov r2, #0x58F8
			b sc_out
sc_0x42F9:
			mov r1, #0x42F9
			mov r2, #0x58F9
			b sc_out
sc_0x42FA:
			mov r1, #0x42FA
			mov r2, #0x58FA
			b sc_out
sc_0x42FB:
			mov r1, #0x42FB
			mov r2, #0x58FB
			b sc_out
sc_0x42FC:
			mov r1, #0x42FC
			mov r2, #0x58FC
			b sc_out
sc_0x42FD:
			mov r1, #0x42FD
			mov r2, #0x58FD
			b sc_out
sc_0x42FE:
			mov r1, #0x42FE
			mov r2, #0x58FE
			b sc_out
sc_0x42FF:
			mov r1, #0x42FF
			mov r2, #0x58FF
			b sc_out
sc_0x43E0:
			mov r1, #0x43E0
			mov r2, #0x58E0
			b sc_out
sc_0x43E1:
			mov r1, #0x43E1
			mov r2, #0x58E1
			b sc_out
sc_0x43E2:
			mov r1, #0x43E2
			mov r2, #0x58E2
			b sc_out
sc_0x43E3:
			mov r1, #0x43E3
			mov r2, #0x58E3
			b sc_out
sc_0x43E4:
			mov r1, #0x43E4
			mov r2, #0x58E4
			b sc_out
sc_0x43E5:
			mov r1, #0x43E5
			mov r2, #0x58E5
			b sc_out
sc_0x43E6:
			mov r1, #0x43E6
			mov r2, #0x58E6
			b sc_out
sc_0x43E7:
			mov r1, #0x43E7
			mov r2, #0x58E7
			b sc_out
sc_0x43E8:
			mov r1, #0x43E8
			mov r2, #0x58E8
			b sc_out
sc_0x43E9:
			mov r1, #0x43E9
			mov r2, #0x58E9
			b sc_out
sc_0x43EA:
			mov r1, #0x43EA
			mov r2, #0x58EA
			b sc_out
sc_0x43EB:
			mov r1, #0x43EB
			mov r2, #0x58EB
			b sc_out
sc_0x43EC:
			mov r1, #0x43EC
			mov r2, #0x58EC
			b sc_out
sc_0x43ED:
			mov r1, #0x43ED
			mov r2, #0x58ED
			b sc_out
sc_0x43EE:
			mov r1, #0x43EE
			mov r2, #0x58EE
			b sc_out
sc_0x43EF:
			mov r1, #0x43EF
			mov r2, #0x58EF
			b sc_out
sc_0x43F0:
			mov r1, #0x43F0
			mov r2, #0x58F0
			b sc_out
sc_0x43F1:
			mov r1, #0x43F1
			mov r2, #0x58F1
			b sc_out
sc_0x43F2:
			mov r1, #0x43F2
			mov r2, #0x58F2
			b sc_out
sc_0x43F3:
			mov r1, #0x43F3
			mov r2, #0x58F3
			b sc_out
sc_0x43F4:
			mov r1, #0x43F4
			mov r2, #0x58F4
			b sc_out
sc_0x43F5:
			mov r1, #0x43F5
			mov r2, #0x58F5
			b sc_out
sc_0x43F6:
			mov r1, #0x43F6
			mov r2, #0x58F6
			b sc_out
sc_0x43F7:
			mov r1, #0x43F7
			mov r2, #0x58F7
			b sc_out
sc_0x43F8:
			mov r1, #0x43F8
			mov r2, #0x58F8
			b sc_out
sc_0x43F9:
			mov r1, #0x43F9
			mov r2, #0x58F9
			b sc_out
sc_0x43FA:
			mov r1, #0x43FA
			mov r2, #0x58FA
			b sc_out
sc_0x43FB:
			mov r1, #0x43FB
			mov r2, #0x58FB
			b sc_out
sc_0x43FC:
			mov r1, #0x43FC
			mov r2, #0x58FC
			b sc_out
sc_0x43FD:
			mov r1, #0x43FD
			mov r2, #0x58FD
			b sc_out
sc_0x43FE:
			mov r1, #0x43FE
			mov r2, #0x58FE
			b sc_out
sc_0x43FF:
			mov r1, #0x43FF
			mov r2, #0x58FF
			b sc_out
sc_0x44E0:
			mov r1, #0x44E0
			mov r2, #0x58E0
			b sc_out
sc_0x44E1:
			mov r1, #0x44E1
			mov r2, #0x58E1
			b sc_out
sc_0x44E2:
			mov r1, #0x44E2
			mov r2, #0x58E2
			b sc_out
sc_0x44E3:
			mov r1, #0x44E3
			mov r2, #0x58E3
			b sc_out
sc_0x44E4:
			mov r1, #0x44E4
			mov r2, #0x58E4
			b sc_out
sc_0x44E5:
			mov r1, #0x44E5
			mov r2, #0x58E5
			b sc_out
sc_0x44E6:
			mov r1, #0x44E6
			mov r2, #0x58E6
			b sc_out
sc_0x44E7:
			mov r1, #0x44E7
			mov r2, #0x58E7
			b sc_out
sc_0x44E8:
			mov r1, #0x44E8
			mov r2, #0x58E8
			b sc_out
sc_0x44E9:
			mov r1, #0x44E9
			mov r2, #0x58E9
			b sc_out
sc_0x44EA:
			mov r1, #0x44EA
			mov r2, #0x58EA
			b sc_out
sc_0x44EB:
			mov r1, #0x44EB
			mov r2, #0x58EB
			b sc_out
sc_0x44EC:
			mov r1, #0x44EC
			mov r2, #0x58EC
			b sc_out
sc_0x44ED:
			mov r1, #0x44ED
			mov r2, #0x58ED
			b sc_out
sc_0x44EE:
			mov r1, #0x44EE
			mov r2, #0x58EE
			b sc_out
sc_0x44EF:
			mov r1, #0x44EF
			mov r2, #0x58EF
			b sc_out
sc_0x44F0:
			mov r1, #0x44F0
			mov r2, #0x58F0
			b sc_out
sc_0x44F1:
			mov r1, #0x44F1
			mov r2, #0x58F1
			b sc_out
sc_0x44F2:
			mov r1, #0x44F2
			mov r2, #0x58F2
			b sc_out
sc_0x44F3:
			mov r1, #0x44F3
			mov r2, #0x58F3
			b sc_out
sc_0x44F4:
			mov r1, #0x44F4
			mov r2, #0x58F4
			b sc_out
sc_0x44F5:
			mov r1, #0x44F5
			mov r2, #0x58F5
			b sc_out
sc_0x44F6:
			mov r1, #0x44F6
			mov r2, #0x58F6
			b sc_out
sc_0x44F7:
			mov r1, #0x44F7
			mov r2, #0x58F7
			b sc_out
sc_0x44F8:
			mov r1, #0x44F8
			mov r2, #0x58F8
			b sc_out
sc_0x44F9:
			mov r1, #0x44F9
			mov r2, #0x58F9
			b sc_out
sc_0x44FA:
			mov r1, #0x44FA
			mov r2, #0x58FA
			b sc_out
sc_0x44FB:
			mov r1, #0x44FB
			mov r2, #0x58FB
			b sc_out
sc_0x44FC:
			mov r1, #0x44FC
			mov r2, #0x58FC
			b sc_out
sc_0x44FD:
			mov r1, #0x44FD
			mov r2, #0x58FD
			b sc_out
sc_0x44FE:
			mov r1, #0x44FE
			mov r2, #0x58FE
			b sc_out
sc_0x44FF:
			mov r1, #0x44FF
			mov r2, #0x58FF
			b sc_out
sc_0x45E0:
			mov r1, #0x45E0
			mov r2, #0x58E0
			b sc_out
sc_0x45E1:
			mov r1, #0x45E1
			mov r2, #0x58E1
			b sc_out
sc_0x45E2:
			mov r1, #0x45E2
			mov r2, #0x58E2
			b sc_out
sc_0x45E3:
			mov r1, #0x45E3
			mov r2, #0x58E3
			b sc_out
sc_0x45E4:
			mov r1, #0x45E4
			mov r2, #0x58E4
			b sc_out
sc_0x45E5:
			mov r1, #0x45E5
			mov r2, #0x58E5
			b sc_out
sc_0x45E6:
			mov r1, #0x45E6
			mov r2, #0x58E6
			b sc_out
sc_0x45E7:
			mov r1, #0x45E7
			mov r2, #0x58E7
			b sc_out
sc_0x45E8:
			mov r1, #0x45E8
			mov r2, #0x58E8
			b sc_out
sc_0x45E9:
			mov r1, #0x45E9
			mov r2, #0x58E9
			b sc_out
sc_0x45EA:
			mov r1, #0x45EA
			mov r2, #0x58EA
			b sc_out
sc_0x45EB:
			mov r1, #0x45EB
			mov r2, #0x58EB
			b sc_out
sc_0x45EC:
			mov r1, #0x45EC
			mov r2, #0x58EC
			b sc_out
sc_0x45ED:
			mov r1, #0x45ED
			mov r2, #0x58ED
			b sc_out
sc_0x45EE:
			mov r1, #0x45EE
			mov r2, #0x58EE
			b sc_out
sc_0x45EF:
			mov r1, #0x45EF
			mov r2, #0x58EF
			b sc_out
sc_0x45F0:
			mov r1, #0x45F0
			mov r2, #0x58F0
			b sc_out
sc_0x45F1:
			mov r1, #0x45F1
			mov r2, #0x58F1
			b sc_out
sc_0x45F2:
			mov r1, #0x45F2
			mov r2, #0x58F2
			b sc_out
sc_0x45F3:
			mov r1, #0x45F3
			mov r2, #0x58F3
			b sc_out
sc_0x45F4:
			mov r1, #0x45F4
			mov r2, #0x58F4
			b sc_out
sc_0x45F5:
			mov r1, #0x45F5
			mov r2, #0x58F5
			b sc_out
sc_0x45F6:
			mov r1, #0x45F6
			mov r2, #0x58F6
			b sc_out
sc_0x45F7:
			mov r1, #0x45F7
			mov r2, #0x58F7
			b sc_out
sc_0x45F8:
			mov r1, #0x45F8
			mov r2, #0x58F8
			b sc_out
sc_0x45F9:
			mov r1, #0x45F9
			mov r2, #0x58F9
			b sc_out
sc_0x45FA:
			mov r1, #0x45FA
			mov r2, #0x58FA
			b sc_out
sc_0x45FB:
			mov r1, #0x45FB
			mov r2, #0x58FB
			b sc_out
sc_0x45FC:
			mov r1, #0x45FC
			mov r2, #0x58FC
			b sc_out
sc_0x45FD:
			mov r1, #0x45FD
			mov r2, #0x58FD
			b sc_out
sc_0x45FE:
			mov r1, #0x45FE
			mov r2, #0x58FE
			b sc_out
sc_0x45FF:
			mov r1, #0x45FF
			mov r2, #0x58FF
			b sc_out
sc_0x46E0:
			mov r1, #0x46E0
			mov r2, #0x58E0
			b sc_out
sc_0x46E1:
			mov r1, #0x46E1
			mov r2, #0x58E1
			b sc_out
sc_0x46E2:
			mov r1, #0x46E2
			mov r2, #0x58E2
			b sc_out
sc_0x46E3:
			mov r1, #0x46E3
			mov r2, #0x58E3
			b sc_out
sc_0x46E4:
			mov r1, #0x46E4
			mov r2, #0x58E4
			b sc_out
sc_0x46E5:
			mov r1, #0x46E5
			mov r2, #0x58E5
			b sc_out
sc_0x46E6:
			mov r1, #0x46E6
			mov r2, #0x58E6
			b sc_out
sc_0x46E7:
			mov r1, #0x46E7
			mov r2, #0x58E7
			b sc_out
sc_0x46E8:
			mov r1, #0x46E8
			mov r2, #0x58E8
			b sc_out
sc_0x46E9:
			mov r1, #0x46E9
			mov r2, #0x58E9
			b sc_out
sc_0x46EA:
			mov r1, #0x46EA
			mov r2, #0x58EA
			b sc_out
sc_0x46EB:
			mov r1, #0x46EB
			mov r2, #0x58EB
			b sc_out
sc_0x46EC:
			mov r1, #0x46EC
			mov r2, #0x58EC
			b sc_out
sc_0x46ED:
			mov r1, #0x46ED
			mov r2, #0x58ED
			b sc_out
sc_0x46EE:
			mov r1, #0x46EE
			mov r2, #0x58EE
			b sc_out
sc_0x46EF:
			mov r1, #0x46EF
			mov r2, #0x58EF
			b sc_out
sc_0x46F0:
			mov r1, #0x46F0
			mov r2, #0x58F0
			b sc_out
sc_0x46F1:
			mov r1, #0x46F1
			mov r2, #0x58F1
			b sc_out
sc_0x46F2:
			mov r1, #0x46F2
			mov r2, #0x58F2
			b sc_out
sc_0x46F3:
			mov r1, #0x46F3
			mov r2, #0x58F3
			b sc_out
sc_0x46F4:
			mov r1, #0x46F4
			mov r2, #0x58F4
			b sc_out
sc_0x46F5:
			mov r1, #0x46F5
			mov r2, #0x58F5
			b sc_out
sc_0x46F6:
			mov r1, #0x46F6
			mov r2, #0x58F6
			b sc_out
sc_0x46F7:
			mov r1, #0x46F7
			mov r2, #0x58F7
			b sc_out
sc_0x46F8:
			mov r1, #0x46F8
			mov r2, #0x58F8
			b sc_out
sc_0x46F9:
			mov r1, #0x46F9
			mov r2, #0x58F9
			b sc_out
sc_0x46FA:
			mov r1, #0x46FA
			mov r2, #0x58FA
			b sc_out
sc_0x46FB:
			mov r1, #0x46FB
			mov r2, #0x58FB
			b sc_out
sc_0x46FC:
			mov r1, #0x46FC
			mov r2, #0x58FC
			b sc_out
sc_0x46FD:
			mov r1, #0x46FD
			mov r2, #0x58FD
			b sc_out
sc_0x46FE:
			mov r1, #0x46FE
			mov r2, #0x58FE
			b sc_out
sc_0x46FF:
			mov r1, #0x46FF
			mov r2, #0x58FF
			b sc_out
sc_0x47E0:
			mov r1, #0x47E0
			mov r2, #0x58E0
			b sc_out
sc_0x47E1:
			mov r1, #0x47E1
			mov r2, #0x58E1
			b sc_out
sc_0x47E2:
			mov r1, #0x47E2
			mov r2, #0x58E2
			b sc_out
sc_0x47E3:
			mov r1, #0x47E3
			mov r2, #0x58E3
			b sc_out
sc_0x47E4:
			mov r1, #0x47E4
			mov r2, #0x58E4
			b sc_out
sc_0x47E5:
			mov r1, #0x47E5
			mov r2, #0x58E5
			b sc_out
sc_0x47E6:
			mov r1, #0x47E6
			mov r2, #0x58E6
			b sc_out
sc_0x47E7:
			mov r1, #0x47E7
			mov r2, #0x58E7
			b sc_out
sc_0x47E8:
			mov r1, #0x47E8
			mov r2, #0x58E8
			b sc_out
sc_0x47E9:
			mov r1, #0x47E9
			mov r2, #0x58E9
			b sc_out
sc_0x47EA:
			mov r1, #0x47EA
			mov r2, #0x58EA
			b sc_out
sc_0x47EB:
			mov r1, #0x47EB
			mov r2, #0x58EB
			b sc_out
sc_0x47EC:
			mov r1, #0x47EC
			mov r2, #0x58EC
			b sc_out
sc_0x47ED:
			mov r1, #0x47ED
			mov r2, #0x58ED
			b sc_out
sc_0x47EE:
			mov r1, #0x47EE
			mov r2, #0x58EE
			b sc_out
sc_0x47EF:
			mov r1, #0x47EF
			mov r2, #0x58EF
			b sc_out
sc_0x47F0:
			mov r1, #0x47F0
			mov r2, #0x58F0
			b sc_out
sc_0x47F1:
			mov r1, #0x47F1
			mov r2, #0x58F1
			b sc_out
sc_0x47F2:
			mov r1, #0x47F2
			mov r2, #0x58F2
			b sc_out
sc_0x47F3:
			mov r1, #0x47F3
			mov r2, #0x58F3
			b sc_out
sc_0x47F4:
			mov r1, #0x47F4
			mov r2, #0x58F4
			b sc_out
sc_0x47F5:
			mov r1, #0x47F5
			mov r2, #0x58F5
			b sc_out
sc_0x47F6:
			mov r1, #0x47F6
			mov r2, #0x58F6
			b sc_out
sc_0x47F7:
			mov r1, #0x47F7
			mov r2, #0x58F7
			b sc_out
sc_0x47F8:
			mov r1, #0x47F8
			mov r2, #0x58F8
			b sc_out
sc_0x47F9:
			mov r1, #0x47F9
			mov r2, #0x58F9
			b sc_out
sc_0x47FA:
			mov r1, #0x47FA
			mov r2, #0x58FA
			b sc_out
sc_0x47FB:
			mov r1, #0x47FB
			mov r2, #0x58FB
			b sc_out
sc_0x47FC:
			mov r1, #0x47FC
			mov r2, #0x58FC
			b sc_out
sc_0x47FD:
			mov r1, #0x47FD
			mov r2, #0x58FD
			b sc_out
sc_0x47FE:
			mov r1, #0x47FE
			mov r2, #0x58FE
			b sc_out
sc_0x47FF:
			mov r1, #0x47FF
			mov r2, #0x58FF
			b sc_out
sc_0x4800:
			mov r1, #0x4800
			mov r2, #0x5900
			b sc_out
sc_0x4801:
			mov r1, #0x4801
			mov r2, #0x5901
			b sc_out
sc_0x4802:
			mov r1, #0x4802
			mov r2, #0x5902
			b sc_out
sc_0x4803:
			mov r1, #0x4803
			mov r2, #0x5903
			b sc_out
sc_0x4804:
			mov r1, #0x4804
			mov r2, #0x5904
			b sc_out
sc_0x4805:
			mov r1, #0x4805
			mov r2, #0x5905
			b sc_out
sc_0x4806:
			mov r1, #0x4806
			mov r2, #0x5906
			b sc_out
sc_0x4807:
			mov r1, #0x4807
			mov r2, #0x5907
			b sc_out
sc_0x4808:
			mov r1, #0x4808
			mov r2, #0x5908
			b sc_out
sc_0x4809:
			mov r1, #0x4809
			mov r2, #0x5909
			b sc_out
sc_0x480A:
			mov r1, #0x480A
			mov r2, #0x590A
			b sc_out
sc_0x480B:
			mov r1, #0x480B
			mov r2, #0x590B
			b sc_out
sc_0x480C:
			mov r1, #0x480C
			mov r2, #0x590C
			b sc_out
sc_0x480D:
			mov r1, #0x480D
			mov r2, #0x590D
			b sc_out
sc_0x480E:
			mov r1, #0x480E
			mov r2, #0x590E
			b sc_out
sc_0x480F:
			mov r1, #0x480F
			mov r2, #0x590F
			b sc_out
sc_0x4810:
			mov r1, #0x4810
			mov r2, #0x5910
			b sc_out
sc_0x4811:
			mov r1, #0x4811
			mov r2, #0x5911
			b sc_out
sc_0x4812:
			mov r1, #0x4812
			mov r2, #0x5912
			b sc_out
sc_0x4813:
			mov r1, #0x4813
			mov r2, #0x5913
			b sc_out
sc_0x4814:
			mov r1, #0x4814
			mov r2, #0x5914
			b sc_out
sc_0x4815:
			mov r1, #0x4815
			mov r2, #0x5915
			b sc_out
sc_0x4816:
			mov r1, #0x4816
			mov r2, #0x5916
			b sc_out
sc_0x4817:
			mov r1, #0x4817
			mov r2, #0x5917
			b sc_out
sc_0x4818:
			mov r1, #0x4818
			mov r2, #0x5918
			b sc_out
sc_0x4819:
			mov r1, #0x4819
			mov r2, #0x5919
			b sc_out
sc_0x481A:
			mov r1, #0x481A
			mov r2, #0x591A
			b sc_out
sc_0x481B:
			mov r1, #0x481B
			mov r2, #0x591B
			b sc_out
sc_0x481C:
			mov r1, #0x481C
			mov r2, #0x591C
			b sc_out
sc_0x481D:
			mov r1, #0x481D
			mov r2, #0x591D
			b sc_out
sc_0x481E:
			mov r1, #0x481E
			mov r2, #0x591E
			b sc_out
sc_0x481F:
			mov r1, #0x481F
			mov r2, #0x591F
			b sc_out
sc_0x4900:
			mov r1, #0x4900
			mov r2, #0x5900
			b sc_out
sc_0x4901:
			mov r1, #0x4901
			mov r2, #0x5901
			b sc_out
sc_0x4902:
			mov r1, #0x4902
			mov r2, #0x5902
			b sc_out
sc_0x4903:
			mov r1, #0x4903
			mov r2, #0x5903
			b sc_out
sc_0x4904:
			mov r1, #0x4904
			mov r2, #0x5904
			b sc_out
sc_0x4905:
			mov r1, #0x4905
			mov r2, #0x5905
			b sc_out
sc_0x4906:
			mov r1, #0x4906
			mov r2, #0x5906
			b sc_out
sc_0x4907:
			mov r1, #0x4907
			mov r2, #0x5907
			b sc_out
sc_0x4908:
			mov r1, #0x4908
			mov r2, #0x5908
			b sc_out
sc_0x4909:
			mov r1, #0x4909
			mov r2, #0x5909
			b sc_out
sc_0x490A:
			mov r1, #0x490A
			mov r2, #0x590A
			b sc_out
sc_0x490B:
			mov r1, #0x490B
			mov r2, #0x590B
			b sc_out
sc_0x490C:
			mov r1, #0x490C
			mov r2, #0x590C
			b sc_out
sc_0x490D:
			mov r1, #0x490D
			mov r2, #0x590D
			b sc_out
sc_0x490E:
			mov r1, #0x490E
			mov r2, #0x590E
			b sc_out
sc_0x490F:
			mov r1, #0x490F
			mov r2, #0x590F
			b sc_out
sc_0x4910:
			mov r1, #0x4910
			mov r2, #0x5910
			b sc_out
sc_0x4911:
			mov r1, #0x4911
			mov r2, #0x5911
			b sc_out
sc_0x4912:
			mov r1, #0x4912
			mov r2, #0x5912
			b sc_out
sc_0x4913:
			mov r1, #0x4913
			mov r2, #0x5913
			b sc_out
sc_0x4914:
			mov r1, #0x4914
			mov r2, #0x5914
			b sc_out
sc_0x4915:
			mov r1, #0x4915
			mov r2, #0x5915
			b sc_out
sc_0x4916:
			mov r1, #0x4916
			mov r2, #0x5916
			b sc_out
sc_0x4917:
			mov r1, #0x4917
			mov r2, #0x5917
			b sc_out
sc_0x4918:
			mov r1, #0x4918
			mov r2, #0x5918
			b sc_out
sc_0x4919:
			mov r1, #0x4919
			mov r2, #0x5919
			b sc_out
sc_0x491A:
			mov r1, #0x491A
			mov r2, #0x591A
			b sc_out
sc_0x491B:
			mov r1, #0x491B
			mov r2, #0x591B
			b sc_out
sc_0x491C:
			mov r1, #0x491C
			mov r2, #0x591C
			b sc_out
sc_0x491D:
			mov r1, #0x491D
			mov r2, #0x591D
			b sc_out
sc_0x491E:
			mov r1, #0x491E
			mov r2, #0x591E
			b sc_out
sc_0x491F:
			mov r1, #0x491F
			mov r2, #0x591F
			b sc_out
sc_0x4A00:
			mov r1, #0x4A00
			mov r2, #0x5900
			b sc_out
sc_0x4A01:
			mov r1, #0x4A01
			mov r2, #0x5901
			b sc_out
sc_0x4A02:
			mov r1, #0x4A02
			mov r2, #0x5902
			b sc_out
sc_0x4A03:
			mov r1, #0x4A03
			mov r2, #0x5903
			b sc_out
sc_0x4A04:
			mov r1, #0x4A04
			mov r2, #0x5904
			b sc_out
sc_0x4A05:
			mov r1, #0x4A05
			mov r2, #0x5905
			b sc_out
sc_0x4A06:
			mov r1, #0x4A06
			mov r2, #0x5906
			b sc_out
sc_0x4A07:
			mov r1, #0x4A07
			mov r2, #0x5907
			b sc_out
sc_0x4A08:
			mov r1, #0x4A08
			mov r2, #0x5908
			b sc_out
sc_0x4A09:
			mov r1, #0x4A09
			mov r2, #0x5909
			b sc_out
sc_0x4A0A:
			mov r1, #0x4A0A
			mov r2, #0x590A
			b sc_out
sc_0x4A0B:
			mov r1, #0x4A0B
			mov r2, #0x590B
			b sc_out
sc_0x4A0C:
			mov r1, #0x4A0C
			mov r2, #0x590C
			b sc_out
sc_0x4A0D:
			mov r1, #0x4A0D
			mov r2, #0x590D
			b sc_out
sc_0x4A0E:
			mov r1, #0x4A0E
			mov r2, #0x590E
			b sc_out
sc_0x4A0F:
			mov r1, #0x4A0F
			mov r2, #0x590F
			b sc_out
sc_0x4A10:
			mov r1, #0x4A10
			mov r2, #0x5910
			b sc_out
sc_0x4A11:
			mov r1, #0x4A11
			mov r2, #0x5911
			b sc_out
sc_0x4A12:
			mov r1, #0x4A12
			mov r2, #0x5912
			b sc_out
sc_0x4A13:
			mov r1, #0x4A13
			mov r2, #0x5913
			b sc_out
sc_0x4A14:
			mov r1, #0x4A14
			mov r2, #0x5914
			b sc_out
sc_0x4A15:
			mov r1, #0x4A15
			mov r2, #0x5915
			b sc_out
sc_0x4A16:
			mov r1, #0x4A16
			mov r2, #0x5916
			b sc_out
sc_0x4A17:
			mov r1, #0x4A17
			mov r2, #0x5917
			b sc_out
sc_0x4A18:
			mov r1, #0x4A18
			mov r2, #0x5918
			b sc_out
sc_0x4A19:
			mov r1, #0x4A19
			mov r2, #0x5919
			b sc_out
sc_0x4A1A:
			mov r1, #0x4A1A
			mov r2, #0x591A
			b sc_out
sc_0x4A1B:
			mov r1, #0x4A1B
			mov r2, #0x591B
			b sc_out
sc_0x4A1C:
			mov r1, #0x4A1C
			mov r2, #0x591C
			b sc_out
sc_0x4A1D:
			mov r1, #0x4A1D
			mov r2, #0x591D
			b sc_out
sc_0x4A1E:
			mov r1, #0x4A1E
			mov r2, #0x591E
			b sc_out
sc_0x4A1F:
			mov r1, #0x4A1F
			mov r2, #0x591F
			b sc_out
sc_0x4B00:
			mov r1, #0x4B00
			mov r2, #0x5900
			b sc_out
sc_0x4B01:
			mov r1, #0x4B01
			mov r2, #0x5901
			b sc_out
sc_0x4B02:
			mov r1, #0x4B02
			mov r2, #0x5902
			b sc_out
sc_0x4B03:
			mov r1, #0x4B03
			mov r2, #0x5903
			b sc_out
sc_0x4B04:
			mov r1, #0x4B04
			mov r2, #0x5904
			b sc_out
sc_0x4B05:
			mov r1, #0x4B05
			mov r2, #0x5905
			b sc_out
sc_0x4B06:
			mov r1, #0x4B06
			mov r2, #0x5906
			b sc_out
sc_0x4B07:
			mov r1, #0x4B07
			mov r2, #0x5907
			b sc_out
sc_0x4B08:
			mov r1, #0x4B08
			mov r2, #0x5908
			b sc_out
sc_0x4B09:
			mov r1, #0x4B09
			mov r2, #0x5909
			b sc_out
sc_0x4B0A:
			mov r1, #0x4B0A
			mov r2, #0x590A
			b sc_out
sc_0x4B0B:
			mov r1, #0x4B0B
			mov r2, #0x590B
			b sc_out
sc_0x4B0C:
			mov r1, #0x4B0C
			mov r2, #0x590C
			b sc_out
sc_0x4B0D:
			mov r1, #0x4B0D
			mov r2, #0x590D
			b sc_out
sc_0x4B0E:
			mov r1, #0x4B0E
			mov r2, #0x590E
			b sc_out
sc_0x4B0F:
			mov r1, #0x4B0F
			mov r2, #0x590F
			b sc_out
sc_0x4B10:
			mov r1, #0x4B10
			mov r2, #0x5910
			b sc_out
sc_0x4B11:
			mov r1, #0x4B11
			mov r2, #0x5911
			b sc_out
sc_0x4B12:
			mov r1, #0x4B12
			mov r2, #0x5912
			b sc_out
sc_0x4B13:
			mov r1, #0x4B13
			mov r2, #0x5913
			b sc_out
sc_0x4B14:
			mov r1, #0x4B14
			mov r2, #0x5914
			b sc_out
sc_0x4B15:
			mov r1, #0x4B15
			mov r2, #0x5915
			b sc_out
sc_0x4B16:
			mov r1, #0x4B16
			mov r2, #0x5916
			b sc_out
sc_0x4B17:
			mov r1, #0x4B17
			mov r2, #0x5917
			b sc_out
sc_0x4B18:
			mov r1, #0x4B18
			mov r2, #0x5918
			b sc_out
sc_0x4B19:
			mov r1, #0x4B19
			mov r2, #0x5919
			b sc_out
sc_0x4B1A:
			mov r1, #0x4B1A
			mov r2, #0x591A
			b sc_out
sc_0x4B1B:
			mov r1, #0x4B1B
			mov r2, #0x591B
			b sc_out
sc_0x4B1C:
			mov r1, #0x4B1C
			mov r2, #0x591C
			b sc_out
sc_0x4B1D:
			mov r1, #0x4B1D
			mov r2, #0x591D
			b sc_out
sc_0x4B1E:
			mov r1, #0x4B1E
			mov r2, #0x591E
			b sc_out
sc_0x4B1F:
			mov r1, #0x4B1F
			mov r2, #0x591F
			b sc_out
sc_0x4C00:
			mov r1, #0x4C00
			mov r2, #0x5900
			b sc_out
sc_0x4C01:
			mov r1, #0x4C01
			mov r2, #0x5901
			b sc_out
sc_0x4C02:
			mov r1, #0x4C02
			mov r2, #0x5902
			b sc_out
sc_0x4C03:
			mov r1, #0x4C03
			mov r2, #0x5903
			b sc_out
sc_0x4C04:
			mov r1, #0x4C04
			mov r2, #0x5904
			b sc_out
sc_0x4C05:
			mov r1, #0x4C05
			mov r2, #0x5905
			b sc_out
sc_0x4C06:
			mov r1, #0x4C06
			mov r2, #0x5906
			b sc_out
sc_0x4C07:
			mov r1, #0x4C07
			mov r2, #0x5907
			b sc_out
sc_0x4C08:
			mov r1, #0x4C08
			mov r2, #0x5908
			b sc_out
sc_0x4C09:
			mov r1, #0x4C09
			mov r2, #0x5909
			b sc_out
sc_0x4C0A:
			mov r1, #0x4C0A
			mov r2, #0x590A
			b sc_out
sc_0x4C0B:
			mov r1, #0x4C0B
			mov r2, #0x590B
			b sc_out
sc_0x4C0C:
			mov r1, #0x4C0C
			mov r2, #0x590C
			b sc_out
sc_0x4C0D:
			mov r1, #0x4C0D
			mov r2, #0x590D
			b sc_out
sc_0x4C0E:
			mov r1, #0x4C0E
			mov r2, #0x590E
			b sc_out
sc_0x4C0F:
			mov r1, #0x4C0F
			mov r2, #0x590F
			b sc_out
sc_0x4C10:
			mov r1, #0x4C10
			mov r2, #0x5910
			b sc_out
sc_0x4C11:
			mov r1, #0x4C11
			mov r2, #0x5911
			b sc_out
sc_0x4C12:
			mov r1, #0x4C12
			mov r2, #0x5912
			b sc_out
sc_0x4C13:
			mov r1, #0x4C13
			mov r2, #0x5913
			b sc_out
sc_0x4C14:
			mov r1, #0x4C14
			mov r2, #0x5914
			b sc_out
sc_0x4C15:
			mov r1, #0x4C15
			mov r2, #0x5915
			b sc_out
sc_0x4C16:
			mov r1, #0x4C16
			mov r2, #0x5916
			b sc_out
sc_0x4C17:
			mov r1, #0x4C17
			mov r2, #0x5917
			b sc_out
sc_0x4C18:
			mov r1, #0x4C18
			mov r2, #0x5918
			b sc_out
sc_0x4C19:
			mov r1, #0x4C19
			mov r2, #0x5919
			b sc_out
sc_0x4C1A:
			mov r1, #0x4C1A
			mov r2, #0x591A
			b sc_out
sc_0x4C1B:
			mov r1, #0x4C1B
			mov r2, #0x591B
			b sc_out
sc_0x4C1C:
			mov r1, #0x4C1C
			mov r2, #0x591C
			b sc_out
sc_0x4C1D:
			mov r1, #0x4C1D
			mov r2, #0x591D
			b sc_out
sc_0x4C1E:
			mov r1, #0x4C1E
			mov r2, #0x591E
			b sc_out
sc_0x4C1F:
			mov r1, #0x4C1F
			mov r2, #0x591F
			b sc_out
sc_0x4D00:
			mov r1, #0x4D00
			mov r2, #0x5900
			b sc_out
sc_0x4D01:
			mov r1, #0x4D01
			mov r2, #0x5901
			b sc_out
sc_0x4D02:
			mov r1, #0x4D02
			mov r2, #0x5902
			b sc_out
sc_0x4D03:
			mov r1, #0x4D03
			mov r2, #0x5903
			b sc_out
sc_0x4D04:
			mov r1, #0x4D04
			mov r2, #0x5904
			b sc_out
sc_0x4D05:
			mov r1, #0x4D05
			mov r2, #0x5905
			b sc_out
sc_0x4D06:
			mov r1, #0x4D06
			mov r2, #0x5906
			b sc_out
sc_0x4D07:
			mov r1, #0x4D07
			mov r2, #0x5907
			b sc_out
sc_0x4D08:
			mov r1, #0x4D08
			mov r2, #0x5908
			b sc_out
sc_0x4D09:
			mov r1, #0x4D09
			mov r2, #0x5909
			b sc_out
sc_0x4D0A:
			mov r1, #0x4D0A
			mov r2, #0x590A
			b sc_out
sc_0x4D0B:
			mov r1, #0x4D0B
			mov r2, #0x590B
			b sc_out
sc_0x4D0C:
			mov r1, #0x4D0C
			mov r2, #0x590C
			b sc_out
sc_0x4D0D:
			mov r1, #0x4D0D
			mov r2, #0x590D
			b sc_out
sc_0x4D0E:
			mov r1, #0x4D0E
			mov r2, #0x590E
			b sc_out
sc_0x4D0F:
			mov r1, #0x4D0F
			mov r2, #0x590F
			b sc_out
sc_0x4D10:
			mov r1, #0x4D10
			mov r2, #0x5910
			b sc_out
sc_0x4D11:
			mov r1, #0x4D11
			mov r2, #0x5911
			b sc_out
sc_0x4D12:
			mov r1, #0x4D12
			mov r2, #0x5912
			b sc_out
sc_0x4D13:
			mov r1, #0x4D13
			mov r2, #0x5913
			b sc_out
sc_0x4D14:
			mov r1, #0x4D14
			mov r2, #0x5914
			b sc_out
sc_0x4D15:
			mov r1, #0x4D15
			mov r2, #0x5915
			b sc_out
sc_0x4D16:
			mov r1, #0x4D16
			mov r2, #0x5916
			b sc_out
sc_0x4D17:
			mov r1, #0x4D17
			mov r2, #0x5917
			b sc_out
sc_0x4D18:
			mov r1, #0x4D18
			mov r2, #0x5918
			b sc_out
sc_0x4D19:
			mov r1, #0x4D19
			mov r2, #0x5919
			b sc_out
sc_0x4D1A:
			mov r1, #0x4D1A
			mov r2, #0x591A
			b sc_out
sc_0x4D1B:
			mov r1, #0x4D1B
			mov r2, #0x591B
			b sc_out
sc_0x4D1C:
			mov r1, #0x4D1C
			mov r2, #0x591C
			b sc_out
sc_0x4D1D:
			mov r1, #0x4D1D
			mov r2, #0x591D
			b sc_out
sc_0x4D1E:
			mov r1, #0x4D1E
			mov r2, #0x591E
			b sc_out
sc_0x4D1F:
			mov r1, #0x4D1F
			mov r2, #0x591F
			b sc_out
sc_0x4E00:
			mov r1, #0x4E00
			mov r2, #0x5900
			b sc_out
sc_0x4E01:
			mov r1, #0x4E01
			mov r2, #0x5901
			b sc_out
sc_0x4E02:
			mov r1, #0x4E02
			mov r2, #0x5902
			b sc_out
sc_0x4E03:
			mov r1, #0x4E03
			mov r2, #0x5903
			b sc_out
sc_0x4E04:
			mov r1, #0x4E04
			mov r2, #0x5904
			b sc_out
sc_0x4E05:
			mov r1, #0x4E05
			mov r2, #0x5905
			b sc_out
sc_0x4E06:
			mov r1, #0x4E06
			mov r2, #0x5906
			b sc_out
sc_0x4E07:
			mov r1, #0x4E07
			mov r2, #0x5907
			b sc_out
sc_0x4E08:
			mov r1, #0x4E08
			mov r2, #0x5908
			b sc_out
sc_0x4E09:
			mov r1, #0x4E09
			mov r2, #0x5909
			b sc_out
sc_0x4E0A:
			mov r1, #0x4E0A
			mov r2, #0x590A
			b sc_out
sc_0x4E0B:
			mov r1, #0x4E0B
			mov r2, #0x590B
			b sc_out
sc_0x4E0C:
			mov r1, #0x4E0C
			mov r2, #0x590C
			b sc_out
sc_0x4E0D:
			mov r1, #0x4E0D
			mov r2, #0x590D
			b sc_out
sc_0x4E0E:
			mov r1, #0x4E0E
			mov r2, #0x590E
			b sc_out
sc_0x4E0F:
			mov r1, #0x4E0F
			mov r2, #0x590F
			b sc_out
sc_0x4E10:
			mov r1, #0x4E10
			mov r2, #0x5910
			b sc_out
sc_0x4E11:
			mov r1, #0x4E11
			mov r2, #0x5911
			b sc_out
sc_0x4E12:
			mov r1, #0x4E12
			mov r2, #0x5912
			b sc_out
sc_0x4E13:
			mov r1, #0x4E13
			mov r2, #0x5913
			b sc_out
sc_0x4E14:
			mov r1, #0x4E14
			mov r2, #0x5914
			b sc_out
sc_0x4E15:
			mov r1, #0x4E15
			mov r2, #0x5915
			b sc_out
sc_0x4E16:
			mov r1, #0x4E16
			mov r2, #0x5916
			b sc_out
sc_0x4E17:
			mov r1, #0x4E17
			mov r2, #0x5917
			b sc_out
sc_0x4E18:
			mov r1, #0x4E18
			mov r2, #0x5918
			b sc_out
sc_0x4E19:
			mov r1, #0x4E19
			mov r2, #0x5919
			b sc_out
sc_0x4E1A:
			mov r1, #0x4E1A
			mov r2, #0x591A
			b sc_out
sc_0x4E1B:
			mov r1, #0x4E1B
			mov r2, #0x591B
			b sc_out
sc_0x4E1C:
			mov r1, #0x4E1C
			mov r2, #0x591C
			b sc_out
sc_0x4E1D:
			mov r1, #0x4E1D
			mov r2, #0x591D
			b sc_out
sc_0x4E1E:
			mov r1, #0x4E1E
			mov r2, #0x591E
			b sc_out
sc_0x4E1F:
			mov r1, #0x4E1F
			mov r2, #0x591F
			b sc_out
sc_0x4F00:
			mov r1, #0x4F00
			mov r2, #0x5900
			b sc_out
sc_0x4F01:
			mov r1, #0x4F01
			mov r2, #0x5901
			b sc_out
sc_0x4F02:
			mov r1, #0x4F02
			mov r2, #0x5902
			b sc_out
sc_0x4F03:
			mov r1, #0x4F03
			mov r2, #0x5903
			b sc_out
sc_0x4F04:
			mov r1, #0x4F04
			mov r2, #0x5904
			b sc_out
sc_0x4F05:
			mov r1, #0x4F05
			mov r2, #0x5905
			b sc_out
sc_0x4F06:
			mov r1, #0x4F06
			mov r2, #0x5906
			b sc_out
sc_0x4F07:
			mov r1, #0x4F07
			mov r2, #0x5907
			b sc_out
sc_0x4F08:
			mov r1, #0x4F08
			mov r2, #0x5908
			b sc_out
sc_0x4F09:
			mov r1, #0x4F09
			mov r2, #0x5909
			b sc_out
sc_0x4F0A:
			mov r1, #0x4F0A
			mov r2, #0x590A
			b sc_out
sc_0x4F0B:
			mov r1, #0x4F0B
			mov r2, #0x590B
			b sc_out
sc_0x4F0C:
			mov r1, #0x4F0C
			mov r2, #0x590C
			b sc_out
sc_0x4F0D:
			mov r1, #0x4F0D
			mov r2, #0x590D
			b sc_out
sc_0x4F0E:
			mov r1, #0x4F0E
			mov r2, #0x590E
			b sc_out
sc_0x4F0F:
			mov r1, #0x4F0F
			mov r2, #0x590F
			b sc_out
sc_0x4F10:
			mov r1, #0x4F10
			mov r2, #0x5910
			b sc_out
sc_0x4F11:
			mov r1, #0x4F11
			mov r2, #0x5911
			b sc_out
sc_0x4F12:
			mov r1, #0x4F12
			mov r2, #0x5912
			b sc_out
sc_0x4F13:
			mov r1, #0x4F13
			mov r2, #0x5913
			b sc_out
sc_0x4F14:
			mov r1, #0x4F14
			mov r2, #0x5914
			b sc_out
sc_0x4F15:
			mov r1, #0x4F15
			mov r2, #0x5915
			b sc_out
sc_0x4F16:
			mov r1, #0x4F16
			mov r2, #0x5916
			b sc_out
sc_0x4F17:
			mov r1, #0x4F17
			mov r2, #0x5917
			b sc_out
sc_0x4F18:
			mov r1, #0x4F18
			mov r2, #0x5918
			b sc_out
sc_0x4F19:
			mov r1, #0x4F19
			mov r2, #0x5919
			b sc_out
sc_0x4F1A:
			mov r1, #0x4F1A
			mov r2, #0x591A
			b sc_out
sc_0x4F1B:
			mov r1, #0x4F1B
			mov r2, #0x591B
			b sc_out
sc_0x4F1C:
			mov r1, #0x4F1C
			mov r2, #0x591C
			b sc_out
sc_0x4F1D:
			mov r1, #0x4F1D
			mov r2, #0x591D
			b sc_out
sc_0x4F1E:
			mov r1, #0x4F1E
			mov r2, #0x591E
			b sc_out
sc_0x4F1F:
			mov r1, #0x4F1F
			mov r2, #0x591F
			b sc_out
sc_0x4820:
			mov r1, #0x4820
			mov r2, #0x5920
			b sc_out
sc_0x4821:
			mov r1, #0x4821
			mov r2, #0x5921
			b sc_out
sc_0x4822:
			mov r1, #0x4822
			mov r2, #0x5922
			b sc_out
sc_0x4823:
			mov r1, #0x4823
			mov r2, #0x5923
			b sc_out
sc_0x4824:
			mov r1, #0x4824
			mov r2, #0x5924
			b sc_out
sc_0x4825:
			mov r1, #0x4825
			mov r2, #0x5925
			b sc_out
sc_0x4826:
			mov r1, #0x4826
			mov r2, #0x5926
			b sc_out
sc_0x4827:
			mov r1, #0x4827
			mov r2, #0x5927
			b sc_out
sc_0x4828:
			mov r1, #0x4828
			mov r2, #0x5928
			b sc_out
sc_0x4829:
			mov r1, #0x4829
			mov r2, #0x5929
			b sc_out
sc_0x482A:
			mov r1, #0x482A
			mov r2, #0x592A
			b sc_out
sc_0x482B:
			mov r1, #0x482B
			mov r2, #0x592B
			b sc_out
sc_0x482C:
			mov r1, #0x482C
			mov r2, #0x592C
			b sc_out
sc_0x482D:
			mov r1, #0x482D
			mov r2, #0x592D
			b sc_out
sc_0x482E:
			mov r1, #0x482E
			mov r2, #0x592E
			b sc_out
sc_0x482F:
			mov r1, #0x482F
			mov r2, #0x592F
			b sc_out
sc_0x4830:
			mov r1, #0x4830
			mov r2, #0x5930
			b sc_out
sc_0x4831:
			mov r1, #0x4831
			mov r2, #0x5931
			b sc_out
sc_0x4832:
			mov r1, #0x4832
			mov r2, #0x5932
			b sc_out
sc_0x4833:
			mov r1, #0x4833
			mov r2, #0x5933
			b sc_out
sc_0x4834:
			mov r1, #0x4834
			mov r2, #0x5934
			b sc_out
sc_0x4835:
			mov r1, #0x4835
			mov r2, #0x5935
			b sc_out
sc_0x4836:
			mov r1, #0x4836
			mov r2, #0x5936
			b sc_out
sc_0x4837:
			mov r1, #0x4837
			mov r2, #0x5937
			b sc_out
sc_0x4838:
			mov r1, #0x4838
			mov r2, #0x5938
			b sc_out
sc_0x4839:
			mov r1, #0x4839
			mov r2, #0x5939
			b sc_out
sc_0x483A:
			mov r1, #0x483A
			mov r2, #0x593A
			b sc_out
sc_0x483B:
			mov r1, #0x483B
			mov r2, #0x593B
			b sc_out
sc_0x483C:
			mov r1, #0x483C
			mov r2, #0x593C
			b sc_out
sc_0x483D:
			mov r1, #0x483D
			mov r2, #0x593D
			b sc_out
sc_0x483E:
			mov r1, #0x483E
			mov r2, #0x593E
			b sc_out
sc_0x483F:
			mov r1, #0x483F
			mov r2, #0x593F
			b sc_out
sc_0x4920:
			mov r1, #0x4920
			mov r2, #0x5920
			b sc_out
sc_0x4921:
			mov r1, #0x4921
			mov r2, #0x5921
			b sc_out
sc_0x4922:
			mov r1, #0x4922
			mov r2, #0x5922
			b sc_out
sc_0x4923:
			mov r1, #0x4923
			mov r2, #0x5923
			b sc_out
sc_0x4924:
			mov r1, #0x4924
			mov r2, #0x5924
			b sc_out
sc_0x4925:
			mov r1, #0x4925
			mov r2, #0x5925
			b sc_out
sc_0x4926:
			mov r1, #0x4926
			mov r2, #0x5926
			b sc_out
sc_0x4927:
			mov r1, #0x4927
			mov r2, #0x5927
			b sc_out
sc_0x4928:
			mov r1, #0x4928
			mov r2, #0x5928
			b sc_out
sc_0x4929:
			mov r1, #0x4929
			mov r2, #0x5929
			b sc_out
sc_0x492A:
			mov r1, #0x492A
			mov r2, #0x592A
			b sc_out
sc_0x492B:
			mov r1, #0x492B
			mov r2, #0x592B
			b sc_out
sc_0x492C:
			mov r1, #0x492C
			mov r2, #0x592C
			b sc_out
sc_0x492D:
			mov r1, #0x492D
			mov r2, #0x592D
			b sc_out
sc_0x492E:
			mov r1, #0x492E
			mov r2, #0x592E
			b sc_out
sc_0x492F:
			mov r1, #0x492F
			mov r2, #0x592F
			b sc_out
sc_0x4930:
			mov r1, #0x4930
			mov r2, #0x5930
			b sc_out
sc_0x4931:
			mov r1, #0x4931
			mov r2, #0x5931
			b sc_out
sc_0x4932:
			mov r1, #0x4932
			mov r2, #0x5932
			b sc_out
sc_0x4933:
			mov r1, #0x4933
			mov r2, #0x5933
			b sc_out
sc_0x4934:
			mov r1, #0x4934
			mov r2, #0x5934
			b sc_out
sc_0x4935:
			mov r1, #0x4935
			mov r2, #0x5935
			b sc_out
sc_0x4936:
			mov r1, #0x4936
			mov r2, #0x5936
			b sc_out
sc_0x4937:
			mov r1, #0x4937
			mov r2, #0x5937
			b sc_out
sc_0x4938:
			mov r1, #0x4938
			mov r2, #0x5938
			b sc_out
sc_0x4939:
			mov r1, #0x4939
			mov r2, #0x5939
			b sc_out
sc_0x493A:
			mov r1, #0x493A
			mov r2, #0x593A
			b sc_out
sc_0x493B:
			mov r1, #0x493B
			mov r2, #0x593B
			b sc_out
sc_0x493C:
			mov r1, #0x493C
			mov r2, #0x593C
			b sc_out
sc_0x493D:
			mov r1, #0x493D
			mov r2, #0x593D
			b sc_out
sc_0x493E:
			mov r1, #0x493E
			mov r2, #0x593E
			b sc_out
sc_0x493F:
			mov r1, #0x493F
			mov r2, #0x593F
			b sc_out
sc_0x4A20:
			mov r1, #0x4A20
			mov r2, #0x5920
			b sc_out
sc_0x4A21:
			mov r1, #0x4A21
			mov r2, #0x5921
			b sc_out
sc_0x4A22:
			mov r1, #0x4A22
			mov r2, #0x5922
			b sc_out
sc_0x4A23:
			mov r1, #0x4A23
			mov r2, #0x5923
			b sc_out
sc_0x4A24:
			mov r1, #0x4A24
			mov r2, #0x5924
			b sc_out
sc_0x4A25:
			mov r1, #0x4A25
			mov r2, #0x5925
			b sc_out
sc_0x4A26:
			mov r1, #0x4A26
			mov r2, #0x5926
			b sc_out
sc_0x4A27:
			mov r1, #0x4A27
			mov r2, #0x5927
			b sc_out
sc_0x4A28:
			mov r1, #0x4A28
			mov r2, #0x5928
			b sc_out
sc_0x4A29:
			mov r1, #0x4A29
			mov r2, #0x5929
			b sc_out
sc_0x4A2A:
			mov r1, #0x4A2A
			mov r2, #0x592A
			b sc_out
sc_0x4A2B:
			mov r1, #0x4A2B
			mov r2, #0x592B
			b sc_out
sc_0x4A2C:
			mov r1, #0x4A2C
			mov r2, #0x592C
			b sc_out
sc_0x4A2D:
			mov r1, #0x4A2D
			mov r2, #0x592D
			b sc_out
sc_0x4A2E:
			mov r1, #0x4A2E
			mov r2, #0x592E
			b sc_out
sc_0x4A2F:
			mov r1, #0x4A2F
			mov r2, #0x592F
			b sc_out
sc_0x4A30:
			mov r1, #0x4A30
			mov r2, #0x5930
			b sc_out
sc_0x4A31:
			mov r1, #0x4A31
			mov r2, #0x5931
			b sc_out
sc_0x4A32:
			mov r1, #0x4A32
			mov r2, #0x5932
			b sc_out
sc_0x4A33:
			mov r1, #0x4A33
			mov r2, #0x5933
			b sc_out
sc_0x4A34:
			mov r1, #0x4A34
			mov r2, #0x5934
			b sc_out
sc_0x4A35:
			mov r1, #0x4A35
			mov r2, #0x5935
			b sc_out
sc_0x4A36:
			mov r1, #0x4A36
			mov r2, #0x5936
			b sc_out
sc_0x4A37:
			mov r1, #0x4A37
			mov r2, #0x5937
			b sc_out
sc_0x4A38:
			mov r1, #0x4A38
			mov r2, #0x5938
			b sc_out
sc_0x4A39:
			mov r1, #0x4A39
			mov r2, #0x5939
			b sc_out
sc_0x4A3A:
			mov r1, #0x4A3A
			mov r2, #0x593A
			b sc_out
sc_0x4A3B:
			mov r1, #0x4A3B
			mov r2, #0x593B
			b sc_out
sc_0x4A3C:
			mov r1, #0x4A3C
			mov r2, #0x593C
			b sc_out
sc_0x4A3D:
			mov r1, #0x4A3D
			mov r2, #0x593D
			b sc_out
sc_0x4A3E:
			mov r1, #0x4A3E
			mov r2, #0x593E
			b sc_out
sc_0x4A3F:
			mov r1, #0x4A3F
			mov r2, #0x593F
			b sc_out
sc_0x4B20:
			mov r1, #0x4B20
			mov r2, #0x5920
			b sc_out
sc_0x4B21:
			mov r1, #0x4B21
			mov r2, #0x5921
			b sc_out
sc_0x4B22:
			mov r1, #0x4B22
			mov r2, #0x5922
			b sc_out
sc_0x4B23:
			mov r1, #0x4B23
			mov r2, #0x5923
			b sc_out
sc_0x4B24:
			mov r1, #0x4B24
			mov r2, #0x5924
			b sc_out
sc_0x4B25:
			mov r1, #0x4B25
			mov r2, #0x5925
			b sc_out
sc_0x4B26:
			mov r1, #0x4B26
			mov r2, #0x5926
			b sc_out
sc_0x4B27:
			mov r1, #0x4B27
			mov r2, #0x5927
			b sc_out
sc_0x4B28:
			mov r1, #0x4B28
			mov r2, #0x5928
			b sc_out
sc_0x4B29:
			mov r1, #0x4B29
			mov r2, #0x5929
			b sc_out
sc_0x4B2A:
			mov r1, #0x4B2A
			mov r2, #0x592A
			b sc_out
sc_0x4B2B:
			mov r1, #0x4B2B
			mov r2, #0x592B
			b sc_out
sc_0x4B2C:
			mov r1, #0x4B2C
			mov r2, #0x592C
			b sc_out
sc_0x4B2D:
			mov r1, #0x4B2D
			mov r2, #0x592D
			b sc_out
sc_0x4B2E:
			mov r1, #0x4B2E
			mov r2, #0x592E
			b sc_out
sc_0x4B2F:
			mov r1, #0x4B2F
			mov r2, #0x592F
			b sc_out
sc_0x4B30:
			mov r1, #0x4B30
			mov r2, #0x5930
			b sc_out
sc_0x4B31:
			mov r1, #0x4B31
			mov r2, #0x5931
			b sc_out
sc_0x4B32:
			mov r1, #0x4B32
			mov r2, #0x5932
			b sc_out
sc_0x4B33:
			mov r1, #0x4B33
			mov r2, #0x5933
			b sc_out
sc_0x4B34:
			mov r1, #0x4B34
			mov r2, #0x5934
			b sc_out
sc_0x4B35:
			mov r1, #0x4B35
			mov r2, #0x5935
			b sc_out
sc_0x4B36:
			mov r1, #0x4B36
			mov r2, #0x5936
			b sc_out
sc_0x4B37:
			mov r1, #0x4B37
			mov r2, #0x5937
			b sc_out
sc_0x4B38:
			mov r1, #0x4B38
			mov r2, #0x5938
			b sc_out
sc_0x4B39:
			mov r1, #0x4B39
			mov r2, #0x5939
			b sc_out
sc_0x4B3A:
			mov r1, #0x4B3A
			mov r2, #0x593A
			b sc_out
sc_0x4B3B:
			mov r1, #0x4B3B
			mov r2, #0x593B
			b sc_out
sc_0x4B3C:
			mov r1, #0x4B3C
			mov r2, #0x593C
			b sc_out
sc_0x4B3D:
			mov r1, #0x4B3D
			mov r2, #0x593D
			b sc_out
sc_0x4B3E:
			mov r1, #0x4B3E
			mov r2, #0x593E
			b sc_out
sc_0x4B3F:
			mov r1, #0x4B3F
			mov r2, #0x593F
			b sc_out
sc_0x4C20:
			mov r1, #0x4C20
			mov r2, #0x5920
			b sc_out
sc_0x4C21:
			mov r1, #0x4C21
			mov r2, #0x5921
			b sc_out
sc_0x4C22:
			mov r1, #0x4C22
			mov r2, #0x5922
			b sc_out
sc_0x4C23:
			mov r1, #0x4C23
			mov r2, #0x5923
			b sc_out
sc_0x4C24:
			mov r1, #0x4C24
			mov r2, #0x5924
			b sc_out
sc_0x4C25:
			mov r1, #0x4C25
			mov r2, #0x5925
			b sc_out
sc_0x4C26:
			mov r1, #0x4C26
			mov r2, #0x5926
			b sc_out
sc_0x4C27:
			mov r1, #0x4C27
			mov r2, #0x5927
			b sc_out
sc_0x4C28:
			mov r1, #0x4C28
			mov r2, #0x5928
			b sc_out
sc_0x4C29:
			mov r1, #0x4C29
			mov r2, #0x5929
			b sc_out
sc_0x4C2A:
			mov r1, #0x4C2A
			mov r2, #0x592A
			b sc_out
sc_0x4C2B:
			mov r1, #0x4C2B
			mov r2, #0x592B
			b sc_out
sc_0x4C2C:
			mov r1, #0x4C2C
			mov r2, #0x592C
			b sc_out
sc_0x4C2D:
			mov r1, #0x4C2D
			mov r2, #0x592D
			b sc_out
sc_0x4C2E:
			mov r1, #0x4C2E
			mov r2, #0x592E
			b sc_out
sc_0x4C2F:
			mov r1, #0x4C2F
			mov r2, #0x592F
			b sc_out
sc_0x4C30:
			mov r1, #0x4C30
			mov r2, #0x5930
			b sc_out
sc_0x4C31:
			mov r1, #0x4C31
			mov r2, #0x5931
			b sc_out
sc_0x4C32:
			mov r1, #0x4C32
			mov r2, #0x5932
			b sc_out
sc_0x4C33:
			mov r1, #0x4C33
			mov r2, #0x5933
			b sc_out
sc_0x4C34:
			mov r1, #0x4C34
			mov r2, #0x5934
			b sc_out
sc_0x4C35:
			mov r1, #0x4C35
			mov r2, #0x5935
			b sc_out
sc_0x4C36:
			mov r1, #0x4C36
			mov r2, #0x5936
			b sc_out
sc_0x4C37:
			mov r1, #0x4C37
			mov r2, #0x5937
			b sc_out
sc_0x4C38:
			mov r1, #0x4C38
			mov r2, #0x5938
			b sc_out
sc_0x4C39:
			mov r1, #0x4C39
			mov r2, #0x5939
			b sc_out
sc_0x4C3A:
			mov r1, #0x4C3A
			mov r2, #0x593A
			b sc_out
sc_0x4C3B:
			mov r1, #0x4C3B
			mov r2, #0x593B
			b sc_out
sc_0x4C3C:
			mov r1, #0x4C3C
			mov r2, #0x593C
			b sc_out
sc_0x4C3D:
			mov r1, #0x4C3D
			mov r2, #0x593D
			b sc_out
sc_0x4C3E:
			mov r1, #0x4C3E
			mov r2, #0x593E
			b sc_out
sc_0x4C3F:
			mov r1, #0x4C3F
			mov r2, #0x593F
			b sc_out
sc_0x4D20:
			mov r1, #0x4D20
			mov r2, #0x5920
			b sc_out
sc_0x4D21:
			mov r1, #0x4D21
			mov r2, #0x5921
			b sc_out
sc_0x4D22:
			mov r1, #0x4D22
			mov r2, #0x5922
			b sc_out
sc_0x4D23:
			mov r1, #0x4D23
			mov r2, #0x5923
			b sc_out
sc_0x4D24:
			mov r1, #0x4D24
			mov r2, #0x5924
			b sc_out
sc_0x4D25:
			mov r1, #0x4D25
			mov r2, #0x5925
			b sc_out
sc_0x4D26:
			mov r1, #0x4D26
			mov r2, #0x5926
			b sc_out
sc_0x4D27:
			mov r1, #0x4D27
			mov r2, #0x5927
			b sc_out
sc_0x4D28:
			mov r1, #0x4D28
			mov r2, #0x5928
			b sc_out
sc_0x4D29:
			mov r1, #0x4D29
			mov r2, #0x5929
			b sc_out
sc_0x4D2A:
			mov r1, #0x4D2A
			mov r2, #0x592A
			b sc_out
sc_0x4D2B:
			mov r1, #0x4D2B
			mov r2, #0x592B
			b sc_out
sc_0x4D2C:
			mov r1, #0x4D2C
			mov r2, #0x592C
			b sc_out
sc_0x4D2D:
			mov r1, #0x4D2D
			mov r2, #0x592D
			b sc_out
sc_0x4D2E:
			mov r1, #0x4D2E
			mov r2, #0x592E
			b sc_out
sc_0x4D2F:
			mov r1, #0x4D2F
			mov r2, #0x592F
			b sc_out
sc_0x4D30:
			mov r1, #0x4D30
			mov r2, #0x5930
			b sc_out
sc_0x4D31:
			mov r1, #0x4D31
			mov r2, #0x5931
			b sc_out
sc_0x4D32:
			mov r1, #0x4D32
			mov r2, #0x5932
			b sc_out
sc_0x4D33:
			mov r1, #0x4D33
			mov r2, #0x5933
			b sc_out
sc_0x4D34:
			mov r1, #0x4D34
			mov r2, #0x5934
			b sc_out
sc_0x4D35:
			mov r1, #0x4D35
			mov r2, #0x5935
			b sc_out
sc_0x4D36:
			mov r1, #0x4D36
			mov r2, #0x5936
			b sc_out
sc_0x4D37:
			mov r1, #0x4D37
			mov r2, #0x5937
			b sc_out
sc_0x4D38:
			mov r1, #0x4D38
			mov r2, #0x5938
			b sc_out
sc_0x4D39:
			mov r1, #0x4D39
			mov r2, #0x5939
			b sc_out
sc_0x4D3A:
			mov r1, #0x4D3A
			mov r2, #0x593A
			b sc_out
sc_0x4D3B:
			mov r1, #0x4D3B
			mov r2, #0x593B
			b sc_out
sc_0x4D3C:
			mov r1, #0x4D3C
			mov r2, #0x593C
			b sc_out
sc_0x4D3D:
			mov r1, #0x4D3D
			mov r2, #0x593D
			b sc_out
sc_0x4D3E:
			mov r1, #0x4D3E
			mov r2, #0x593E
			b sc_out
sc_0x4D3F:
			mov r1, #0x4D3F
			mov r2, #0x593F
			b sc_out
sc_0x4E20:
			mov r1, #0x4E20
			mov r2, #0x5920
			b sc_out
sc_0x4E21:
			mov r1, #0x4E21
			mov r2, #0x5921
			b sc_out
sc_0x4E22:
			mov r1, #0x4E22
			mov r2, #0x5922
			b sc_out
sc_0x4E23:
			mov r1, #0x4E23
			mov r2, #0x5923
			b sc_out
sc_0x4E24:
			mov r1, #0x4E24
			mov r2, #0x5924
			b sc_out
sc_0x4E25:
			mov r1, #0x4E25
			mov r2, #0x5925
			b sc_out
sc_0x4E26:
			mov r1, #0x4E26
			mov r2, #0x5926
			b sc_out
sc_0x4E27:
			mov r1, #0x4E27
			mov r2, #0x5927
			b sc_out
sc_0x4E28:
			mov r1, #0x4E28
			mov r2, #0x5928
			b sc_out
sc_0x4E29:
			mov r1, #0x4E29
			mov r2, #0x5929
			b sc_out
sc_0x4E2A:
			mov r1, #0x4E2A
			mov r2, #0x592A
			b sc_out
sc_0x4E2B:
			mov r1, #0x4E2B
			mov r2, #0x592B
			b sc_out
sc_0x4E2C:
			mov r1, #0x4E2C
			mov r2, #0x592C
			b sc_out
sc_0x4E2D:
			mov r1, #0x4E2D
			mov r2, #0x592D
			b sc_out
sc_0x4E2E:
			mov r1, #0x4E2E
			mov r2, #0x592E
			b sc_out
sc_0x4E2F:
			mov r1, #0x4E2F
			mov r2, #0x592F
			b sc_out
sc_0x4E30:
			mov r1, #0x4E30
			mov r2, #0x5930
			b sc_out
sc_0x4E31:
			mov r1, #0x4E31
			mov r2, #0x5931
			b sc_out
sc_0x4E32:
			mov r1, #0x4E32
			mov r2, #0x5932
			b sc_out
sc_0x4E33:
			mov r1, #0x4E33
			mov r2, #0x5933
			b sc_out
sc_0x4E34:
			mov r1, #0x4E34
			mov r2, #0x5934
			b sc_out
sc_0x4E35:
			mov r1, #0x4E35
			mov r2, #0x5935
			b sc_out
sc_0x4E36:
			mov r1, #0x4E36
			mov r2, #0x5936
			b sc_out
sc_0x4E37:
			mov r1, #0x4E37
			mov r2, #0x5937
			b sc_out
sc_0x4E38:
			mov r1, #0x4E38
			mov r2, #0x5938
			b sc_out
sc_0x4E39:
			mov r1, #0x4E39
			mov r2, #0x5939
			b sc_out
sc_0x4E3A:
			mov r1, #0x4E3A
			mov r2, #0x593A
			b sc_out
sc_0x4E3B:
			mov r1, #0x4E3B
			mov r2, #0x593B
			b sc_out
sc_0x4E3C:
			mov r1, #0x4E3C
			mov r2, #0x593C
			b sc_out
sc_0x4E3D:
			mov r1, #0x4E3D
			mov r2, #0x593D
			b sc_out
sc_0x4E3E:
			mov r1, #0x4E3E
			mov r2, #0x593E
			b sc_out
sc_0x4E3F:
			mov r1, #0x4E3F
			mov r2, #0x593F
			b sc_out
sc_0x4F20:
			mov r1, #0x4F20
			mov r2, #0x5920
			b sc_out
sc_0x4F21:
			mov r1, #0x4F21
			mov r2, #0x5921
			b sc_out
sc_0x4F22:
			mov r1, #0x4F22
			mov r2, #0x5922
			b sc_out
sc_0x4F23:
			mov r1, #0x4F23
			mov r2, #0x5923
			b sc_out
sc_0x4F24:
			mov r1, #0x4F24
			mov r2, #0x5924
			b sc_out
sc_0x4F25:
			mov r1, #0x4F25
			mov r2, #0x5925
			b sc_out
sc_0x4F26:
			mov r1, #0x4F26
			mov r2, #0x5926
			b sc_out
sc_0x4F27:
			mov r1, #0x4F27
			mov r2, #0x5927
			b sc_out
sc_0x4F28:
			mov r1, #0x4F28
			mov r2, #0x5928
			b sc_out
sc_0x4F29:
			mov r1, #0x4F29
			mov r2, #0x5929
			b sc_out
sc_0x4F2A:
			mov r1, #0x4F2A
			mov r2, #0x592A
			b sc_out
sc_0x4F2B:
			mov r1, #0x4F2B
			mov r2, #0x592B
			b sc_out
sc_0x4F2C:
			mov r1, #0x4F2C
			mov r2, #0x592C
			b sc_out
sc_0x4F2D:
			mov r1, #0x4F2D
			mov r2, #0x592D
			b sc_out
sc_0x4F2E:
			mov r1, #0x4F2E
			mov r2, #0x592E
			b sc_out
sc_0x4F2F:
			mov r1, #0x4F2F
			mov r2, #0x592F
			b sc_out
sc_0x4F30:
			mov r1, #0x4F30
			mov r2, #0x5930
			b sc_out
sc_0x4F31:
			mov r1, #0x4F31
			mov r2, #0x5931
			b sc_out
sc_0x4F32:
			mov r1, #0x4F32
			mov r2, #0x5932
			b sc_out
sc_0x4F33:
			mov r1, #0x4F33
			mov r2, #0x5933
			b sc_out
sc_0x4F34:
			mov r1, #0x4F34
			mov r2, #0x5934
			b sc_out
sc_0x4F35:
			mov r1, #0x4F35
			mov r2, #0x5935
			b sc_out
sc_0x4F36:
			mov r1, #0x4F36
			mov r2, #0x5936
			b sc_out
sc_0x4F37:
			mov r1, #0x4F37
			mov r2, #0x5937
			b sc_out
sc_0x4F38:
			mov r1, #0x4F38
			mov r2, #0x5938
			b sc_out
sc_0x4F39:
			mov r1, #0x4F39
			mov r2, #0x5939
			b sc_out
sc_0x4F3A:
			mov r1, #0x4F3A
			mov r2, #0x593A
			b sc_out
sc_0x4F3B:
			mov r1, #0x4F3B
			mov r2, #0x593B
			b sc_out
sc_0x4F3C:
			mov r1, #0x4F3C
			mov r2, #0x593C
			b sc_out
sc_0x4F3D:
			mov r1, #0x4F3D
			mov r2, #0x593D
			b sc_out
sc_0x4F3E:
			mov r1, #0x4F3E
			mov r2, #0x593E
			b sc_out
sc_0x4F3F:
			mov r1, #0x4F3F
			mov r2, #0x593F
			b sc_out
sc_0x4840:
			mov r1, #0x4840
			mov r2, #0x5940
			b sc_out
sc_0x4841:
			mov r1, #0x4841
			mov r2, #0x5941
			b sc_out
sc_0x4842:
			mov r1, #0x4842
			mov r2, #0x5942
			b sc_out
sc_0x4843:
			mov r1, #0x4843
			mov r2, #0x5943
			b sc_out
sc_0x4844:
			mov r1, #0x4844
			mov r2, #0x5944
			b sc_out
sc_0x4845:
			mov r1, #0x4845
			mov r2, #0x5945
			b sc_out
sc_0x4846:
			mov r1, #0x4846
			mov r2, #0x5946
			b sc_out
sc_0x4847:
			mov r1, #0x4847
			mov r2, #0x5947
			b sc_out
sc_0x4848:
			mov r1, #0x4848
			mov r2, #0x5948
			b sc_out
sc_0x4849:
			mov r1, #0x4849
			mov r2, #0x5949
			b sc_out
sc_0x484A:
			mov r1, #0x484A
			mov r2, #0x594A
			b sc_out
sc_0x484B:
			mov r1, #0x484B
			mov r2, #0x594B
			b sc_out
sc_0x484C:
			mov r1, #0x484C
			mov r2, #0x594C
			b sc_out
sc_0x484D:
			mov r1, #0x484D
			mov r2, #0x594D
			b sc_out
sc_0x484E:
			mov r1, #0x484E
			mov r2, #0x594E
			b sc_out
sc_0x484F:
			mov r1, #0x484F
			mov r2, #0x594F
			b sc_out
sc_0x4850:
			mov r1, #0x4850
			mov r2, #0x5950
			b sc_out
sc_0x4851:
			mov r1, #0x4851
			mov r2, #0x5951
			b sc_out
sc_0x4852:
			mov r1, #0x4852
			mov r2, #0x5952
			b sc_out
sc_0x4853:
			mov r1, #0x4853
			mov r2, #0x5953
			b sc_out
sc_0x4854:
			mov r1, #0x4854
			mov r2, #0x5954
			b sc_out
sc_0x4855:
			mov r1, #0x4855
			mov r2, #0x5955
			b sc_out
sc_0x4856:
			mov r1, #0x4856
			mov r2, #0x5956
			b sc_out
sc_0x4857:
			mov r1, #0x4857
			mov r2, #0x5957
			b sc_out
sc_0x4858:
			mov r1, #0x4858
			mov r2, #0x5958
			b sc_out
sc_0x4859:
			mov r1, #0x4859
			mov r2, #0x5959
			b sc_out
sc_0x485A:
			mov r1, #0x485A
			mov r2, #0x595A
			b sc_out
sc_0x485B:
			mov r1, #0x485B
			mov r2, #0x595B
			b sc_out
sc_0x485C:
			mov r1, #0x485C
			mov r2, #0x595C
			b sc_out
sc_0x485D:
			mov r1, #0x485D
			mov r2, #0x595D
			b sc_out
sc_0x485E:
			mov r1, #0x485E
			mov r2, #0x595E
			b sc_out
sc_0x485F:
			mov r1, #0x485F
			mov r2, #0x595F
			b sc_out
sc_0x4940:
			mov r1, #0x4940
			mov r2, #0x5940
			b sc_out
sc_0x4941:
			mov r1, #0x4941
			mov r2, #0x5941
			b sc_out
sc_0x4942:
			mov r1, #0x4942
			mov r2, #0x5942
			b sc_out
sc_0x4943:
			mov r1, #0x4943
			mov r2, #0x5943
			b sc_out
sc_0x4944:
			mov r1, #0x4944
			mov r2, #0x5944
			b sc_out
sc_0x4945:
			mov r1, #0x4945
			mov r2, #0x5945
			b sc_out
sc_0x4946:
			mov r1, #0x4946
			mov r2, #0x5946
			b sc_out
sc_0x4947:
			mov r1, #0x4947
			mov r2, #0x5947
			b sc_out
sc_0x4948:
			mov r1, #0x4948
			mov r2, #0x5948
			b sc_out
sc_0x4949:
			mov r1, #0x4949
			mov r2, #0x5949
			b sc_out
sc_0x494A:
			mov r1, #0x494A
			mov r2, #0x594A
			b sc_out
sc_0x494B:
			mov r1, #0x494B
			mov r2, #0x594B
			b sc_out
sc_0x494C:
			mov r1, #0x494C
			mov r2, #0x594C
			b sc_out
sc_0x494D:
			mov r1, #0x494D
			mov r2, #0x594D
			b sc_out
sc_0x494E:
			mov r1, #0x494E
			mov r2, #0x594E
			b sc_out
sc_0x494F:
			mov r1, #0x494F
			mov r2, #0x594F
			b sc_out
sc_0x4950:
			mov r1, #0x4950
			mov r2, #0x5950
			b sc_out
sc_0x4951:
			mov r1, #0x4951
			mov r2, #0x5951
			b sc_out
sc_0x4952:
			mov r1, #0x4952
			mov r2, #0x5952
			b sc_out
sc_0x4953:
			mov r1, #0x4953
			mov r2, #0x5953
			b sc_out
sc_0x4954:
			mov r1, #0x4954
			mov r2, #0x5954
			b sc_out
sc_0x4955:
			mov r1, #0x4955
			mov r2, #0x5955
			b sc_out
sc_0x4956:
			mov r1, #0x4956
			mov r2, #0x5956
			b sc_out
sc_0x4957:
			mov r1, #0x4957
			mov r2, #0x5957
			b sc_out
sc_0x4958:
			mov r1, #0x4958
			mov r2, #0x5958
			b sc_out
sc_0x4959:
			mov r1, #0x4959
			mov r2, #0x5959
			b sc_out
sc_0x495A:
			mov r1, #0x495A
			mov r2, #0x595A
			b sc_out
sc_0x495B:
			mov r1, #0x495B
			mov r2, #0x595B
			b sc_out
sc_0x495C:
			mov r1, #0x495C
			mov r2, #0x595C
			b sc_out
sc_0x495D:
			mov r1, #0x495D
			mov r2, #0x595D
			b sc_out
sc_0x495E:
			mov r1, #0x495E
			mov r2, #0x595E
			b sc_out
sc_0x495F:
			mov r1, #0x495F
			mov r2, #0x595F
			b sc_out
sc_0x4A40:
			mov r1, #0x4A40
			mov r2, #0x5940
			b sc_out
sc_0x4A41:
			mov r1, #0x4A41
			mov r2, #0x5941
			b sc_out
sc_0x4A42:
			mov r1, #0x4A42
			mov r2, #0x5942
			b sc_out
sc_0x4A43:
			mov r1, #0x4A43
			mov r2, #0x5943
			b sc_out
sc_0x4A44:
			mov r1, #0x4A44
			mov r2, #0x5944
			b sc_out
sc_0x4A45:
			mov r1, #0x4A45
			mov r2, #0x5945
			b sc_out
sc_0x4A46:
			mov r1, #0x4A46
			mov r2, #0x5946
			b sc_out
sc_0x4A47:
			mov r1, #0x4A47
			mov r2, #0x5947
			b sc_out
sc_0x4A48:
			mov r1, #0x4A48
			mov r2, #0x5948
			b sc_out
sc_0x4A49:
			mov r1, #0x4A49
			mov r2, #0x5949
			b sc_out
sc_0x4A4A:
			mov r1, #0x4A4A
			mov r2, #0x594A
			b sc_out
sc_0x4A4B:
			mov r1, #0x4A4B
			mov r2, #0x594B
			b sc_out
sc_0x4A4C:
			mov r1, #0x4A4C
			mov r2, #0x594C
			b sc_out
sc_0x4A4D:
			mov r1, #0x4A4D
			mov r2, #0x594D
			b sc_out
sc_0x4A4E:
			mov r1, #0x4A4E
			mov r2, #0x594E
			b sc_out
sc_0x4A4F:
			mov r1, #0x4A4F
			mov r2, #0x594F
			b sc_out
sc_0x4A50:
			mov r1, #0x4A50
			mov r2, #0x5950
			b sc_out
sc_0x4A51:
			mov r1, #0x4A51
			mov r2, #0x5951
			b sc_out
sc_0x4A52:
			mov r1, #0x4A52
			mov r2, #0x5952
			b sc_out
sc_0x4A53:
			mov r1, #0x4A53
			mov r2, #0x5953
			b sc_out
sc_0x4A54:
			mov r1, #0x4A54
			mov r2, #0x5954
			b sc_out
sc_0x4A55:
			mov r1, #0x4A55
			mov r2, #0x5955
			b sc_out
sc_0x4A56:
			mov r1, #0x4A56
			mov r2, #0x5956
			b sc_out
sc_0x4A57:
			mov r1, #0x4A57
			mov r2, #0x5957
			b sc_out
sc_0x4A58:
			mov r1, #0x4A58
			mov r2, #0x5958
			b sc_out
sc_0x4A59:
			mov r1, #0x4A59
			mov r2, #0x5959
			b sc_out
sc_0x4A5A:
			mov r1, #0x4A5A
			mov r2, #0x595A
			b sc_out
sc_0x4A5B:
			mov r1, #0x4A5B
			mov r2, #0x595B
			b sc_out
sc_0x4A5C:
			mov r1, #0x4A5C
			mov r2, #0x595C
			b sc_out
sc_0x4A5D:
			mov r1, #0x4A5D
			mov r2, #0x595D
			b sc_out
sc_0x4A5E:
			mov r1, #0x4A5E
			mov r2, #0x595E
			b sc_out
sc_0x4A5F:
			mov r1, #0x4A5F
			mov r2, #0x595F
			b sc_out
sc_0x4B40:
			mov r1, #0x4B40
			mov r2, #0x5940
			b sc_out
sc_0x4B41:
			mov r1, #0x4B41
			mov r2, #0x5941
			b sc_out
sc_0x4B42:
			mov r1, #0x4B42
			mov r2, #0x5942
			b sc_out
sc_0x4B43:
			mov r1, #0x4B43
			mov r2, #0x5943
			b sc_out
sc_0x4B44:
			mov r1, #0x4B44
			mov r2, #0x5944
			b sc_out
sc_0x4B45:
			mov r1, #0x4B45
			mov r2, #0x5945
			b sc_out
sc_0x4B46:
			mov r1, #0x4B46
			mov r2, #0x5946
			b sc_out
sc_0x4B47:
			mov r1, #0x4B47
			mov r2, #0x5947
			b sc_out
sc_0x4B48:
			mov r1, #0x4B48
			mov r2, #0x5948
			b sc_out
sc_0x4B49:
			mov r1, #0x4B49
			mov r2, #0x5949
			b sc_out
sc_0x4B4A:
			mov r1, #0x4B4A
			mov r2, #0x594A
			b sc_out
sc_0x4B4B:
			mov r1, #0x4B4B
			mov r2, #0x594B
			b sc_out
sc_0x4B4C:
			mov r1, #0x4B4C
			mov r2, #0x594C
			b sc_out
sc_0x4B4D:
			mov r1, #0x4B4D
			mov r2, #0x594D
			b sc_out
sc_0x4B4E:
			mov r1, #0x4B4E
			mov r2, #0x594E
			b sc_out
sc_0x4B4F:
			mov r1, #0x4B4F
			mov r2, #0x594F
			b sc_out
sc_0x4B50:
			mov r1, #0x4B50
			mov r2, #0x5950
			b sc_out
sc_0x4B51:
			mov r1, #0x4B51
			mov r2, #0x5951
			b sc_out
sc_0x4B52:
			mov r1, #0x4B52
			mov r2, #0x5952
			b sc_out
sc_0x4B53:
			mov r1, #0x4B53
			mov r2, #0x5953
			b sc_out
sc_0x4B54:
			mov r1, #0x4B54
			mov r2, #0x5954
			b sc_out
sc_0x4B55:
			mov r1, #0x4B55
			mov r2, #0x5955
			b sc_out
sc_0x4B56:
			mov r1, #0x4B56
			mov r2, #0x5956
			b sc_out
sc_0x4B57:
			mov r1, #0x4B57
			mov r2, #0x5957
			b sc_out
sc_0x4B58:
			mov r1, #0x4B58
			mov r2, #0x5958
			b sc_out
sc_0x4B59:
			mov r1, #0x4B59
			mov r2, #0x5959
			b sc_out
sc_0x4B5A:
			mov r1, #0x4B5A
			mov r2, #0x595A
			b sc_out
sc_0x4B5B:
			mov r1, #0x4B5B
			mov r2, #0x595B
			b sc_out
sc_0x4B5C:
			mov r1, #0x4B5C
			mov r2, #0x595C
			b sc_out
sc_0x4B5D:
			mov r1, #0x4B5D
			mov r2, #0x595D
			b sc_out
sc_0x4B5E:
			mov r1, #0x4B5E
			mov r2, #0x595E
			b sc_out
sc_0x4B5F:
			mov r1, #0x4B5F
			mov r2, #0x595F
			b sc_out
sc_0x4C40:
			mov r1, #0x4C40
			mov r2, #0x5940
			b sc_out
sc_0x4C41:
			mov r1, #0x4C41
			mov r2, #0x5941
			b sc_out
sc_0x4C42:
			mov r1, #0x4C42
			mov r2, #0x5942
			b sc_out
sc_0x4C43:
			mov r1, #0x4C43
			mov r2, #0x5943
			b sc_out
sc_0x4C44:
			mov r1, #0x4C44
			mov r2, #0x5944
			b sc_out
sc_0x4C45:
			mov r1, #0x4C45
			mov r2, #0x5945
			b sc_out
sc_0x4C46:
			mov r1, #0x4C46
			mov r2, #0x5946
			b sc_out
sc_0x4C47:
			mov r1, #0x4C47
			mov r2, #0x5947
			b sc_out
sc_0x4C48:
			mov r1, #0x4C48
			mov r2, #0x5948
			b sc_out
sc_0x4C49:
			mov r1, #0x4C49
			mov r2, #0x5949
			b sc_out
sc_0x4C4A:
			mov r1, #0x4C4A
			mov r2, #0x594A
			b sc_out
sc_0x4C4B:
			mov r1, #0x4C4B
			mov r2, #0x594B
			b sc_out
sc_0x4C4C:
			mov r1, #0x4C4C
			mov r2, #0x594C
			b sc_out
sc_0x4C4D:
			mov r1, #0x4C4D
			mov r2, #0x594D
			b sc_out
sc_0x4C4E:
			mov r1, #0x4C4E
			mov r2, #0x594E
			b sc_out
sc_0x4C4F:
			mov r1, #0x4C4F
			mov r2, #0x594F
			b sc_out
sc_0x4C50:
			mov r1, #0x4C50
			mov r2, #0x5950
			b sc_out
sc_0x4C51:
			mov r1, #0x4C51
			mov r2, #0x5951
			b sc_out
sc_0x4C52:
			mov r1, #0x4C52
			mov r2, #0x5952
			b sc_out
sc_0x4C53:
			mov r1, #0x4C53
			mov r2, #0x5953
			b sc_out
sc_0x4C54:
			mov r1, #0x4C54
			mov r2, #0x5954
			b sc_out
sc_0x4C55:
			mov r1, #0x4C55
			mov r2, #0x5955
			b sc_out
sc_0x4C56:
			mov r1, #0x4C56
			mov r2, #0x5956
			b sc_out
sc_0x4C57:
			mov r1, #0x4C57
			mov r2, #0x5957
			b sc_out
sc_0x4C58:
			mov r1, #0x4C58
			mov r2, #0x5958
			b sc_out
sc_0x4C59:
			mov r1, #0x4C59
			mov r2, #0x5959
			b sc_out
sc_0x4C5A:
			mov r1, #0x4C5A
			mov r2, #0x595A
			b sc_out
sc_0x4C5B:
			mov r1, #0x4C5B
			mov r2, #0x595B
			b sc_out
sc_0x4C5C:
			mov r1, #0x4C5C
			mov r2, #0x595C
			b sc_out
sc_0x4C5D:
			mov r1, #0x4C5D
			mov r2, #0x595D
			b sc_out
sc_0x4C5E:
			mov r1, #0x4C5E
			mov r2, #0x595E
			b sc_out
sc_0x4C5F:
			mov r1, #0x4C5F
			mov r2, #0x595F
			b sc_out
sc_0x4D40:
			mov r1, #0x4D40
			mov r2, #0x5940
			b sc_out
sc_0x4D41:
			mov r1, #0x4D41
			mov r2, #0x5941
			b sc_out
sc_0x4D42:
			mov r1, #0x4D42
			mov r2, #0x5942
			b sc_out
sc_0x4D43:
			mov r1, #0x4D43
			mov r2, #0x5943
			b sc_out
sc_0x4D44:
			mov r1, #0x4D44
			mov r2, #0x5944
			b sc_out
sc_0x4D45:
			mov r1, #0x4D45
			mov r2, #0x5945
			b sc_out
sc_0x4D46:
			mov r1, #0x4D46
			mov r2, #0x5946
			b sc_out
sc_0x4D47:
			mov r1, #0x4D47
			mov r2, #0x5947
			b sc_out
sc_0x4D48:
			mov r1, #0x4D48
			mov r2, #0x5948
			b sc_out
sc_0x4D49:
			mov r1, #0x4D49
			mov r2, #0x5949
			b sc_out
sc_0x4D4A:
			mov r1, #0x4D4A
			mov r2, #0x594A
			b sc_out
sc_0x4D4B:
			mov r1, #0x4D4B
			mov r2, #0x594B
			b sc_out
sc_0x4D4C:
			mov r1, #0x4D4C
			mov r2, #0x594C
			b sc_out
sc_0x4D4D:
			mov r1, #0x4D4D
			mov r2, #0x594D
			b sc_out
sc_0x4D4E:
			mov r1, #0x4D4E
			mov r2, #0x594E
			b sc_out
sc_0x4D4F:
			mov r1, #0x4D4F
			mov r2, #0x594F
			b sc_out
sc_0x4D50:
			mov r1, #0x4D50
			mov r2, #0x5950
			b sc_out
sc_0x4D51:
			mov r1, #0x4D51
			mov r2, #0x5951
			b sc_out
sc_0x4D52:
			mov r1, #0x4D52
			mov r2, #0x5952
			b sc_out
sc_0x4D53:
			mov r1, #0x4D53
			mov r2, #0x5953
			b sc_out
sc_0x4D54:
			mov r1, #0x4D54
			mov r2, #0x5954
			b sc_out
sc_0x4D55:
			mov r1, #0x4D55
			mov r2, #0x5955
			b sc_out
sc_0x4D56:
			mov r1, #0x4D56
			mov r2, #0x5956
			b sc_out
sc_0x4D57:
			mov r1, #0x4D57
			mov r2, #0x5957
			b sc_out
sc_0x4D58:
			mov r1, #0x4D58
			mov r2, #0x5958
			b sc_out
sc_0x4D59:
			mov r1, #0x4D59
			mov r2, #0x5959
			b sc_out
sc_0x4D5A:
			mov r1, #0x4D5A
			mov r2, #0x595A
			b sc_out
sc_0x4D5B:
			mov r1, #0x4D5B
			mov r2, #0x595B
			b sc_out
sc_0x4D5C:
			mov r1, #0x4D5C
			mov r2, #0x595C
			b sc_out
sc_0x4D5D:
			mov r1, #0x4D5D
			mov r2, #0x595D
			b sc_out
sc_0x4D5E:
			mov r1, #0x4D5E
			mov r2, #0x595E
			b sc_out
sc_0x4D5F:
			mov r1, #0x4D5F
			mov r2, #0x595F
			b sc_out
sc_0x4E40:
			mov r1, #0x4E40
			mov r2, #0x5940
			b sc_out
sc_0x4E41:
			mov r1, #0x4E41
			mov r2, #0x5941
			b sc_out
sc_0x4E42:
			mov r1, #0x4E42
			mov r2, #0x5942
			b sc_out
sc_0x4E43:
			mov r1, #0x4E43
			mov r2, #0x5943
			b sc_out
sc_0x4E44:
			mov r1, #0x4E44
			mov r2, #0x5944
			b sc_out
sc_0x4E45:
			mov r1, #0x4E45
			mov r2, #0x5945
			b sc_out
sc_0x4E46:
			mov r1, #0x4E46
			mov r2, #0x5946
			b sc_out
sc_0x4E47:
			mov r1, #0x4E47
			mov r2, #0x5947
			b sc_out
sc_0x4E48:
			mov r1, #0x4E48
			mov r2, #0x5948
			b sc_out
sc_0x4E49:
			mov r1, #0x4E49
			mov r2, #0x5949
			b sc_out
sc_0x4E4A:
			mov r1, #0x4E4A
			mov r2, #0x594A
			b sc_out
sc_0x4E4B:
			mov r1, #0x4E4B
			mov r2, #0x594B
			b sc_out
sc_0x4E4C:
			mov r1, #0x4E4C
			mov r2, #0x594C
			b sc_out
sc_0x4E4D:
			mov r1, #0x4E4D
			mov r2, #0x594D
			b sc_out
sc_0x4E4E:
			mov r1, #0x4E4E
			mov r2, #0x594E
			b sc_out
sc_0x4E4F:
			mov r1, #0x4E4F
			mov r2, #0x594F
			b sc_out
sc_0x4E50:
			mov r1, #0x4E50
			mov r2, #0x5950
			b sc_out
sc_0x4E51:
			mov r1, #0x4E51
			mov r2, #0x5951
			b sc_out
sc_0x4E52:
			mov r1, #0x4E52
			mov r2, #0x5952
			b sc_out
sc_0x4E53:
			mov r1, #0x4E53
			mov r2, #0x5953
			b sc_out
sc_0x4E54:
			mov r1, #0x4E54
			mov r2, #0x5954
			b sc_out
sc_0x4E55:
			mov r1, #0x4E55
			mov r2, #0x5955
			b sc_out
sc_0x4E56:
			mov r1, #0x4E56
			mov r2, #0x5956
			b sc_out
sc_0x4E57:
			mov r1, #0x4E57
			mov r2, #0x5957
			b sc_out
sc_0x4E58:
			mov r1, #0x4E58
			mov r2, #0x5958
			b sc_out
sc_0x4E59:
			mov r1, #0x4E59
			mov r2, #0x5959
			b sc_out
sc_0x4E5A:
			mov r1, #0x4E5A
			mov r2, #0x595A
			b sc_out
sc_0x4E5B:
			mov r1, #0x4E5B
			mov r2, #0x595B
			b sc_out
sc_0x4E5C:
			mov r1, #0x4E5C
			mov r2, #0x595C
			b sc_out
sc_0x4E5D:
			mov r1, #0x4E5D
			mov r2, #0x595D
			b sc_out
sc_0x4E5E:
			mov r1, #0x4E5E
			mov r2, #0x595E
			b sc_out
sc_0x4E5F:
			mov r1, #0x4E5F
			mov r2, #0x595F
			b sc_out
sc_0x4F40:
			mov r1, #0x4F40
			mov r2, #0x5940
			b sc_out
sc_0x4F41:
			mov r1, #0x4F41
			mov r2, #0x5941
			b sc_out
sc_0x4F42:
			mov r1, #0x4F42
			mov r2, #0x5942
			b sc_out
sc_0x4F43:
			mov r1, #0x4F43
			mov r2, #0x5943
			b sc_out
sc_0x4F44:
			mov r1, #0x4F44
			mov r2, #0x5944
			b sc_out
sc_0x4F45:
			mov r1, #0x4F45
			mov r2, #0x5945
			b sc_out
sc_0x4F46:
			mov r1, #0x4F46
			mov r2, #0x5946
			b sc_out
sc_0x4F47:
			mov r1, #0x4F47
			mov r2, #0x5947
			b sc_out
sc_0x4F48:
			mov r1, #0x4F48
			mov r2, #0x5948
			b sc_out
sc_0x4F49:
			mov r1, #0x4F49
			mov r2, #0x5949
			b sc_out
sc_0x4F4A:
			mov r1, #0x4F4A
			mov r2, #0x594A
			b sc_out
sc_0x4F4B:
			mov r1, #0x4F4B
			mov r2, #0x594B
			b sc_out
sc_0x4F4C:
			mov r1, #0x4F4C
			mov r2, #0x594C
			b sc_out
sc_0x4F4D:
			mov r1, #0x4F4D
			mov r2, #0x594D
			b sc_out
sc_0x4F4E:
			mov r1, #0x4F4E
			mov r2, #0x594E
			b sc_out
sc_0x4F4F:
			mov r1, #0x4F4F
			mov r2, #0x594F
			b sc_out
sc_0x4F50:
			mov r1, #0x4F50
			mov r2, #0x5950
			b sc_out
sc_0x4F51:
			mov r1, #0x4F51
			mov r2, #0x5951
			b sc_out
sc_0x4F52:
			mov r1, #0x4F52
			mov r2, #0x5952
			b sc_out
sc_0x4F53:
			mov r1, #0x4F53
			mov r2, #0x5953
			b sc_out
sc_0x4F54:
			mov r1, #0x4F54
			mov r2, #0x5954
			b sc_out
sc_0x4F55:
			mov r1, #0x4F55
			mov r2, #0x5955
			b sc_out
sc_0x4F56:
			mov r1, #0x4F56
			mov r2, #0x5956
			b sc_out
sc_0x4F57:
			mov r1, #0x4F57
			mov r2, #0x5957
			b sc_out
sc_0x4F58:
			mov r1, #0x4F58
			mov r2, #0x5958
			b sc_out
sc_0x4F59:
			mov r1, #0x4F59
			mov r2, #0x5959
			b sc_out
sc_0x4F5A:
			mov r1, #0x4F5A
			mov r2, #0x595A
			b sc_out
sc_0x4F5B:
			mov r1, #0x4F5B
			mov r2, #0x595B
			b sc_out
sc_0x4F5C:
			mov r1, #0x4F5C
			mov r2, #0x595C
			b sc_out
sc_0x4F5D:
			mov r1, #0x4F5D
			mov r2, #0x595D
			b sc_out
sc_0x4F5E:
			mov r1, #0x4F5E
			mov r2, #0x595E
			b sc_out
sc_0x4F5F:
			mov r1, #0x4F5F
			mov r2, #0x595F
			b sc_out
sc_0x4860:
			mov r1, #0x4860
			mov r2, #0x5960
			b sc_out
sc_0x4861:
			mov r1, #0x4861
			mov r2, #0x5961
			b sc_out
sc_0x4862:
			mov r1, #0x4862
			mov r2, #0x5962
			b sc_out
sc_0x4863:
			mov r1, #0x4863
			mov r2, #0x5963
			b sc_out
sc_0x4864:
			mov r1, #0x4864
			mov r2, #0x5964
			b sc_out
sc_0x4865:
			mov r1, #0x4865
			mov r2, #0x5965
			b sc_out
sc_0x4866:
			mov r1, #0x4866
			mov r2, #0x5966
			b sc_out
sc_0x4867:
			mov r1, #0x4867
			mov r2, #0x5967
			b sc_out
sc_0x4868:
			mov r1, #0x4868
			mov r2, #0x5968
			b sc_out
sc_0x4869:
			mov r1, #0x4869
			mov r2, #0x5969
			b sc_out
sc_0x486A:
			mov r1, #0x486A
			mov r2, #0x596A
			b sc_out
sc_0x486B:
			mov r1, #0x486B
			mov r2, #0x596B
			b sc_out
sc_0x486C:
			mov r1, #0x486C
			mov r2, #0x596C
			b sc_out
sc_0x486D:
			mov r1, #0x486D
			mov r2, #0x596D
			b sc_out
sc_0x486E:
			mov r1, #0x486E
			mov r2, #0x596E
			b sc_out
sc_0x486F:
			mov r1, #0x486F
			mov r2, #0x596F
			b sc_out
sc_0x4870:
			mov r1, #0x4870
			mov r2, #0x5970
			b sc_out
sc_0x4871:
			mov r1, #0x4871
			mov r2, #0x5971
			b sc_out
sc_0x4872:
			mov r1, #0x4872
			mov r2, #0x5972
			b sc_out
sc_0x4873:
			mov r1, #0x4873
			mov r2, #0x5973
			b sc_out
sc_0x4874:
			mov r1, #0x4874
			mov r2, #0x5974
			b sc_out
sc_0x4875:
			mov r1, #0x4875
			mov r2, #0x5975
			b sc_out
sc_0x4876:
			mov r1, #0x4876
			mov r2, #0x5976
			b sc_out
sc_0x4877:
			mov r1, #0x4877
			mov r2, #0x5977
			b sc_out
sc_0x4878:
			mov r1, #0x4878
			mov r2, #0x5978
			b sc_out
sc_0x4879:
			mov r1, #0x4879
			mov r2, #0x5979
			b sc_out
sc_0x487A:
			mov r1, #0x487A
			mov r2, #0x597A
			b sc_out
sc_0x487B:
			mov r1, #0x487B
			mov r2, #0x597B
			b sc_out
sc_0x487C:
			mov r1, #0x487C
			mov r2, #0x597C
			b sc_out
sc_0x487D:
			mov r1, #0x487D
			mov r2, #0x597D
			b sc_out
sc_0x487E:
			mov r1, #0x487E
			mov r2, #0x597E
			b sc_out
sc_0x487F:
			mov r1, #0x487F
			mov r2, #0x597F
			b sc_out
sc_0x4960:
			mov r1, #0x4960
			mov r2, #0x5960
			b sc_out
sc_0x4961:
			mov r1, #0x4961
			mov r2, #0x5961
			b sc_out
sc_0x4962:
			mov r1, #0x4962
			mov r2, #0x5962
			b sc_out
sc_0x4963:
			mov r1, #0x4963
			mov r2, #0x5963
			b sc_out
sc_0x4964:
			mov r1, #0x4964
			mov r2, #0x5964
			b sc_out
sc_0x4965:
			mov r1, #0x4965
			mov r2, #0x5965
			b sc_out
sc_0x4966:
			mov r1, #0x4966
			mov r2, #0x5966
			b sc_out
sc_0x4967:
			mov r1, #0x4967
			mov r2, #0x5967
			b sc_out
sc_0x4968:
			mov r1, #0x4968
			mov r2, #0x5968
			b sc_out
sc_0x4969:
			mov r1, #0x4969
			mov r2, #0x5969
			b sc_out
sc_0x496A:
			mov r1, #0x496A
			mov r2, #0x596A
			b sc_out
sc_0x496B:
			mov r1, #0x496B
			mov r2, #0x596B
			b sc_out
sc_0x496C:
			mov r1, #0x496C
			mov r2, #0x596C
			b sc_out
sc_0x496D:
			mov r1, #0x496D
			mov r2, #0x596D
			b sc_out
sc_0x496E:
			mov r1, #0x496E
			mov r2, #0x596E
			b sc_out
sc_0x496F:
			mov r1, #0x496F
			mov r2, #0x596F
			b sc_out
sc_0x4970:
			mov r1, #0x4970
			mov r2, #0x5970
			b sc_out
sc_0x4971:
			mov r1, #0x4971
			mov r2, #0x5971
			b sc_out
sc_0x4972:
			mov r1, #0x4972
			mov r2, #0x5972
			b sc_out
sc_0x4973:
			mov r1, #0x4973
			mov r2, #0x5973
			b sc_out
sc_0x4974:
			mov r1, #0x4974
			mov r2, #0x5974
			b sc_out
sc_0x4975:
			mov r1, #0x4975
			mov r2, #0x5975
			b sc_out
sc_0x4976:
			mov r1, #0x4976
			mov r2, #0x5976
			b sc_out
sc_0x4977:
			mov r1, #0x4977
			mov r2, #0x5977
			b sc_out
sc_0x4978:
			mov r1, #0x4978
			mov r2, #0x5978
			b sc_out
sc_0x4979:
			mov r1, #0x4979
			mov r2, #0x5979
			b sc_out
sc_0x497A:
			mov r1, #0x497A
			mov r2, #0x597A
			b sc_out
sc_0x497B:
			mov r1, #0x497B
			mov r2, #0x597B
			b sc_out
sc_0x497C:
			mov r1, #0x497C
			mov r2, #0x597C
			b sc_out
sc_0x497D:
			mov r1, #0x497D
			mov r2, #0x597D
			b sc_out
sc_0x497E:
			mov r1, #0x497E
			mov r2, #0x597E
			b sc_out
sc_0x497F:
			mov r1, #0x497F
			mov r2, #0x597F
			b sc_out
sc_0x4A60:
			mov r1, #0x4A60
			mov r2, #0x5960
			b sc_out
sc_0x4A61:
			mov r1, #0x4A61
			mov r2, #0x5961
			b sc_out
sc_0x4A62:
			mov r1, #0x4A62
			mov r2, #0x5962
			b sc_out
sc_0x4A63:
			mov r1, #0x4A63
			mov r2, #0x5963
			b sc_out
sc_0x4A64:
			mov r1, #0x4A64
			mov r2, #0x5964
			b sc_out
sc_0x4A65:
			mov r1, #0x4A65
			mov r2, #0x5965
			b sc_out
sc_0x4A66:
			mov r1, #0x4A66
			mov r2, #0x5966
			b sc_out
sc_0x4A67:
			mov r1, #0x4A67
			mov r2, #0x5967
			b sc_out
sc_0x4A68:
			mov r1, #0x4A68
			mov r2, #0x5968
			b sc_out
sc_0x4A69:
			mov r1, #0x4A69
			mov r2, #0x5969
			b sc_out
sc_0x4A6A:
			mov r1, #0x4A6A
			mov r2, #0x596A
			b sc_out
sc_0x4A6B:
			mov r1, #0x4A6B
			mov r2, #0x596B
			b sc_out
sc_0x4A6C:
			mov r1, #0x4A6C
			mov r2, #0x596C
			b sc_out
sc_0x4A6D:
			mov r1, #0x4A6D
			mov r2, #0x596D
			b sc_out
sc_0x4A6E:
			mov r1, #0x4A6E
			mov r2, #0x596E
			b sc_out
sc_0x4A6F:
			mov r1, #0x4A6F
			mov r2, #0x596F
			b sc_out
sc_0x4A70:
			mov r1, #0x4A70
			mov r2, #0x5970
			b sc_out
sc_0x4A71:
			mov r1, #0x4A71
			mov r2, #0x5971
			b sc_out
sc_0x4A72:
			mov r1, #0x4A72
			mov r2, #0x5972
			b sc_out
sc_0x4A73:
			mov r1, #0x4A73
			mov r2, #0x5973
			b sc_out
sc_0x4A74:
			mov r1, #0x4A74
			mov r2, #0x5974
			b sc_out
sc_0x4A75:
			mov r1, #0x4A75
			mov r2, #0x5975
			b sc_out
sc_0x4A76:
			mov r1, #0x4A76
			mov r2, #0x5976
			b sc_out
sc_0x4A77:
			mov r1, #0x4A77
			mov r2, #0x5977
			b sc_out
sc_0x4A78:
			mov r1, #0x4A78
			mov r2, #0x5978
			b sc_out
sc_0x4A79:
			mov r1, #0x4A79
			mov r2, #0x5979
			b sc_out
sc_0x4A7A:
			mov r1, #0x4A7A
			mov r2, #0x597A
			b sc_out
sc_0x4A7B:
			mov r1, #0x4A7B
			mov r2, #0x597B
			b sc_out
sc_0x4A7C:
			mov r1, #0x4A7C
			mov r2, #0x597C
			b sc_out
sc_0x4A7D:
			mov r1, #0x4A7D
			mov r2, #0x597D
			b sc_out
sc_0x4A7E:
			mov r1, #0x4A7E
			mov r2, #0x597E
			b sc_out
sc_0x4A7F:
			mov r1, #0x4A7F
			mov r2, #0x597F
			b sc_out
sc_0x4B60:
			mov r1, #0x4B60
			mov r2, #0x5960
			b sc_out
sc_0x4B61:
			mov r1, #0x4B61
			mov r2, #0x5961
			b sc_out
sc_0x4B62:
			mov r1, #0x4B62
			mov r2, #0x5962
			b sc_out
sc_0x4B63:
			mov r1, #0x4B63
			mov r2, #0x5963
			b sc_out
sc_0x4B64:
			mov r1, #0x4B64
			mov r2, #0x5964
			b sc_out
sc_0x4B65:
			mov r1, #0x4B65
			mov r2, #0x5965
			b sc_out
sc_0x4B66:
			mov r1, #0x4B66
			mov r2, #0x5966
			b sc_out
sc_0x4B67:
			mov r1, #0x4B67
			mov r2, #0x5967
			b sc_out
sc_0x4B68:
			mov r1, #0x4B68
			mov r2, #0x5968
			b sc_out
sc_0x4B69:
			mov r1, #0x4B69
			mov r2, #0x5969
			b sc_out
sc_0x4B6A:
			mov r1, #0x4B6A
			mov r2, #0x596A
			b sc_out
sc_0x4B6B:
			mov r1, #0x4B6B
			mov r2, #0x596B
			b sc_out
sc_0x4B6C:
			mov r1, #0x4B6C
			mov r2, #0x596C
			b sc_out
sc_0x4B6D:
			mov r1, #0x4B6D
			mov r2, #0x596D
			b sc_out
sc_0x4B6E:
			mov r1, #0x4B6E
			mov r2, #0x596E
			b sc_out
sc_0x4B6F:
			mov r1, #0x4B6F
			mov r2, #0x596F
			b sc_out
sc_0x4B70:
			mov r1, #0x4B70
			mov r2, #0x5970
			b sc_out
sc_0x4B71:
			mov r1, #0x4B71
			mov r2, #0x5971
			b sc_out
sc_0x4B72:
			mov r1, #0x4B72
			mov r2, #0x5972
			b sc_out
sc_0x4B73:
			mov r1, #0x4B73
			mov r2, #0x5973
			b sc_out
sc_0x4B74:
			mov r1, #0x4B74
			mov r2, #0x5974
			b sc_out
sc_0x4B75:
			mov r1, #0x4B75
			mov r2, #0x5975
			b sc_out
sc_0x4B76:
			mov r1, #0x4B76
			mov r2, #0x5976
			b sc_out
sc_0x4B77:
			mov r1, #0x4B77
			mov r2, #0x5977
			b sc_out
sc_0x4B78:
			mov r1, #0x4B78
			mov r2, #0x5978
			b sc_out
sc_0x4B79:
			mov r1, #0x4B79
			mov r2, #0x5979
			b sc_out
sc_0x4B7A:
			mov r1, #0x4B7A
			mov r2, #0x597A
			b sc_out
sc_0x4B7B:
			mov r1, #0x4B7B
			mov r2, #0x597B
			b sc_out
sc_0x4B7C:
			mov r1, #0x4B7C
			mov r2, #0x597C
			b sc_out
sc_0x4B7D:
			mov r1, #0x4B7D
			mov r2, #0x597D
			b sc_out
sc_0x4B7E:
			mov r1, #0x4B7E
			mov r2, #0x597E
			b sc_out
sc_0x4B7F:
			mov r1, #0x4B7F
			mov r2, #0x597F
			b sc_out
sc_0x4C60:
			mov r1, #0x4C60
			mov r2, #0x5960
			b sc_out
sc_0x4C61:
			mov r1, #0x4C61
			mov r2, #0x5961
			b sc_out
sc_0x4C62:
			mov r1, #0x4C62
			mov r2, #0x5962
			b sc_out
sc_0x4C63:
			mov r1, #0x4C63
			mov r2, #0x5963
			b sc_out
sc_0x4C64:
			mov r1, #0x4C64
			mov r2, #0x5964
			b sc_out
sc_0x4C65:
			mov r1, #0x4C65
			mov r2, #0x5965
			b sc_out
sc_0x4C66:
			mov r1, #0x4C66
			mov r2, #0x5966
			b sc_out
sc_0x4C67:
			mov r1, #0x4C67
			mov r2, #0x5967
			b sc_out
sc_0x4C68:
			mov r1, #0x4C68
			mov r2, #0x5968
			b sc_out
sc_0x4C69:
			mov r1, #0x4C69
			mov r2, #0x5969
			b sc_out
sc_0x4C6A:
			mov r1, #0x4C6A
			mov r2, #0x596A
			b sc_out
sc_0x4C6B:
			mov r1, #0x4C6B
			mov r2, #0x596B
			b sc_out
sc_0x4C6C:
			mov r1, #0x4C6C
			mov r2, #0x596C
			b sc_out
sc_0x4C6D:
			mov r1, #0x4C6D
			mov r2, #0x596D
			b sc_out
sc_0x4C6E:
			mov r1, #0x4C6E
			mov r2, #0x596E
			b sc_out
sc_0x4C6F:
			mov r1, #0x4C6F
			mov r2, #0x596F
			b sc_out
sc_0x4C70:
			mov r1, #0x4C70
			mov r2, #0x5970
			b sc_out
sc_0x4C71:
			mov r1, #0x4C71
			mov r2, #0x5971
			b sc_out
sc_0x4C72:
			mov r1, #0x4C72
			mov r2, #0x5972
			b sc_out
sc_0x4C73:
			mov r1, #0x4C73
			mov r2, #0x5973
			b sc_out
sc_0x4C74:
			mov r1, #0x4C74
			mov r2, #0x5974
			b sc_out
sc_0x4C75:
			mov r1, #0x4C75
			mov r2, #0x5975
			b sc_out
sc_0x4C76:
			mov r1, #0x4C76
			mov r2, #0x5976
			b sc_out
sc_0x4C77:
			mov r1, #0x4C77
			mov r2, #0x5977
			b sc_out
sc_0x4C78:
			mov r1, #0x4C78
			mov r2, #0x5978
			b sc_out
sc_0x4C79:
			mov r1, #0x4C79
			mov r2, #0x5979
			b sc_out
sc_0x4C7A:
			mov r1, #0x4C7A
			mov r2, #0x597A
			b sc_out
sc_0x4C7B:
			mov r1, #0x4C7B
			mov r2, #0x597B
			b sc_out
sc_0x4C7C:
			mov r1, #0x4C7C
			mov r2, #0x597C
			b sc_out
sc_0x4C7D:
			mov r1, #0x4C7D
			mov r2, #0x597D
			b sc_out
sc_0x4C7E:
			mov r1, #0x4C7E
			mov r2, #0x597E
			b sc_out
sc_0x4C7F:
			mov r1, #0x4C7F
			mov r2, #0x597F
			b sc_out
sc_0x4D60:
			mov r1, #0x4D60
			mov r2, #0x5960
			b sc_out
sc_0x4D61:
			mov r1, #0x4D61
			mov r2, #0x5961
			b sc_out
sc_0x4D62:
			mov r1, #0x4D62
			mov r2, #0x5962
			b sc_out
sc_0x4D63:
			mov r1, #0x4D63
			mov r2, #0x5963
			b sc_out
sc_0x4D64:
			mov r1, #0x4D64
			mov r2, #0x5964
			b sc_out
sc_0x4D65:
			mov r1, #0x4D65
			mov r2, #0x5965
			b sc_out
sc_0x4D66:
			mov r1, #0x4D66
			mov r2, #0x5966
			b sc_out
sc_0x4D67:
			mov r1, #0x4D67
			mov r2, #0x5967
			b sc_out
sc_0x4D68:
			mov r1, #0x4D68
			mov r2, #0x5968
			b sc_out
sc_0x4D69:
			mov r1, #0x4D69
			mov r2, #0x5969
			b sc_out
sc_0x4D6A:
			mov r1, #0x4D6A
			mov r2, #0x596A
			b sc_out
sc_0x4D6B:
			mov r1, #0x4D6B
			mov r2, #0x596B
			b sc_out
sc_0x4D6C:
			mov r1, #0x4D6C
			mov r2, #0x596C
			b sc_out
sc_0x4D6D:
			mov r1, #0x4D6D
			mov r2, #0x596D
			b sc_out
sc_0x4D6E:
			mov r1, #0x4D6E
			mov r2, #0x596E
			b sc_out
sc_0x4D6F:
			mov r1, #0x4D6F
			mov r2, #0x596F
			b sc_out
sc_0x4D70:
			mov r1, #0x4D70
			mov r2, #0x5970
			b sc_out
sc_0x4D71:
			mov r1, #0x4D71
			mov r2, #0x5971
			b sc_out
sc_0x4D72:
			mov r1, #0x4D72
			mov r2, #0x5972
			b sc_out
sc_0x4D73:
			mov r1, #0x4D73
			mov r2, #0x5973
			b sc_out
sc_0x4D74:
			mov r1, #0x4D74
			mov r2, #0x5974
			b sc_out
sc_0x4D75:
			mov r1, #0x4D75
			mov r2, #0x5975
			b sc_out
sc_0x4D76:
			mov r1, #0x4D76
			mov r2, #0x5976
			b sc_out
sc_0x4D77:
			mov r1, #0x4D77
			mov r2, #0x5977
			b sc_out
sc_0x4D78:
			mov r1, #0x4D78
			mov r2, #0x5978
			b sc_out
sc_0x4D79:
			mov r1, #0x4D79
			mov r2, #0x5979
			b sc_out
sc_0x4D7A:
			mov r1, #0x4D7A
			mov r2, #0x597A
			b sc_out
sc_0x4D7B:
			mov r1, #0x4D7B
			mov r2, #0x597B
			b sc_out
sc_0x4D7C:
			mov r1, #0x4D7C
			mov r2, #0x597C
			b sc_out
sc_0x4D7D:
			mov r1, #0x4D7D
			mov r2, #0x597D
			b sc_out
sc_0x4D7E:
			mov r1, #0x4D7E
			mov r2, #0x597E
			b sc_out
sc_0x4D7F:
			mov r1, #0x4D7F
			mov r2, #0x597F
			b sc_out
sc_0x4E60:
			mov r1, #0x4E60
			mov r2, #0x5960
			b sc_out
sc_0x4E61:
			mov r1, #0x4E61
			mov r2, #0x5961
			b sc_out
sc_0x4E62:
			mov r1, #0x4E62
			mov r2, #0x5962
			b sc_out
sc_0x4E63:
			mov r1, #0x4E63
			mov r2, #0x5963
			b sc_out
sc_0x4E64:
			mov r1, #0x4E64
			mov r2, #0x5964
			b sc_out
sc_0x4E65:
			mov r1, #0x4E65
			mov r2, #0x5965
			b sc_out
sc_0x4E66:
			mov r1, #0x4E66
			mov r2, #0x5966
			b sc_out
sc_0x4E67:
			mov r1, #0x4E67
			mov r2, #0x5967
			b sc_out
sc_0x4E68:
			mov r1, #0x4E68
			mov r2, #0x5968
			b sc_out
sc_0x4E69:
			mov r1, #0x4E69
			mov r2, #0x5969
			b sc_out
sc_0x4E6A:
			mov r1, #0x4E6A
			mov r2, #0x596A
			b sc_out
sc_0x4E6B:
			mov r1, #0x4E6B
			mov r2, #0x596B
			b sc_out
sc_0x4E6C:
			mov r1, #0x4E6C
			mov r2, #0x596C
			b sc_out
sc_0x4E6D:
			mov r1, #0x4E6D
			mov r2, #0x596D
			b sc_out
sc_0x4E6E:
			mov r1, #0x4E6E
			mov r2, #0x596E
			b sc_out
sc_0x4E6F:
			mov r1, #0x4E6F
			mov r2, #0x596F
			b sc_out
sc_0x4E70:
			mov r1, #0x4E70
			mov r2, #0x5970
			b sc_out
sc_0x4E71:
			mov r1, #0x4E71
			mov r2, #0x5971
			b sc_out
sc_0x4E72:
			mov r1, #0x4E72
			mov r2, #0x5972
			b sc_out
sc_0x4E73:
			mov r1, #0x4E73
			mov r2, #0x5973
			b sc_out
sc_0x4E74:
			mov r1, #0x4E74
			mov r2, #0x5974
			b sc_out
sc_0x4E75:
			mov r1, #0x4E75
			mov r2, #0x5975
			b sc_out
sc_0x4E76:
			mov r1, #0x4E76
			mov r2, #0x5976
			b sc_out
sc_0x4E77:
			mov r1, #0x4E77
			mov r2, #0x5977
			b sc_out
sc_0x4E78:
			mov r1, #0x4E78
			mov r2, #0x5978
			b sc_out
sc_0x4E79:
			mov r1, #0x4E79
			mov r2, #0x5979
			b sc_out
sc_0x4E7A:
			mov r1, #0x4E7A
			mov r2, #0x597A
			b sc_out
sc_0x4E7B:
			mov r1, #0x4E7B
			mov r2, #0x597B
			b sc_out
sc_0x4E7C:
			mov r1, #0x4E7C
			mov r2, #0x597C
			b sc_out
sc_0x4E7D:
			mov r1, #0x4E7D
			mov r2, #0x597D
			b sc_out
sc_0x4E7E:
			mov r1, #0x4E7E
			mov r2, #0x597E
			b sc_out
sc_0x4E7F:
			mov r1, #0x4E7F
			mov r2, #0x597F
			b sc_out
sc_0x4F60:
			mov r1, #0x4F60
			mov r2, #0x5960
			b sc_out
sc_0x4F61:
			mov r1, #0x4F61
			mov r2, #0x5961
			b sc_out
sc_0x4F62:
			mov r1, #0x4F62
			mov r2, #0x5962
			b sc_out
sc_0x4F63:
			mov r1, #0x4F63
			mov r2, #0x5963
			b sc_out
sc_0x4F64:
			mov r1, #0x4F64
			mov r2, #0x5964
			b sc_out
sc_0x4F65:
			mov r1, #0x4F65
			mov r2, #0x5965
			b sc_out
sc_0x4F66:
			mov r1, #0x4F66
			mov r2, #0x5966
			b sc_out
sc_0x4F67:
			mov r1, #0x4F67
			mov r2, #0x5967
			b sc_out
sc_0x4F68:
			mov r1, #0x4F68
			mov r2, #0x5968
			b sc_out
sc_0x4F69:
			mov r1, #0x4F69
			mov r2, #0x5969
			b sc_out
sc_0x4F6A:
			mov r1, #0x4F6A
			mov r2, #0x596A
			b sc_out
sc_0x4F6B:
			mov r1, #0x4F6B
			mov r2, #0x596B
			b sc_out
sc_0x4F6C:
			mov r1, #0x4F6C
			mov r2, #0x596C
			b sc_out
sc_0x4F6D:
			mov r1, #0x4F6D
			mov r2, #0x596D
			b sc_out
sc_0x4F6E:
			mov r1, #0x4F6E
			mov r2, #0x596E
			b sc_out
sc_0x4F6F:
			mov r1, #0x4F6F
			mov r2, #0x596F
			b sc_out
sc_0x4F70:
			mov r1, #0x4F70
			mov r2, #0x5970
			b sc_out
sc_0x4F71:
			mov r1, #0x4F71
			mov r2, #0x5971
			b sc_out
sc_0x4F72:
			mov r1, #0x4F72
			mov r2, #0x5972
			b sc_out
sc_0x4F73:
			mov r1, #0x4F73
			mov r2, #0x5973
			b sc_out
sc_0x4F74:
			mov r1, #0x4F74
			mov r2, #0x5974
			b sc_out
sc_0x4F75:
			mov r1, #0x4F75
			mov r2, #0x5975
			b sc_out
sc_0x4F76:
			mov r1, #0x4F76
			mov r2, #0x5976
			b sc_out
sc_0x4F77:
			mov r1, #0x4F77
			mov r2, #0x5977
			b sc_out
sc_0x4F78:
			mov r1, #0x4F78
			mov r2, #0x5978
			b sc_out
sc_0x4F79:
			mov r1, #0x4F79
			mov r2, #0x5979
			b sc_out
sc_0x4F7A:
			mov r1, #0x4F7A
			mov r2, #0x597A
			b sc_out
sc_0x4F7B:
			mov r1, #0x4F7B
			mov r2, #0x597B
			b sc_out
sc_0x4F7C:
			mov r1, #0x4F7C
			mov r2, #0x597C
			b sc_out
sc_0x4F7D:
			mov r1, #0x4F7D
			mov r2, #0x597D
			b sc_out
sc_0x4F7E:
			mov r1, #0x4F7E
			mov r2, #0x597E
			b sc_out
sc_0x4F7F:
			mov r1, #0x4F7F
			mov r2, #0x597F
			b sc_out
sc_0x4880:
			mov r1, #0x4880
			mov r2, #0x5980
			b sc_out
sc_0x4881:
			mov r1, #0x4881
			mov r2, #0x5981
			b sc_out
sc_0x4882:
			mov r1, #0x4882
			mov r2, #0x5982
			b sc_out
sc_0x4883:
			mov r1, #0x4883
			mov r2, #0x5983
			b sc_out
sc_0x4884:
			mov r1, #0x4884
			mov r2, #0x5984
			b sc_out
sc_0x4885:
			mov r1, #0x4885
			mov r2, #0x5985
			b sc_out
sc_0x4886:
			mov r1, #0x4886
			mov r2, #0x5986
			b sc_out
sc_0x4887:
			mov r1, #0x4887
			mov r2, #0x5987
			b sc_out
sc_0x4888:
			mov r1, #0x4888
			mov r2, #0x5988
			b sc_out
sc_0x4889:
			mov r1, #0x4889
			mov r2, #0x5989
			b sc_out
sc_0x488A:
			mov r1, #0x488A
			mov r2, #0x598A
			b sc_out
sc_0x488B:
			mov r1, #0x488B
			mov r2, #0x598B
			b sc_out
sc_0x488C:
			mov r1, #0x488C
			mov r2, #0x598C
			b sc_out
sc_0x488D:
			mov r1, #0x488D
			mov r2, #0x598D
			b sc_out
sc_0x488E:
			mov r1, #0x488E
			mov r2, #0x598E
			b sc_out
sc_0x488F:
			mov r1, #0x488F
			mov r2, #0x598F
			b sc_out
sc_0x4890:
			mov r1, #0x4890
			mov r2, #0x5990
			b sc_out
sc_0x4891:
			mov r1, #0x4891
			mov r2, #0x5991
			b sc_out
sc_0x4892:
			mov r1, #0x4892
			mov r2, #0x5992
			b sc_out
sc_0x4893:
			mov r1, #0x4893
			mov r2, #0x5993
			b sc_out
sc_0x4894:
			mov r1, #0x4894
			mov r2, #0x5994
			b sc_out
sc_0x4895:
			mov r1, #0x4895
			mov r2, #0x5995
			b sc_out
sc_0x4896:
			mov r1, #0x4896
			mov r2, #0x5996
			b sc_out
sc_0x4897:
			mov r1, #0x4897
			mov r2, #0x5997
			b sc_out
sc_0x4898:
			mov r1, #0x4898
			mov r2, #0x5998
			b sc_out
sc_0x4899:
			mov r1, #0x4899
			mov r2, #0x5999
			b sc_out
sc_0x489A:
			mov r1, #0x489A
			mov r2, #0x599A
			b sc_out
sc_0x489B:
			mov r1, #0x489B
			mov r2, #0x599B
			b sc_out
sc_0x489C:
			mov r1, #0x489C
			mov r2, #0x599C
			b sc_out
sc_0x489D:
			mov r1, #0x489D
			mov r2, #0x599D
			b sc_out
sc_0x489E:
			mov r1, #0x489E
			mov r2, #0x599E
			b sc_out
sc_0x489F:
			mov r1, #0x489F
			mov r2, #0x599F
			b sc_out
sc_0x4980:
			mov r1, #0x4980
			mov r2, #0x5980
			b sc_out
sc_0x4981:
			mov r1, #0x4981
			mov r2, #0x5981
			b sc_out
sc_0x4982:
			mov r1, #0x4982
			mov r2, #0x5982
			b sc_out
sc_0x4983:
			mov r1, #0x4983
			mov r2, #0x5983
			b sc_out
sc_0x4984:
			mov r1, #0x4984
			mov r2, #0x5984
			b sc_out
sc_0x4985:
			mov r1, #0x4985
			mov r2, #0x5985
			b sc_out
sc_0x4986:
			mov r1, #0x4986
			mov r2, #0x5986
			b sc_out
sc_0x4987:
			mov r1, #0x4987
			mov r2, #0x5987
			b sc_out
sc_0x4988:
			mov r1, #0x4988
			mov r2, #0x5988
			b sc_out
sc_0x4989:
			mov r1, #0x4989
			mov r2, #0x5989
			b sc_out
sc_0x498A:
			mov r1, #0x498A
			mov r2, #0x598A
			b sc_out
sc_0x498B:
			mov r1, #0x498B
			mov r2, #0x598B
			b sc_out
sc_0x498C:
			mov r1, #0x498C
			mov r2, #0x598C
			b sc_out
sc_0x498D:
			mov r1, #0x498D
			mov r2, #0x598D
			b sc_out
sc_0x498E:
			mov r1, #0x498E
			mov r2, #0x598E
			b sc_out
sc_0x498F:
			mov r1, #0x498F
			mov r2, #0x598F
			b sc_out
sc_0x4990:
			mov r1, #0x4990
			mov r2, #0x5990
			b sc_out
sc_0x4991:
			mov r1, #0x4991
			mov r2, #0x5991
			b sc_out
sc_0x4992:
			mov r1, #0x4992
			mov r2, #0x5992
			b sc_out
sc_0x4993:
			mov r1, #0x4993
			mov r2, #0x5993
			b sc_out
sc_0x4994:
			mov r1, #0x4994
			mov r2, #0x5994
			b sc_out
sc_0x4995:
			mov r1, #0x4995
			mov r2, #0x5995
			b sc_out
sc_0x4996:
			mov r1, #0x4996
			mov r2, #0x5996
			b sc_out
sc_0x4997:
			mov r1, #0x4997
			mov r2, #0x5997
			b sc_out
sc_0x4998:
			mov r1, #0x4998
			mov r2, #0x5998
			b sc_out
sc_0x4999:
			mov r1, #0x4999
			mov r2, #0x5999
			b sc_out
sc_0x499A:
			mov r1, #0x499A
			mov r2, #0x599A
			b sc_out
sc_0x499B:
			mov r1, #0x499B
			mov r2, #0x599B
			b sc_out
sc_0x499C:
			mov r1, #0x499C
			mov r2, #0x599C
			b sc_out
sc_0x499D:
			mov r1, #0x499D
			mov r2, #0x599D
			b sc_out
sc_0x499E:
			mov r1, #0x499E
			mov r2, #0x599E
			b sc_out
sc_0x499F:
			mov r1, #0x499F
			mov r2, #0x599F
			b sc_out
sc_0x4A80:
			mov r1, #0x4A80
			mov r2, #0x5980
			b sc_out
sc_0x4A81:
			mov r1, #0x4A81
			mov r2, #0x5981
			b sc_out
sc_0x4A82:
			mov r1, #0x4A82
			mov r2, #0x5982
			b sc_out
sc_0x4A83:
			mov r1, #0x4A83
			mov r2, #0x5983
			b sc_out
sc_0x4A84:
			mov r1, #0x4A84
			mov r2, #0x5984
			b sc_out
sc_0x4A85:
			mov r1, #0x4A85
			mov r2, #0x5985
			b sc_out
sc_0x4A86:
			mov r1, #0x4A86
			mov r2, #0x5986
			b sc_out
sc_0x4A87:
			mov r1, #0x4A87
			mov r2, #0x5987
			b sc_out
sc_0x4A88:
			mov r1, #0x4A88
			mov r2, #0x5988
			b sc_out
sc_0x4A89:
			mov r1, #0x4A89
			mov r2, #0x5989
			b sc_out
sc_0x4A8A:
			mov r1, #0x4A8A
			mov r2, #0x598A
			b sc_out
sc_0x4A8B:
			mov r1, #0x4A8B
			mov r2, #0x598B
			b sc_out
sc_0x4A8C:
			mov r1, #0x4A8C
			mov r2, #0x598C
			b sc_out
sc_0x4A8D:
			mov r1, #0x4A8D
			mov r2, #0x598D
			b sc_out
sc_0x4A8E:
			mov r1, #0x4A8E
			mov r2, #0x598E
			b sc_out
sc_0x4A8F:
			mov r1, #0x4A8F
			mov r2, #0x598F
			b sc_out
sc_0x4A90:
			mov r1, #0x4A90
			mov r2, #0x5990
			b sc_out
sc_0x4A91:
			mov r1, #0x4A91
			mov r2, #0x5991
			b sc_out
sc_0x4A92:
			mov r1, #0x4A92
			mov r2, #0x5992
			b sc_out
sc_0x4A93:
			mov r1, #0x4A93
			mov r2, #0x5993
			b sc_out
sc_0x4A94:
			mov r1, #0x4A94
			mov r2, #0x5994
			b sc_out
sc_0x4A95:
			mov r1, #0x4A95
			mov r2, #0x5995
			b sc_out
sc_0x4A96:
			mov r1, #0x4A96
			mov r2, #0x5996
			b sc_out
sc_0x4A97:
			mov r1, #0x4A97
			mov r2, #0x5997
			b sc_out
sc_0x4A98:
			mov r1, #0x4A98
			mov r2, #0x5998
			b sc_out
sc_0x4A99:
			mov r1, #0x4A99
			mov r2, #0x5999
			b sc_out
sc_0x4A9A:
			mov r1, #0x4A9A
			mov r2, #0x599A
			b sc_out
sc_0x4A9B:
			mov r1, #0x4A9B
			mov r2, #0x599B
			b sc_out
sc_0x4A9C:
			mov r1, #0x4A9C
			mov r2, #0x599C
			b sc_out
sc_0x4A9D:
			mov r1, #0x4A9D
			mov r2, #0x599D
			b sc_out
sc_0x4A9E:
			mov r1, #0x4A9E
			mov r2, #0x599E
			b sc_out
sc_0x4A9F:
			mov r1, #0x4A9F
			mov r2, #0x599F
			b sc_out
sc_0x4B80:
			mov r1, #0x4B80
			mov r2, #0x5980
			b sc_out
sc_0x4B81:
			mov r1, #0x4B81
			mov r2, #0x5981
			b sc_out
sc_0x4B82:
			mov r1, #0x4B82
			mov r2, #0x5982
			b sc_out
sc_0x4B83:
			mov r1, #0x4B83
			mov r2, #0x5983
			b sc_out
sc_0x4B84:
			mov r1, #0x4B84
			mov r2, #0x5984
			b sc_out
sc_0x4B85:
			mov r1, #0x4B85
			mov r2, #0x5985
			b sc_out
sc_0x4B86:
			mov r1, #0x4B86
			mov r2, #0x5986
			b sc_out
sc_0x4B87:
			mov r1, #0x4B87
			mov r2, #0x5987
			b sc_out
sc_0x4B88:
			mov r1, #0x4B88
			mov r2, #0x5988
			b sc_out
sc_0x4B89:
			mov r1, #0x4B89
			mov r2, #0x5989
			b sc_out
sc_0x4B8A:
			mov r1, #0x4B8A
			mov r2, #0x598A
			b sc_out
sc_0x4B8B:
			mov r1, #0x4B8B
			mov r2, #0x598B
			b sc_out
sc_0x4B8C:
			mov r1, #0x4B8C
			mov r2, #0x598C
			b sc_out
sc_0x4B8D:
			mov r1, #0x4B8D
			mov r2, #0x598D
			b sc_out
sc_0x4B8E:
			mov r1, #0x4B8E
			mov r2, #0x598E
			b sc_out
sc_0x4B8F:
			mov r1, #0x4B8F
			mov r2, #0x598F
			b sc_out
sc_0x4B90:
			mov r1, #0x4B90
			mov r2, #0x5990
			b sc_out
sc_0x4B91:
			mov r1, #0x4B91
			mov r2, #0x5991
			b sc_out
sc_0x4B92:
			mov r1, #0x4B92
			mov r2, #0x5992
			b sc_out
sc_0x4B93:
			mov r1, #0x4B93
			mov r2, #0x5993
			b sc_out
sc_0x4B94:
			mov r1, #0x4B94
			mov r2, #0x5994
			b sc_out
sc_0x4B95:
			mov r1, #0x4B95
			mov r2, #0x5995
			b sc_out
sc_0x4B96:
			mov r1, #0x4B96
			mov r2, #0x5996
			b sc_out
sc_0x4B97:
			mov r1, #0x4B97
			mov r2, #0x5997
			b sc_out
sc_0x4B98:
			mov r1, #0x4B98
			mov r2, #0x5998
			b sc_out
sc_0x4B99:
			mov r1, #0x4B99
			mov r2, #0x5999
			b sc_out
sc_0x4B9A:
			mov r1, #0x4B9A
			mov r2, #0x599A
			b sc_out
sc_0x4B9B:
			mov r1, #0x4B9B
			mov r2, #0x599B
			b sc_out
sc_0x4B9C:
			mov r1, #0x4B9C
			mov r2, #0x599C
			b sc_out
sc_0x4B9D:
			mov r1, #0x4B9D
			mov r2, #0x599D
			b sc_out
sc_0x4B9E:
			mov r1, #0x4B9E
			mov r2, #0x599E
			b sc_out
sc_0x4B9F:
			mov r1, #0x4B9F
			mov r2, #0x599F
			b sc_out
sc_0x4C80:
			mov r1, #0x4C80
			mov r2, #0x5980
			b sc_out
sc_0x4C81:
			mov r1, #0x4C81
			mov r2, #0x5981
			b sc_out
sc_0x4C82:
			mov r1, #0x4C82
			mov r2, #0x5982
			b sc_out
sc_0x4C83:
			mov r1, #0x4C83
			mov r2, #0x5983
			b sc_out
sc_0x4C84:
			mov r1, #0x4C84
			mov r2, #0x5984
			b sc_out
sc_0x4C85:
			mov r1, #0x4C85
			mov r2, #0x5985
			b sc_out
sc_0x4C86:
			mov r1, #0x4C86
			mov r2, #0x5986
			b sc_out
sc_0x4C87:
			mov r1, #0x4C87
			mov r2, #0x5987
			b sc_out
sc_0x4C88:
			mov r1, #0x4C88
			mov r2, #0x5988
			b sc_out
sc_0x4C89:
			mov r1, #0x4C89
			mov r2, #0x5989
			b sc_out
sc_0x4C8A:
			mov r1, #0x4C8A
			mov r2, #0x598A
			b sc_out
sc_0x4C8B:
			mov r1, #0x4C8B
			mov r2, #0x598B
			b sc_out
sc_0x4C8C:
			mov r1, #0x4C8C
			mov r2, #0x598C
			b sc_out
sc_0x4C8D:
			mov r1, #0x4C8D
			mov r2, #0x598D
			b sc_out
sc_0x4C8E:
			mov r1, #0x4C8E
			mov r2, #0x598E
			b sc_out
sc_0x4C8F:
			mov r1, #0x4C8F
			mov r2, #0x598F
			b sc_out
sc_0x4C90:
			mov r1, #0x4C90
			mov r2, #0x5990
			b sc_out
sc_0x4C91:
			mov r1, #0x4C91
			mov r2, #0x5991
			b sc_out
sc_0x4C92:
			mov r1, #0x4C92
			mov r2, #0x5992
			b sc_out
sc_0x4C93:
			mov r1, #0x4C93
			mov r2, #0x5993
			b sc_out
sc_0x4C94:
			mov r1, #0x4C94
			mov r2, #0x5994
			b sc_out
sc_0x4C95:
			mov r1, #0x4C95
			mov r2, #0x5995
			b sc_out
sc_0x4C96:
			mov r1, #0x4C96
			mov r2, #0x5996
			b sc_out
sc_0x4C97:
			mov r1, #0x4C97
			mov r2, #0x5997
			b sc_out
sc_0x4C98:
			mov r1, #0x4C98
			mov r2, #0x5998
			b sc_out
sc_0x4C99:
			mov r1, #0x4C99
			mov r2, #0x5999
			b sc_out
sc_0x4C9A:
			mov r1, #0x4C9A
			mov r2, #0x599A
			b sc_out
sc_0x4C9B:
			mov r1, #0x4C9B
			mov r2, #0x599B
			b sc_out
sc_0x4C9C:
			mov r1, #0x4C9C
			mov r2, #0x599C
			b sc_out
sc_0x4C9D:
			mov r1, #0x4C9D
			mov r2, #0x599D
			b sc_out
sc_0x4C9E:
			mov r1, #0x4C9E
			mov r2, #0x599E
			b sc_out
sc_0x4C9F:
			mov r1, #0x4C9F
			mov r2, #0x599F
			b sc_out
sc_0x4D80:
			mov r1, #0x4D80
			mov r2, #0x5980
			b sc_out
sc_0x4D81:
			mov r1, #0x4D81
			mov r2, #0x5981
			b sc_out
sc_0x4D82:
			mov r1, #0x4D82
			mov r2, #0x5982
			b sc_out
sc_0x4D83:
			mov r1, #0x4D83
			mov r2, #0x5983
			b sc_out
sc_0x4D84:
			mov r1, #0x4D84
			mov r2, #0x5984
			b sc_out
sc_0x4D85:
			mov r1, #0x4D85
			mov r2, #0x5985
			b sc_out
sc_0x4D86:
			mov r1, #0x4D86
			mov r2, #0x5986
			b sc_out
sc_0x4D87:
			mov r1, #0x4D87
			mov r2, #0x5987
			b sc_out
sc_0x4D88:
			mov r1, #0x4D88
			mov r2, #0x5988
			b sc_out
sc_0x4D89:
			mov r1, #0x4D89
			mov r2, #0x5989
			b sc_out
sc_0x4D8A:
			mov r1, #0x4D8A
			mov r2, #0x598A
			b sc_out
sc_0x4D8B:
			mov r1, #0x4D8B
			mov r2, #0x598B
			b sc_out
sc_0x4D8C:
			mov r1, #0x4D8C
			mov r2, #0x598C
			b sc_out
sc_0x4D8D:
			mov r1, #0x4D8D
			mov r2, #0x598D
			b sc_out
sc_0x4D8E:
			mov r1, #0x4D8E
			mov r2, #0x598E
			b sc_out
sc_0x4D8F:
			mov r1, #0x4D8F
			mov r2, #0x598F
			b sc_out
sc_0x4D90:
			mov r1, #0x4D90
			mov r2, #0x5990
			b sc_out
sc_0x4D91:
			mov r1, #0x4D91
			mov r2, #0x5991
			b sc_out
sc_0x4D92:
			mov r1, #0x4D92
			mov r2, #0x5992
			b sc_out
sc_0x4D93:
			mov r1, #0x4D93
			mov r2, #0x5993
			b sc_out
sc_0x4D94:
			mov r1, #0x4D94
			mov r2, #0x5994
			b sc_out
sc_0x4D95:
			mov r1, #0x4D95
			mov r2, #0x5995
			b sc_out
sc_0x4D96:
			mov r1, #0x4D96
			mov r2, #0x5996
			b sc_out
sc_0x4D97:
			mov r1, #0x4D97
			mov r2, #0x5997
			b sc_out
sc_0x4D98:
			mov r1, #0x4D98
			mov r2, #0x5998
			b sc_out
sc_0x4D99:
			mov r1, #0x4D99
			mov r2, #0x5999
			b sc_out
sc_0x4D9A:
			mov r1, #0x4D9A
			mov r2, #0x599A
			b sc_out
sc_0x4D9B:
			mov r1, #0x4D9B
			mov r2, #0x599B
			b sc_out
sc_0x4D9C:
			mov r1, #0x4D9C
			mov r2, #0x599C
			b sc_out
sc_0x4D9D:
			mov r1, #0x4D9D
			mov r2, #0x599D
			b sc_out
sc_0x4D9E:
			mov r1, #0x4D9E
			mov r2, #0x599E
			b sc_out
sc_0x4D9F:
			mov r1, #0x4D9F
			mov r2, #0x599F
			b sc_out
sc_0x4E80:
			mov r1, #0x4E80
			mov r2, #0x5980
			b sc_out
sc_0x4E81:
			mov r1, #0x4E81
			mov r2, #0x5981
			b sc_out
sc_0x4E82:
			mov r1, #0x4E82
			mov r2, #0x5982
			b sc_out
sc_0x4E83:
			mov r1, #0x4E83
			mov r2, #0x5983
			b sc_out
sc_0x4E84:
			mov r1, #0x4E84
			mov r2, #0x5984
			b sc_out
sc_0x4E85:
			mov r1, #0x4E85
			mov r2, #0x5985
			b sc_out
sc_0x4E86:
			mov r1, #0x4E86
			mov r2, #0x5986
			b sc_out
sc_0x4E87:
			mov r1, #0x4E87
			mov r2, #0x5987
			b sc_out
sc_0x4E88:
			mov r1, #0x4E88
			mov r2, #0x5988
			b sc_out
sc_0x4E89:
			mov r1, #0x4E89
			mov r2, #0x5989
			b sc_out
sc_0x4E8A:
			mov r1, #0x4E8A
			mov r2, #0x598A
			b sc_out
sc_0x4E8B:
			mov r1, #0x4E8B
			mov r2, #0x598B
			b sc_out
sc_0x4E8C:
			mov r1, #0x4E8C
			mov r2, #0x598C
			b sc_out
sc_0x4E8D:
			mov r1, #0x4E8D
			mov r2, #0x598D
			b sc_out
sc_0x4E8E:
			mov r1, #0x4E8E
			mov r2, #0x598E
			b sc_out
sc_0x4E8F:
			mov r1, #0x4E8F
			mov r2, #0x598F
			b sc_out
sc_0x4E90:
			mov r1, #0x4E90
			mov r2, #0x5990
			b sc_out
sc_0x4E91:
			mov r1, #0x4E91
			mov r2, #0x5991
			b sc_out
sc_0x4E92:
			mov r1, #0x4E92
			mov r2, #0x5992
			b sc_out
sc_0x4E93:
			mov r1, #0x4E93
			mov r2, #0x5993
			b sc_out
sc_0x4E94:
			mov r1, #0x4E94
			mov r2, #0x5994
			b sc_out
sc_0x4E95:
			mov r1, #0x4E95
			mov r2, #0x5995
			b sc_out
sc_0x4E96:
			mov r1, #0x4E96
			mov r2, #0x5996
			b sc_out
sc_0x4E97:
			mov r1, #0x4E97
			mov r2, #0x5997
			b sc_out
sc_0x4E98:
			mov r1, #0x4E98
			mov r2, #0x5998
			b sc_out
sc_0x4E99:
			mov r1, #0x4E99
			mov r2, #0x5999
			b sc_out
sc_0x4E9A:
			mov r1, #0x4E9A
			mov r2, #0x599A
			b sc_out
sc_0x4E9B:
			mov r1, #0x4E9B
			mov r2, #0x599B
			b sc_out
sc_0x4E9C:
			mov r1, #0x4E9C
			mov r2, #0x599C
			b sc_out
sc_0x4E9D:
			mov r1, #0x4E9D
			mov r2, #0x599D
			b sc_out
sc_0x4E9E:
			mov r1, #0x4E9E
			mov r2, #0x599E
			b sc_out
sc_0x4E9F:
			mov r1, #0x4E9F
			mov r2, #0x599F
			b sc_out
sc_0x4F80:
			mov r1, #0x4F80
			mov r2, #0x5980
			b sc_out
sc_0x4F81:
			mov r1, #0x4F81
			mov r2, #0x5981
			b sc_out
sc_0x4F82:
			mov r1, #0x4F82
			mov r2, #0x5982
			b sc_out
sc_0x4F83:
			mov r1, #0x4F83
			mov r2, #0x5983
			b sc_out
sc_0x4F84:
			mov r1, #0x4F84
			mov r2, #0x5984
			b sc_out
sc_0x4F85:
			mov r1, #0x4F85
			mov r2, #0x5985
			b sc_out
sc_0x4F86:
			mov r1, #0x4F86
			mov r2, #0x5986
			b sc_out
sc_0x4F87:
			mov r1, #0x4F87
			mov r2, #0x5987
			b sc_out
sc_0x4F88:
			mov r1, #0x4F88
			mov r2, #0x5988
			b sc_out
sc_0x4F89:
			mov r1, #0x4F89
			mov r2, #0x5989
			b sc_out
sc_0x4F8A:
			mov r1, #0x4F8A
			mov r2, #0x598A
			b sc_out
sc_0x4F8B:
			mov r1, #0x4F8B
			mov r2, #0x598B
			b sc_out
sc_0x4F8C:
			mov r1, #0x4F8C
			mov r2, #0x598C
			b sc_out
sc_0x4F8D:
			mov r1, #0x4F8D
			mov r2, #0x598D
			b sc_out
sc_0x4F8E:
			mov r1, #0x4F8E
			mov r2, #0x598E
			b sc_out
sc_0x4F8F:
			mov r1, #0x4F8F
			mov r2, #0x598F
			b sc_out
sc_0x4F90:
			mov r1, #0x4F90
			mov r2, #0x5990
			b sc_out
sc_0x4F91:
			mov r1, #0x4F91
			mov r2, #0x5991
			b sc_out
sc_0x4F92:
			mov r1, #0x4F92
			mov r2, #0x5992
			b sc_out
sc_0x4F93:
			mov r1, #0x4F93
			mov r2, #0x5993
			b sc_out
sc_0x4F94:
			mov r1, #0x4F94
			mov r2, #0x5994
			b sc_out
sc_0x4F95:
			mov r1, #0x4F95
			mov r2, #0x5995
			b sc_out
sc_0x4F96:
			mov r1, #0x4F96
			mov r2, #0x5996
			b sc_out
sc_0x4F97:
			mov r1, #0x4F97
			mov r2, #0x5997
			b sc_out
sc_0x4F98:
			mov r1, #0x4F98
			mov r2, #0x5998
			b sc_out
sc_0x4F99:
			mov r1, #0x4F99
			mov r2, #0x5999
			b sc_out
sc_0x4F9A:
			mov r1, #0x4F9A
			mov r2, #0x599A
			b sc_out
sc_0x4F9B:
			mov r1, #0x4F9B
			mov r2, #0x599B
			b sc_out
sc_0x4F9C:
			mov r1, #0x4F9C
			mov r2, #0x599C
			b sc_out
sc_0x4F9D:
			mov r1, #0x4F9D
			mov r2, #0x599D
			b sc_out
sc_0x4F9E:
			mov r1, #0x4F9E
			mov r2, #0x599E
			b sc_out
sc_0x4F9F:
			mov r1, #0x4F9F
			mov r2, #0x599F
			b sc_out
sc_0x48A0:
			mov r1, #0x48A0
			mov r2, #0x59A0
			b sc_out
sc_0x48A1:
			mov r1, #0x48A1
			mov r2, #0x59A1
			b sc_out
sc_0x48A2:
			mov r1, #0x48A2
			mov r2, #0x59A2
			b sc_out
sc_0x48A3:
			mov r1, #0x48A3
			mov r2, #0x59A3
			b sc_out
sc_0x48A4:
			mov r1, #0x48A4
			mov r2, #0x59A4
			b sc_out
sc_0x48A5:
			mov r1, #0x48A5
			mov r2, #0x59A5
			b sc_out
sc_0x48A6:
			mov r1, #0x48A6
			mov r2, #0x59A6
			b sc_out
sc_0x48A7:
			mov r1, #0x48A7
			mov r2, #0x59A7
			b sc_out
sc_0x48A8:
			mov r1, #0x48A8
			mov r2, #0x59A8
			b sc_out
sc_0x48A9:
			mov r1, #0x48A9
			mov r2, #0x59A9
			b sc_out
sc_0x48AA:
			mov r1, #0x48AA
			mov r2, #0x59AA
			b sc_out
sc_0x48AB:
			mov r1, #0x48AB
			mov r2, #0x59AB
			b sc_out
sc_0x48AC:
			mov r1, #0x48AC
			mov r2, #0x59AC
			b sc_out
sc_0x48AD:
			mov r1, #0x48AD
			mov r2, #0x59AD
			b sc_out
sc_0x48AE:
			mov r1, #0x48AE
			mov r2, #0x59AE
			b sc_out
sc_0x48AF:
			mov r1, #0x48AF
			mov r2, #0x59AF
			b sc_out
sc_0x48B0:
			mov r1, #0x48B0
			mov r2, #0x59B0
			b sc_out
sc_0x48B1:
			mov r1, #0x48B1
			mov r2, #0x59B1
			b sc_out
sc_0x48B2:
			mov r1, #0x48B2
			mov r2, #0x59B2
			b sc_out
sc_0x48B3:
			mov r1, #0x48B3
			mov r2, #0x59B3
			b sc_out
sc_0x48B4:
			mov r1, #0x48B4
			mov r2, #0x59B4
			b sc_out
sc_0x48B5:
			mov r1, #0x48B5
			mov r2, #0x59B5
			b sc_out
sc_0x48B6:
			mov r1, #0x48B6
			mov r2, #0x59B6
			b sc_out
sc_0x48B7:
			mov r1, #0x48B7
			mov r2, #0x59B7
			b sc_out
sc_0x48B8:
			mov r1, #0x48B8
			mov r2, #0x59B8
			b sc_out
sc_0x48B9:
			mov r1, #0x48B9
			mov r2, #0x59B9
			b sc_out
sc_0x48BA:
			mov r1, #0x48BA
			mov r2, #0x59BA
			b sc_out
sc_0x48BB:
			mov r1, #0x48BB
			mov r2, #0x59BB
			b sc_out
sc_0x48BC:
			mov r1, #0x48BC
			mov r2, #0x59BC
			b sc_out
sc_0x48BD:
			mov r1, #0x48BD
			mov r2, #0x59BD
			b sc_out
sc_0x48BE:
			mov r1, #0x48BE
			mov r2, #0x59BE
			b sc_out
sc_0x48BF:
			mov r1, #0x48BF
			mov r2, #0x59BF
			b sc_out
sc_0x49A0:
			mov r1, #0x49A0
			mov r2, #0x59A0
			b sc_out
sc_0x49A1:
			mov r1, #0x49A1
			mov r2, #0x59A1
			b sc_out
sc_0x49A2:
			mov r1, #0x49A2
			mov r2, #0x59A2
			b sc_out
sc_0x49A3:
			mov r1, #0x49A3
			mov r2, #0x59A3
			b sc_out
sc_0x49A4:
			mov r1, #0x49A4
			mov r2, #0x59A4
			b sc_out
sc_0x49A5:
			mov r1, #0x49A5
			mov r2, #0x59A5
			b sc_out
sc_0x49A6:
			mov r1, #0x49A6
			mov r2, #0x59A6
			b sc_out
sc_0x49A7:
			mov r1, #0x49A7
			mov r2, #0x59A7
			b sc_out
sc_0x49A8:
			mov r1, #0x49A8
			mov r2, #0x59A8
			b sc_out
sc_0x49A9:
			mov r1, #0x49A9
			mov r2, #0x59A9
			b sc_out
sc_0x49AA:
			mov r1, #0x49AA
			mov r2, #0x59AA
			b sc_out
sc_0x49AB:
			mov r1, #0x49AB
			mov r2, #0x59AB
			b sc_out
sc_0x49AC:
			mov r1, #0x49AC
			mov r2, #0x59AC
			b sc_out
sc_0x49AD:
			mov r1, #0x49AD
			mov r2, #0x59AD
			b sc_out
sc_0x49AE:
			mov r1, #0x49AE
			mov r2, #0x59AE
			b sc_out
sc_0x49AF:
			mov r1, #0x49AF
			mov r2, #0x59AF
			b sc_out
sc_0x49B0:
			mov r1, #0x49B0
			mov r2, #0x59B0
			b sc_out
sc_0x49B1:
			mov r1, #0x49B1
			mov r2, #0x59B1
			b sc_out
sc_0x49B2:
			mov r1, #0x49B2
			mov r2, #0x59B2
			b sc_out
sc_0x49B3:
			mov r1, #0x49B3
			mov r2, #0x59B3
			b sc_out
sc_0x49B4:
			mov r1, #0x49B4
			mov r2, #0x59B4
			b sc_out
sc_0x49B5:
			mov r1, #0x49B5
			mov r2, #0x59B5
			b sc_out
sc_0x49B6:
			mov r1, #0x49B6
			mov r2, #0x59B6
			b sc_out
sc_0x49B7:
			mov r1, #0x49B7
			mov r2, #0x59B7
			b sc_out
sc_0x49B8:
			mov r1, #0x49B8
			mov r2, #0x59B8
			b sc_out
sc_0x49B9:
			mov r1, #0x49B9
			mov r2, #0x59B9
			b sc_out
sc_0x49BA:
			mov r1, #0x49BA
			mov r2, #0x59BA
			b sc_out
sc_0x49BB:
			mov r1, #0x49BB
			mov r2, #0x59BB
			b sc_out
sc_0x49BC:
			mov r1, #0x49BC
			mov r2, #0x59BC
			b sc_out
sc_0x49BD:
			mov r1, #0x49BD
			mov r2, #0x59BD
			b sc_out
sc_0x49BE:
			mov r1, #0x49BE
			mov r2, #0x59BE
			b sc_out
sc_0x49BF:
			mov r1, #0x49BF
			mov r2, #0x59BF
			b sc_out
sc_0x4AA0:
			mov r1, #0x4AA0
			mov r2, #0x59A0
			b sc_out
sc_0x4AA1:
			mov r1, #0x4AA1
			mov r2, #0x59A1
			b sc_out
sc_0x4AA2:
			mov r1, #0x4AA2
			mov r2, #0x59A2
			b sc_out
sc_0x4AA3:
			mov r1, #0x4AA3
			mov r2, #0x59A3
			b sc_out
sc_0x4AA4:
			mov r1, #0x4AA4
			mov r2, #0x59A4
			b sc_out
sc_0x4AA5:
			mov r1, #0x4AA5
			mov r2, #0x59A5
			b sc_out
sc_0x4AA6:
			mov r1, #0x4AA6
			mov r2, #0x59A6
			b sc_out
sc_0x4AA7:
			mov r1, #0x4AA7
			mov r2, #0x59A7
			b sc_out
sc_0x4AA8:
			mov r1, #0x4AA8
			mov r2, #0x59A8
			b sc_out
sc_0x4AA9:
			mov r1, #0x4AA9
			mov r2, #0x59A9
			b sc_out
sc_0x4AAA:
			mov r1, #0x4AAA
			mov r2, #0x59AA
			b sc_out
sc_0x4AAB:
			mov r1, #0x4AAB
			mov r2, #0x59AB
			b sc_out
sc_0x4AAC:
			mov r1, #0x4AAC
			mov r2, #0x59AC
			b sc_out
sc_0x4AAD:
			mov r1, #0x4AAD
			mov r2, #0x59AD
			b sc_out
sc_0x4AAE:
			mov r1, #0x4AAE
			mov r2, #0x59AE
			b sc_out
sc_0x4AAF:
			mov r1, #0x4AAF
			mov r2, #0x59AF
			b sc_out
sc_0x4AB0:
			mov r1, #0x4AB0
			mov r2, #0x59B0
			b sc_out
sc_0x4AB1:
			mov r1, #0x4AB1
			mov r2, #0x59B1
			b sc_out
sc_0x4AB2:
			mov r1, #0x4AB2
			mov r2, #0x59B2
			b sc_out
sc_0x4AB3:
			mov r1, #0x4AB3
			mov r2, #0x59B3
			b sc_out
sc_0x4AB4:
			mov r1, #0x4AB4
			mov r2, #0x59B4
			b sc_out
sc_0x4AB5:
			mov r1, #0x4AB5
			mov r2, #0x59B5
			b sc_out
sc_0x4AB6:
			mov r1, #0x4AB6
			mov r2, #0x59B6
			b sc_out
sc_0x4AB7:
			mov r1, #0x4AB7
			mov r2, #0x59B7
			b sc_out
sc_0x4AB8:
			mov r1, #0x4AB8
			mov r2, #0x59B8
			b sc_out
sc_0x4AB9:
			mov r1, #0x4AB9
			mov r2, #0x59B9
			b sc_out
sc_0x4ABA:
			mov r1, #0x4ABA
			mov r2, #0x59BA
			b sc_out
sc_0x4ABB:
			mov r1, #0x4ABB
			mov r2, #0x59BB
			b sc_out
sc_0x4ABC:
			mov r1, #0x4ABC
			mov r2, #0x59BC
			b sc_out
sc_0x4ABD:
			mov r1, #0x4ABD
			mov r2, #0x59BD
			b sc_out
sc_0x4ABE:
			mov r1, #0x4ABE
			mov r2, #0x59BE
			b sc_out
sc_0x4ABF:
			mov r1, #0x4ABF
			mov r2, #0x59BF
			b sc_out
sc_0x4BA0:
			mov r1, #0x4BA0
			mov r2, #0x59A0
			b sc_out
sc_0x4BA1:
			mov r1, #0x4BA1
			mov r2, #0x59A1
			b sc_out
sc_0x4BA2:
			mov r1, #0x4BA2
			mov r2, #0x59A2
			b sc_out
sc_0x4BA3:
			mov r1, #0x4BA3
			mov r2, #0x59A3
			b sc_out
sc_0x4BA4:
			mov r1, #0x4BA4
			mov r2, #0x59A4
			b sc_out
sc_0x4BA5:
			mov r1, #0x4BA5
			mov r2, #0x59A5
			b sc_out
sc_0x4BA6:
			mov r1, #0x4BA6
			mov r2, #0x59A6
			b sc_out
sc_0x4BA7:
			mov r1, #0x4BA7
			mov r2, #0x59A7
			b sc_out
sc_0x4BA8:
			mov r1, #0x4BA8
			mov r2, #0x59A8
			b sc_out
sc_0x4BA9:
			mov r1, #0x4BA9
			mov r2, #0x59A9
			b sc_out
sc_0x4BAA:
			mov r1, #0x4BAA
			mov r2, #0x59AA
			b sc_out
sc_0x4BAB:
			mov r1, #0x4BAB
			mov r2, #0x59AB
			b sc_out
sc_0x4BAC:
			mov r1, #0x4BAC
			mov r2, #0x59AC
			b sc_out
sc_0x4BAD:
			mov r1, #0x4BAD
			mov r2, #0x59AD
			b sc_out
sc_0x4BAE:
			mov r1, #0x4BAE
			mov r2, #0x59AE
			b sc_out
sc_0x4BAF:
			mov r1, #0x4BAF
			mov r2, #0x59AF
			b sc_out
sc_0x4BB0:
			mov r1, #0x4BB0
			mov r2, #0x59B0
			b sc_out
sc_0x4BB1:
			mov r1, #0x4BB1
			mov r2, #0x59B1
			b sc_out
sc_0x4BB2:
			mov r1, #0x4BB2
			mov r2, #0x59B2
			b sc_out
sc_0x4BB3:
			mov r1, #0x4BB3
			mov r2, #0x59B3
			b sc_out
sc_0x4BB4:
			mov r1, #0x4BB4
			mov r2, #0x59B4
			b sc_out
sc_0x4BB5:
			mov r1, #0x4BB5
			mov r2, #0x59B5
			b sc_out
sc_0x4BB6:
			mov r1, #0x4BB6
			mov r2, #0x59B6
			b sc_out
sc_0x4BB7:
			mov r1, #0x4BB7
			mov r2, #0x59B7
			b sc_out
sc_0x4BB8:
			mov r1, #0x4BB8
			mov r2, #0x59B8
			b sc_out
sc_0x4BB9:
			mov r1, #0x4BB9
			mov r2, #0x59B9
			b sc_out
sc_0x4BBA:
			mov r1, #0x4BBA
			mov r2, #0x59BA
			b sc_out
sc_0x4BBB:
			mov r1, #0x4BBB
			mov r2, #0x59BB
			b sc_out
sc_0x4BBC:
			mov r1, #0x4BBC
			mov r2, #0x59BC
			b sc_out
sc_0x4BBD:
			mov r1, #0x4BBD
			mov r2, #0x59BD
			b sc_out
sc_0x4BBE:
			mov r1, #0x4BBE
			mov r2, #0x59BE
			b sc_out
sc_0x4BBF:
			mov r1, #0x4BBF
			mov r2, #0x59BF
			b sc_out
sc_0x4CA0:
			mov r1, #0x4CA0
			mov r2, #0x59A0
			b sc_out
sc_0x4CA1:
			mov r1, #0x4CA1
			mov r2, #0x59A1
			b sc_out
sc_0x4CA2:
			mov r1, #0x4CA2
			mov r2, #0x59A2
			b sc_out
sc_0x4CA3:
			mov r1, #0x4CA3
			mov r2, #0x59A3
			b sc_out
sc_0x4CA4:
			mov r1, #0x4CA4
			mov r2, #0x59A4
			b sc_out
sc_0x4CA5:
			mov r1, #0x4CA5
			mov r2, #0x59A5
			b sc_out
sc_0x4CA6:
			mov r1, #0x4CA6
			mov r2, #0x59A6
			b sc_out
sc_0x4CA7:
			mov r1, #0x4CA7
			mov r2, #0x59A7
			b sc_out
sc_0x4CA8:
			mov r1, #0x4CA8
			mov r2, #0x59A8
			b sc_out
sc_0x4CA9:
			mov r1, #0x4CA9
			mov r2, #0x59A9
			b sc_out
sc_0x4CAA:
			mov r1, #0x4CAA
			mov r2, #0x59AA
			b sc_out
sc_0x4CAB:
			mov r1, #0x4CAB
			mov r2, #0x59AB
			b sc_out
sc_0x4CAC:
			mov r1, #0x4CAC
			mov r2, #0x59AC
			b sc_out
sc_0x4CAD:
			mov r1, #0x4CAD
			mov r2, #0x59AD
			b sc_out
sc_0x4CAE:
			mov r1, #0x4CAE
			mov r2, #0x59AE
			b sc_out
sc_0x4CAF:
			mov r1, #0x4CAF
			mov r2, #0x59AF
			b sc_out
sc_0x4CB0:
			mov r1, #0x4CB0
			mov r2, #0x59B0
			b sc_out
sc_0x4CB1:
			mov r1, #0x4CB1
			mov r2, #0x59B1
			b sc_out
sc_0x4CB2:
			mov r1, #0x4CB2
			mov r2, #0x59B2
			b sc_out
sc_0x4CB3:
			mov r1, #0x4CB3
			mov r2, #0x59B3
			b sc_out
sc_0x4CB4:
			mov r1, #0x4CB4
			mov r2, #0x59B4
			b sc_out
sc_0x4CB5:
			mov r1, #0x4CB5
			mov r2, #0x59B5
			b sc_out
sc_0x4CB6:
			mov r1, #0x4CB6
			mov r2, #0x59B6
			b sc_out
sc_0x4CB7:
			mov r1, #0x4CB7
			mov r2, #0x59B7
			b sc_out
sc_0x4CB8:
			mov r1, #0x4CB8
			mov r2, #0x59B8
			b sc_out
sc_0x4CB9:
			mov r1, #0x4CB9
			mov r2, #0x59B9
			b sc_out
sc_0x4CBA:
			mov r1, #0x4CBA
			mov r2, #0x59BA
			b sc_out
sc_0x4CBB:
			mov r1, #0x4CBB
			mov r2, #0x59BB
			b sc_out
sc_0x4CBC:
			mov r1, #0x4CBC
			mov r2, #0x59BC
			b sc_out
sc_0x4CBD:
			mov r1, #0x4CBD
			mov r2, #0x59BD
			b sc_out
sc_0x4CBE:
			mov r1, #0x4CBE
			mov r2, #0x59BE
			b sc_out
sc_0x4CBF:
			mov r1, #0x4CBF
			mov r2, #0x59BF
			b sc_out
sc_0x4DA0:
			mov r1, #0x4DA0
			mov r2, #0x59A0
			b sc_out
sc_0x4DA1:
			mov r1, #0x4DA1
			mov r2, #0x59A1
			b sc_out
sc_0x4DA2:
			mov r1, #0x4DA2
			mov r2, #0x59A2
			b sc_out
sc_0x4DA3:
			mov r1, #0x4DA3
			mov r2, #0x59A3
			b sc_out
sc_0x4DA4:
			mov r1, #0x4DA4
			mov r2, #0x59A4
			b sc_out
sc_0x4DA5:
			mov r1, #0x4DA5
			mov r2, #0x59A5
			b sc_out
sc_0x4DA6:
			mov r1, #0x4DA6
			mov r2, #0x59A6
			b sc_out
sc_0x4DA7:
			mov r1, #0x4DA7
			mov r2, #0x59A7
			b sc_out
sc_0x4DA8:
			mov r1, #0x4DA8
			mov r2, #0x59A8
			b sc_out
sc_0x4DA9:
			mov r1, #0x4DA9
			mov r2, #0x59A9
			b sc_out
sc_0x4DAA:
			mov r1, #0x4DAA
			mov r2, #0x59AA
			b sc_out
sc_0x4DAB:
			mov r1, #0x4DAB
			mov r2, #0x59AB
			b sc_out
sc_0x4DAC:
			mov r1, #0x4DAC
			mov r2, #0x59AC
			b sc_out
sc_0x4DAD:
			mov r1, #0x4DAD
			mov r2, #0x59AD
			b sc_out
sc_0x4DAE:
			mov r1, #0x4DAE
			mov r2, #0x59AE
			b sc_out
sc_0x4DAF:
			mov r1, #0x4DAF
			mov r2, #0x59AF
			b sc_out
sc_0x4DB0:
			mov r1, #0x4DB0
			mov r2, #0x59B0
			b sc_out
sc_0x4DB1:
			mov r1, #0x4DB1
			mov r2, #0x59B1
			b sc_out
sc_0x4DB2:
			mov r1, #0x4DB2
			mov r2, #0x59B2
			b sc_out
sc_0x4DB3:
			mov r1, #0x4DB3
			mov r2, #0x59B3
			b sc_out
sc_0x4DB4:
			mov r1, #0x4DB4
			mov r2, #0x59B4
			b sc_out
sc_0x4DB5:
			mov r1, #0x4DB5
			mov r2, #0x59B5
			b sc_out
sc_0x4DB6:
			mov r1, #0x4DB6
			mov r2, #0x59B6
			b sc_out
sc_0x4DB7:
			mov r1, #0x4DB7
			mov r2, #0x59B7
			b sc_out
sc_0x4DB8:
			mov r1, #0x4DB8
			mov r2, #0x59B8
			b sc_out
sc_0x4DB9:
			mov r1, #0x4DB9
			mov r2, #0x59B9
			b sc_out
sc_0x4DBA:
			mov r1, #0x4DBA
			mov r2, #0x59BA
			b sc_out
sc_0x4DBB:
			mov r1, #0x4DBB
			mov r2, #0x59BB
			b sc_out
sc_0x4DBC:
			mov r1, #0x4DBC
			mov r2, #0x59BC
			b sc_out
sc_0x4DBD:
			mov r1, #0x4DBD
			mov r2, #0x59BD
			b sc_out
sc_0x4DBE:
			mov r1, #0x4DBE
			mov r2, #0x59BE
			b sc_out
sc_0x4DBF:
			mov r1, #0x4DBF
			mov r2, #0x59BF
			b sc_out
sc_0x4EA0:
			mov r1, #0x4EA0
			mov r2, #0x59A0
			b sc_out
sc_0x4EA1:
			mov r1, #0x4EA1
			mov r2, #0x59A1
			b sc_out
sc_0x4EA2:
			mov r1, #0x4EA2
			mov r2, #0x59A2
			b sc_out
sc_0x4EA3:
			mov r1, #0x4EA3
			mov r2, #0x59A3
			b sc_out
sc_0x4EA4:
			mov r1, #0x4EA4
			mov r2, #0x59A4
			b sc_out
sc_0x4EA5:
			mov r1, #0x4EA5
			mov r2, #0x59A5
			b sc_out
sc_0x4EA6:
			mov r1, #0x4EA6
			mov r2, #0x59A6
			b sc_out
sc_0x4EA7:
			mov r1, #0x4EA7
			mov r2, #0x59A7
			b sc_out
sc_0x4EA8:
			mov r1, #0x4EA8
			mov r2, #0x59A8
			b sc_out
sc_0x4EA9:
			mov r1, #0x4EA9
			mov r2, #0x59A9
			b sc_out
sc_0x4EAA:
			mov r1, #0x4EAA
			mov r2, #0x59AA
			b sc_out
sc_0x4EAB:
			mov r1, #0x4EAB
			mov r2, #0x59AB
			b sc_out
sc_0x4EAC:
			mov r1, #0x4EAC
			mov r2, #0x59AC
			b sc_out
sc_0x4EAD:
			mov r1, #0x4EAD
			mov r2, #0x59AD
			b sc_out
sc_0x4EAE:
			mov r1, #0x4EAE
			mov r2, #0x59AE
			b sc_out
sc_0x4EAF:
			mov r1, #0x4EAF
			mov r2, #0x59AF
			b sc_out
sc_0x4EB0:
			mov r1, #0x4EB0
			mov r2, #0x59B0
			b sc_out
sc_0x4EB1:
			mov r1, #0x4EB1
			mov r2, #0x59B1
			b sc_out
sc_0x4EB2:
			mov r1, #0x4EB2
			mov r2, #0x59B2
			b sc_out
sc_0x4EB3:
			mov r1, #0x4EB3
			mov r2, #0x59B3
			b sc_out
sc_0x4EB4:
			mov r1, #0x4EB4
			mov r2, #0x59B4
			b sc_out
sc_0x4EB5:
			mov r1, #0x4EB5
			mov r2, #0x59B5
			b sc_out
sc_0x4EB6:
			mov r1, #0x4EB6
			mov r2, #0x59B6
			b sc_out
sc_0x4EB7:
			mov r1, #0x4EB7
			mov r2, #0x59B7
			b sc_out
sc_0x4EB8:
			mov r1, #0x4EB8
			mov r2, #0x59B8
			b sc_out
sc_0x4EB9:
			mov r1, #0x4EB9
			mov r2, #0x59B9
			b sc_out
sc_0x4EBA:
			mov r1, #0x4EBA
			mov r2, #0x59BA
			b sc_out
sc_0x4EBB:
			mov r1, #0x4EBB
			mov r2, #0x59BB
			b sc_out
sc_0x4EBC:
			mov r1, #0x4EBC
			mov r2, #0x59BC
			b sc_out
sc_0x4EBD:
			mov r1, #0x4EBD
			mov r2, #0x59BD
			b sc_out
sc_0x4EBE:
			mov r1, #0x4EBE
			mov r2, #0x59BE
			b sc_out
sc_0x4EBF:
			mov r1, #0x4EBF
			mov r2, #0x59BF
			b sc_out
sc_0x4FA0:
			mov r1, #0x4FA0
			mov r2, #0x59A0
			b sc_out
sc_0x4FA1:
			mov r1, #0x4FA1
			mov r2, #0x59A1
			b sc_out
sc_0x4FA2:
			mov r1, #0x4FA2
			mov r2, #0x59A2
			b sc_out
sc_0x4FA3:
			mov r1, #0x4FA3
			mov r2, #0x59A3
			b sc_out
sc_0x4FA4:
			mov r1, #0x4FA4
			mov r2, #0x59A4
			b sc_out
sc_0x4FA5:
			mov r1, #0x4FA5
			mov r2, #0x59A5
			b sc_out
sc_0x4FA6:
			mov r1, #0x4FA6
			mov r2, #0x59A6
			b sc_out
sc_0x4FA7:
			mov r1, #0x4FA7
			mov r2, #0x59A7
			b sc_out
sc_0x4FA8:
			mov r1, #0x4FA8
			mov r2, #0x59A8
			b sc_out
sc_0x4FA9:
			mov r1, #0x4FA9
			mov r2, #0x59A9
			b sc_out
sc_0x4FAA:
			mov r1, #0x4FAA
			mov r2, #0x59AA
			b sc_out
sc_0x4FAB:
			mov r1, #0x4FAB
			mov r2, #0x59AB
			b sc_out
sc_0x4FAC:
			mov r1, #0x4FAC
			mov r2, #0x59AC
			b sc_out
sc_0x4FAD:
			mov r1, #0x4FAD
			mov r2, #0x59AD
			b sc_out
sc_0x4FAE:
			mov r1, #0x4FAE
			mov r2, #0x59AE
			b sc_out
sc_0x4FAF:
			mov r1, #0x4FAF
			mov r2, #0x59AF
			b sc_out
sc_0x4FB0:
			mov r1, #0x4FB0
			mov r2, #0x59B0
			b sc_out
sc_0x4FB1:
			mov r1, #0x4FB1
			mov r2, #0x59B1
			b sc_out
sc_0x4FB2:
			mov r1, #0x4FB2
			mov r2, #0x59B2
			b sc_out
sc_0x4FB3:
			mov r1, #0x4FB3
			mov r2, #0x59B3
			b sc_out
sc_0x4FB4:
			mov r1, #0x4FB4
			mov r2, #0x59B4
			b sc_out
sc_0x4FB5:
			mov r1, #0x4FB5
			mov r2, #0x59B5
			b sc_out
sc_0x4FB6:
			mov r1, #0x4FB6
			mov r2, #0x59B6
			b sc_out
sc_0x4FB7:
			mov r1, #0x4FB7
			mov r2, #0x59B7
			b sc_out
sc_0x4FB8:
			mov r1, #0x4FB8
			mov r2, #0x59B8
			b sc_out
sc_0x4FB9:
			mov r1, #0x4FB9
			mov r2, #0x59B9
			b sc_out
sc_0x4FBA:
			mov r1, #0x4FBA
			mov r2, #0x59BA
			b sc_out
sc_0x4FBB:
			mov r1, #0x4FBB
			mov r2, #0x59BB
			b sc_out
sc_0x4FBC:
			mov r1, #0x4FBC
			mov r2, #0x59BC
			b sc_out
sc_0x4FBD:
			mov r1, #0x4FBD
			mov r2, #0x59BD
			b sc_out
sc_0x4FBE:
			mov r1, #0x4FBE
			mov r2, #0x59BE
			b sc_out
sc_0x4FBF:
			mov r1, #0x4FBF
			mov r2, #0x59BF
			b sc_out
sc_0x48C0:
			mov r1, #0x48C0
			mov r2, #0x59C0
			b sc_out
sc_0x48C1:
			mov r1, #0x48C1
			mov r2, #0x59C1
			b sc_out
sc_0x48C2:
			mov r1, #0x48C2
			mov r2, #0x59C2
			b sc_out
sc_0x48C3:
			mov r1, #0x48C3
			mov r2, #0x59C3
			b sc_out
sc_0x48C4:
			mov r1, #0x48C4
			mov r2, #0x59C4
			b sc_out
sc_0x48C5:
			mov r1, #0x48C5
			mov r2, #0x59C5
			b sc_out
sc_0x48C6:
			mov r1, #0x48C6
			mov r2, #0x59C6
			b sc_out
sc_0x48C7:
			mov r1, #0x48C7
			mov r2, #0x59C7
			b sc_out
sc_0x48C8:
			mov r1, #0x48C8
			mov r2, #0x59C8
			b sc_out
sc_0x48C9:
			mov r1, #0x48C9
			mov r2, #0x59C9
			b sc_out
sc_0x48CA:
			mov r1, #0x48CA
			mov r2, #0x59CA
			b sc_out
sc_0x48CB:
			mov r1, #0x48CB
			mov r2, #0x59CB
			b sc_out
sc_0x48CC:
			mov r1, #0x48CC
			mov r2, #0x59CC
			b sc_out
sc_0x48CD:
			mov r1, #0x48CD
			mov r2, #0x59CD
			b sc_out
sc_0x48CE:
			mov r1, #0x48CE
			mov r2, #0x59CE
			b sc_out
sc_0x48CF:
			mov r1, #0x48CF
			mov r2, #0x59CF
			b sc_out
sc_0x48D0:
			mov r1, #0x48D0
			mov r2, #0x59D0
			b sc_out
sc_0x48D1:
			mov r1, #0x48D1
			mov r2, #0x59D1
			b sc_out
sc_0x48D2:
			mov r1, #0x48D2
			mov r2, #0x59D2
			b sc_out
sc_0x48D3:
			mov r1, #0x48D3
			mov r2, #0x59D3
			b sc_out
sc_0x48D4:
			mov r1, #0x48D4
			mov r2, #0x59D4
			b sc_out
sc_0x48D5:
			mov r1, #0x48D5
			mov r2, #0x59D5
			b sc_out
sc_0x48D6:
			mov r1, #0x48D6
			mov r2, #0x59D6
			b sc_out
sc_0x48D7:
			mov r1, #0x48D7
			mov r2, #0x59D7
			b sc_out
sc_0x48D8:
			mov r1, #0x48D8
			mov r2, #0x59D8
			b sc_out
sc_0x48D9:
			mov r1, #0x48D9
			mov r2, #0x59D9
			b sc_out
sc_0x48DA:
			mov r1, #0x48DA
			mov r2, #0x59DA
			b sc_out
sc_0x48DB:
			mov r1, #0x48DB
			mov r2, #0x59DB
			b sc_out
sc_0x48DC:
			mov r1, #0x48DC
			mov r2, #0x59DC
			b sc_out
sc_0x48DD:
			mov r1, #0x48DD
			mov r2, #0x59DD
			b sc_out
sc_0x48DE:
			mov r1, #0x48DE
			mov r2, #0x59DE
			b sc_out
sc_0x48DF:
			mov r1, #0x48DF
			mov r2, #0x59DF
			b sc_out
sc_0x49C0:
			mov r1, #0x49C0
			mov r2, #0x59C0
			b sc_out
sc_0x49C1:
			mov r1, #0x49C1
			mov r2, #0x59C1
			b sc_out
sc_0x49C2:
			mov r1, #0x49C2
			mov r2, #0x59C2
			b sc_out
sc_0x49C3:
			mov r1, #0x49C3
			mov r2, #0x59C3
			b sc_out
sc_0x49C4:
			mov r1, #0x49C4
			mov r2, #0x59C4
			b sc_out
sc_0x49C5:
			mov r1, #0x49C5
			mov r2, #0x59C5
			b sc_out
sc_0x49C6:
			mov r1, #0x49C6
			mov r2, #0x59C6
			b sc_out
sc_0x49C7:
			mov r1, #0x49C7
			mov r2, #0x59C7
			b sc_out
sc_0x49C8:
			mov r1, #0x49C8
			mov r2, #0x59C8
			b sc_out
sc_0x49C9:
			mov r1, #0x49C9
			mov r2, #0x59C9
			b sc_out
sc_0x49CA:
			mov r1, #0x49CA
			mov r2, #0x59CA
			b sc_out
sc_0x49CB:
			mov r1, #0x49CB
			mov r2, #0x59CB
			b sc_out
sc_0x49CC:
			mov r1, #0x49CC
			mov r2, #0x59CC
			b sc_out
sc_0x49CD:
			mov r1, #0x49CD
			mov r2, #0x59CD
			b sc_out
sc_0x49CE:
			mov r1, #0x49CE
			mov r2, #0x59CE
			b sc_out
sc_0x49CF:
			mov r1, #0x49CF
			mov r2, #0x59CF
			b sc_out
sc_0x49D0:
			mov r1, #0x49D0
			mov r2, #0x59D0
			b sc_out
sc_0x49D1:
			mov r1, #0x49D1
			mov r2, #0x59D1
			b sc_out
sc_0x49D2:
			mov r1, #0x49D2
			mov r2, #0x59D2
			b sc_out
sc_0x49D3:
			mov r1, #0x49D3
			mov r2, #0x59D3
			b sc_out
sc_0x49D4:
			mov r1, #0x49D4
			mov r2, #0x59D4
			b sc_out
sc_0x49D5:
			mov r1, #0x49D5
			mov r2, #0x59D5
			b sc_out
sc_0x49D6:
			mov r1, #0x49D6
			mov r2, #0x59D6
			b sc_out
sc_0x49D7:
			mov r1, #0x49D7
			mov r2, #0x59D7
			b sc_out
sc_0x49D8:
			mov r1, #0x49D8
			mov r2, #0x59D8
			b sc_out
sc_0x49D9:
			mov r1, #0x49D9
			mov r2, #0x59D9
			b sc_out
sc_0x49DA:
			mov r1, #0x49DA
			mov r2, #0x59DA
			b sc_out
sc_0x49DB:
			mov r1, #0x49DB
			mov r2, #0x59DB
			b sc_out
sc_0x49DC:
			mov r1, #0x49DC
			mov r2, #0x59DC
			b sc_out
sc_0x49DD:
			mov r1, #0x49DD
			mov r2, #0x59DD
			b sc_out
sc_0x49DE:
			mov r1, #0x49DE
			mov r2, #0x59DE
			b sc_out
sc_0x49DF:
			mov r1, #0x49DF
			mov r2, #0x59DF
			b sc_out
sc_0x4AC0:
			mov r1, #0x4AC0
			mov r2, #0x59C0
			b sc_out
sc_0x4AC1:
			mov r1, #0x4AC1
			mov r2, #0x59C1
			b sc_out
sc_0x4AC2:
			mov r1, #0x4AC2
			mov r2, #0x59C2
			b sc_out
sc_0x4AC3:
			mov r1, #0x4AC3
			mov r2, #0x59C3
			b sc_out
sc_0x4AC4:
			mov r1, #0x4AC4
			mov r2, #0x59C4
			b sc_out
sc_0x4AC5:
			mov r1, #0x4AC5
			mov r2, #0x59C5
			b sc_out
sc_0x4AC6:
			mov r1, #0x4AC6
			mov r2, #0x59C6
			b sc_out
sc_0x4AC7:
			mov r1, #0x4AC7
			mov r2, #0x59C7
			b sc_out
sc_0x4AC8:
			mov r1, #0x4AC8
			mov r2, #0x59C8
			b sc_out
sc_0x4AC9:
			mov r1, #0x4AC9
			mov r2, #0x59C9
			b sc_out
sc_0x4ACA:
			mov r1, #0x4ACA
			mov r2, #0x59CA
			b sc_out
sc_0x4ACB:
			mov r1, #0x4ACB
			mov r2, #0x59CB
			b sc_out
sc_0x4ACC:
			mov r1, #0x4ACC
			mov r2, #0x59CC
			b sc_out
sc_0x4ACD:
			mov r1, #0x4ACD
			mov r2, #0x59CD
			b sc_out
sc_0x4ACE:
			mov r1, #0x4ACE
			mov r2, #0x59CE
			b sc_out
sc_0x4ACF:
			mov r1, #0x4ACF
			mov r2, #0x59CF
			b sc_out
sc_0x4AD0:
			mov r1, #0x4AD0
			mov r2, #0x59D0
			b sc_out
sc_0x4AD1:
			mov r1, #0x4AD1
			mov r2, #0x59D1
			b sc_out
sc_0x4AD2:
			mov r1, #0x4AD2
			mov r2, #0x59D2
			b sc_out
sc_0x4AD3:
			mov r1, #0x4AD3
			mov r2, #0x59D3
			b sc_out
sc_0x4AD4:
			mov r1, #0x4AD4
			mov r2, #0x59D4
			b sc_out
sc_0x4AD5:
			mov r1, #0x4AD5
			mov r2, #0x59D5
			b sc_out
sc_0x4AD6:
			mov r1, #0x4AD6
			mov r2, #0x59D6
			b sc_out
sc_0x4AD7:
			mov r1, #0x4AD7
			mov r2, #0x59D7
			b sc_out
sc_0x4AD8:
			mov r1, #0x4AD8
			mov r2, #0x59D8
			b sc_out
sc_0x4AD9:
			mov r1, #0x4AD9
			mov r2, #0x59D9
			b sc_out
sc_0x4ADA:
			mov r1, #0x4ADA
			mov r2, #0x59DA
			b sc_out
sc_0x4ADB:
			mov r1, #0x4ADB
			mov r2, #0x59DB
			b sc_out
sc_0x4ADC:
			mov r1, #0x4ADC
			mov r2, #0x59DC
			b sc_out
sc_0x4ADD:
			mov r1, #0x4ADD
			mov r2, #0x59DD
			b sc_out
sc_0x4ADE:
			mov r1, #0x4ADE
			mov r2, #0x59DE
			b sc_out
sc_0x4ADF:
			mov r1, #0x4ADF
			mov r2, #0x59DF
			b sc_out
sc_0x4BC0:
			mov r1, #0x4BC0
			mov r2, #0x59C0
			b sc_out
sc_0x4BC1:
			mov r1, #0x4BC1
			mov r2, #0x59C1
			b sc_out
sc_0x4BC2:
			mov r1, #0x4BC2
			mov r2, #0x59C2
			b sc_out
sc_0x4BC3:
			mov r1, #0x4BC3
			mov r2, #0x59C3
			b sc_out
sc_0x4BC4:
			mov r1, #0x4BC4
			mov r2, #0x59C4
			b sc_out
sc_0x4BC5:
			mov r1, #0x4BC5
			mov r2, #0x59C5
			b sc_out
sc_0x4BC6:
			mov r1, #0x4BC6
			mov r2, #0x59C6
			b sc_out
sc_0x4BC7:
			mov r1, #0x4BC7
			mov r2, #0x59C7
			b sc_out
sc_0x4BC8:
			mov r1, #0x4BC8
			mov r2, #0x59C8
			b sc_out
sc_0x4BC9:
			mov r1, #0x4BC9
			mov r2, #0x59C9
			b sc_out
sc_0x4BCA:
			mov r1, #0x4BCA
			mov r2, #0x59CA
			b sc_out
sc_0x4BCB:
			mov r1, #0x4BCB
			mov r2, #0x59CB
			b sc_out
sc_0x4BCC:
			mov r1, #0x4BCC
			mov r2, #0x59CC
			b sc_out
sc_0x4BCD:
			mov r1, #0x4BCD
			mov r2, #0x59CD
			b sc_out
sc_0x4BCE:
			mov r1, #0x4BCE
			mov r2, #0x59CE
			b sc_out
sc_0x4BCF:
			mov r1, #0x4BCF
			mov r2, #0x59CF
			b sc_out
sc_0x4BD0:
			mov r1, #0x4BD0
			mov r2, #0x59D0
			b sc_out
sc_0x4BD1:
			mov r1, #0x4BD1
			mov r2, #0x59D1
			b sc_out
sc_0x4BD2:
			mov r1, #0x4BD2
			mov r2, #0x59D2
			b sc_out
sc_0x4BD3:
			mov r1, #0x4BD3
			mov r2, #0x59D3
			b sc_out
sc_0x4BD4:
			mov r1, #0x4BD4
			mov r2, #0x59D4
			b sc_out
sc_0x4BD5:
			mov r1, #0x4BD5
			mov r2, #0x59D5
			b sc_out
sc_0x4BD6:
			mov r1, #0x4BD6
			mov r2, #0x59D6
			b sc_out
sc_0x4BD7:
			mov r1, #0x4BD7
			mov r2, #0x59D7
			b sc_out
sc_0x4BD8:
			mov r1, #0x4BD8
			mov r2, #0x59D8
			b sc_out
sc_0x4BD9:
			mov r1, #0x4BD9
			mov r2, #0x59D9
			b sc_out
sc_0x4BDA:
			mov r1, #0x4BDA
			mov r2, #0x59DA
			b sc_out
sc_0x4BDB:
			mov r1, #0x4BDB
			mov r2, #0x59DB
			b sc_out
sc_0x4BDC:
			mov r1, #0x4BDC
			mov r2, #0x59DC
			b sc_out
sc_0x4BDD:
			mov r1, #0x4BDD
			mov r2, #0x59DD
			b sc_out
sc_0x4BDE:
			mov r1, #0x4BDE
			mov r2, #0x59DE
			b sc_out
sc_0x4BDF:
			mov r1, #0x4BDF
			mov r2, #0x59DF
			b sc_out
sc_0x4CC0:
			mov r1, #0x4CC0
			mov r2, #0x59C0
			b sc_out
sc_0x4CC1:
			mov r1, #0x4CC1
			mov r2, #0x59C1
			b sc_out
sc_0x4CC2:
			mov r1, #0x4CC2
			mov r2, #0x59C2
			b sc_out
sc_0x4CC3:
			mov r1, #0x4CC3
			mov r2, #0x59C3
			b sc_out
sc_0x4CC4:
			mov r1, #0x4CC4
			mov r2, #0x59C4
			b sc_out
sc_0x4CC5:
			mov r1, #0x4CC5
			mov r2, #0x59C5
			b sc_out
sc_0x4CC6:
			mov r1, #0x4CC6
			mov r2, #0x59C6
			b sc_out
sc_0x4CC7:
			mov r1, #0x4CC7
			mov r2, #0x59C7
			b sc_out
sc_0x4CC8:
			mov r1, #0x4CC8
			mov r2, #0x59C8
			b sc_out
sc_0x4CC9:
			mov r1, #0x4CC9
			mov r2, #0x59C9
			b sc_out
sc_0x4CCA:
			mov r1, #0x4CCA
			mov r2, #0x59CA
			b sc_out
sc_0x4CCB:
			mov r1, #0x4CCB
			mov r2, #0x59CB
			b sc_out
sc_0x4CCC:
			mov r1, #0x4CCC
			mov r2, #0x59CC
			b sc_out
sc_0x4CCD:
			mov r1, #0x4CCD
			mov r2, #0x59CD
			b sc_out
sc_0x4CCE:
			mov r1, #0x4CCE
			mov r2, #0x59CE
			b sc_out
sc_0x4CCF:
			mov r1, #0x4CCF
			mov r2, #0x59CF
			b sc_out
sc_0x4CD0:
			mov r1, #0x4CD0
			mov r2, #0x59D0
			b sc_out
sc_0x4CD1:
			mov r1, #0x4CD1
			mov r2, #0x59D1
			b sc_out
sc_0x4CD2:
			mov r1, #0x4CD2
			mov r2, #0x59D2
			b sc_out
sc_0x4CD3:
			mov r1, #0x4CD3
			mov r2, #0x59D3
			b sc_out
sc_0x4CD4:
			mov r1, #0x4CD4
			mov r2, #0x59D4
			b sc_out
sc_0x4CD5:
			mov r1, #0x4CD5
			mov r2, #0x59D5
			b sc_out
sc_0x4CD6:
			mov r1, #0x4CD6
			mov r2, #0x59D6
			b sc_out
sc_0x4CD7:
			mov r1, #0x4CD7
			mov r2, #0x59D7
			b sc_out
sc_0x4CD8:
			mov r1, #0x4CD8
			mov r2, #0x59D8
			b sc_out
sc_0x4CD9:
			mov r1, #0x4CD9
			mov r2, #0x59D9
			b sc_out
sc_0x4CDA:
			mov r1, #0x4CDA
			mov r2, #0x59DA
			b sc_out
sc_0x4CDB:
			mov r1, #0x4CDB
			mov r2, #0x59DB
			b sc_out
sc_0x4CDC:
			mov r1, #0x4CDC
			mov r2, #0x59DC
			b sc_out
sc_0x4CDD:
			mov r1, #0x4CDD
			mov r2, #0x59DD
			b sc_out
sc_0x4CDE:
			mov r1, #0x4CDE
			mov r2, #0x59DE
			b sc_out
sc_0x4CDF:
			mov r1, #0x4CDF
			mov r2, #0x59DF
			b sc_out
sc_0x4DC0:
			mov r1, #0x4DC0
			mov r2, #0x59C0
			b sc_out
sc_0x4DC1:
			mov r1, #0x4DC1
			mov r2, #0x59C1
			b sc_out
sc_0x4DC2:
			mov r1, #0x4DC2
			mov r2, #0x59C2
			b sc_out
sc_0x4DC3:
			mov r1, #0x4DC3
			mov r2, #0x59C3
			b sc_out
sc_0x4DC4:
			mov r1, #0x4DC4
			mov r2, #0x59C4
			b sc_out
sc_0x4DC5:
			mov r1, #0x4DC5
			mov r2, #0x59C5
			b sc_out
sc_0x4DC6:
			mov r1, #0x4DC6
			mov r2, #0x59C6
			b sc_out
sc_0x4DC7:
			mov r1, #0x4DC7
			mov r2, #0x59C7
			b sc_out
sc_0x4DC8:
			mov r1, #0x4DC8
			mov r2, #0x59C8
			b sc_out
sc_0x4DC9:
			mov r1, #0x4DC9
			mov r2, #0x59C9
			b sc_out
sc_0x4DCA:
			mov r1, #0x4DCA
			mov r2, #0x59CA
			b sc_out
sc_0x4DCB:
			mov r1, #0x4DCB
			mov r2, #0x59CB
			b sc_out
sc_0x4DCC:
			mov r1, #0x4DCC
			mov r2, #0x59CC
			b sc_out
sc_0x4DCD:
			mov r1, #0x4DCD
			mov r2, #0x59CD
			b sc_out
sc_0x4DCE:
			mov r1, #0x4DCE
			mov r2, #0x59CE
			b sc_out
sc_0x4DCF:
			mov r1, #0x4DCF
			mov r2, #0x59CF
			b sc_out
sc_0x4DD0:
			mov r1, #0x4DD0
			mov r2, #0x59D0
			b sc_out
sc_0x4DD1:
			mov r1, #0x4DD1
			mov r2, #0x59D1
			b sc_out
sc_0x4DD2:
			mov r1, #0x4DD2
			mov r2, #0x59D2
			b sc_out
sc_0x4DD3:
			mov r1, #0x4DD3
			mov r2, #0x59D3
			b sc_out
sc_0x4DD4:
			mov r1, #0x4DD4
			mov r2, #0x59D4
			b sc_out
sc_0x4DD5:
			mov r1, #0x4DD5
			mov r2, #0x59D5
			b sc_out
sc_0x4DD6:
			mov r1, #0x4DD6
			mov r2, #0x59D6
			b sc_out
sc_0x4DD7:
			mov r1, #0x4DD7
			mov r2, #0x59D7
			b sc_out
sc_0x4DD8:
			mov r1, #0x4DD8
			mov r2, #0x59D8
			b sc_out
sc_0x4DD9:
			mov r1, #0x4DD9
			mov r2, #0x59D9
			b sc_out
sc_0x4DDA:
			mov r1, #0x4DDA
			mov r2, #0x59DA
			b sc_out
sc_0x4DDB:
			mov r1, #0x4DDB
			mov r2, #0x59DB
			b sc_out
sc_0x4DDC:
			mov r1, #0x4DDC
			mov r2, #0x59DC
			b sc_out
sc_0x4DDD:
			mov r1, #0x4DDD
			mov r2, #0x59DD
			b sc_out
sc_0x4DDE:
			mov r1, #0x4DDE
			mov r2, #0x59DE
			b sc_out
sc_0x4DDF:
			mov r1, #0x4DDF
			mov r2, #0x59DF
			b sc_out
sc_0x4EC0:
			mov r1, #0x4EC0
			mov r2, #0x59C0
			b sc_out
sc_0x4EC1:
			mov r1, #0x4EC1
			mov r2, #0x59C1
			b sc_out
sc_0x4EC2:
			mov r1, #0x4EC2
			mov r2, #0x59C2
			b sc_out
sc_0x4EC3:
			mov r1, #0x4EC3
			mov r2, #0x59C3
			b sc_out
sc_0x4EC4:
			mov r1, #0x4EC4
			mov r2, #0x59C4
			b sc_out
sc_0x4EC5:
			mov r1, #0x4EC5
			mov r2, #0x59C5
			b sc_out
sc_0x4EC6:
			mov r1, #0x4EC6
			mov r2, #0x59C6
			b sc_out
sc_0x4EC7:
			mov r1, #0x4EC7
			mov r2, #0x59C7
			b sc_out
sc_0x4EC8:
			mov r1, #0x4EC8
			mov r2, #0x59C8
			b sc_out
sc_0x4EC9:
			mov r1, #0x4EC9
			mov r2, #0x59C9
			b sc_out
sc_0x4ECA:
			mov r1, #0x4ECA
			mov r2, #0x59CA
			b sc_out
sc_0x4ECB:
			mov r1, #0x4ECB
			mov r2, #0x59CB
			b sc_out
sc_0x4ECC:
			mov r1, #0x4ECC
			mov r2, #0x59CC
			b sc_out
sc_0x4ECD:
			mov r1, #0x4ECD
			mov r2, #0x59CD
			b sc_out
sc_0x4ECE:
			mov r1, #0x4ECE
			mov r2, #0x59CE
			b sc_out
sc_0x4ECF:
			mov r1, #0x4ECF
			mov r2, #0x59CF
			b sc_out
sc_0x4ED0:
			mov r1, #0x4ED0
			mov r2, #0x59D0
			b sc_out
sc_0x4ED1:
			mov r1, #0x4ED1
			mov r2, #0x59D1
			b sc_out
sc_0x4ED2:
			mov r1, #0x4ED2
			mov r2, #0x59D2
			b sc_out
sc_0x4ED3:
			mov r1, #0x4ED3
			mov r2, #0x59D3
			b sc_out
sc_0x4ED4:
			mov r1, #0x4ED4
			mov r2, #0x59D4
			b sc_out
sc_0x4ED5:
			mov r1, #0x4ED5
			mov r2, #0x59D5
			b sc_out
sc_0x4ED6:
			mov r1, #0x4ED6
			mov r2, #0x59D6
			b sc_out
sc_0x4ED7:
			mov r1, #0x4ED7
			mov r2, #0x59D7
			b sc_out
sc_0x4ED8:
			mov r1, #0x4ED8
			mov r2, #0x59D8
			b sc_out
sc_0x4ED9:
			mov r1, #0x4ED9
			mov r2, #0x59D9
			b sc_out
sc_0x4EDA:
			mov r1, #0x4EDA
			mov r2, #0x59DA
			b sc_out
sc_0x4EDB:
			mov r1, #0x4EDB
			mov r2, #0x59DB
			b sc_out
sc_0x4EDC:
			mov r1, #0x4EDC
			mov r2, #0x59DC
			b sc_out
sc_0x4EDD:
			mov r1, #0x4EDD
			mov r2, #0x59DD
			b sc_out
sc_0x4EDE:
			mov r1, #0x4EDE
			mov r2, #0x59DE
			b sc_out
sc_0x4EDF:
			mov r1, #0x4EDF
			mov r2, #0x59DF
			b sc_out
sc_0x4FC0:
			mov r1, #0x4FC0
			mov r2, #0x59C0
			b sc_out
sc_0x4FC1:
			mov r1, #0x4FC1
			mov r2, #0x59C1
			b sc_out
sc_0x4FC2:
			mov r1, #0x4FC2
			mov r2, #0x59C2
			b sc_out
sc_0x4FC3:
			mov r1, #0x4FC3
			mov r2, #0x59C3
			b sc_out
sc_0x4FC4:
			mov r1, #0x4FC4
			mov r2, #0x59C4
			b sc_out
sc_0x4FC5:
			mov r1, #0x4FC5
			mov r2, #0x59C5
			b sc_out
sc_0x4FC6:
			mov r1, #0x4FC6
			mov r2, #0x59C6
			b sc_out
sc_0x4FC7:
			mov r1, #0x4FC7
			mov r2, #0x59C7
			b sc_out
sc_0x4FC8:
			mov r1, #0x4FC8
			mov r2, #0x59C8
			b sc_out
sc_0x4FC9:
			mov r1, #0x4FC9
			mov r2, #0x59C9
			b sc_out
sc_0x4FCA:
			mov r1, #0x4FCA
			mov r2, #0x59CA
			b sc_out
sc_0x4FCB:
			mov r1, #0x4FCB
			mov r2, #0x59CB
			b sc_out
sc_0x4FCC:
			mov r1, #0x4FCC
			mov r2, #0x59CC
			b sc_out
sc_0x4FCD:
			mov r1, #0x4FCD
			mov r2, #0x59CD
			b sc_out
sc_0x4FCE:
			mov r1, #0x4FCE
			mov r2, #0x59CE
			b sc_out
sc_0x4FCF:
			mov r1, #0x4FCF
			mov r2, #0x59CF
			b sc_out
sc_0x4FD0:
			mov r1, #0x4FD0
			mov r2, #0x59D0
			b sc_out
sc_0x4FD1:
			mov r1, #0x4FD1
			mov r2, #0x59D1
			b sc_out
sc_0x4FD2:
			mov r1, #0x4FD2
			mov r2, #0x59D2
			b sc_out
sc_0x4FD3:
			mov r1, #0x4FD3
			mov r2, #0x59D3
			b sc_out
sc_0x4FD4:
			mov r1, #0x4FD4
			mov r2, #0x59D4
			b sc_out
sc_0x4FD5:
			mov r1, #0x4FD5
			mov r2, #0x59D5
			b sc_out
sc_0x4FD6:
			mov r1, #0x4FD6
			mov r2, #0x59D6
			b sc_out
sc_0x4FD7:
			mov r1, #0x4FD7
			mov r2, #0x59D7
			b sc_out
sc_0x4FD8:
			mov r1, #0x4FD8
			mov r2, #0x59D8
			b sc_out
sc_0x4FD9:
			mov r1, #0x4FD9
			mov r2, #0x59D9
			b sc_out
sc_0x4FDA:
			mov r1, #0x4FDA
			mov r2, #0x59DA
			b sc_out
sc_0x4FDB:
			mov r1, #0x4FDB
			mov r2, #0x59DB
			b sc_out
sc_0x4FDC:
			mov r1, #0x4FDC
			mov r2, #0x59DC
			b sc_out
sc_0x4FDD:
			mov r1, #0x4FDD
			mov r2, #0x59DD
			b sc_out
sc_0x4FDE:
			mov r1, #0x4FDE
			mov r2, #0x59DE
			b sc_out
sc_0x4FDF:
			mov r1, #0x4FDF
			mov r2, #0x59DF
			b sc_out
sc_0x48E0:
			mov r1, #0x48E0
			mov r2, #0x59E0
			b sc_out
sc_0x48E1:
			mov r1, #0x48E1
			mov r2, #0x59E1
			b sc_out
sc_0x48E2:
			mov r1, #0x48E2
			mov r2, #0x59E2
			b sc_out
sc_0x48E3:
			mov r1, #0x48E3
			mov r2, #0x59E3
			b sc_out
sc_0x48E4:
			mov r1, #0x48E4
			mov r2, #0x59E4
			b sc_out
sc_0x48E5:
			mov r1, #0x48E5
			mov r2, #0x59E5
			b sc_out
sc_0x48E6:
			mov r1, #0x48E6
			mov r2, #0x59E6
			b sc_out
sc_0x48E7:
			mov r1, #0x48E7
			mov r2, #0x59E7
			b sc_out
sc_0x48E8:
			mov r1, #0x48E8
			mov r2, #0x59E8
			b sc_out
sc_0x48E9:
			mov r1, #0x48E9
			mov r2, #0x59E9
			b sc_out
sc_0x48EA:
			mov r1, #0x48EA
			mov r2, #0x59EA
			b sc_out
sc_0x48EB:
			mov r1, #0x48EB
			mov r2, #0x59EB
			b sc_out
sc_0x48EC:
			mov r1, #0x48EC
			mov r2, #0x59EC
			b sc_out
sc_0x48ED:
			mov r1, #0x48ED
			mov r2, #0x59ED
			b sc_out
sc_0x48EE:
			mov r1, #0x48EE
			mov r2, #0x59EE
			b sc_out
sc_0x48EF:
			mov r1, #0x48EF
			mov r2, #0x59EF
			b sc_out
sc_0x48F0:
			mov r1, #0x48F0
			mov r2, #0x59F0
			b sc_out
sc_0x48F1:
			mov r1, #0x48F1
			mov r2, #0x59F1
			b sc_out
sc_0x48F2:
			mov r1, #0x48F2
			mov r2, #0x59F2
			b sc_out
sc_0x48F3:
			mov r1, #0x48F3
			mov r2, #0x59F3
			b sc_out
sc_0x48F4:
			mov r1, #0x48F4
			mov r2, #0x59F4
			b sc_out
sc_0x48F5:
			mov r1, #0x48F5
			mov r2, #0x59F5
			b sc_out
sc_0x48F6:
			mov r1, #0x48F6
			mov r2, #0x59F6
			b sc_out
sc_0x48F7:
			mov r1, #0x48F7
			mov r2, #0x59F7
			b sc_out
sc_0x48F8:
			mov r1, #0x48F8
			mov r2, #0x59F8
			b sc_out
sc_0x48F9:
			mov r1, #0x48F9
			mov r2, #0x59F9
			b sc_out
sc_0x48FA:
			mov r1, #0x48FA
			mov r2, #0x59FA
			b sc_out
sc_0x48FB:
			mov r1, #0x48FB
			mov r2, #0x59FB
			b sc_out
sc_0x48FC:
			mov r1, #0x48FC
			mov r2, #0x59FC
			b sc_out
sc_0x48FD:
			mov r1, #0x48FD
			mov r2, #0x59FD
			b sc_out
sc_0x48FE:
			mov r1, #0x48FE
			mov r2, #0x59FE
			b sc_out
sc_0x48FF:
			mov r1, #0x48FF
			mov r2, #0x59FF
			b sc_out
sc_0x49E0:
			mov r1, #0x49E0
			mov r2, #0x59E0
			b sc_out
sc_0x49E1:
			mov r1, #0x49E1
			mov r2, #0x59E1
			b sc_out
sc_0x49E2:
			mov r1, #0x49E2
			mov r2, #0x59E2
			b sc_out
sc_0x49E3:
			mov r1, #0x49E3
			mov r2, #0x59E3
			b sc_out
sc_0x49E4:
			mov r1, #0x49E4
			mov r2, #0x59E4
			b sc_out
sc_0x49E5:
			mov r1, #0x49E5
			mov r2, #0x59E5
			b sc_out
sc_0x49E6:
			mov r1, #0x49E6
			mov r2, #0x59E6
			b sc_out
sc_0x49E7:
			mov r1, #0x49E7
			mov r2, #0x59E7
			b sc_out
sc_0x49E8:
			mov r1, #0x49E8
			mov r2, #0x59E8
			b sc_out
sc_0x49E9:
			mov r1, #0x49E9
			mov r2, #0x59E9
			b sc_out
sc_0x49EA:
			mov r1, #0x49EA
			mov r2, #0x59EA
			b sc_out
sc_0x49EB:
			mov r1, #0x49EB
			mov r2, #0x59EB
			b sc_out
sc_0x49EC:
			mov r1, #0x49EC
			mov r2, #0x59EC
			b sc_out
sc_0x49ED:
			mov r1, #0x49ED
			mov r2, #0x59ED
			b sc_out
sc_0x49EE:
			mov r1, #0x49EE
			mov r2, #0x59EE
			b sc_out
sc_0x49EF:
			mov r1, #0x49EF
			mov r2, #0x59EF
			b sc_out
sc_0x49F0:
			mov r1, #0x49F0
			mov r2, #0x59F0
			b sc_out
sc_0x49F1:
			mov r1, #0x49F1
			mov r2, #0x59F1
			b sc_out
sc_0x49F2:
			mov r1, #0x49F2
			mov r2, #0x59F2
			b sc_out
sc_0x49F3:
			mov r1, #0x49F3
			mov r2, #0x59F3
			b sc_out
sc_0x49F4:
			mov r1, #0x49F4
			mov r2, #0x59F4
			b sc_out
sc_0x49F5:
			mov r1, #0x49F5
			mov r2, #0x59F5
			b sc_out
sc_0x49F6:
			mov r1, #0x49F6
			mov r2, #0x59F6
			b sc_out
sc_0x49F7:
			mov r1, #0x49F7
			mov r2, #0x59F7
			b sc_out
sc_0x49F8:
			mov r1, #0x49F8
			mov r2, #0x59F8
			b sc_out
sc_0x49F9:
			mov r1, #0x49F9
			mov r2, #0x59F9
			b sc_out
sc_0x49FA:
			mov r1, #0x49FA
			mov r2, #0x59FA
			b sc_out
sc_0x49FB:
			mov r1, #0x49FB
			mov r2, #0x59FB
			b sc_out
sc_0x49FC:
			mov r1, #0x49FC
			mov r2, #0x59FC
			b sc_out
sc_0x49FD:
			mov r1, #0x49FD
			mov r2, #0x59FD
			b sc_out
sc_0x49FE:
			mov r1, #0x49FE
			mov r2, #0x59FE
			b sc_out
sc_0x49FF:
			mov r1, #0x49FF
			mov r2, #0x59FF
			b sc_out
sc_0x4AE0:
			mov r1, #0x4AE0
			mov r2, #0x59E0
			b sc_out
sc_0x4AE1:
			mov r1, #0x4AE1
			mov r2, #0x59E1
			b sc_out
sc_0x4AE2:
			mov r1, #0x4AE2
			mov r2, #0x59E2
			b sc_out
sc_0x4AE3:
			mov r1, #0x4AE3
			mov r2, #0x59E3
			b sc_out
sc_0x4AE4:
			mov r1, #0x4AE4
			mov r2, #0x59E4
			b sc_out
sc_0x4AE5:
			mov r1, #0x4AE5
			mov r2, #0x59E5
			b sc_out
sc_0x4AE6:
			mov r1, #0x4AE6
			mov r2, #0x59E6
			b sc_out
sc_0x4AE7:
			mov r1, #0x4AE7
			mov r2, #0x59E7
			b sc_out
sc_0x4AE8:
			mov r1, #0x4AE8
			mov r2, #0x59E8
			b sc_out
sc_0x4AE9:
			mov r1, #0x4AE9
			mov r2, #0x59E9
			b sc_out
sc_0x4AEA:
			mov r1, #0x4AEA
			mov r2, #0x59EA
			b sc_out
sc_0x4AEB:
			mov r1, #0x4AEB
			mov r2, #0x59EB
			b sc_out
sc_0x4AEC:
			mov r1, #0x4AEC
			mov r2, #0x59EC
			b sc_out
sc_0x4AED:
			mov r1, #0x4AED
			mov r2, #0x59ED
			b sc_out
sc_0x4AEE:
			mov r1, #0x4AEE
			mov r2, #0x59EE
			b sc_out
sc_0x4AEF:
			mov r1, #0x4AEF
			mov r2, #0x59EF
			b sc_out
sc_0x4AF0:
			mov r1, #0x4AF0
			mov r2, #0x59F0
			b sc_out
sc_0x4AF1:
			mov r1, #0x4AF1
			mov r2, #0x59F1
			b sc_out
sc_0x4AF2:
			mov r1, #0x4AF2
			mov r2, #0x59F2
			b sc_out
sc_0x4AF3:
			mov r1, #0x4AF3
			mov r2, #0x59F3
			b sc_out
sc_0x4AF4:
			mov r1, #0x4AF4
			mov r2, #0x59F4
			b sc_out
sc_0x4AF5:
			mov r1, #0x4AF5
			mov r2, #0x59F5
			b sc_out
sc_0x4AF6:
			mov r1, #0x4AF6
			mov r2, #0x59F6
			b sc_out
sc_0x4AF7:
			mov r1, #0x4AF7
			mov r2, #0x59F7
			b sc_out
sc_0x4AF8:
			mov r1, #0x4AF8
			mov r2, #0x59F8
			b sc_out
sc_0x4AF9:
			mov r1, #0x4AF9
			mov r2, #0x59F9
			b sc_out
sc_0x4AFA:
			mov r1, #0x4AFA
			mov r2, #0x59FA
			b sc_out
sc_0x4AFB:
			mov r1, #0x4AFB
			mov r2, #0x59FB
			b sc_out
sc_0x4AFC:
			mov r1, #0x4AFC
			mov r2, #0x59FC
			b sc_out
sc_0x4AFD:
			mov r1, #0x4AFD
			mov r2, #0x59FD
			b sc_out
sc_0x4AFE:
			mov r1, #0x4AFE
			mov r2, #0x59FE
			b sc_out
sc_0x4AFF:
			mov r1, #0x4AFF
			mov r2, #0x59FF
			b sc_out
sc_0x4BE0:
			mov r1, #0x4BE0
			mov r2, #0x59E0
			b sc_out
sc_0x4BE1:
			mov r1, #0x4BE1
			mov r2, #0x59E1
			b sc_out
sc_0x4BE2:
			mov r1, #0x4BE2
			mov r2, #0x59E2
			b sc_out
sc_0x4BE3:
			mov r1, #0x4BE3
			mov r2, #0x59E3
			b sc_out
sc_0x4BE4:
			mov r1, #0x4BE4
			mov r2, #0x59E4
			b sc_out
sc_0x4BE5:
			mov r1, #0x4BE5
			mov r2, #0x59E5
			b sc_out
sc_0x4BE6:
			mov r1, #0x4BE6
			mov r2, #0x59E6
			b sc_out
sc_0x4BE7:
			mov r1, #0x4BE7
			mov r2, #0x59E7
			b sc_out
sc_0x4BE8:
			mov r1, #0x4BE8
			mov r2, #0x59E8
			b sc_out
sc_0x4BE9:
			mov r1, #0x4BE9
			mov r2, #0x59E9
			b sc_out
sc_0x4BEA:
			mov r1, #0x4BEA
			mov r2, #0x59EA
			b sc_out
sc_0x4BEB:
			mov r1, #0x4BEB
			mov r2, #0x59EB
			b sc_out
sc_0x4BEC:
			mov r1, #0x4BEC
			mov r2, #0x59EC
			b sc_out
sc_0x4BED:
			mov r1, #0x4BED
			mov r2, #0x59ED
			b sc_out
sc_0x4BEE:
			mov r1, #0x4BEE
			mov r2, #0x59EE
			b sc_out
sc_0x4BEF:
			mov r1, #0x4BEF
			mov r2, #0x59EF
			b sc_out
sc_0x4BF0:
			mov r1, #0x4BF0
			mov r2, #0x59F0
			b sc_out
sc_0x4BF1:
			mov r1, #0x4BF1
			mov r2, #0x59F1
			b sc_out
sc_0x4BF2:
			mov r1, #0x4BF2
			mov r2, #0x59F2
			b sc_out
sc_0x4BF3:
			mov r1, #0x4BF3
			mov r2, #0x59F3
			b sc_out
sc_0x4BF4:
			mov r1, #0x4BF4
			mov r2, #0x59F4
			b sc_out
sc_0x4BF5:
			mov r1, #0x4BF5
			mov r2, #0x59F5
			b sc_out
sc_0x4BF6:
			mov r1, #0x4BF6
			mov r2, #0x59F6
			b sc_out
sc_0x4BF7:
			mov r1, #0x4BF7
			mov r2, #0x59F7
			b sc_out
sc_0x4BF8:
			mov r1, #0x4BF8
			mov r2, #0x59F8
			b sc_out
sc_0x4BF9:
			mov r1, #0x4BF9
			mov r2, #0x59F9
			b sc_out
sc_0x4BFA:
			mov r1, #0x4BFA
			mov r2, #0x59FA
			b sc_out
sc_0x4BFB:
			mov r1, #0x4BFB
			mov r2, #0x59FB
			b sc_out
sc_0x4BFC:
			mov r1, #0x4BFC
			mov r2, #0x59FC
			b sc_out
sc_0x4BFD:
			mov r1, #0x4BFD
			mov r2, #0x59FD
			b sc_out
sc_0x4BFE:
			mov r1, #0x4BFE
			mov r2, #0x59FE
			b sc_out
sc_0x4BFF:
			mov r1, #0x4BFF
			mov r2, #0x59FF
			b sc_out
sc_0x4CE0:
			mov r1, #0x4CE0
			mov r2, #0x59E0
			b sc_out
sc_0x4CE1:
			mov r1, #0x4CE1
			mov r2, #0x59E1
			b sc_out
sc_0x4CE2:
			mov r1, #0x4CE2
			mov r2, #0x59E2
			b sc_out
sc_0x4CE3:
			mov r1, #0x4CE3
			mov r2, #0x59E3
			b sc_out
sc_0x4CE4:
			mov r1, #0x4CE4
			mov r2, #0x59E4
			b sc_out
sc_0x4CE5:
			mov r1, #0x4CE5
			mov r2, #0x59E5
			b sc_out
sc_0x4CE6:
			mov r1, #0x4CE6
			mov r2, #0x59E6
			b sc_out
sc_0x4CE7:
			mov r1, #0x4CE7
			mov r2, #0x59E7
			b sc_out
sc_0x4CE8:
			mov r1, #0x4CE8
			mov r2, #0x59E8
			b sc_out
sc_0x4CE9:
			mov r1, #0x4CE9
			mov r2, #0x59E9
			b sc_out
sc_0x4CEA:
			mov r1, #0x4CEA
			mov r2, #0x59EA
			b sc_out
sc_0x4CEB:
			mov r1, #0x4CEB
			mov r2, #0x59EB
			b sc_out
sc_0x4CEC:
			mov r1, #0x4CEC
			mov r2, #0x59EC
			b sc_out
sc_0x4CED:
			mov r1, #0x4CED
			mov r2, #0x59ED
			b sc_out
sc_0x4CEE:
			mov r1, #0x4CEE
			mov r2, #0x59EE
			b sc_out
sc_0x4CEF:
			mov r1, #0x4CEF
			mov r2, #0x59EF
			b sc_out
sc_0x4CF0:
			mov r1, #0x4CF0
			mov r2, #0x59F0
			b sc_out
sc_0x4CF1:
			mov r1, #0x4CF1
			mov r2, #0x59F1
			b sc_out
sc_0x4CF2:
			mov r1, #0x4CF2
			mov r2, #0x59F2
			b sc_out
sc_0x4CF3:
			mov r1, #0x4CF3
			mov r2, #0x59F3
			b sc_out
sc_0x4CF4:
			mov r1, #0x4CF4
			mov r2, #0x59F4
			b sc_out
sc_0x4CF5:
			mov r1, #0x4CF5
			mov r2, #0x59F5
			b sc_out
sc_0x4CF6:
			mov r1, #0x4CF6
			mov r2, #0x59F6
			b sc_out
sc_0x4CF7:
			mov r1, #0x4CF7
			mov r2, #0x59F7
			b sc_out
sc_0x4CF8:
			mov r1, #0x4CF8
			mov r2, #0x59F8
			b sc_out
sc_0x4CF9:
			mov r1, #0x4CF9
			mov r2, #0x59F9
			b sc_out
sc_0x4CFA:
			mov r1, #0x4CFA
			mov r2, #0x59FA
			b sc_out
sc_0x4CFB:
			mov r1, #0x4CFB
			mov r2, #0x59FB
			b sc_out
sc_0x4CFC:
			mov r1, #0x4CFC
			mov r2, #0x59FC
			b sc_out
sc_0x4CFD:
			mov r1, #0x4CFD
			mov r2, #0x59FD
			b sc_out
sc_0x4CFE:
			mov r1, #0x4CFE
			mov r2, #0x59FE
			b sc_out
sc_0x4CFF:
			mov r1, #0x4CFF
			mov r2, #0x59FF
			b sc_out
sc_0x4DE0:
			mov r1, #0x4DE0
			mov r2, #0x59E0
			b sc_out
sc_0x4DE1:
			mov r1, #0x4DE1
			mov r2, #0x59E1
			b sc_out
sc_0x4DE2:
			mov r1, #0x4DE2
			mov r2, #0x59E2
			b sc_out
sc_0x4DE3:
			mov r1, #0x4DE3
			mov r2, #0x59E3
			b sc_out
sc_0x4DE4:
			mov r1, #0x4DE4
			mov r2, #0x59E4
			b sc_out
sc_0x4DE5:
			mov r1, #0x4DE5
			mov r2, #0x59E5
			b sc_out
sc_0x4DE6:
			mov r1, #0x4DE6
			mov r2, #0x59E6
			b sc_out
sc_0x4DE7:
			mov r1, #0x4DE7
			mov r2, #0x59E7
			b sc_out
sc_0x4DE8:
			mov r1, #0x4DE8
			mov r2, #0x59E8
			b sc_out
sc_0x4DE9:
			mov r1, #0x4DE9
			mov r2, #0x59E9
			b sc_out
sc_0x4DEA:
			mov r1, #0x4DEA
			mov r2, #0x59EA
			b sc_out
sc_0x4DEB:
			mov r1, #0x4DEB
			mov r2, #0x59EB
			b sc_out
sc_0x4DEC:
			mov r1, #0x4DEC
			mov r2, #0x59EC
			b sc_out
sc_0x4DED:
			mov r1, #0x4DED
			mov r2, #0x59ED
			b sc_out
sc_0x4DEE:
			mov r1, #0x4DEE
			mov r2, #0x59EE
			b sc_out
sc_0x4DEF:
			mov r1, #0x4DEF
			mov r2, #0x59EF
			b sc_out
sc_0x4DF0:
			mov r1, #0x4DF0
			mov r2, #0x59F0
			b sc_out
sc_0x4DF1:
			mov r1, #0x4DF1
			mov r2, #0x59F1
			b sc_out
sc_0x4DF2:
			mov r1, #0x4DF2
			mov r2, #0x59F2
			b sc_out
sc_0x4DF3:
			mov r1, #0x4DF3
			mov r2, #0x59F3
			b sc_out
sc_0x4DF4:
			mov r1, #0x4DF4
			mov r2, #0x59F4
			b sc_out
sc_0x4DF5:
			mov r1, #0x4DF5
			mov r2, #0x59F5
			b sc_out
sc_0x4DF6:
			mov r1, #0x4DF6
			mov r2, #0x59F6
			b sc_out
sc_0x4DF7:
			mov r1, #0x4DF7
			mov r2, #0x59F7
			b sc_out
sc_0x4DF8:
			mov r1, #0x4DF8
			mov r2, #0x59F8
			b sc_out
sc_0x4DF9:
			mov r1, #0x4DF9
			mov r2, #0x59F9
			b sc_out
sc_0x4DFA:
			mov r1, #0x4DFA
			mov r2, #0x59FA
			b sc_out
sc_0x4DFB:
			mov r1, #0x4DFB
			mov r2, #0x59FB
			b sc_out
sc_0x4DFC:
			mov r1, #0x4DFC
			mov r2, #0x59FC
			b sc_out
sc_0x4DFD:
			mov r1, #0x4DFD
			mov r2, #0x59FD
			b sc_out
sc_0x4DFE:
			mov r1, #0x4DFE
			mov r2, #0x59FE
			b sc_out
sc_0x4DFF:
			mov r1, #0x4DFF
			mov r2, #0x59FF
			b sc_out
sc_0x4EE0:
			mov r1, #0x4EE0
			mov r2, #0x59E0
			b sc_out
sc_0x4EE1:
			mov r1, #0x4EE1
			mov r2, #0x59E1
			b sc_out
sc_0x4EE2:
			mov r1, #0x4EE2
			mov r2, #0x59E2
			b sc_out
sc_0x4EE3:
			mov r1, #0x4EE3
			mov r2, #0x59E3
			b sc_out
sc_0x4EE4:
			mov r1, #0x4EE4
			mov r2, #0x59E4
			b sc_out
sc_0x4EE5:
			mov r1, #0x4EE5
			mov r2, #0x59E5
			b sc_out
sc_0x4EE6:
			mov r1, #0x4EE6
			mov r2, #0x59E6
			b sc_out
sc_0x4EE7:
			mov r1, #0x4EE7
			mov r2, #0x59E7
			b sc_out
sc_0x4EE8:
			mov r1, #0x4EE8
			mov r2, #0x59E8
			b sc_out
sc_0x4EE9:
			mov r1, #0x4EE9
			mov r2, #0x59E9
			b sc_out
sc_0x4EEA:
			mov r1, #0x4EEA
			mov r2, #0x59EA
			b sc_out
sc_0x4EEB:
			mov r1, #0x4EEB
			mov r2, #0x59EB
			b sc_out
sc_0x4EEC:
			mov r1, #0x4EEC
			mov r2, #0x59EC
			b sc_out
sc_0x4EED:
			mov r1, #0x4EED
			mov r2, #0x59ED
			b sc_out
sc_0x4EEE:
			mov r1, #0x4EEE
			mov r2, #0x59EE
			b sc_out
sc_0x4EEF:
			mov r1, #0x4EEF
			mov r2, #0x59EF
			b sc_out
sc_0x4EF0:
			mov r1, #0x4EF0
			mov r2, #0x59F0
			b sc_out
sc_0x4EF1:
			mov r1, #0x4EF1
			mov r2, #0x59F1
			b sc_out
sc_0x4EF2:
			mov r1, #0x4EF2
			mov r2, #0x59F2
			b sc_out
sc_0x4EF3:
			mov r1, #0x4EF3
			mov r2, #0x59F3
			b sc_out
sc_0x4EF4:
			mov r1, #0x4EF4
			mov r2, #0x59F4
			b sc_out
sc_0x4EF5:
			mov r1, #0x4EF5
			mov r2, #0x59F5
			b sc_out
sc_0x4EF6:
			mov r1, #0x4EF6
			mov r2, #0x59F6
			b sc_out
sc_0x4EF7:
			mov r1, #0x4EF7
			mov r2, #0x59F7
			b sc_out
sc_0x4EF8:
			mov r1, #0x4EF8
			mov r2, #0x59F8
			b sc_out
sc_0x4EF9:
			mov r1, #0x4EF9
			mov r2, #0x59F9
			b sc_out
sc_0x4EFA:
			mov r1, #0x4EFA
			mov r2, #0x59FA
			b sc_out
sc_0x4EFB:
			mov r1, #0x4EFB
			mov r2, #0x59FB
			b sc_out
sc_0x4EFC:
			mov r1, #0x4EFC
			mov r2, #0x59FC
			b sc_out
sc_0x4EFD:
			mov r1, #0x4EFD
			mov r2, #0x59FD
			b sc_out
sc_0x4EFE:
			mov r1, #0x4EFE
			mov r2, #0x59FE
			b sc_out
sc_0x4EFF:
			mov r1, #0x4EFF
			mov r2, #0x59FF
			b sc_out
sc_0x4FE0:
			mov r1, #0x4FE0
			mov r2, #0x59E0
			b sc_out
sc_0x4FE1:
			mov r1, #0x4FE1
			mov r2, #0x59E1
			b sc_out
sc_0x4FE2:
			mov r1, #0x4FE2
			mov r2, #0x59E2
			b sc_out
sc_0x4FE3:
			mov r1, #0x4FE3
			mov r2, #0x59E3
			b sc_out
sc_0x4FE4:
			mov r1, #0x4FE4
			mov r2, #0x59E4
			b sc_out
sc_0x4FE5:
			mov r1, #0x4FE5
			mov r2, #0x59E5
			b sc_out
sc_0x4FE6:
			mov r1, #0x4FE6
			mov r2, #0x59E6
			b sc_out
sc_0x4FE7:
			mov r1, #0x4FE7
			mov r2, #0x59E7
			b sc_out
sc_0x4FE8:
			mov r1, #0x4FE8
			mov r2, #0x59E8
			b sc_out
sc_0x4FE9:
			mov r1, #0x4FE9
			mov r2, #0x59E9
			b sc_out
sc_0x4FEA:
			mov r1, #0x4FEA
			mov r2, #0x59EA
			b sc_out
sc_0x4FEB:
			mov r1, #0x4FEB
			mov r2, #0x59EB
			b sc_out
sc_0x4FEC:
			mov r1, #0x4FEC
			mov r2, #0x59EC
			b sc_out
sc_0x4FED:
			mov r1, #0x4FED
			mov r2, #0x59ED
			b sc_out
sc_0x4FEE:
			mov r1, #0x4FEE
			mov r2, #0x59EE
			b sc_out
sc_0x4FEF:
			mov r1, #0x4FEF
			mov r2, #0x59EF
			b sc_out
sc_0x4FF0:
			mov r1, #0x4FF0
			mov r2, #0x59F0
			b sc_out
sc_0x4FF1:
			mov r1, #0x4FF1
			mov r2, #0x59F1
			b sc_out
sc_0x4FF2:
			mov r1, #0x4FF2
			mov r2, #0x59F2
			b sc_out
sc_0x4FF3:
			mov r1, #0x4FF3
			mov r2, #0x59F3
			b sc_out
sc_0x4FF4:
			mov r1, #0x4FF4
			mov r2, #0x59F4
			b sc_out
sc_0x4FF5:
			mov r1, #0x4FF5
			mov r2, #0x59F5
			b sc_out
sc_0x4FF6:
			mov r1, #0x4FF6
			mov r2, #0x59F6
			b sc_out
sc_0x4FF7:
			mov r1, #0x4FF7
			mov r2, #0x59F7
			b sc_out
sc_0x4FF8:
			mov r1, #0x4FF8
			mov r2, #0x59F8
			b sc_out
sc_0x4FF9:
			mov r1, #0x4FF9
			mov r2, #0x59F9
			b sc_out
sc_0x4FFA:
			mov r1, #0x4FFA
			mov r2, #0x59FA
			b sc_out
sc_0x4FFB:
			mov r1, #0x4FFB
			mov r2, #0x59FB
			b sc_out
sc_0x4FFC:
			mov r1, #0x4FFC
			mov r2, #0x59FC
			b sc_out
sc_0x4FFD:
			mov r1, #0x4FFD
			mov r2, #0x59FD
			b sc_out
sc_0x4FFE:
			mov r1, #0x4FFE
			mov r2, #0x59FE
			b sc_out
sc_0x4FFF:
			mov r1, #0x4FFF
			mov r2, #0x59FF
			b sc_out
sc_0x5000:
			mov r1, #0x5000
			mov r2, #0x5A00
			b sc_out
sc_0x5001:
			mov r1, #0x5001
			mov r2, #0x5A01
			b sc_out
sc_0x5002:
			mov r1, #0x5002
			mov r2, #0x5A02
			b sc_out
sc_0x5003:
			mov r1, #0x5003
			mov r2, #0x5A03
			b sc_out
sc_0x5004:
			mov r1, #0x5004
			mov r2, #0x5A04
			b sc_out
sc_0x5005:
			mov r1, #0x5005
			mov r2, #0x5A05
			b sc_out
sc_0x5006:
			mov r1, #0x5006
			mov r2, #0x5A06
			b sc_out
sc_0x5007:
			mov r1, #0x5007
			mov r2, #0x5A07
			b sc_out
sc_0x5008:
			mov r1, #0x5008
			mov r2, #0x5A08
			b sc_out
sc_0x5009:
			mov r1, #0x5009
			mov r2, #0x5A09
			b sc_out
sc_0x500A:
			mov r1, #0x500A
			mov r2, #0x5A0A
			b sc_out
sc_0x500B:
			mov r1, #0x500B
			mov r2, #0x5A0B
			b sc_out
sc_0x500C:
			mov r1, #0x500C
			mov r2, #0x5A0C
			b sc_out
sc_0x500D:
			mov r1, #0x500D
			mov r2, #0x5A0D
			b sc_out
sc_0x500E:
			mov r1, #0x500E
			mov r2, #0x5A0E
			b sc_out
sc_0x500F:
			mov r1, #0x500F
			mov r2, #0x5A0F
			b sc_out
sc_0x5010:
			mov r1, #0x5010
			mov r2, #0x5A10
			b sc_out
sc_0x5011:
			mov r1, #0x5011
			mov r2, #0x5A11
			b sc_out
sc_0x5012:
			mov r1, #0x5012
			mov r2, #0x5A12
			b sc_out
sc_0x5013:
			mov r1, #0x5013
			mov r2, #0x5A13
			b sc_out
sc_0x5014:
			mov r1, #0x5014
			mov r2, #0x5A14
			b sc_out
sc_0x5015:
			mov r1, #0x5015
			mov r2, #0x5A15
			b sc_out
sc_0x5016:
			mov r1, #0x5016
			mov r2, #0x5A16
			b sc_out
sc_0x5017:
			mov r1, #0x5017
			mov r2, #0x5A17
			b sc_out
sc_0x5018:
			mov r1, #0x5018
			mov r2, #0x5A18
			b sc_out
sc_0x5019:
			mov r1, #0x5019
			mov r2, #0x5A19
			b sc_out
sc_0x501A:
			mov r1, #0x501A
			mov r2, #0x5A1A
			b sc_out
sc_0x501B:
			mov r1, #0x501B
			mov r2, #0x5A1B
			b sc_out
sc_0x501C:
			mov r1, #0x501C
			mov r2, #0x5A1C
			b sc_out
sc_0x501D:
			mov r1, #0x501D
			mov r2, #0x5A1D
			b sc_out
sc_0x501E:
			mov r1, #0x501E
			mov r2, #0x5A1E
			b sc_out
sc_0x501F:
			mov r1, #0x501F
			mov r2, #0x5A1F
			b sc_out
sc_0x5100:
			mov r1, #0x5100
			mov r2, #0x5A00
			b sc_out
sc_0x5101:
			mov r1, #0x5101
			mov r2, #0x5A01
			b sc_out
sc_0x5102:
			mov r1, #0x5102
			mov r2, #0x5A02
			b sc_out
sc_0x5103:
			mov r1, #0x5103
			mov r2, #0x5A03
			b sc_out
sc_0x5104:
			mov r1, #0x5104
			mov r2, #0x5A04
			b sc_out
sc_0x5105:
			mov r1, #0x5105
			mov r2, #0x5A05
			b sc_out
sc_0x5106:
			mov r1, #0x5106
			mov r2, #0x5A06
			b sc_out
sc_0x5107:
			mov r1, #0x5107
			mov r2, #0x5A07
			b sc_out
sc_0x5108:
			mov r1, #0x5108
			mov r2, #0x5A08
			b sc_out
sc_0x5109:
			mov r1, #0x5109
			mov r2, #0x5A09
			b sc_out
sc_0x510A:
			mov r1, #0x510A
			mov r2, #0x5A0A
			b sc_out
sc_0x510B:
			mov r1, #0x510B
			mov r2, #0x5A0B
			b sc_out
sc_0x510C:
			mov r1, #0x510C
			mov r2, #0x5A0C
			b sc_out
sc_0x510D:
			mov r1, #0x510D
			mov r2, #0x5A0D
			b sc_out
sc_0x510E:
			mov r1, #0x510E
			mov r2, #0x5A0E
			b sc_out
sc_0x510F:
			mov r1, #0x510F
			mov r2, #0x5A0F
			b sc_out
sc_0x5110:
			mov r1, #0x5110
			mov r2, #0x5A10
			b sc_out
sc_0x5111:
			mov r1, #0x5111
			mov r2, #0x5A11
			b sc_out
sc_0x5112:
			mov r1, #0x5112
			mov r2, #0x5A12
			b sc_out
sc_0x5113:
			mov r1, #0x5113
			mov r2, #0x5A13
			b sc_out
sc_0x5114:
			mov r1, #0x5114
			mov r2, #0x5A14
			b sc_out
sc_0x5115:
			mov r1, #0x5115
			mov r2, #0x5A15
			b sc_out
sc_0x5116:
			mov r1, #0x5116
			mov r2, #0x5A16
			b sc_out
sc_0x5117:
			mov r1, #0x5117
			mov r2, #0x5A17
			b sc_out
sc_0x5118:
			mov r1, #0x5118
			mov r2, #0x5A18
			b sc_out
sc_0x5119:
			mov r1, #0x5119
			mov r2, #0x5A19
			b sc_out
sc_0x511A:
			mov r1, #0x511A
			mov r2, #0x5A1A
			b sc_out
sc_0x511B:
			mov r1, #0x511B
			mov r2, #0x5A1B
			b sc_out
sc_0x511C:
			mov r1, #0x511C
			mov r2, #0x5A1C
			b sc_out
sc_0x511D:
			mov r1, #0x511D
			mov r2, #0x5A1D
			b sc_out
sc_0x511E:
			mov r1, #0x511E
			mov r2, #0x5A1E
			b sc_out
sc_0x511F:
			mov r1, #0x511F
			mov r2, #0x5A1F
			b sc_out
sc_0x5200:
			mov r1, #0x5200
			mov r2, #0x5A00
			b sc_out
sc_0x5201:
			mov r1, #0x5201
			mov r2, #0x5A01
			b sc_out
sc_0x5202:
			mov r1, #0x5202
			mov r2, #0x5A02
			b sc_out
sc_0x5203:
			mov r1, #0x5203
			mov r2, #0x5A03
			b sc_out
sc_0x5204:
			mov r1, #0x5204
			mov r2, #0x5A04
			b sc_out
sc_0x5205:
			mov r1, #0x5205
			mov r2, #0x5A05
			b sc_out
sc_0x5206:
			mov r1, #0x5206
			mov r2, #0x5A06
			b sc_out
sc_0x5207:
			mov r1, #0x5207
			mov r2, #0x5A07
			b sc_out
sc_0x5208:
			mov r1, #0x5208
			mov r2, #0x5A08
			b sc_out
sc_0x5209:
			mov r1, #0x5209
			mov r2, #0x5A09
			b sc_out
sc_0x520A:
			mov r1, #0x520A
			mov r2, #0x5A0A
			b sc_out
sc_0x520B:
			mov r1, #0x520B
			mov r2, #0x5A0B
			b sc_out
sc_0x520C:
			mov r1, #0x520C
			mov r2, #0x5A0C
			b sc_out
sc_0x520D:
			mov r1, #0x520D
			mov r2, #0x5A0D
			b sc_out
sc_0x520E:
			mov r1, #0x520E
			mov r2, #0x5A0E
			b sc_out
sc_0x520F:
			mov r1, #0x520F
			mov r2, #0x5A0F
			b sc_out
sc_0x5210:
			mov r1, #0x5210
			mov r2, #0x5A10
			b sc_out
sc_0x5211:
			mov r1, #0x5211
			mov r2, #0x5A11
			b sc_out
sc_0x5212:
			mov r1, #0x5212
			mov r2, #0x5A12
			b sc_out
sc_0x5213:
			mov r1, #0x5213
			mov r2, #0x5A13
			b sc_out
sc_0x5214:
			mov r1, #0x5214
			mov r2, #0x5A14
			b sc_out
sc_0x5215:
			mov r1, #0x5215
			mov r2, #0x5A15
			b sc_out
sc_0x5216:
			mov r1, #0x5216
			mov r2, #0x5A16
			b sc_out
sc_0x5217:
			mov r1, #0x5217
			mov r2, #0x5A17
			b sc_out
sc_0x5218:
			mov r1, #0x5218
			mov r2, #0x5A18
			b sc_out
sc_0x5219:
			mov r1, #0x5219
			mov r2, #0x5A19
			b sc_out
sc_0x521A:
			mov r1, #0x521A
			mov r2, #0x5A1A
			b sc_out
sc_0x521B:
			mov r1, #0x521B
			mov r2, #0x5A1B
			b sc_out
sc_0x521C:
			mov r1, #0x521C
			mov r2, #0x5A1C
			b sc_out
sc_0x521D:
			mov r1, #0x521D
			mov r2, #0x5A1D
			b sc_out
sc_0x521E:
			mov r1, #0x521E
			mov r2, #0x5A1E
			b sc_out
sc_0x521F:
			mov r1, #0x521F
			mov r2, #0x5A1F
			b sc_out
sc_0x5300:
			mov r1, #0x5300
			mov r2, #0x5A00
			b sc_out
sc_0x5301:
			mov r1, #0x5301
			mov r2, #0x5A01
			b sc_out
sc_0x5302:
			mov r1, #0x5302
			mov r2, #0x5A02
			b sc_out
sc_0x5303:
			mov r1, #0x5303
			mov r2, #0x5A03
			b sc_out
sc_0x5304:
			mov r1, #0x5304
			mov r2, #0x5A04
			b sc_out
sc_0x5305:
			mov r1, #0x5305
			mov r2, #0x5A05
			b sc_out
sc_0x5306:
			mov r1, #0x5306
			mov r2, #0x5A06
			b sc_out
sc_0x5307:
			mov r1, #0x5307
			mov r2, #0x5A07
			b sc_out
sc_0x5308:
			mov r1, #0x5308
			mov r2, #0x5A08
			b sc_out
sc_0x5309:
			mov r1, #0x5309
			mov r2, #0x5A09
			b sc_out
sc_0x530A:
			mov r1, #0x530A
			mov r2, #0x5A0A
			b sc_out
sc_0x530B:
			mov r1, #0x530B
			mov r2, #0x5A0B
			b sc_out
sc_0x530C:
			mov r1, #0x530C
			mov r2, #0x5A0C
			b sc_out
sc_0x530D:
			mov r1, #0x530D
			mov r2, #0x5A0D
			b sc_out
sc_0x530E:
			mov r1, #0x530E
			mov r2, #0x5A0E
			b sc_out
sc_0x530F:
			mov r1, #0x530F
			mov r2, #0x5A0F
			b sc_out
sc_0x5310:
			mov r1, #0x5310
			mov r2, #0x5A10
			b sc_out
sc_0x5311:
			mov r1, #0x5311
			mov r2, #0x5A11
			b sc_out
sc_0x5312:
			mov r1, #0x5312
			mov r2, #0x5A12
			b sc_out
sc_0x5313:
			mov r1, #0x5313
			mov r2, #0x5A13
			b sc_out
sc_0x5314:
			mov r1, #0x5314
			mov r2, #0x5A14
			b sc_out
sc_0x5315:
			mov r1, #0x5315
			mov r2, #0x5A15
			b sc_out
sc_0x5316:
			mov r1, #0x5316
			mov r2, #0x5A16
			b sc_out
sc_0x5317:
			mov r1, #0x5317
			mov r2, #0x5A17
			b sc_out
sc_0x5318:
			mov r1, #0x5318
			mov r2, #0x5A18
			b sc_out
sc_0x5319:
			mov r1, #0x5319
			mov r2, #0x5A19
			b sc_out
sc_0x531A:
			mov r1, #0x531A
			mov r2, #0x5A1A
			b sc_out
sc_0x531B:
			mov r1, #0x531B
			mov r2, #0x5A1B
			b sc_out
sc_0x531C:
			mov r1, #0x531C
			mov r2, #0x5A1C
			b sc_out
sc_0x531D:
			mov r1, #0x531D
			mov r2, #0x5A1D
			b sc_out
sc_0x531E:
			mov r1, #0x531E
			mov r2, #0x5A1E
			b sc_out
sc_0x531F:
			mov r1, #0x531F
			mov r2, #0x5A1F
			b sc_out
sc_0x5400:
			mov r1, #0x5400
			mov r2, #0x5A00
			b sc_out
sc_0x5401:
			mov r1, #0x5401
			mov r2, #0x5A01
			b sc_out
sc_0x5402:
			mov r1, #0x5402
			mov r2, #0x5A02
			b sc_out
sc_0x5403:
			mov r1, #0x5403
			mov r2, #0x5A03
			b sc_out
sc_0x5404:
			mov r1, #0x5404
			mov r2, #0x5A04
			b sc_out
sc_0x5405:
			mov r1, #0x5405
			mov r2, #0x5A05
			b sc_out
sc_0x5406:
			mov r1, #0x5406
			mov r2, #0x5A06
			b sc_out
sc_0x5407:
			mov r1, #0x5407
			mov r2, #0x5A07
			b sc_out
sc_0x5408:
			mov r1, #0x5408
			mov r2, #0x5A08
			b sc_out
sc_0x5409:
			mov r1, #0x5409
			mov r2, #0x5A09
			b sc_out
sc_0x540A:
			mov r1, #0x540A
			mov r2, #0x5A0A
			b sc_out
sc_0x540B:
			mov r1, #0x540B
			mov r2, #0x5A0B
			b sc_out
sc_0x540C:
			mov r1, #0x540C
			mov r2, #0x5A0C
			b sc_out
sc_0x540D:
			mov r1, #0x540D
			mov r2, #0x5A0D
			b sc_out
sc_0x540E:
			mov r1, #0x540E
			mov r2, #0x5A0E
			b sc_out
sc_0x540F:
			mov r1, #0x540F
			mov r2, #0x5A0F
			b sc_out
sc_0x5410:
			mov r1, #0x5410
			mov r2, #0x5A10
			b sc_out
sc_0x5411:
			mov r1, #0x5411
			mov r2, #0x5A11
			b sc_out
sc_0x5412:
			mov r1, #0x5412
			mov r2, #0x5A12
			b sc_out
sc_0x5413:
			mov r1, #0x5413
			mov r2, #0x5A13
			b sc_out
sc_0x5414:
			mov r1, #0x5414
			mov r2, #0x5A14
			b sc_out
sc_0x5415:
			mov r1, #0x5415
			mov r2, #0x5A15
			b sc_out
sc_0x5416:
			mov r1, #0x5416
			mov r2, #0x5A16
			b sc_out
sc_0x5417:
			mov r1, #0x5417
			mov r2, #0x5A17
			b sc_out
sc_0x5418:
			mov r1, #0x5418
			mov r2, #0x5A18
			b sc_out
sc_0x5419:
			mov r1, #0x5419
			mov r2, #0x5A19
			b sc_out
sc_0x541A:
			mov r1, #0x541A
			mov r2, #0x5A1A
			b sc_out
sc_0x541B:
			mov r1, #0x541B
			mov r2, #0x5A1B
			b sc_out
sc_0x541C:
			mov r1, #0x541C
			mov r2, #0x5A1C
			b sc_out
sc_0x541D:
			mov r1, #0x541D
			mov r2, #0x5A1D
			b sc_out
sc_0x541E:
			mov r1, #0x541E
			mov r2, #0x5A1E
			b sc_out
sc_0x541F:
			mov r1, #0x541F
			mov r2, #0x5A1F
			b sc_out
sc_0x5500:
			mov r1, #0x5500
			mov r2, #0x5A00
			b sc_out
sc_0x5501:
			mov r1, #0x5501
			mov r2, #0x5A01
			b sc_out
sc_0x5502:
			mov r1, #0x5502
			mov r2, #0x5A02
			b sc_out
sc_0x5503:
			mov r1, #0x5503
			mov r2, #0x5A03
			b sc_out
sc_0x5504:
			mov r1, #0x5504
			mov r2, #0x5A04
			b sc_out
sc_0x5505:
			mov r1, #0x5505
			mov r2, #0x5A05
			b sc_out
sc_0x5506:
			mov r1, #0x5506
			mov r2, #0x5A06
			b sc_out
sc_0x5507:
			mov r1, #0x5507
			mov r2, #0x5A07
			b sc_out
sc_0x5508:
			mov r1, #0x5508
			mov r2, #0x5A08
			b sc_out
sc_0x5509:
			mov r1, #0x5509
			mov r2, #0x5A09
			b sc_out
sc_0x550A:
			mov r1, #0x550A
			mov r2, #0x5A0A
			b sc_out
sc_0x550B:
			mov r1, #0x550B
			mov r2, #0x5A0B
			b sc_out
sc_0x550C:
			mov r1, #0x550C
			mov r2, #0x5A0C
			b sc_out
sc_0x550D:
			mov r1, #0x550D
			mov r2, #0x5A0D
			b sc_out
sc_0x550E:
			mov r1, #0x550E
			mov r2, #0x5A0E
			b sc_out
sc_0x550F:
			mov r1, #0x550F
			mov r2, #0x5A0F
			b sc_out
sc_0x5510:
			mov r1, #0x5510
			mov r2, #0x5A10
			b sc_out
sc_0x5511:
			mov r1, #0x5511
			mov r2, #0x5A11
			b sc_out
sc_0x5512:
			mov r1, #0x5512
			mov r2, #0x5A12
			b sc_out
sc_0x5513:
			mov r1, #0x5513
			mov r2, #0x5A13
			b sc_out
sc_0x5514:
			mov r1, #0x5514
			mov r2, #0x5A14
			b sc_out
sc_0x5515:
			mov r1, #0x5515
			mov r2, #0x5A15
			b sc_out
sc_0x5516:
			mov r1, #0x5516
			mov r2, #0x5A16
			b sc_out
sc_0x5517:
			mov r1, #0x5517
			mov r2, #0x5A17
			b sc_out
sc_0x5518:
			mov r1, #0x5518
			mov r2, #0x5A18
			b sc_out
sc_0x5519:
			mov r1, #0x5519
			mov r2, #0x5A19
			b sc_out
sc_0x551A:
			mov r1, #0x551A
			mov r2, #0x5A1A
			b sc_out
sc_0x551B:
			mov r1, #0x551B
			mov r2, #0x5A1B
			b sc_out
sc_0x551C:
			mov r1, #0x551C
			mov r2, #0x5A1C
			b sc_out
sc_0x551D:
			mov r1, #0x551D
			mov r2, #0x5A1D
			b sc_out
sc_0x551E:
			mov r1, #0x551E
			mov r2, #0x5A1E
			b sc_out
sc_0x551F:
			mov r1, #0x551F
			mov r2, #0x5A1F
			b sc_out
sc_0x5600:
			mov r1, #0x5600
			mov r2, #0x5A00
			b sc_out
sc_0x5601:
			mov r1, #0x5601
			mov r2, #0x5A01
			b sc_out
sc_0x5602:
			mov r1, #0x5602
			mov r2, #0x5A02
			b sc_out
sc_0x5603:
			mov r1, #0x5603
			mov r2, #0x5A03
			b sc_out
sc_0x5604:
			mov r1, #0x5604
			mov r2, #0x5A04
			b sc_out
sc_0x5605:
			mov r1, #0x5605
			mov r2, #0x5A05
			b sc_out
sc_0x5606:
			mov r1, #0x5606
			mov r2, #0x5A06
			b sc_out
sc_0x5607:
			mov r1, #0x5607
			mov r2, #0x5A07
			b sc_out
sc_0x5608:
			mov r1, #0x5608
			mov r2, #0x5A08
			b sc_out
sc_0x5609:
			mov r1, #0x5609
			mov r2, #0x5A09
			b sc_out
sc_0x560A:
			mov r1, #0x560A
			mov r2, #0x5A0A
			b sc_out
sc_0x560B:
			mov r1, #0x560B
			mov r2, #0x5A0B
			b sc_out
sc_0x560C:
			mov r1, #0x560C
			mov r2, #0x5A0C
			b sc_out
sc_0x560D:
			mov r1, #0x560D
			mov r2, #0x5A0D
			b sc_out
sc_0x560E:
			mov r1, #0x560E
			mov r2, #0x5A0E
			b sc_out
sc_0x560F:
			mov r1, #0x560F
			mov r2, #0x5A0F
			b sc_out
sc_0x5610:
			mov r1, #0x5610
			mov r2, #0x5A10
			b sc_out
sc_0x5611:
			mov r1, #0x5611
			mov r2, #0x5A11
			b sc_out
sc_0x5612:
			mov r1, #0x5612
			mov r2, #0x5A12
			b sc_out
sc_0x5613:
			mov r1, #0x5613
			mov r2, #0x5A13
			b sc_out
sc_0x5614:
			mov r1, #0x5614
			mov r2, #0x5A14
			b sc_out
sc_0x5615:
			mov r1, #0x5615
			mov r2, #0x5A15
			b sc_out
sc_0x5616:
			mov r1, #0x5616
			mov r2, #0x5A16
			b sc_out
sc_0x5617:
			mov r1, #0x5617
			mov r2, #0x5A17
			b sc_out
sc_0x5618:
			mov r1, #0x5618
			mov r2, #0x5A18
			b sc_out
sc_0x5619:
			mov r1, #0x5619
			mov r2, #0x5A19
			b sc_out
sc_0x561A:
			mov r1, #0x561A
			mov r2, #0x5A1A
			b sc_out
sc_0x561B:
			mov r1, #0x561B
			mov r2, #0x5A1B
			b sc_out
sc_0x561C:
			mov r1, #0x561C
			mov r2, #0x5A1C
			b sc_out
sc_0x561D:
			mov r1, #0x561D
			mov r2, #0x5A1D
			b sc_out
sc_0x561E:
			mov r1, #0x561E
			mov r2, #0x5A1E
			b sc_out
sc_0x561F:
			mov r1, #0x561F
			mov r2, #0x5A1F
			b sc_out
sc_0x5700:
			mov r1, #0x5700
			mov r2, #0x5A00
			b sc_out
sc_0x5701:
			mov r1, #0x5701
			mov r2, #0x5A01
			b sc_out
sc_0x5702:
			mov r1, #0x5702
			mov r2, #0x5A02
			b sc_out
sc_0x5703:
			mov r1, #0x5703
			mov r2, #0x5A03
			b sc_out
sc_0x5704:
			mov r1, #0x5704
			mov r2, #0x5A04
			b sc_out
sc_0x5705:
			mov r1, #0x5705
			mov r2, #0x5A05
			b sc_out
sc_0x5706:
			mov r1, #0x5706
			mov r2, #0x5A06
			b sc_out
sc_0x5707:
			mov r1, #0x5707
			mov r2, #0x5A07
			b sc_out
sc_0x5708:
			mov r1, #0x5708
			mov r2, #0x5A08
			b sc_out
sc_0x5709:
			mov r1, #0x5709
			mov r2, #0x5A09
			b sc_out
sc_0x570A:
			mov r1, #0x570A
			mov r2, #0x5A0A
			b sc_out
sc_0x570B:
			mov r1, #0x570B
			mov r2, #0x5A0B
			b sc_out
sc_0x570C:
			mov r1, #0x570C
			mov r2, #0x5A0C
			b sc_out
sc_0x570D:
			mov r1, #0x570D
			mov r2, #0x5A0D
			b sc_out
sc_0x570E:
			mov r1, #0x570E
			mov r2, #0x5A0E
			b sc_out
sc_0x570F:
			mov r1, #0x570F
			mov r2, #0x5A0F
			b sc_out
sc_0x5710:
			mov r1, #0x5710
			mov r2, #0x5A10
			b sc_out
sc_0x5711:
			mov r1, #0x5711
			mov r2, #0x5A11
			b sc_out
sc_0x5712:
			mov r1, #0x5712
			mov r2, #0x5A12
			b sc_out
sc_0x5713:
			mov r1, #0x5713
			mov r2, #0x5A13
			b sc_out
sc_0x5714:
			mov r1, #0x5714
			mov r2, #0x5A14
			b sc_out
sc_0x5715:
			mov r1, #0x5715
			mov r2, #0x5A15
			b sc_out
sc_0x5716:
			mov r1, #0x5716
			mov r2, #0x5A16
			b sc_out
sc_0x5717:
			mov r1, #0x5717
			mov r2, #0x5A17
			b sc_out
sc_0x5718:
			mov r1, #0x5718
			mov r2, #0x5A18
			b sc_out
sc_0x5719:
			mov r1, #0x5719
			mov r2, #0x5A19
			b sc_out
sc_0x571A:
			mov r1, #0x571A
			mov r2, #0x5A1A
			b sc_out
sc_0x571B:
			mov r1, #0x571B
			mov r2, #0x5A1B
			b sc_out
sc_0x571C:
			mov r1, #0x571C
			mov r2, #0x5A1C
			b sc_out
sc_0x571D:
			mov r1, #0x571D
			mov r2, #0x5A1D
			b sc_out
sc_0x571E:
			mov r1, #0x571E
			mov r2, #0x5A1E
			b sc_out
sc_0x571F:
			mov r1, #0x571F
			mov r2, #0x5A1F
			b sc_out
sc_0x5020:
			mov r1, #0x5020
			mov r2, #0x5A20
			b sc_out
sc_0x5021:
			mov r1, #0x5021
			mov r2, #0x5A21
			b sc_out
sc_0x5022:
			mov r1, #0x5022
			mov r2, #0x5A22
			b sc_out
sc_0x5023:
			mov r1, #0x5023
			mov r2, #0x5A23
			b sc_out
sc_0x5024:
			mov r1, #0x5024
			mov r2, #0x5A24
			b sc_out
sc_0x5025:
			mov r1, #0x5025
			mov r2, #0x5A25
			b sc_out
sc_0x5026:
			mov r1, #0x5026
			mov r2, #0x5A26
			b sc_out
sc_0x5027:
			mov r1, #0x5027
			mov r2, #0x5A27
			b sc_out
sc_0x5028:
			mov r1, #0x5028
			mov r2, #0x5A28
			b sc_out
sc_0x5029:
			mov r1, #0x5029
			mov r2, #0x5A29
			b sc_out
sc_0x502A:
			mov r1, #0x502A
			mov r2, #0x5A2A
			b sc_out
sc_0x502B:
			mov r1, #0x502B
			mov r2, #0x5A2B
			b sc_out
sc_0x502C:
			mov r1, #0x502C
			mov r2, #0x5A2C
			b sc_out
sc_0x502D:
			mov r1, #0x502D
			mov r2, #0x5A2D
			b sc_out
sc_0x502E:
			mov r1, #0x502E
			mov r2, #0x5A2E
			b sc_out
sc_0x502F:
			mov r1, #0x502F
			mov r2, #0x5A2F
			b sc_out
sc_0x5030:
			mov r1, #0x5030
			mov r2, #0x5A30
			b sc_out
sc_0x5031:
			mov r1, #0x5031
			mov r2, #0x5A31
			b sc_out
sc_0x5032:
			mov r1, #0x5032
			mov r2, #0x5A32
			b sc_out
sc_0x5033:
			mov r1, #0x5033
			mov r2, #0x5A33
			b sc_out
sc_0x5034:
			mov r1, #0x5034
			mov r2, #0x5A34
			b sc_out
sc_0x5035:
			mov r1, #0x5035
			mov r2, #0x5A35
			b sc_out
sc_0x5036:
			mov r1, #0x5036
			mov r2, #0x5A36
			b sc_out
sc_0x5037:
			mov r1, #0x5037
			mov r2, #0x5A37
			b sc_out
sc_0x5038:
			mov r1, #0x5038
			mov r2, #0x5A38
			b sc_out
sc_0x5039:
			mov r1, #0x5039
			mov r2, #0x5A39
			b sc_out
sc_0x503A:
			mov r1, #0x503A
			mov r2, #0x5A3A
			b sc_out
sc_0x503B:
			mov r1, #0x503B
			mov r2, #0x5A3B
			b sc_out
sc_0x503C:
			mov r1, #0x503C
			mov r2, #0x5A3C
			b sc_out
sc_0x503D:
			mov r1, #0x503D
			mov r2, #0x5A3D
			b sc_out
sc_0x503E:
			mov r1, #0x503E
			mov r2, #0x5A3E
			b sc_out
sc_0x503F:
			mov r1, #0x503F
			mov r2, #0x5A3F
			b sc_out
sc_0x5120:
			mov r1, #0x5120
			mov r2, #0x5A20
			b sc_out
sc_0x5121:
			mov r1, #0x5121
			mov r2, #0x5A21
			b sc_out
sc_0x5122:
			mov r1, #0x5122
			mov r2, #0x5A22
			b sc_out
sc_0x5123:
			mov r1, #0x5123
			mov r2, #0x5A23
			b sc_out
sc_0x5124:
			mov r1, #0x5124
			mov r2, #0x5A24
			b sc_out
sc_0x5125:
			mov r1, #0x5125
			mov r2, #0x5A25
			b sc_out
sc_0x5126:
			mov r1, #0x5126
			mov r2, #0x5A26
			b sc_out
sc_0x5127:
			mov r1, #0x5127
			mov r2, #0x5A27
			b sc_out
sc_0x5128:
			mov r1, #0x5128
			mov r2, #0x5A28
			b sc_out
sc_0x5129:
			mov r1, #0x5129
			mov r2, #0x5A29
			b sc_out
sc_0x512A:
			mov r1, #0x512A
			mov r2, #0x5A2A
			b sc_out
sc_0x512B:
			mov r1, #0x512B
			mov r2, #0x5A2B
			b sc_out
sc_0x512C:
			mov r1, #0x512C
			mov r2, #0x5A2C
			b sc_out
sc_0x512D:
			mov r1, #0x512D
			mov r2, #0x5A2D
			b sc_out
sc_0x512E:
			mov r1, #0x512E
			mov r2, #0x5A2E
			b sc_out
sc_0x512F:
			mov r1, #0x512F
			mov r2, #0x5A2F
			b sc_out
sc_0x5130:
			mov r1, #0x5130
			mov r2, #0x5A30
			b sc_out
sc_0x5131:
			mov r1, #0x5131
			mov r2, #0x5A31
			b sc_out
sc_0x5132:
			mov r1, #0x5132
			mov r2, #0x5A32
			b sc_out
sc_0x5133:
			mov r1, #0x5133
			mov r2, #0x5A33
			b sc_out
sc_0x5134:
			mov r1, #0x5134
			mov r2, #0x5A34
			b sc_out
sc_0x5135:
			mov r1, #0x5135
			mov r2, #0x5A35
			b sc_out
sc_0x5136:
			mov r1, #0x5136
			mov r2, #0x5A36
			b sc_out
sc_0x5137:
			mov r1, #0x5137
			mov r2, #0x5A37
			b sc_out
sc_0x5138:
			mov r1, #0x5138
			mov r2, #0x5A38
			b sc_out
sc_0x5139:
			mov r1, #0x5139
			mov r2, #0x5A39
			b sc_out
sc_0x513A:
			mov r1, #0x513A
			mov r2, #0x5A3A
			b sc_out
sc_0x513B:
			mov r1, #0x513B
			mov r2, #0x5A3B
			b sc_out
sc_0x513C:
			mov r1, #0x513C
			mov r2, #0x5A3C
			b sc_out
sc_0x513D:
			mov r1, #0x513D
			mov r2, #0x5A3D
			b sc_out
sc_0x513E:
			mov r1, #0x513E
			mov r2, #0x5A3E
			b sc_out
sc_0x513F:
			mov r1, #0x513F
			mov r2, #0x5A3F
			b sc_out
sc_0x5220:
			mov r1, #0x5220
			mov r2, #0x5A20
			b sc_out
sc_0x5221:
			mov r1, #0x5221
			mov r2, #0x5A21
			b sc_out
sc_0x5222:
			mov r1, #0x5222
			mov r2, #0x5A22
			b sc_out
sc_0x5223:
			mov r1, #0x5223
			mov r2, #0x5A23
			b sc_out
sc_0x5224:
			mov r1, #0x5224
			mov r2, #0x5A24
			b sc_out
sc_0x5225:
			mov r1, #0x5225
			mov r2, #0x5A25
			b sc_out
sc_0x5226:
			mov r1, #0x5226
			mov r2, #0x5A26
			b sc_out
sc_0x5227:
			mov r1, #0x5227
			mov r2, #0x5A27
			b sc_out
sc_0x5228:
			mov r1, #0x5228
			mov r2, #0x5A28
			b sc_out
sc_0x5229:
			mov r1, #0x5229
			mov r2, #0x5A29
			b sc_out
sc_0x522A:
			mov r1, #0x522A
			mov r2, #0x5A2A
			b sc_out
sc_0x522B:
			mov r1, #0x522B
			mov r2, #0x5A2B
			b sc_out
sc_0x522C:
			mov r1, #0x522C
			mov r2, #0x5A2C
			b sc_out
sc_0x522D:
			mov r1, #0x522D
			mov r2, #0x5A2D
			b sc_out
sc_0x522E:
			mov r1, #0x522E
			mov r2, #0x5A2E
			b sc_out
sc_0x522F:
			mov r1, #0x522F
			mov r2, #0x5A2F
			b sc_out
sc_0x5230:
			mov r1, #0x5230
			mov r2, #0x5A30
			b sc_out
sc_0x5231:
			mov r1, #0x5231
			mov r2, #0x5A31
			b sc_out
sc_0x5232:
			mov r1, #0x5232
			mov r2, #0x5A32
			b sc_out
sc_0x5233:
			mov r1, #0x5233
			mov r2, #0x5A33
			b sc_out
sc_0x5234:
			mov r1, #0x5234
			mov r2, #0x5A34
			b sc_out
sc_0x5235:
			mov r1, #0x5235
			mov r2, #0x5A35
			b sc_out
sc_0x5236:
			mov r1, #0x5236
			mov r2, #0x5A36
			b sc_out
sc_0x5237:
			mov r1, #0x5237
			mov r2, #0x5A37
			b sc_out
sc_0x5238:
			mov r1, #0x5238
			mov r2, #0x5A38
			b sc_out
sc_0x5239:
			mov r1, #0x5239
			mov r2, #0x5A39
			b sc_out
sc_0x523A:
			mov r1, #0x523A
			mov r2, #0x5A3A
			b sc_out
sc_0x523B:
			mov r1, #0x523B
			mov r2, #0x5A3B
			b sc_out
sc_0x523C:
			mov r1, #0x523C
			mov r2, #0x5A3C
			b sc_out
sc_0x523D:
			mov r1, #0x523D
			mov r2, #0x5A3D
			b sc_out
sc_0x523E:
			mov r1, #0x523E
			mov r2, #0x5A3E
			b sc_out
sc_0x523F:
			mov r1, #0x523F
			mov r2, #0x5A3F
			b sc_out
sc_0x5320:
			mov r1, #0x5320
			mov r2, #0x5A20
			b sc_out
sc_0x5321:
			mov r1, #0x5321
			mov r2, #0x5A21
			b sc_out
sc_0x5322:
			mov r1, #0x5322
			mov r2, #0x5A22
			b sc_out
sc_0x5323:
			mov r1, #0x5323
			mov r2, #0x5A23
			b sc_out
sc_0x5324:
			mov r1, #0x5324
			mov r2, #0x5A24
			b sc_out
sc_0x5325:
			mov r1, #0x5325
			mov r2, #0x5A25
			b sc_out
sc_0x5326:
			mov r1, #0x5326
			mov r2, #0x5A26
			b sc_out
sc_0x5327:
			mov r1, #0x5327
			mov r2, #0x5A27
			b sc_out
sc_0x5328:
			mov r1, #0x5328
			mov r2, #0x5A28
			b sc_out
sc_0x5329:
			mov r1, #0x5329
			mov r2, #0x5A29
			b sc_out
sc_0x532A:
			mov r1, #0x532A
			mov r2, #0x5A2A
			b sc_out
sc_0x532B:
			mov r1, #0x532B
			mov r2, #0x5A2B
			b sc_out
sc_0x532C:
			mov r1, #0x532C
			mov r2, #0x5A2C
			b sc_out
sc_0x532D:
			mov r1, #0x532D
			mov r2, #0x5A2D
			b sc_out
sc_0x532E:
			mov r1, #0x532E
			mov r2, #0x5A2E
			b sc_out
sc_0x532F:
			mov r1, #0x532F
			mov r2, #0x5A2F
			b sc_out
sc_0x5330:
			mov r1, #0x5330
			mov r2, #0x5A30
			b sc_out
sc_0x5331:
			mov r1, #0x5331
			mov r2, #0x5A31
			b sc_out
sc_0x5332:
			mov r1, #0x5332
			mov r2, #0x5A32
			b sc_out
sc_0x5333:
			mov r1, #0x5333
			mov r2, #0x5A33
			b sc_out
sc_0x5334:
			mov r1, #0x5334
			mov r2, #0x5A34
			b sc_out
sc_0x5335:
			mov r1, #0x5335
			mov r2, #0x5A35
			b sc_out
sc_0x5336:
			mov r1, #0x5336
			mov r2, #0x5A36
			b sc_out
sc_0x5337:
			mov r1, #0x5337
			mov r2, #0x5A37
			b sc_out
sc_0x5338:
			mov r1, #0x5338
			mov r2, #0x5A38
			b sc_out
sc_0x5339:
			mov r1, #0x5339
			mov r2, #0x5A39
			b sc_out
sc_0x533A:
			mov r1, #0x533A
			mov r2, #0x5A3A
			b sc_out
sc_0x533B:
			mov r1, #0x533B
			mov r2, #0x5A3B
			b sc_out
sc_0x533C:
			mov r1, #0x533C
			mov r2, #0x5A3C
			b sc_out
sc_0x533D:
			mov r1, #0x533D
			mov r2, #0x5A3D
			b sc_out
sc_0x533E:
			mov r1, #0x533E
			mov r2, #0x5A3E
			b sc_out
sc_0x533F:
			mov r1, #0x533F
			mov r2, #0x5A3F
			b sc_out
sc_0x5420:
			mov r1, #0x5420
			mov r2, #0x5A20
			b sc_out
sc_0x5421:
			mov r1, #0x5421
			mov r2, #0x5A21
			b sc_out
sc_0x5422:
			mov r1, #0x5422
			mov r2, #0x5A22
			b sc_out
sc_0x5423:
			mov r1, #0x5423
			mov r2, #0x5A23
			b sc_out
sc_0x5424:
			mov r1, #0x5424
			mov r2, #0x5A24
			b sc_out
sc_0x5425:
			mov r1, #0x5425
			mov r2, #0x5A25
			b sc_out
sc_0x5426:
			mov r1, #0x5426
			mov r2, #0x5A26
			b sc_out
sc_0x5427:
			mov r1, #0x5427
			mov r2, #0x5A27
			b sc_out
sc_0x5428:
			mov r1, #0x5428
			mov r2, #0x5A28
			b sc_out
sc_0x5429:
			mov r1, #0x5429
			mov r2, #0x5A29
			b sc_out
sc_0x542A:
			mov r1, #0x542A
			mov r2, #0x5A2A
			b sc_out
sc_0x542B:
			mov r1, #0x542B
			mov r2, #0x5A2B
			b sc_out
sc_0x542C:
			mov r1, #0x542C
			mov r2, #0x5A2C
			b sc_out
sc_0x542D:
			mov r1, #0x542D
			mov r2, #0x5A2D
			b sc_out
sc_0x542E:
			mov r1, #0x542E
			mov r2, #0x5A2E
			b sc_out
sc_0x542F:
			mov r1, #0x542F
			mov r2, #0x5A2F
			b sc_out
sc_0x5430:
			mov r1, #0x5430
			mov r2, #0x5A30
			b sc_out
sc_0x5431:
			mov r1, #0x5431
			mov r2, #0x5A31
			b sc_out
sc_0x5432:
			mov r1, #0x5432
			mov r2, #0x5A32
			b sc_out
sc_0x5433:
			mov r1, #0x5433
			mov r2, #0x5A33
			b sc_out
sc_0x5434:
			mov r1, #0x5434
			mov r2, #0x5A34
			b sc_out
sc_0x5435:
			mov r1, #0x5435
			mov r2, #0x5A35
			b sc_out
sc_0x5436:
			mov r1, #0x5436
			mov r2, #0x5A36
			b sc_out
sc_0x5437:
			mov r1, #0x5437
			mov r2, #0x5A37
			b sc_out
sc_0x5438:
			mov r1, #0x5438
			mov r2, #0x5A38
			b sc_out
sc_0x5439:
			mov r1, #0x5439
			mov r2, #0x5A39
			b sc_out
sc_0x543A:
			mov r1, #0x543A
			mov r2, #0x5A3A
			b sc_out
sc_0x543B:
			mov r1, #0x543B
			mov r2, #0x5A3B
			b sc_out
sc_0x543C:
			mov r1, #0x543C
			mov r2, #0x5A3C
			b sc_out
sc_0x543D:
			mov r1, #0x543D
			mov r2, #0x5A3D
			b sc_out
sc_0x543E:
			mov r1, #0x543E
			mov r2, #0x5A3E
			b sc_out
sc_0x543F:
			mov r1, #0x543F
			mov r2, #0x5A3F
			b sc_out
sc_0x5520:
			mov r1, #0x5520
			mov r2, #0x5A20
			b sc_out
sc_0x5521:
			mov r1, #0x5521
			mov r2, #0x5A21
			b sc_out
sc_0x5522:
			mov r1, #0x5522
			mov r2, #0x5A22
			b sc_out
sc_0x5523:
			mov r1, #0x5523
			mov r2, #0x5A23
			b sc_out
sc_0x5524:
			mov r1, #0x5524
			mov r2, #0x5A24
			b sc_out
sc_0x5525:
			mov r1, #0x5525
			mov r2, #0x5A25
			b sc_out
sc_0x5526:
			mov r1, #0x5526
			mov r2, #0x5A26
			b sc_out
sc_0x5527:
			mov r1, #0x5527
			mov r2, #0x5A27
			b sc_out
sc_0x5528:
			mov r1, #0x5528
			mov r2, #0x5A28
			b sc_out
sc_0x5529:
			mov r1, #0x5529
			mov r2, #0x5A29
			b sc_out
sc_0x552A:
			mov r1, #0x552A
			mov r2, #0x5A2A
			b sc_out
sc_0x552B:
			mov r1, #0x552B
			mov r2, #0x5A2B
			b sc_out
sc_0x552C:
			mov r1, #0x552C
			mov r2, #0x5A2C
			b sc_out
sc_0x552D:
			mov r1, #0x552D
			mov r2, #0x5A2D
			b sc_out
sc_0x552E:
			mov r1, #0x552E
			mov r2, #0x5A2E
			b sc_out
sc_0x552F:
			mov r1, #0x552F
			mov r2, #0x5A2F
			b sc_out
sc_0x5530:
			mov r1, #0x5530
			mov r2, #0x5A30
			b sc_out
sc_0x5531:
			mov r1, #0x5531
			mov r2, #0x5A31
			b sc_out
sc_0x5532:
			mov r1, #0x5532
			mov r2, #0x5A32
			b sc_out
sc_0x5533:
			mov r1, #0x5533
			mov r2, #0x5A33
			b sc_out
sc_0x5534:
			mov r1, #0x5534
			mov r2, #0x5A34
			b sc_out
sc_0x5535:
			mov r1, #0x5535
			mov r2, #0x5A35
			b sc_out
sc_0x5536:
			mov r1, #0x5536
			mov r2, #0x5A36
			b sc_out
sc_0x5537:
			mov r1, #0x5537
			mov r2, #0x5A37
			b sc_out
sc_0x5538:
			mov r1, #0x5538
			mov r2, #0x5A38
			b sc_out
sc_0x5539:
			mov r1, #0x5539
			mov r2, #0x5A39
			b sc_out
sc_0x553A:
			mov r1, #0x553A
			mov r2, #0x5A3A
			b sc_out
sc_0x553B:
			mov r1, #0x553B
			mov r2, #0x5A3B
			b sc_out
sc_0x553C:
			mov r1, #0x553C
			mov r2, #0x5A3C
			b sc_out
sc_0x553D:
			mov r1, #0x553D
			mov r2, #0x5A3D
			b sc_out
sc_0x553E:
			mov r1, #0x553E
			mov r2, #0x5A3E
			b sc_out
sc_0x553F:
			mov r1, #0x553F
			mov r2, #0x5A3F
			b sc_out
sc_0x5620:
			mov r1, #0x5620
			mov r2, #0x5A20
			b sc_out
sc_0x5621:
			mov r1, #0x5621
			mov r2, #0x5A21
			b sc_out
sc_0x5622:
			mov r1, #0x5622
			mov r2, #0x5A22
			b sc_out
sc_0x5623:
			mov r1, #0x5623
			mov r2, #0x5A23
			b sc_out
sc_0x5624:
			mov r1, #0x5624
			mov r2, #0x5A24
			b sc_out
sc_0x5625:
			mov r1, #0x5625
			mov r2, #0x5A25
			b sc_out
sc_0x5626:
			mov r1, #0x5626
			mov r2, #0x5A26
			b sc_out
sc_0x5627:
			mov r1, #0x5627
			mov r2, #0x5A27
			b sc_out
sc_0x5628:
			mov r1, #0x5628
			mov r2, #0x5A28
			b sc_out
sc_0x5629:
			mov r1, #0x5629
			mov r2, #0x5A29
			b sc_out
sc_0x562A:
			mov r1, #0x562A
			mov r2, #0x5A2A
			b sc_out
sc_0x562B:
			mov r1, #0x562B
			mov r2, #0x5A2B
			b sc_out
sc_0x562C:
			mov r1, #0x562C
			mov r2, #0x5A2C
			b sc_out
sc_0x562D:
			mov r1, #0x562D
			mov r2, #0x5A2D
			b sc_out
sc_0x562E:
			mov r1, #0x562E
			mov r2, #0x5A2E
			b sc_out
sc_0x562F:
			mov r1, #0x562F
			mov r2, #0x5A2F
			b sc_out
sc_0x5630:
			mov r1, #0x5630
			mov r2, #0x5A30
			b sc_out
sc_0x5631:
			mov r1, #0x5631
			mov r2, #0x5A31
			b sc_out
sc_0x5632:
			mov r1, #0x5632
			mov r2, #0x5A32
			b sc_out
sc_0x5633:
			mov r1, #0x5633
			mov r2, #0x5A33
			b sc_out
sc_0x5634:
			mov r1, #0x5634
			mov r2, #0x5A34
			b sc_out
sc_0x5635:
			mov r1, #0x5635
			mov r2, #0x5A35
			b sc_out
sc_0x5636:
			mov r1, #0x5636
			mov r2, #0x5A36
			b sc_out
sc_0x5637:
			mov r1, #0x5637
			mov r2, #0x5A37
			b sc_out
sc_0x5638:
			mov r1, #0x5638
			mov r2, #0x5A38
			b sc_out
sc_0x5639:
			mov r1, #0x5639
			mov r2, #0x5A39
			b sc_out
sc_0x563A:
			mov r1, #0x563A
			mov r2, #0x5A3A
			b sc_out
sc_0x563B:
			mov r1, #0x563B
			mov r2, #0x5A3B
			b sc_out
sc_0x563C:
			mov r1, #0x563C
			mov r2, #0x5A3C
			b sc_out
sc_0x563D:
			mov r1, #0x563D
			mov r2, #0x5A3D
			b sc_out
sc_0x563E:
			mov r1, #0x563E
			mov r2, #0x5A3E
			b sc_out
sc_0x563F:
			mov r1, #0x563F
			mov r2, #0x5A3F
			b sc_out
sc_0x5720:
			mov r1, #0x5720
			mov r2, #0x5A20
			b sc_out
sc_0x5721:
			mov r1, #0x5721
			mov r2, #0x5A21
			b sc_out
sc_0x5722:
			mov r1, #0x5722
			mov r2, #0x5A22
			b sc_out
sc_0x5723:
			mov r1, #0x5723
			mov r2, #0x5A23
			b sc_out
sc_0x5724:
			mov r1, #0x5724
			mov r2, #0x5A24
			b sc_out
sc_0x5725:
			mov r1, #0x5725
			mov r2, #0x5A25
			b sc_out
sc_0x5726:
			mov r1, #0x5726
			mov r2, #0x5A26
			b sc_out
sc_0x5727:
			mov r1, #0x5727
			mov r2, #0x5A27
			b sc_out
sc_0x5728:
			mov r1, #0x5728
			mov r2, #0x5A28
			b sc_out
sc_0x5729:
			mov r1, #0x5729
			mov r2, #0x5A29
			b sc_out
sc_0x572A:
			mov r1, #0x572A
			mov r2, #0x5A2A
			b sc_out
sc_0x572B:
			mov r1, #0x572B
			mov r2, #0x5A2B
			b sc_out
sc_0x572C:
			mov r1, #0x572C
			mov r2, #0x5A2C
			b sc_out
sc_0x572D:
			mov r1, #0x572D
			mov r2, #0x5A2D
			b sc_out
sc_0x572E:
			mov r1, #0x572E
			mov r2, #0x5A2E
			b sc_out
sc_0x572F:
			mov r1, #0x572F
			mov r2, #0x5A2F
			b sc_out
sc_0x5730:
			mov r1, #0x5730
			mov r2, #0x5A30
			b sc_out
sc_0x5731:
			mov r1, #0x5731
			mov r2, #0x5A31
			b sc_out
sc_0x5732:
			mov r1, #0x5732
			mov r2, #0x5A32
			b sc_out
sc_0x5733:
			mov r1, #0x5733
			mov r2, #0x5A33
			b sc_out
sc_0x5734:
			mov r1, #0x5734
			mov r2, #0x5A34
			b sc_out
sc_0x5735:
			mov r1, #0x5735
			mov r2, #0x5A35
			b sc_out
sc_0x5736:
			mov r1, #0x5736
			mov r2, #0x5A36
			b sc_out
sc_0x5737:
			mov r1, #0x5737
			mov r2, #0x5A37
			b sc_out
sc_0x5738:
			mov r1, #0x5738
			mov r2, #0x5A38
			b sc_out
sc_0x5739:
			mov r1, #0x5739
			mov r2, #0x5A39
			b sc_out
sc_0x573A:
			mov r1, #0x573A
			mov r2, #0x5A3A
			b sc_out
sc_0x573B:
			mov r1, #0x573B
			mov r2, #0x5A3B
			b sc_out
sc_0x573C:
			mov r1, #0x573C
			mov r2, #0x5A3C
			b sc_out
sc_0x573D:
			mov r1, #0x573D
			mov r2, #0x5A3D
			b sc_out
sc_0x573E:
			mov r1, #0x573E
			mov r2, #0x5A3E
			b sc_out
sc_0x573F:
			mov r1, #0x573F
			mov r2, #0x5A3F
			b sc_out
sc_0x5040:
			mov r1, #0x5040
			mov r2, #0x5A40
			b sc_out
sc_0x5041:
			mov r1, #0x5041
			mov r2, #0x5A41
			b sc_out
sc_0x5042:
			mov r1, #0x5042
			mov r2, #0x5A42
			b sc_out
sc_0x5043:
			mov r1, #0x5043
			mov r2, #0x5A43
			b sc_out
sc_0x5044:
			mov r1, #0x5044
			mov r2, #0x5A44
			b sc_out
sc_0x5045:
			mov r1, #0x5045
			mov r2, #0x5A45
			b sc_out
sc_0x5046:
			mov r1, #0x5046
			mov r2, #0x5A46
			b sc_out
sc_0x5047:
			mov r1, #0x5047
			mov r2, #0x5A47
			b sc_out
sc_0x5048:
			mov r1, #0x5048
			mov r2, #0x5A48
			b sc_out
sc_0x5049:
			mov r1, #0x5049
			mov r2, #0x5A49
			b sc_out
sc_0x504A:
			mov r1, #0x504A
			mov r2, #0x5A4A
			b sc_out
sc_0x504B:
			mov r1, #0x504B
			mov r2, #0x5A4B
			b sc_out
sc_0x504C:
			mov r1, #0x504C
			mov r2, #0x5A4C
			b sc_out
sc_0x504D:
			mov r1, #0x504D
			mov r2, #0x5A4D
			b sc_out
sc_0x504E:
			mov r1, #0x504E
			mov r2, #0x5A4E
			b sc_out
sc_0x504F:
			mov r1, #0x504F
			mov r2, #0x5A4F
			b sc_out
sc_0x5050:
			mov r1, #0x5050
			mov r2, #0x5A50
			b sc_out
sc_0x5051:
			mov r1, #0x5051
			mov r2, #0x5A51
			b sc_out
sc_0x5052:
			mov r1, #0x5052
			mov r2, #0x5A52
			b sc_out
sc_0x5053:
			mov r1, #0x5053
			mov r2, #0x5A53
			b sc_out
sc_0x5054:
			mov r1, #0x5054
			mov r2, #0x5A54
			b sc_out
sc_0x5055:
			mov r1, #0x5055
			mov r2, #0x5A55
			b sc_out
sc_0x5056:
			mov r1, #0x5056
			mov r2, #0x5A56
			b sc_out
sc_0x5057:
			mov r1, #0x5057
			mov r2, #0x5A57
			b sc_out
sc_0x5058:
			mov r1, #0x5058
			mov r2, #0x5A58
			b sc_out
sc_0x5059:
			mov r1, #0x5059
			mov r2, #0x5A59
			b sc_out
sc_0x505A:
			mov r1, #0x505A
			mov r2, #0x5A5A
			b sc_out
sc_0x505B:
			mov r1, #0x505B
			mov r2, #0x5A5B
			b sc_out
sc_0x505C:
			mov r1, #0x505C
			mov r2, #0x5A5C
			b sc_out
sc_0x505D:
			mov r1, #0x505D
			mov r2, #0x5A5D
			b sc_out
sc_0x505E:
			mov r1, #0x505E
			mov r2, #0x5A5E
			b sc_out
sc_0x505F:
			mov r1, #0x505F
			mov r2, #0x5A5F
			b sc_out
sc_0x5140:
			mov r1, #0x5140
			mov r2, #0x5A40
			b sc_out
sc_0x5141:
			mov r1, #0x5141
			mov r2, #0x5A41
			b sc_out
sc_0x5142:
			mov r1, #0x5142
			mov r2, #0x5A42
			b sc_out
sc_0x5143:
			mov r1, #0x5143
			mov r2, #0x5A43
			b sc_out
sc_0x5144:
			mov r1, #0x5144
			mov r2, #0x5A44
			b sc_out
sc_0x5145:
			mov r1, #0x5145
			mov r2, #0x5A45
			b sc_out
sc_0x5146:
			mov r1, #0x5146
			mov r2, #0x5A46
			b sc_out
sc_0x5147:
			mov r1, #0x5147
			mov r2, #0x5A47
			b sc_out
sc_0x5148:
			mov r1, #0x5148
			mov r2, #0x5A48
			b sc_out
sc_0x5149:
			mov r1, #0x5149
			mov r2, #0x5A49
			b sc_out
sc_0x514A:
			mov r1, #0x514A
			mov r2, #0x5A4A
			b sc_out
sc_0x514B:
			mov r1, #0x514B
			mov r2, #0x5A4B
			b sc_out
sc_0x514C:
			mov r1, #0x514C
			mov r2, #0x5A4C
			b sc_out
sc_0x514D:
			mov r1, #0x514D
			mov r2, #0x5A4D
			b sc_out
sc_0x514E:
			mov r1, #0x514E
			mov r2, #0x5A4E
			b sc_out
sc_0x514F:
			mov r1, #0x514F
			mov r2, #0x5A4F
			b sc_out
sc_0x5150:
			mov r1, #0x5150
			mov r2, #0x5A50
			b sc_out
sc_0x5151:
			mov r1, #0x5151
			mov r2, #0x5A51
			b sc_out
sc_0x5152:
			mov r1, #0x5152
			mov r2, #0x5A52
			b sc_out
sc_0x5153:
			mov r1, #0x5153
			mov r2, #0x5A53
			b sc_out
sc_0x5154:
			mov r1, #0x5154
			mov r2, #0x5A54
			b sc_out
sc_0x5155:
			mov r1, #0x5155
			mov r2, #0x5A55
			b sc_out
sc_0x5156:
			mov r1, #0x5156
			mov r2, #0x5A56
			b sc_out
sc_0x5157:
			mov r1, #0x5157
			mov r2, #0x5A57
			b sc_out
sc_0x5158:
			mov r1, #0x5158
			mov r2, #0x5A58
			b sc_out
sc_0x5159:
			mov r1, #0x5159
			mov r2, #0x5A59
			b sc_out
sc_0x515A:
			mov r1, #0x515A
			mov r2, #0x5A5A
			b sc_out
sc_0x515B:
			mov r1, #0x515B
			mov r2, #0x5A5B
			b sc_out
sc_0x515C:
			mov r1, #0x515C
			mov r2, #0x5A5C
			b sc_out
sc_0x515D:
			mov r1, #0x515D
			mov r2, #0x5A5D
			b sc_out
sc_0x515E:
			mov r1, #0x515E
			mov r2, #0x5A5E
			b sc_out
sc_0x515F:
			mov r1, #0x515F
			mov r2, #0x5A5F
			b sc_out
sc_0x5240:
			mov r1, #0x5240
			mov r2, #0x5A40
			b sc_out
sc_0x5241:
			mov r1, #0x5241
			mov r2, #0x5A41
			b sc_out
sc_0x5242:
			mov r1, #0x5242
			mov r2, #0x5A42
			b sc_out
sc_0x5243:
			mov r1, #0x5243
			mov r2, #0x5A43
			b sc_out
sc_0x5244:
			mov r1, #0x5244
			mov r2, #0x5A44
			b sc_out
sc_0x5245:
			mov r1, #0x5245
			mov r2, #0x5A45
			b sc_out
sc_0x5246:
			mov r1, #0x5246
			mov r2, #0x5A46
			b sc_out
sc_0x5247:
			mov r1, #0x5247
			mov r2, #0x5A47
			b sc_out
sc_0x5248:
			mov r1, #0x5248
			mov r2, #0x5A48
			b sc_out
sc_0x5249:
			mov r1, #0x5249
			mov r2, #0x5A49
			b sc_out
sc_0x524A:
			mov r1, #0x524A
			mov r2, #0x5A4A
			b sc_out
sc_0x524B:
			mov r1, #0x524B
			mov r2, #0x5A4B
			b sc_out
sc_0x524C:
			mov r1, #0x524C
			mov r2, #0x5A4C
			b sc_out
sc_0x524D:
			mov r1, #0x524D
			mov r2, #0x5A4D
			b sc_out
sc_0x524E:
			mov r1, #0x524E
			mov r2, #0x5A4E
			b sc_out
sc_0x524F:
			mov r1, #0x524F
			mov r2, #0x5A4F
			b sc_out
sc_0x5250:
			mov r1, #0x5250
			mov r2, #0x5A50
			b sc_out
sc_0x5251:
			mov r1, #0x5251
			mov r2, #0x5A51
			b sc_out
sc_0x5252:
			mov r1, #0x5252
			mov r2, #0x5A52
			b sc_out
sc_0x5253:
			mov r1, #0x5253
			mov r2, #0x5A53
			b sc_out
sc_0x5254:
			mov r1, #0x5254
			mov r2, #0x5A54
			b sc_out
sc_0x5255:
			mov r1, #0x5255
			mov r2, #0x5A55
			b sc_out
sc_0x5256:
			mov r1, #0x5256
			mov r2, #0x5A56
			b sc_out
sc_0x5257:
			mov r1, #0x5257
			mov r2, #0x5A57
			b sc_out
sc_0x5258:
			mov r1, #0x5258
			mov r2, #0x5A58
			b sc_out
sc_0x5259:
			mov r1, #0x5259
			mov r2, #0x5A59
			b sc_out
sc_0x525A:
			mov r1, #0x525A
			mov r2, #0x5A5A
			b sc_out
sc_0x525B:
			mov r1, #0x525B
			mov r2, #0x5A5B
			b sc_out
sc_0x525C:
			mov r1, #0x525C
			mov r2, #0x5A5C
			b sc_out
sc_0x525D:
			mov r1, #0x525D
			mov r2, #0x5A5D
			b sc_out
sc_0x525E:
			mov r1, #0x525E
			mov r2, #0x5A5E
			b sc_out
sc_0x525F:
			mov r1, #0x525F
			mov r2, #0x5A5F
			b sc_out
sc_0x5340:
			mov r1, #0x5340
			mov r2, #0x5A40
			b sc_out
sc_0x5341:
			mov r1, #0x5341
			mov r2, #0x5A41
			b sc_out
sc_0x5342:
			mov r1, #0x5342
			mov r2, #0x5A42
			b sc_out
sc_0x5343:
			mov r1, #0x5343
			mov r2, #0x5A43
			b sc_out
sc_0x5344:
			mov r1, #0x5344
			mov r2, #0x5A44
			b sc_out
sc_0x5345:
			mov r1, #0x5345
			mov r2, #0x5A45
			b sc_out
sc_0x5346:
			mov r1, #0x5346
			mov r2, #0x5A46
			b sc_out
sc_0x5347:
			mov r1, #0x5347
			mov r2, #0x5A47
			b sc_out
sc_0x5348:
			mov r1, #0x5348
			mov r2, #0x5A48
			b sc_out
sc_0x5349:
			mov r1, #0x5349
			mov r2, #0x5A49
			b sc_out
sc_0x534A:
			mov r1, #0x534A
			mov r2, #0x5A4A
			b sc_out
sc_0x534B:
			mov r1, #0x534B
			mov r2, #0x5A4B
			b sc_out
sc_0x534C:
			mov r1, #0x534C
			mov r2, #0x5A4C
			b sc_out
sc_0x534D:
			mov r1, #0x534D
			mov r2, #0x5A4D
			b sc_out
sc_0x534E:
			mov r1, #0x534E
			mov r2, #0x5A4E
			b sc_out
sc_0x534F:
			mov r1, #0x534F
			mov r2, #0x5A4F
			b sc_out
sc_0x5350:
			mov r1, #0x5350
			mov r2, #0x5A50
			b sc_out
sc_0x5351:
			mov r1, #0x5351
			mov r2, #0x5A51
			b sc_out
sc_0x5352:
			mov r1, #0x5352
			mov r2, #0x5A52
			b sc_out
sc_0x5353:
			mov r1, #0x5353
			mov r2, #0x5A53
			b sc_out
sc_0x5354:
			mov r1, #0x5354
			mov r2, #0x5A54
			b sc_out
sc_0x5355:
			mov r1, #0x5355
			mov r2, #0x5A55
			b sc_out
sc_0x5356:
			mov r1, #0x5356
			mov r2, #0x5A56
			b sc_out
sc_0x5357:
			mov r1, #0x5357
			mov r2, #0x5A57
			b sc_out
sc_0x5358:
			mov r1, #0x5358
			mov r2, #0x5A58
			b sc_out
sc_0x5359:
			mov r1, #0x5359
			mov r2, #0x5A59
			b sc_out
sc_0x535A:
			mov r1, #0x535A
			mov r2, #0x5A5A
			b sc_out
sc_0x535B:
			mov r1, #0x535B
			mov r2, #0x5A5B
			b sc_out
sc_0x535C:
			mov r1, #0x535C
			mov r2, #0x5A5C
			b sc_out
sc_0x535D:
			mov r1, #0x535D
			mov r2, #0x5A5D
			b sc_out
sc_0x535E:
			mov r1, #0x535E
			mov r2, #0x5A5E
			b sc_out
sc_0x535F:
			mov r1, #0x535F
			mov r2, #0x5A5F
			b sc_out
sc_0x5440:
			mov r1, #0x5440
			mov r2, #0x5A40
			b sc_out
sc_0x5441:
			mov r1, #0x5441
			mov r2, #0x5A41
			b sc_out
sc_0x5442:
			mov r1, #0x5442
			mov r2, #0x5A42
			b sc_out
sc_0x5443:
			mov r1, #0x5443
			mov r2, #0x5A43
			b sc_out
sc_0x5444:
			mov r1, #0x5444
			mov r2, #0x5A44
			b sc_out
sc_0x5445:
			mov r1, #0x5445
			mov r2, #0x5A45
			b sc_out
sc_0x5446:
			mov r1, #0x5446
			mov r2, #0x5A46
			b sc_out
sc_0x5447:
			mov r1, #0x5447
			mov r2, #0x5A47
			b sc_out
sc_0x5448:
			mov r1, #0x5448
			mov r2, #0x5A48
			b sc_out
sc_0x5449:
			mov r1, #0x5449
			mov r2, #0x5A49
			b sc_out
sc_0x544A:
			mov r1, #0x544A
			mov r2, #0x5A4A
			b sc_out
sc_0x544B:
			mov r1, #0x544B
			mov r2, #0x5A4B
			b sc_out
sc_0x544C:
			mov r1, #0x544C
			mov r2, #0x5A4C
			b sc_out
sc_0x544D:
			mov r1, #0x544D
			mov r2, #0x5A4D
			b sc_out
sc_0x544E:
			mov r1, #0x544E
			mov r2, #0x5A4E
			b sc_out
sc_0x544F:
			mov r1, #0x544F
			mov r2, #0x5A4F
			b sc_out
sc_0x5450:
			mov r1, #0x5450
			mov r2, #0x5A50
			b sc_out
sc_0x5451:
			mov r1, #0x5451
			mov r2, #0x5A51
			b sc_out
sc_0x5452:
			mov r1, #0x5452
			mov r2, #0x5A52
			b sc_out
sc_0x5453:
			mov r1, #0x5453
			mov r2, #0x5A53
			b sc_out
sc_0x5454:
			mov r1, #0x5454
			mov r2, #0x5A54
			b sc_out
sc_0x5455:
			mov r1, #0x5455
			mov r2, #0x5A55
			b sc_out
sc_0x5456:
			mov r1, #0x5456
			mov r2, #0x5A56
			b sc_out
sc_0x5457:
			mov r1, #0x5457
			mov r2, #0x5A57
			b sc_out
sc_0x5458:
			mov r1, #0x5458
			mov r2, #0x5A58
			b sc_out
sc_0x5459:
			mov r1, #0x5459
			mov r2, #0x5A59
			b sc_out
sc_0x545A:
			mov r1, #0x545A
			mov r2, #0x5A5A
			b sc_out
sc_0x545B:
			mov r1, #0x545B
			mov r2, #0x5A5B
			b sc_out
sc_0x545C:
			mov r1, #0x545C
			mov r2, #0x5A5C
			b sc_out
sc_0x545D:
			mov r1, #0x545D
			mov r2, #0x5A5D
			b sc_out
sc_0x545E:
			mov r1, #0x545E
			mov r2, #0x5A5E
			b sc_out
sc_0x545F:
			mov r1, #0x545F
			mov r2, #0x5A5F
			b sc_out
sc_0x5540:
			mov r1, #0x5540
			mov r2, #0x5A40
			b sc_out
sc_0x5541:
			mov r1, #0x5541
			mov r2, #0x5A41
			b sc_out
sc_0x5542:
			mov r1, #0x5542
			mov r2, #0x5A42
			b sc_out
sc_0x5543:
			mov r1, #0x5543
			mov r2, #0x5A43
			b sc_out
sc_0x5544:
			mov r1, #0x5544
			mov r2, #0x5A44
			b sc_out
sc_0x5545:
			mov r1, #0x5545
			mov r2, #0x5A45
			b sc_out
sc_0x5546:
			mov r1, #0x5546
			mov r2, #0x5A46
			b sc_out
sc_0x5547:
			mov r1, #0x5547
			mov r2, #0x5A47
			b sc_out
sc_0x5548:
			mov r1, #0x5548
			mov r2, #0x5A48
			b sc_out
sc_0x5549:
			mov r1, #0x5549
			mov r2, #0x5A49
			b sc_out
sc_0x554A:
			mov r1, #0x554A
			mov r2, #0x5A4A
			b sc_out
sc_0x554B:
			mov r1, #0x554B
			mov r2, #0x5A4B
			b sc_out
sc_0x554C:
			mov r1, #0x554C
			mov r2, #0x5A4C
			b sc_out
sc_0x554D:
			mov r1, #0x554D
			mov r2, #0x5A4D
			b sc_out
sc_0x554E:
			mov r1, #0x554E
			mov r2, #0x5A4E
			b sc_out
sc_0x554F:
			mov r1, #0x554F
			mov r2, #0x5A4F
			b sc_out
sc_0x5550:
			mov r1, #0x5550
			mov r2, #0x5A50
			b sc_out
sc_0x5551:
			mov r1, #0x5551
			mov r2, #0x5A51
			b sc_out
sc_0x5552:
			mov r1, #0x5552
			mov r2, #0x5A52
			b sc_out
sc_0x5553:
			mov r1, #0x5553
			mov r2, #0x5A53
			b sc_out
sc_0x5554:
			mov r1, #0x5554
			mov r2, #0x5A54
			b sc_out
sc_0x5555:
			mov r1, #0x5555
			mov r2, #0x5A55
			b sc_out
sc_0x5556:
			mov r1, #0x5556
			mov r2, #0x5A56
			b sc_out
sc_0x5557:
			mov r1, #0x5557
			mov r2, #0x5A57
			b sc_out
sc_0x5558:
			mov r1, #0x5558
			mov r2, #0x5A58
			b sc_out
sc_0x5559:
			mov r1, #0x5559
			mov r2, #0x5A59
			b sc_out
sc_0x555A:
			mov r1, #0x555A
			mov r2, #0x5A5A
			b sc_out
sc_0x555B:
			mov r1, #0x555B
			mov r2, #0x5A5B
			b sc_out
sc_0x555C:
			mov r1, #0x555C
			mov r2, #0x5A5C
			b sc_out
sc_0x555D:
			mov r1, #0x555D
			mov r2, #0x5A5D
			b sc_out
sc_0x555E:
			mov r1, #0x555E
			mov r2, #0x5A5E
			b sc_out
sc_0x555F:
			mov r1, #0x555F
			mov r2, #0x5A5F
			b sc_out
sc_0x5640:
			mov r1, #0x5640
			mov r2, #0x5A40
			b sc_out
sc_0x5641:
			mov r1, #0x5641
			mov r2, #0x5A41
			b sc_out
sc_0x5642:
			mov r1, #0x5642
			mov r2, #0x5A42
			b sc_out
sc_0x5643:
			mov r1, #0x5643
			mov r2, #0x5A43
			b sc_out
sc_0x5644:
			mov r1, #0x5644
			mov r2, #0x5A44
			b sc_out
sc_0x5645:
			mov r1, #0x5645
			mov r2, #0x5A45
			b sc_out
sc_0x5646:
			mov r1, #0x5646
			mov r2, #0x5A46
			b sc_out
sc_0x5647:
			mov r1, #0x5647
			mov r2, #0x5A47
			b sc_out
sc_0x5648:
			mov r1, #0x5648
			mov r2, #0x5A48
			b sc_out
sc_0x5649:
			mov r1, #0x5649
			mov r2, #0x5A49
			b sc_out
sc_0x564A:
			mov r1, #0x564A
			mov r2, #0x5A4A
			b sc_out
sc_0x564B:
			mov r1, #0x564B
			mov r2, #0x5A4B
			b sc_out
sc_0x564C:
			mov r1, #0x564C
			mov r2, #0x5A4C
			b sc_out
sc_0x564D:
			mov r1, #0x564D
			mov r2, #0x5A4D
			b sc_out
sc_0x564E:
			mov r1, #0x564E
			mov r2, #0x5A4E
			b sc_out
sc_0x564F:
			mov r1, #0x564F
			mov r2, #0x5A4F
			b sc_out
sc_0x5650:
			mov r1, #0x5650
			mov r2, #0x5A50
			b sc_out
sc_0x5651:
			mov r1, #0x5651
			mov r2, #0x5A51
			b sc_out
sc_0x5652:
			mov r1, #0x5652
			mov r2, #0x5A52
			b sc_out
sc_0x5653:
			mov r1, #0x5653
			mov r2, #0x5A53
			b sc_out
sc_0x5654:
			mov r1, #0x5654
			mov r2, #0x5A54
			b sc_out
sc_0x5655:
			mov r1, #0x5655
			mov r2, #0x5A55
			b sc_out
sc_0x5656:
			mov r1, #0x5656
			mov r2, #0x5A56
			b sc_out
sc_0x5657:
			mov r1, #0x5657
			mov r2, #0x5A57
			b sc_out
sc_0x5658:
			mov r1, #0x5658
			mov r2, #0x5A58
			b sc_out
sc_0x5659:
			mov r1, #0x5659
			mov r2, #0x5A59
			b sc_out
sc_0x565A:
			mov r1, #0x565A
			mov r2, #0x5A5A
			b sc_out
sc_0x565B:
			mov r1, #0x565B
			mov r2, #0x5A5B
			b sc_out
sc_0x565C:
			mov r1, #0x565C
			mov r2, #0x5A5C
			b sc_out
sc_0x565D:
			mov r1, #0x565D
			mov r2, #0x5A5D
			b sc_out
sc_0x565E:
			mov r1, #0x565E
			mov r2, #0x5A5E
			b sc_out
sc_0x565F:
			mov r1, #0x565F
			mov r2, #0x5A5F
			b sc_out
sc_0x5740:
			mov r1, #0x5740
			mov r2, #0x5A40
			b sc_out
sc_0x5741:
			mov r1, #0x5741
			mov r2, #0x5A41
			b sc_out
sc_0x5742:
			mov r1, #0x5742
			mov r2, #0x5A42
			b sc_out
sc_0x5743:
			mov r1, #0x5743
			mov r2, #0x5A43
			b sc_out
sc_0x5744:
			mov r1, #0x5744
			mov r2, #0x5A44
			b sc_out
sc_0x5745:
			mov r1, #0x5745
			mov r2, #0x5A45
			b sc_out
sc_0x5746:
			mov r1, #0x5746
			mov r2, #0x5A46
			b sc_out
sc_0x5747:
			mov r1, #0x5747
			mov r2, #0x5A47
			b sc_out
sc_0x5748:
			mov r1, #0x5748
			mov r2, #0x5A48
			b sc_out
sc_0x5749:
			mov r1, #0x5749
			mov r2, #0x5A49
			b sc_out
sc_0x574A:
			mov r1, #0x574A
			mov r2, #0x5A4A
			b sc_out
sc_0x574B:
			mov r1, #0x574B
			mov r2, #0x5A4B
			b sc_out
sc_0x574C:
			mov r1, #0x574C
			mov r2, #0x5A4C
			b sc_out
sc_0x574D:
			mov r1, #0x574D
			mov r2, #0x5A4D
			b sc_out
sc_0x574E:
			mov r1, #0x574E
			mov r2, #0x5A4E
			b sc_out
sc_0x574F:
			mov r1, #0x574F
			mov r2, #0x5A4F
			b sc_out
sc_0x5750:
			mov r1, #0x5750
			mov r2, #0x5A50
			b sc_out
sc_0x5751:
			mov r1, #0x5751
			mov r2, #0x5A51
			b sc_out
sc_0x5752:
			mov r1, #0x5752
			mov r2, #0x5A52
			b sc_out
sc_0x5753:
			mov r1, #0x5753
			mov r2, #0x5A53
			b sc_out
sc_0x5754:
			mov r1, #0x5754
			mov r2, #0x5A54
			b sc_out
sc_0x5755:
			mov r1, #0x5755
			mov r2, #0x5A55
			b sc_out
sc_0x5756:
			mov r1, #0x5756
			mov r2, #0x5A56
			b sc_out
sc_0x5757:
			mov r1, #0x5757
			mov r2, #0x5A57
			b sc_out
sc_0x5758:
			mov r1, #0x5758
			mov r2, #0x5A58
			b sc_out
sc_0x5759:
			mov r1, #0x5759
			mov r2, #0x5A59
			b sc_out
sc_0x575A:
			mov r1, #0x575A
			mov r2, #0x5A5A
			b sc_out
sc_0x575B:
			mov r1, #0x575B
			mov r2, #0x5A5B
			b sc_out
sc_0x575C:
			mov r1, #0x575C
			mov r2, #0x5A5C
			b sc_out
sc_0x575D:
			mov r1, #0x575D
			mov r2, #0x5A5D
			b sc_out
sc_0x575E:
			mov r1, #0x575E
			mov r2, #0x5A5E
			b sc_out
sc_0x575F:
			mov r1, #0x575F
			mov r2, #0x5A5F
			b sc_out
sc_0x5060:
			mov r1, #0x5060
			mov r2, #0x5A60
			b sc_out
sc_0x5061:
			mov r1, #0x5061
			mov r2, #0x5A61
			b sc_out
sc_0x5062:
			mov r1, #0x5062
			mov r2, #0x5A62
			b sc_out
sc_0x5063:
			mov r1, #0x5063
			mov r2, #0x5A63
			b sc_out
sc_0x5064:
			mov r1, #0x5064
			mov r2, #0x5A64
			b sc_out
sc_0x5065:
			mov r1, #0x5065
			mov r2, #0x5A65
			b sc_out
sc_0x5066:
			mov r1, #0x5066
			mov r2, #0x5A66
			b sc_out
sc_0x5067:
			mov r1, #0x5067
			mov r2, #0x5A67
			b sc_out
sc_0x5068:
			mov r1, #0x5068
			mov r2, #0x5A68
			b sc_out
sc_0x5069:
			mov r1, #0x5069
			mov r2, #0x5A69
			b sc_out
sc_0x506A:
			mov r1, #0x506A
			mov r2, #0x5A6A
			b sc_out
sc_0x506B:
			mov r1, #0x506B
			mov r2, #0x5A6B
			b sc_out
sc_0x506C:
			mov r1, #0x506C
			mov r2, #0x5A6C
			b sc_out
sc_0x506D:
			mov r1, #0x506D
			mov r2, #0x5A6D
			b sc_out
sc_0x506E:
			mov r1, #0x506E
			mov r2, #0x5A6E
			b sc_out
sc_0x506F:
			mov r1, #0x506F
			mov r2, #0x5A6F
			b sc_out
sc_0x5070:
			mov r1, #0x5070
			mov r2, #0x5A70
			b sc_out
sc_0x5071:
			mov r1, #0x5071
			mov r2, #0x5A71
			b sc_out
sc_0x5072:
			mov r1, #0x5072
			mov r2, #0x5A72
			b sc_out
sc_0x5073:
			mov r1, #0x5073
			mov r2, #0x5A73
			b sc_out
sc_0x5074:
			mov r1, #0x5074
			mov r2, #0x5A74
			b sc_out
sc_0x5075:
			mov r1, #0x5075
			mov r2, #0x5A75
			b sc_out
sc_0x5076:
			mov r1, #0x5076
			mov r2, #0x5A76
			b sc_out
sc_0x5077:
			mov r1, #0x5077
			mov r2, #0x5A77
			b sc_out
sc_0x5078:
			mov r1, #0x5078
			mov r2, #0x5A78
			b sc_out
sc_0x5079:
			mov r1, #0x5079
			mov r2, #0x5A79
			b sc_out
sc_0x507A:
			mov r1, #0x507A
			mov r2, #0x5A7A
			b sc_out
sc_0x507B:
			mov r1, #0x507B
			mov r2, #0x5A7B
			b sc_out
sc_0x507C:
			mov r1, #0x507C
			mov r2, #0x5A7C
			b sc_out
sc_0x507D:
			mov r1, #0x507D
			mov r2, #0x5A7D
			b sc_out
sc_0x507E:
			mov r1, #0x507E
			mov r2, #0x5A7E
			b sc_out
sc_0x507F:
			mov r1, #0x507F
			mov r2, #0x5A7F
			b sc_out
sc_0x5160:
			mov r1, #0x5160
			mov r2, #0x5A60
			b sc_out
sc_0x5161:
			mov r1, #0x5161
			mov r2, #0x5A61
			b sc_out
sc_0x5162:
			mov r1, #0x5162
			mov r2, #0x5A62
			b sc_out
sc_0x5163:
			mov r1, #0x5163
			mov r2, #0x5A63
			b sc_out
sc_0x5164:
			mov r1, #0x5164
			mov r2, #0x5A64
			b sc_out
sc_0x5165:
			mov r1, #0x5165
			mov r2, #0x5A65
			b sc_out
sc_0x5166:
			mov r1, #0x5166
			mov r2, #0x5A66
			b sc_out
sc_0x5167:
			mov r1, #0x5167
			mov r2, #0x5A67
			b sc_out
sc_0x5168:
			mov r1, #0x5168
			mov r2, #0x5A68
			b sc_out
sc_0x5169:
			mov r1, #0x5169
			mov r2, #0x5A69
			b sc_out
sc_0x516A:
			mov r1, #0x516A
			mov r2, #0x5A6A
			b sc_out
sc_0x516B:
			mov r1, #0x516B
			mov r2, #0x5A6B
			b sc_out
sc_0x516C:
			mov r1, #0x516C
			mov r2, #0x5A6C
			b sc_out
sc_0x516D:
			mov r1, #0x516D
			mov r2, #0x5A6D
			b sc_out
sc_0x516E:
			mov r1, #0x516E
			mov r2, #0x5A6E
			b sc_out
sc_0x516F:
			mov r1, #0x516F
			mov r2, #0x5A6F
			b sc_out
sc_0x5170:
			mov r1, #0x5170
			mov r2, #0x5A70
			b sc_out
sc_0x5171:
			mov r1, #0x5171
			mov r2, #0x5A71
			b sc_out
sc_0x5172:
			mov r1, #0x5172
			mov r2, #0x5A72
			b sc_out
sc_0x5173:
			mov r1, #0x5173
			mov r2, #0x5A73
			b sc_out
sc_0x5174:
			mov r1, #0x5174
			mov r2, #0x5A74
			b sc_out
sc_0x5175:
			mov r1, #0x5175
			mov r2, #0x5A75
			b sc_out
sc_0x5176:
			mov r1, #0x5176
			mov r2, #0x5A76
			b sc_out
sc_0x5177:
			mov r1, #0x5177
			mov r2, #0x5A77
			b sc_out
sc_0x5178:
			mov r1, #0x5178
			mov r2, #0x5A78
			b sc_out
sc_0x5179:
			mov r1, #0x5179
			mov r2, #0x5A79
			b sc_out
sc_0x517A:
			mov r1, #0x517A
			mov r2, #0x5A7A
			b sc_out
sc_0x517B:
			mov r1, #0x517B
			mov r2, #0x5A7B
			b sc_out
sc_0x517C:
			mov r1, #0x517C
			mov r2, #0x5A7C
			b sc_out
sc_0x517D:
			mov r1, #0x517D
			mov r2, #0x5A7D
			b sc_out
sc_0x517E:
			mov r1, #0x517E
			mov r2, #0x5A7E
			b sc_out
sc_0x517F:
			mov r1, #0x517F
			mov r2, #0x5A7F
			b sc_out
sc_0x5260:
			mov r1, #0x5260
			mov r2, #0x5A60
			b sc_out
sc_0x5261:
			mov r1, #0x5261
			mov r2, #0x5A61
			b sc_out
sc_0x5262:
			mov r1, #0x5262
			mov r2, #0x5A62
			b sc_out
sc_0x5263:
			mov r1, #0x5263
			mov r2, #0x5A63
			b sc_out
sc_0x5264:
			mov r1, #0x5264
			mov r2, #0x5A64
			b sc_out
sc_0x5265:
			mov r1, #0x5265
			mov r2, #0x5A65
			b sc_out
sc_0x5266:
			mov r1, #0x5266
			mov r2, #0x5A66
			b sc_out
sc_0x5267:
			mov r1, #0x5267
			mov r2, #0x5A67
			b sc_out
sc_0x5268:
			mov r1, #0x5268
			mov r2, #0x5A68
			b sc_out
sc_0x5269:
			mov r1, #0x5269
			mov r2, #0x5A69
			b sc_out
sc_0x526A:
			mov r1, #0x526A
			mov r2, #0x5A6A
			b sc_out
sc_0x526B:
			mov r1, #0x526B
			mov r2, #0x5A6B
			b sc_out
sc_0x526C:
			mov r1, #0x526C
			mov r2, #0x5A6C
			b sc_out
sc_0x526D:
			mov r1, #0x526D
			mov r2, #0x5A6D
			b sc_out
sc_0x526E:
			mov r1, #0x526E
			mov r2, #0x5A6E
			b sc_out
sc_0x526F:
			mov r1, #0x526F
			mov r2, #0x5A6F
			b sc_out
sc_0x5270:
			mov r1, #0x5270
			mov r2, #0x5A70
			b sc_out
sc_0x5271:
			mov r1, #0x5271
			mov r2, #0x5A71
			b sc_out
sc_0x5272:
			mov r1, #0x5272
			mov r2, #0x5A72
			b sc_out
sc_0x5273:
			mov r1, #0x5273
			mov r2, #0x5A73
			b sc_out
sc_0x5274:
			mov r1, #0x5274
			mov r2, #0x5A74
			b sc_out
sc_0x5275:
			mov r1, #0x5275
			mov r2, #0x5A75
			b sc_out
sc_0x5276:
			mov r1, #0x5276
			mov r2, #0x5A76
			b sc_out
sc_0x5277:
			mov r1, #0x5277
			mov r2, #0x5A77
			b sc_out
sc_0x5278:
			mov r1, #0x5278
			mov r2, #0x5A78
			b sc_out
sc_0x5279:
			mov r1, #0x5279
			mov r2, #0x5A79
			b sc_out
sc_0x527A:
			mov r1, #0x527A
			mov r2, #0x5A7A
			b sc_out
sc_0x527B:
			mov r1, #0x527B
			mov r2, #0x5A7B
			b sc_out
sc_0x527C:
			mov r1, #0x527C
			mov r2, #0x5A7C
			b sc_out
sc_0x527D:
			mov r1, #0x527D
			mov r2, #0x5A7D
			b sc_out
sc_0x527E:
			mov r1, #0x527E
			mov r2, #0x5A7E
			b sc_out
sc_0x527F:
			mov r1, #0x527F
			mov r2, #0x5A7F
			b sc_out
sc_0x5360:
			mov r1, #0x5360
			mov r2, #0x5A60
			b sc_out
sc_0x5361:
			mov r1, #0x5361
			mov r2, #0x5A61
			b sc_out
sc_0x5362:
			mov r1, #0x5362
			mov r2, #0x5A62
			b sc_out
sc_0x5363:
			mov r1, #0x5363
			mov r2, #0x5A63
			b sc_out
sc_0x5364:
			mov r1, #0x5364
			mov r2, #0x5A64
			b sc_out
sc_0x5365:
			mov r1, #0x5365
			mov r2, #0x5A65
			b sc_out
sc_0x5366:
			mov r1, #0x5366
			mov r2, #0x5A66
			b sc_out
sc_0x5367:
			mov r1, #0x5367
			mov r2, #0x5A67
			b sc_out
sc_0x5368:
			mov r1, #0x5368
			mov r2, #0x5A68
			b sc_out
sc_0x5369:
			mov r1, #0x5369
			mov r2, #0x5A69
			b sc_out
sc_0x536A:
			mov r1, #0x536A
			mov r2, #0x5A6A
			b sc_out
sc_0x536B:
			mov r1, #0x536B
			mov r2, #0x5A6B
			b sc_out
sc_0x536C:
			mov r1, #0x536C
			mov r2, #0x5A6C
			b sc_out
sc_0x536D:
			mov r1, #0x536D
			mov r2, #0x5A6D
			b sc_out
sc_0x536E:
			mov r1, #0x536E
			mov r2, #0x5A6E
			b sc_out
sc_0x536F:
			mov r1, #0x536F
			mov r2, #0x5A6F
			b sc_out
sc_0x5370:
			mov r1, #0x5370
			mov r2, #0x5A70
			b sc_out
sc_0x5371:
			mov r1, #0x5371
			mov r2, #0x5A71
			b sc_out
sc_0x5372:
			mov r1, #0x5372
			mov r2, #0x5A72
			b sc_out
sc_0x5373:
			mov r1, #0x5373
			mov r2, #0x5A73
			b sc_out
sc_0x5374:
			mov r1, #0x5374
			mov r2, #0x5A74
			b sc_out
sc_0x5375:
			mov r1, #0x5375
			mov r2, #0x5A75
			b sc_out
sc_0x5376:
			mov r1, #0x5376
			mov r2, #0x5A76
			b sc_out
sc_0x5377:
			mov r1, #0x5377
			mov r2, #0x5A77
			b sc_out
sc_0x5378:
			mov r1, #0x5378
			mov r2, #0x5A78
			b sc_out
sc_0x5379:
			mov r1, #0x5379
			mov r2, #0x5A79
			b sc_out
sc_0x537A:
			mov r1, #0x537A
			mov r2, #0x5A7A
			b sc_out
sc_0x537B:
			mov r1, #0x537B
			mov r2, #0x5A7B
			b sc_out
sc_0x537C:
			mov r1, #0x537C
			mov r2, #0x5A7C
			b sc_out
sc_0x537D:
			mov r1, #0x537D
			mov r2, #0x5A7D
			b sc_out
sc_0x537E:
			mov r1, #0x537E
			mov r2, #0x5A7E
			b sc_out
sc_0x537F:
			mov r1, #0x537F
			mov r2, #0x5A7F
			b sc_out
sc_0x5460:
			mov r1, #0x5460
			mov r2, #0x5A60
			b sc_out
sc_0x5461:
			mov r1, #0x5461
			mov r2, #0x5A61
			b sc_out
sc_0x5462:
			mov r1, #0x5462
			mov r2, #0x5A62
			b sc_out
sc_0x5463:
			mov r1, #0x5463
			mov r2, #0x5A63
			b sc_out
sc_0x5464:
			mov r1, #0x5464
			mov r2, #0x5A64
			b sc_out
sc_0x5465:
			mov r1, #0x5465
			mov r2, #0x5A65
			b sc_out
sc_0x5466:
			mov r1, #0x5466
			mov r2, #0x5A66
			b sc_out
sc_0x5467:
			mov r1, #0x5467
			mov r2, #0x5A67
			b sc_out
sc_0x5468:
			mov r1, #0x5468
			mov r2, #0x5A68
			b sc_out
sc_0x5469:
			mov r1, #0x5469
			mov r2, #0x5A69
			b sc_out
sc_0x546A:
			mov r1, #0x546A
			mov r2, #0x5A6A
			b sc_out
sc_0x546B:
			mov r1, #0x546B
			mov r2, #0x5A6B
			b sc_out
sc_0x546C:
			mov r1, #0x546C
			mov r2, #0x5A6C
			b sc_out
sc_0x546D:
			mov r1, #0x546D
			mov r2, #0x5A6D
			b sc_out
sc_0x546E:
			mov r1, #0x546E
			mov r2, #0x5A6E
			b sc_out
sc_0x546F:
			mov r1, #0x546F
			mov r2, #0x5A6F
			b sc_out
sc_0x5470:
			mov r1, #0x5470
			mov r2, #0x5A70
			b sc_out
sc_0x5471:
			mov r1, #0x5471
			mov r2, #0x5A71
			b sc_out
sc_0x5472:
			mov r1, #0x5472
			mov r2, #0x5A72
			b sc_out
sc_0x5473:
			mov r1, #0x5473
			mov r2, #0x5A73
			b sc_out
sc_0x5474:
			mov r1, #0x5474
			mov r2, #0x5A74
			b sc_out
sc_0x5475:
			mov r1, #0x5475
			mov r2, #0x5A75
			b sc_out
sc_0x5476:
			mov r1, #0x5476
			mov r2, #0x5A76
			b sc_out
sc_0x5477:
			mov r1, #0x5477
			mov r2, #0x5A77
			b sc_out
sc_0x5478:
			mov r1, #0x5478
			mov r2, #0x5A78
			b sc_out
sc_0x5479:
			mov r1, #0x5479
			mov r2, #0x5A79
			b sc_out
sc_0x547A:
			mov r1, #0x547A
			mov r2, #0x5A7A
			b sc_out
sc_0x547B:
			mov r1, #0x547B
			mov r2, #0x5A7B
			b sc_out
sc_0x547C:
			mov r1, #0x547C
			mov r2, #0x5A7C
			b sc_out
sc_0x547D:
			mov r1, #0x547D
			mov r2, #0x5A7D
			b sc_out
sc_0x547E:
			mov r1, #0x547E
			mov r2, #0x5A7E
			b sc_out
sc_0x547F:
			mov r1, #0x547F
			mov r2, #0x5A7F
			b sc_out
sc_0x5560:
			mov r1, #0x5560
			mov r2, #0x5A60
			b sc_out
sc_0x5561:
			mov r1, #0x5561
			mov r2, #0x5A61
			b sc_out
sc_0x5562:
			mov r1, #0x5562
			mov r2, #0x5A62
			b sc_out
sc_0x5563:
			mov r1, #0x5563
			mov r2, #0x5A63
			b sc_out
sc_0x5564:
			mov r1, #0x5564
			mov r2, #0x5A64
			b sc_out
sc_0x5565:
			mov r1, #0x5565
			mov r2, #0x5A65
			b sc_out
sc_0x5566:
			mov r1, #0x5566
			mov r2, #0x5A66
			b sc_out
sc_0x5567:
			mov r1, #0x5567
			mov r2, #0x5A67
			b sc_out
sc_0x5568:
			mov r1, #0x5568
			mov r2, #0x5A68
			b sc_out
sc_0x5569:
			mov r1, #0x5569
			mov r2, #0x5A69
			b sc_out
sc_0x556A:
			mov r1, #0x556A
			mov r2, #0x5A6A
			b sc_out
sc_0x556B:
			mov r1, #0x556B
			mov r2, #0x5A6B
			b sc_out
sc_0x556C:
			mov r1, #0x556C
			mov r2, #0x5A6C
			b sc_out
sc_0x556D:
			mov r1, #0x556D
			mov r2, #0x5A6D
			b sc_out
sc_0x556E:
			mov r1, #0x556E
			mov r2, #0x5A6E
			b sc_out
sc_0x556F:
			mov r1, #0x556F
			mov r2, #0x5A6F
			b sc_out
sc_0x5570:
			mov r1, #0x5570
			mov r2, #0x5A70
			b sc_out
sc_0x5571:
			mov r1, #0x5571
			mov r2, #0x5A71
			b sc_out
sc_0x5572:
			mov r1, #0x5572
			mov r2, #0x5A72
			b sc_out
sc_0x5573:
			mov r1, #0x5573
			mov r2, #0x5A73
			b sc_out
sc_0x5574:
			mov r1, #0x5574
			mov r2, #0x5A74
			b sc_out
sc_0x5575:
			mov r1, #0x5575
			mov r2, #0x5A75
			b sc_out
sc_0x5576:
			mov r1, #0x5576
			mov r2, #0x5A76
			b sc_out
sc_0x5577:
			mov r1, #0x5577
			mov r2, #0x5A77
			b sc_out
sc_0x5578:
			mov r1, #0x5578
			mov r2, #0x5A78
			b sc_out
sc_0x5579:
			mov r1, #0x5579
			mov r2, #0x5A79
			b sc_out
sc_0x557A:
			mov r1, #0x557A
			mov r2, #0x5A7A
			b sc_out
sc_0x557B:
			mov r1, #0x557B
			mov r2, #0x5A7B
			b sc_out
sc_0x557C:
			mov r1, #0x557C
			mov r2, #0x5A7C
			b sc_out
sc_0x557D:
			mov r1, #0x557D
			mov r2, #0x5A7D
			b sc_out
sc_0x557E:
			mov r1, #0x557E
			mov r2, #0x5A7E
			b sc_out
sc_0x557F:
			mov r1, #0x557F
			mov r2, #0x5A7F
			b sc_out
sc_0x5660:
			mov r1, #0x5660
			mov r2, #0x5A60
			b sc_out
sc_0x5661:
			mov r1, #0x5661
			mov r2, #0x5A61
			b sc_out
sc_0x5662:
			mov r1, #0x5662
			mov r2, #0x5A62
			b sc_out
sc_0x5663:
			mov r1, #0x5663
			mov r2, #0x5A63
			b sc_out
sc_0x5664:
			mov r1, #0x5664
			mov r2, #0x5A64
			b sc_out
sc_0x5665:
			mov r1, #0x5665
			mov r2, #0x5A65
			b sc_out
sc_0x5666:
			mov r1, #0x5666
			mov r2, #0x5A66
			b sc_out
sc_0x5667:
			mov r1, #0x5667
			mov r2, #0x5A67
			b sc_out
sc_0x5668:
			mov r1, #0x5668
			mov r2, #0x5A68
			b sc_out
sc_0x5669:
			mov r1, #0x5669
			mov r2, #0x5A69
			b sc_out
sc_0x566A:
			mov r1, #0x566A
			mov r2, #0x5A6A
			b sc_out
sc_0x566B:
			mov r1, #0x566B
			mov r2, #0x5A6B
			b sc_out
sc_0x566C:
			mov r1, #0x566C
			mov r2, #0x5A6C
			b sc_out
sc_0x566D:
			mov r1, #0x566D
			mov r2, #0x5A6D
			b sc_out
sc_0x566E:
			mov r1, #0x566E
			mov r2, #0x5A6E
			b sc_out
sc_0x566F:
			mov r1, #0x566F
			mov r2, #0x5A6F
			b sc_out
sc_0x5670:
			mov r1, #0x5670
			mov r2, #0x5A70
			b sc_out
sc_0x5671:
			mov r1, #0x5671
			mov r2, #0x5A71
			b sc_out
sc_0x5672:
			mov r1, #0x5672
			mov r2, #0x5A72
			b sc_out
sc_0x5673:
			mov r1, #0x5673
			mov r2, #0x5A73
			b sc_out
sc_0x5674:
			mov r1, #0x5674
			mov r2, #0x5A74
			b sc_out
sc_0x5675:
			mov r1, #0x5675
			mov r2, #0x5A75
			b sc_out
sc_0x5676:
			mov r1, #0x5676
			mov r2, #0x5A76
			b sc_out
sc_0x5677:
			mov r1, #0x5677
			mov r2, #0x5A77
			b sc_out
sc_0x5678:
			mov r1, #0x5678
			mov r2, #0x5A78
			b sc_out
sc_0x5679:
			mov r1, #0x5679
			mov r2, #0x5A79
			b sc_out
sc_0x567A:
			mov r1, #0x567A
			mov r2, #0x5A7A
			b sc_out
sc_0x567B:
			mov r1, #0x567B
			mov r2, #0x5A7B
			b sc_out
sc_0x567C:
			mov r1, #0x567C
			mov r2, #0x5A7C
			b sc_out
sc_0x567D:
			mov r1, #0x567D
			mov r2, #0x5A7D
			b sc_out
sc_0x567E:
			mov r1, #0x567E
			mov r2, #0x5A7E
			b sc_out
sc_0x567F:
			mov r1, #0x567F
			mov r2, #0x5A7F
			b sc_out
sc_0x5760:
			mov r1, #0x5760
			mov r2, #0x5A60
			b sc_out
sc_0x5761:
			mov r1, #0x5761
			mov r2, #0x5A61
			b sc_out
sc_0x5762:
			mov r1, #0x5762
			mov r2, #0x5A62
			b sc_out
sc_0x5763:
			mov r1, #0x5763
			mov r2, #0x5A63
			b sc_out
sc_0x5764:
			mov r1, #0x5764
			mov r2, #0x5A64
			b sc_out
sc_0x5765:
			mov r1, #0x5765
			mov r2, #0x5A65
			b sc_out
sc_0x5766:
			mov r1, #0x5766
			mov r2, #0x5A66
			b sc_out
sc_0x5767:
			mov r1, #0x5767
			mov r2, #0x5A67
			b sc_out
sc_0x5768:
			mov r1, #0x5768
			mov r2, #0x5A68
			b sc_out
sc_0x5769:
			mov r1, #0x5769
			mov r2, #0x5A69
			b sc_out
sc_0x576A:
			mov r1, #0x576A
			mov r2, #0x5A6A
			b sc_out
sc_0x576B:
			mov r1, #0x576B
			mov r2, #0x5A6B
			b sc_out
sc_0x576C:
			mov r1, #0x576C
			mov r2, #0x5A6C
			b sc_out
sc_0x576D:
			mov r1, #0x576D
			mov r2, #0x5A6D
			b sc_out
sc_0x576E:
			mov r1, #0x576E
			mov r2, #0x5A6E
			b sc_out
sc_0x576F:
			mov r1, #0x576F
			mov r2, #0x5A6F
			b sc_out
sc_0x5770:
			mov r1, #0x5770
			mov r2, #0x5A70
			b sc_out
sc_0x5771:
			mov r1, #0x5771
			mov r2, #0x5A71
			b sc_out
sc_0x5772:
			mov r1, #0x5772
			mov r2, #0x5A72
			b sc_out
sc_0x5773:
			mov r1, #0x5773
			mov r2, #0x5A73
			b sc_out
sc_0x5774:
			mov r1, #0x5774
			mov r2, #0x5A74
			b sc_out
sc_0x5775:
			mov r1, #0x5775
			mov r2, #0x5A75
			b sc_out
sc_0x5776:
			mov r1, #0x5776
			mov r2, #0x5A76
			b sc_out
sc_0x5777:
			mov r1, #0x5777
			mov r2, #0x5A77
			b sc_out
sc_0x5778:
			mov r1, #0x5778
			mov r2, #0x5A78
			b sc_out
sc_0x5779:
			mov r1, #0x5779
			mov r2, #0x5A79
			b sc_out
sc_0x577A:
			mov r1, #0x577A
			mov r2, #0x5A7A
			b sc_out
sc_0x577B:
			mov r1, #0x577B
			mov r2, #0x5A7B
			b sc_out
sc_0x577C:
			mov r1, #0x577C
			mov r2, #0x5A7C
			b sc_out
sc_0x577D:
			mov r1, #0x577D
			mov r2, #0x5A7D
			b sc_out
sc_0x577E:
			mov r1, #0x577E
			mov r2, #0x5A7E
			b sc_out
sc_0x577F:
			mov r1, #0x577F
			mov r2, #0x5A7F
			b sc_out
sc_0x5080:
			mov r1, #0x5080
			mov r2, #0x5A80
			b sc_out
sc_0x5081:
			mov r1, #0x5081
			mov r2, #0x5A81
			b sc_out
sc_0x5082:
			mov r1, #0x5082
			mov r2, #0x5A82
			b sc_out
sc_0x5083:
			mov r1, #0x5083
			mov r2, #0x5A83
			b sc_out
sc_0x5084:
			mov r1, #0x5084
			mov r2, #0x5A84
			b sc_out
sc_0x5085:
			mov r1, #0x5085
			mov r2, #0x5A85
			b sc_out
sc_0x5086:
			mov r1, #0x5086
			mov r2, #0x5A86
			b sc_out
sc_0x5087:
			mov r1, #0x5087
			mov r2, #0x5A87
			b sc_out
sc_0x5088:
			mov r1, #0x5088
			mov r2, #0x5A88
			b sc_out
sc_0x5089:
			mov r1, #0x5089
			mov r2, #0x5A89
			b sc_out
sc_0x508A:
			mov r1, #0x508A
			mov r2, #0x5A8A
			b sc_out
sc_0x508B:
			mov r1, #0x508B
			mov r2, #0x5A8B
			b sc_out
sc_0x508C:
			mov r1, #0x508C
			mov r2, #0x5A8C
			b sc_out
sc_0x508D:
			mov r1, #0x508D
			mov r2, #0x5A8D
			b sc_out
sc_0x508E:
			mov r1, #0x508E
			mov r2, #0x5A8E
			b sc_out
sc_0x508F:
			mov r1, #0x508F
			mov r2, #0x5A8F
			b sc_out
sc_0x5090:
			mov r1, #0x5090
			mov r2, #0x5A90
			b sc_out
sc_0x5091:
			mov r1, #0x5091
			mov r2, #0x5A91
			b sc_out
sc_0x5092:
			mov r1, #0x5092
			mov r2, #0x5A92
			b sc_out
sc_0x5093:
			mov r1, #0x5093
			mov r2, #0x5A93
			b sc_out
sc_0x5094:
			mov r1, #0x5094
			mov r2, #0x5A94
			b sc_out
sc_0x5095:
			mov r1, #0x5095
			mov r2, #0x5A95
			b sc_out
sc_0x5096:
			mov r1, #0x5096
			mov r2, #0x5A96
			b sc_out
sc_0x5097:
			mov r1, #0x5097
			mov r2, #0x5A97
			b sc_out
sc_0x5098:
			mov r1, #0x5098
			mov r2, #0x5A98
			b sc_out
sc_0x5099:
			mov r1, #0x5099
			mov r2, #0x5A99
			b sc_out
sc_0x509A:
			mov r1, #0x509A
			mov r2, #0x5A9A
			b sc_out
sc_0x509B:
			mov r1, #0x509B
			mov r2, #0x5A9B
			b sc_out
sc_0x509C:
			mov r1, #0x509C
			mov r2, #0x5A9C
			b sc_out
sc_0x509D:
			mov r1, #0x509D
			mov r2, #0x5A9D
			b sc_out
sc_0x509E:
			mov r1, #0x509E
			mov r2, #0x5A9E
			b sc_out
sc_0x509F:
			mov r1, #0x509F
			mov r2, #0x5A9F
			b sc_out
sc_0x5180:
			mov r1, #0x5180
			mov r2, #0x5A80
			b sc_out
sc_0x5181:
			mov r1, #0x5181
			mov r2, #0x5A81
			b sc_out
sc_0x5182:
			mov r1, #0x5182
			mov r2, #0x5A82
			b sc_out
sc_0x5183:
			mov r1, #0x5183
			mov r2, #0x5A83
			b sc_out
sc_0x5184:
			mov r1, #0x5184
			mov r2, #0x5A84
			b sc_out
sc_0x5185:
			mov r1, #0x5185
			mov r2, #0x5A85
			b sc_out
sc_0x5186:
			mov r1, #0x5186
			mov r2, #0x5A86
			b sc_out
sc_0x5187:
			mov r1, #0x5187
			mov r2, #0x5A87
			b sc_out
sc_0x5188:
			mov r1, #0x5188
			mov r2, #0x5A88
			b sc_out
sc_0x5189:
			mov r1, #0x5189
			mov r2, #0x5A89
			b sc_out
sc_0x518A:
			mov r1, #0x518A
			mov r2, #0x5A8A
			b sc_out
sc_0x518B:
			mov r1, #0x518B
			mov r2, #0x5A8B
			b sc_out
sc_0x518C:
			mov r1, #0x518C
			mov r2, #0x5A8C
			b sc_out
sc_0x518D:
			mov r1, #0x518D
			mov r2, #0x5A8D
			b sc_out
sc_0x518E:
			mov r1, #0x518E
			mov r2, #0x5A8E
			b sc_out
sc_0x518F:
			mov r1, #0x518F
			mov r2, #0x5A8F
			b sc_out
sc_0x5190:
			mov r1, #0x5190
			mov r2, #0x5A90
			b sc_out
sc_0x5191:
			mov r1, #0x5191
			mov r2, #0x5A91
			b sc_out
sc_0x5192:
			mov r1, #0x5192
			mov r2, #0x5A92
			b sc_out
sc_0x5193:
			mov r1, #0x5193
			mov r2, #0x5A93
			b sc_out
sc_0x5194:
			mov r1, #0x5194
			mov r2, #0x5A94
			b sc_out
sc_0x5195:
			mov r1, #0x5195
			mov r2, #0x5A95
			b sc_out
sc_0x5196:
			mov r1, #0x5196
			mov r2, #0x5A96
			b sc_out
sc_0x5197:
			mov r1, #0x5197
			mov r2, #0x5A97
			b sc_out
sc_0x5198:
			mov r1, #0x5198
			mov r2, #0x5A98
			b sc_out
sc_0x5199:
			mov r1, #0x5199
			mov r2, #0x5A99
			b sc_out
sc_0x519A:
			mov r1, #0x519A
			mov r2, #0x5A9A
			b sc_out
sc_0x519B:
			mov r1, #0x519B
			mov r2, #0x5A9B
			b sc_out
sc_0x519C:
			mov r1, #0x519C
			mov r2, #0x5A9C
			b sc_out
sc_0x519D:
			mov r1, #0x519D
			mov r2, #0x5A9D
			b sc_out
sc_0x519E:
			mov r1, #0x519E
			mov r2, #0x5A9E
			b sc_out
sc_0x519F:
			mov r1, #0x519F
			mov r2, #0x5A9F
			b sc_out
sc_0x5280:
			mov r1, #0x5280
			mov r2, #0x5A80
			b sc_out
sc_0x5281:
			mov r1, #0x5281
			mov r2, #0x5A81
			b sc_out
sc_0x5282:
			mov r1, #0x5282
			mov r2, #0x5A82
			b sc_out
sc_0x5283:
			mov r1, #0x5283
			mov r2, #0x5A83
			b sc_out
sc_0x5284:
			mov r1, #0x5284
			mov r2, #0x5A84
			b sc_out
sc_0x5285:
			mov r1, #0x5285
			mov r2, #0x5A85
			b sc_out
sc_0x5286:
			mov r1, #0x5286
			mov r2, #0x5A86
			b sc_out
sc_0x5287:
			mov r1, #0x5287
			mov r2, #0x5A87
			b sc_out
sc_0x5288:
			mov r1, #0x5288
			mov r2, #0x5A88
			b sc_out
sc_0x5289:
			mov r1, #0x5289
			mov r2, #0x5A89
			b sc_out
sc_0x528A:
			mov r1, #0x528A
			mov r2, #0x5A8A
			b sc_out
sc_0x528B:
			mov r1, #0x528B
			mov r2, #0x5A8B
			b sc_out
sc_0x528C:
			mov r1, #0x528C
			mov r2, #0x5A8C
			b sc_out
sc_0x528D:
			mov r1, #0x528D
			mov r2, #0x5A8D
			b sc_out
sc_0x528E:
			mov r1, #0x528E
			mov r2, #0x5A8E
			b sc_out
sc_0x528F:
			mov r1, #0x528F
			mov r2, #0x5A8F
			b sc_out
sc_0x5290:
			mov r1, #0x5290
			mov r2, #0x5A90
			b sc_out
sc_0x5291:
			mov r1, #0x5291
			mov r2, #0x5A91
			b sc_out
sc_0x5292:
			mov r1, #0x5292
			mov r2, #0x5A92
			b sc_out
sc_0x5293:
			mov r1, #0x5293
			mov r2, #0x5A93
			b sc_out
sc_0x5294:
			mov r1, #0x5294
			mov r2, #0x5A94
			b sc_out
sc_0x5295:
			mov r1, #0x5295
			mov r2, #0x5A95
			b sc_out
sc_0x5296:
			mov r1, #0x5296
			mov r2, #0x5A96
			b sc_out
sc_0x5297:
			mov r1, #0x5297
			mov r2, #0x5A97
			b sc_out
sc_0x5298:
			mov r1, #0x5298
			mov r2, #0x5A98
			b sc_out
sc_0x5299:
			mov r1, #0x5299
			mov r2, #0x5A99
			b sc_out
sc_0x529A:
			mov r1, #0x529A
			mov r2, #0x5A9A
			b sc_out
sc_0x529B:
			mov r1, #0x529B
			mov r2, #0x5A9B
			b sc_out
sc_0x529C:
			mov r1, #0x529C
			mov r2, #0x5A9C
			b sc_out
sc_0x529D:
			mov r1, #0x529D
			mov r2, #0x5A9D
			b sc_out
sc_0x529E:
			mov r1, #0x529E
			mov r2, #0x5A9E
			b sc_out
sc_0x529F:
			mov r1, #0x529F
			mov r2, #0x5A9F
			b sc_out
sc_0x5380:
			mov r1, #0x5380
			mov r2, #0x5A80
			b sc_out
sc_0x5381:
			mov r1, #0x5381
			mov r2, #0x5A81
			b sc_out
sc_0x5382:
			mov r1, #0x5382
			mov r2, #0x5A82
			b sc_out
sc_0x5383:
			mov r1, #0x5383
			mov r2, #0x5A83
			b sc_out
sc_0x5384:
			mov r1, #0x5384
			mov r2, #0x5A84
			b sc_out
sc_0x5385:
			mov r1, #0x5385
			mov r2, #0x5A85
			b sc_out
sc_0x5386:
			mov r1, #0x5386
			mov r2, #0x5A86
			b sc_out
sc_0x5387:
			mov r1, #0x5387
			mov r2, #0x5A87
			b sc_out
sc_0x5388:
			mov r1, #0x5388
			mov r2, #0x5A88
			b sc_out
sc_0x5389:
			mov r1, #0x5389
			mov r2, #0x5A89
			b sc_out
sc_0x538A:
			mov r1, #0x538A
			mov r2, #0x5A8A
			b sc_out
sc_0x538B:
			mov r1, #0x538B
			mov r2, #0x5A8B
			b sc_out
sc_0x538C:
			mov r1, #0x538C
			mov r2, #0x5A8C
			b sc_out
sc_0x538D:
			mov r1, #0x538D
			mov r2, #0x5A8D
			b sc_out
sc_0x538E:
			mov r1, #0x538E
			mov r2, #0x5A8E
			b sc_out
sc_0x538F:
			mov r1, #0x538F
			mov r2, #0x5A8F
			b sc_out
sc_0x5390:
			mov r1, #0x5390
			mov r2, #0x5A90
			b sc_out
sc_0x5391:
			mov r1, #0x5391
			mov r2, #0x5A91
			b sc_out
sc_0x5392:
			mov r1, #0x5392
			mov r2, #0x5A92
			b sc_out
sc_0x5393:
			mov r1, #0x5393
			mov r2, #0x5A93
			b sc_out
sc_0x5394:
			mov r1, #0x5394
			mov r2, #0x5A94
			b sc_out
sc_0x5395:
			mov r1, #0x5395
			mov r2, #0x5A95
			b sc_out
sc_0x5396:
			mov r1, #0x5396
			mov r2, #0x5A96
			b sc_out
sc_0x5397:
			mov r1, #0x5397
			mov r2, #0x5A97
			b sc_out
sc_0x5398:
			mov r1, #0x5398
			mov r2, #0x5A98
			b sc_out
sc_0x5399:
			mov r1, #0x5399
			mov r2, #0x5A99
			b sc_out
sc_0x539A:
			mov r1, #0x539A
			mov r2, #0x5A9A
			b sc_out
sc_0x539B:
			mov r1, #0x539B
			mov r2, #0x5A9B
			b sc_out
sc_0x539C:
			mov r1, #0x539C
			mov r2, #0x5A9C
			b sc_out
sc_0x539D:
			mov r1, #0x539D
			mov r2, #0x5A9D
			b sc_out
sc_0x539E:
			mov r1, #0x539E
			mov r2, #0x5A9E
			b sc_out
sc_0x539F:
			mov r1, #0x539F
			mov r2, #0x5A9F
			b sc_out
sc_0x5480:
			mov r1, #0x5480
			mov r2, #0x5A80
			b sc_out
sc_0x5481:
			mov r1, #0x5481
			mov r2, #0x5A81
			b sc_out
sc_0x5482:
			mov r1, #0x5482
			mov r2, #0x5A82
			b sc_out
sc_0x5483:
			mov r1, #0x5483
			mov r2, #0x5A83
			b sc_out
sc_0x5484:
			mov r1, #0x5484
			mov r2, #0x5A84
			b sc_out
sc_0x5485:
			mov r1, #0x5485
			mov r2, #0x5A85
			b sc_out
sc_0x5486:
			mov r1, #0x5486
			mov r2, #0x5A86
			b sc_out
sc_0x5487:
			mov r1, #0x5487
			mov r2, #0x5A87
			b sc_out
sc_0x5488:
			mov r1, #0x5488
			mov r2, #0x5A88
			b sc_out
sc_0x5489:
			mov r1, #0x5489
			mov r2, #0x5A89
			b sc_out
sc_0x548A:
			mov r1, #0x548A
			mov r2, #0x5A8A
			b sc_out
sc_0x548B:
			mov r1, #0x548B
			mov r2, #0x5A8B
			b sc_out
sc_0x548C:
			mov r1, #0x548C
			mov r2, #0x5A8C
			b sc_out
sc_0x548D:
			mov r1, #0x548D
			mov r2, #0x5A8D
			b sc_out
sc_0x548E:
			mov r1, #0x548E
			mov r2, #0x5A8E
			b sc_out
sc_0x548F:
			mov r1, #0x548F
			mov r2, #0x5A8F
			b sc_out
sc_0x5490:
			mov r1, #0x5490
			mov r2, #0x5A90
			b sc_out
sc_0x5491:
			mov r1, #0x5491
			mov r2, #0x5A91
			b sc_out
sc_0x5492:
			mov r1, #0x5492
			mov r2, #0x5A92
			b sc_out
sc_0x5493:
			mov r1, #0x5493
			mov r2, #0x5A93
			b sc_out
sc_0x5494:
			mov r1, #0x5494
			mov r2, #0x5A94
			b sc_out
sc_0x5495:
			mov r1, #0x5495
			mov r2, #0x5A95
			b sc_out
sc_0x5496:
			mov r1, #0x5496
			mov r2, #0x5A96
			b sc_out
sc_0x5497:
			mov r1, #0x5497
			mov r2, #0x5A97
			b sc_out
sc_0x5498:
			mov r1, #0x5498
			mov r2, #0x5A98
			b sc_out
sc_0x5499:
			mov r1, #0x5499
			mov r2, #0x5A99
			b sc_out
sc_0x549A:
			mov r1, #0x549A
			mov r2, #0x5A9A
			b sc_out
sc_0x549B:
			mov r1, #0x549B
			mov r2, #0x5A9B
			b sc_out
sc_0x549C:
			mov r1, #0x549C
			mov r2, #0x5A9C
			b sc_out
sc_0x549D:
			mov r1, #0x549D
			mov r2, #0x5A9D
			b sc_out
sc_0x549E:
			mov r1, #0x549E
			mov r2, #0x5A9E
			b sc_out
sc_0x549F:
			mov r1, #0x549F
			mov r2, #0x5A9F
			b sc_out
sc_0x5580:
			mov r1, #0x5580
			mov r2, #0x5A80
			b sc_out
sc_0x5581:
			mov r1, #0x5581
			mov r2, #0x5A81
			b sc_out
sc_0x5582:
			mov r1, #0x5582
			mov r2, #0x5A82
			b sc_out
sc_0x5583:
			mov r1, #0x5583
			mov r2, #0x5A83
			b sc_out
sc_0x5584:
			mov r1, #0x5584
			mov r2, #0x5A84
			b sc_out
sc_0x5585:
			mov r1, #0x5585
			mov r2, #0x5A85
			b sc_out
sc_0x5586:
			mov r1, #0x5586
			mov r2, #0x5A86
			b sc_out
sc_0x5587:
			mov r1, #0x5587
			mov r2, #0x5A87
			b sc_out
sc_0x5588:
			mov r1, #0x5588
			mov r2, #0x5A88
			b sc_out
sc_0x5589:
			mov r1, #0x5589
			mov r2, #0x5A89
			b sc_out
sc_0x558A:
			mov r1, #0x558A
			mov r2, #0x5A8A
			b sc_out
sc_0x558B:
			mov r1, #0x558B
			mov r2, #0x5A8B
			b sc_out
sc_0x558C:
			mov r1, #0x558C
			mov r2, #0x5A8C
			b sc_out
sc_0x558D:
			mov r1, #0x558D
			mov r2, #0x5A8D
			b sc_out
sc_0x558E:
			mov r1, #0x558E
			mov r2, #0x5A8E
			b sc_out
sc_0x558F:
			mov r1, #0x558F
			mov r2, #0x5A8F
			b sc_out
sc_0x5590:
			mov r1, #0x5590
			mov r2, #0x5A90
			b sc_out
sc_0x5591:
			mov r1, #0x5591
			mov r2, #0x5A91
			b sc_out
sc_0x5592:
			mov r1, #0x5592
			mov r2, #0x5A92
			b sc_out
sc_0x5593:
			mov r1, #0x5593
			mov r2, #0x5A93
			b sc_out
sc_0x5594:
			mov r1, #0x5594
			mov r2, #0x5A94
			b sc_out
sc_0x5595:
			mov r1, #0x5595
			mov r2, #0x5A95
			b sc_out
sc_0x5596:
			mov r1, #0x5596
			mov r2, #0x5A96
			b sc_out
sc_0x5597:
			mov r1, #0x5597
			mov r2, #0x5A97
			b sc_out
sc_0x5598:
			mov r1, #0x5598
			mov r2, #0x5A98
			b sc_out
sc_0x5599:
			mov r1, #0x5599
			mov r2, #0x5A99
			b sc_out
sc_0x559A:
			mov r1, #0x559A
			mov r2, #0x5A9A
			b sc_out
sc_0x559B:
			mov r1, #0x559B
			mov r2, #0x5A9B
			b sc_out
sc_0x559C:
			mov r1, #0x559C
			mov r2, #0x5A9C
			b sc_out
sc_0x559D:
			mov r1, #0x559D
			mov r2, #0x5A9D
			b sc_out
sc_0x559E:
			mov r1, #0x559E
			mov r2, #0x5A9E
			b sc_out
sc_0x559F:
			mov r1, #0x559F
			mov r2, #0x5A9F
			b sc_out
sc_0x5680:
			mov r1, #0x5680
			mov r2, #0x5A80
			b sc_out
sc_0x5681:
			mov r1, #0x5681
			mov r2, #0x5A81
			b sc_out
sc_0x5682:
			mov r1, #0x5682
			mov r2, #0x5A82
			b sc_out
sc_0x5683:
			mov r1, #0x5683
			mov r2, #0x5A83
			b sc_out
sc_0x5684:
			mov r1, #0x5684
			mov r2, #0x5A84
			b sc_out
sc_0x5685:
			mov r1, #0x5685
			mov r2, #0x5A85
			b sc_out
sc_0x5686:
			mov r1, #0x5686
			mov r2, #0x5A86
			b sc_out
sc_0x5687:
			mov r1, #0x5687
			mov r2, #0x5A87
			b sc_out
sc_0x5688:
			mov r1, #0x5688
			mov r2, #0x5A88
			b sc_out
sc_0x5689:
			mov r1, #0x5689
			mov r2, #0x5A89
			b sc_out
sc_0x568A:
			mov r1, #0x568A
			mov r2, #0x5A8A
			b sc_out
sc_0x568B:
			mov r1, #0x568B
			mov r2, #0x5A8B
			b sc_out
sc_0x568C:
			mov r1, #0x568C
			mov r2, #0x5A8C
			b sc_out
sc_0x568D:
			mov r1, #0x568D
			mov r2, #0x5A8D
			b sc_out
sc_0x568E:
			mov r1, #0x568E
			mov r2, #0x5A8E
			b sc_out
sc_0x568F:
			mov r1, #0x568F
			mov r2, #0x5A8F
			b sc_out
sc_0x5690:
			mov r1, #0x5690
			mov r2, #0x5A90
			b sc_out
sc_0x5691:
			mov r1, #0x5691
			mov r2, #0x5A91
			b sc_out
sc_0x5692:
			mov r1, #0x5692
			mov r2, #0x5A92
			b sc_out
sc_0x5693:
			mov r1, #0x5693
			mov r2, #0x5A93
			b sc_out
sc_0x5694:
			mov r1, #0x5694
			mov r2, #0x5A94
			b sc_out
sc_0x5695:
			mov r1, #0x5695
			mov r2, #0x5A95
			b sc_out
sc_0x5696:
			mov r1, #0x5696
			mov r2, #0x5A96
			b sc_out
sc_0x5697:
			mov r1, #0x5697
			mov r2, #0x5A97
			b sc_out
sc_0x5698:
			mov r1, #0x5698
			mov r2, #0x5A98
			b sc_out
sc_0x5699:
			mov r1, #0x5699
			mov r2, #0x5A99
			b sc_out
sc_0x569A:
			mov r1, #0x569A
			mov r2, #0x5A9A
			b sc_out
sc_0x569B:
			mov r1, #0x569B
			mov r2, #0x5A9B
			b sc_out
sc_0x569C:
			mov r1, #0x569C
			mov r2, #0x5A9C
			b sc_out
sc_0x569D:
			mov r1, #0x569D
			mov r2, #0x5A9D
			b sc_out
sc_0x569E:
			mov r1, #0x569E
			mov r2, #0x5A9E
			b sc_out
sc_0x569F:
			mov r1, #0x569F
			mov r2, #0x5A9F
			b sc_out
sc_0x5780:
			mov r1, #0x5780
			mov r2, #0x5A80
			b sc_out
sc_0x5781:
			mov r1, #0x5781
			mov r2, #0x5A81
			b sc_out
sc_0x5782:
			mov r1, #0x5782
			mov r2, #0x5A82
			b sc_out
sc_0x5783:
			mov r1, #0x5783
			mov r2, #0x5A83
			b sc_out
sc_0x5784:
			mov r1, #0x5784
			mov r2, #0x5A84
			b sc_out
sc_0x5785:
			mov r1, #0x5785
			mov r2, #0x5A85
			b sc_out
sc_0x5786:
			mov r1, #0x5786
			mov r2, #0x5A86
			b sc_out
sc_0x5787:
			mov r1, #0x5787
			mov r2, #0x5A87
			b sc_out
sc_0x5788:
			mov r1, #0x5788
			mov r2, #0x5A88
			b sc_out
sc_0x5789:
			mov r1, #0x5789
			mov r2, #0x5A89
			b sc_out
sc_0x578A:
			mov r1, #0x578A
			mov r2, #0x5A8A
			b sc_out
sc_0x578B:
			mov r1, #0x578B
			mov r2, #0x5A8B
			b sc_out
sc_0x578C:
			mov r1, #0x578C
			mov r2, #0x5A8C
			b sc_out
sc_0x578D:
			mov r1, #0x578D
			mov r2, #0x5A8D
			b sc_out
sc_0x578E:
			mov r1, #0x578E
			mov r2, #0x5A8E
			b sc_out
sc_0x578F:
			mov r1, #0x578F
			mov r2, #0x5A8F
			b sc_out
sc_0x5790:
			mov r1, #0x5790
			mov r2, #0x5A90
			b sc_out
sc_0x5791:
			mov r1, #0x5791
			mov r2, #0x5A91
			b sc_out
sc_0x5792:
			mov r1, #0x5792
			mov r2, #0x5A92
			b sc_out
sc_0x5793:
			mov r1, #0x5793
			mov r2, #0x5A93
			b sc_out
sc_0x5794:
			mov r1, #0x5794
			mov r2, #0x5A94
			b sc_out
sc_0x5795:
			mov r1, #0x5795
			mov r2, #0x5A95
			b sc_out
sc_0x5796:
			mov r1, #0x5796
			mov r2, #0x5A96
			b sc_out
sc_0x5797:
			mov r1, #0x5797
			mov r2, #0x5A97
			b sc_out
sc_0x5798:
			mov r1, #0x5798
			mov r2, #0x5A98
			b sc_out
sc_0x5799:
			mov r1, #0x5799
			mov r2, #0x5A99
			b sc_out
sc_0x579A:
			mov r1, #0x579A
			mov r2, #0x5A9A
			b sc_out
sc_0x579B:
			mov r1, #0x579B
			mov r2, #0x5A9B
			b sc_out
sc_0x579C:
			mov r1, #0x579C
			mov r2, #0x5A9C
			b sc_out
sc_0x579D:
			mov r1, #0x579D
			mov r2, #0x5A9D
			b sc_out
sc_0x579E:
			mov r1, #0x579E
			mov r2, #0x5A9E
			b sc_out
sc_0x579F:
			mov r1, #0x579F
			mov r2, #0x5A9F
			b sc_out
sc_0x50A0:
			mov r1, #0x50A0
			mov r2, #0x5AA0
			b sc_out
sc_0x50A1:
			mov r1, #0x50A1
			mov r2, #0x5AA1
			b sc_out
sc_0x50A2:
			mov r1, #0x50A2
			mov r2, #0x5AA2
			b sc_out
sc_0x50A3:
			mov r1, #0x50A3
			mov r2, #0x5AA3
			b sc_out
sc_0x50A4:
			mov r1, #0x50A4
			mov r2, #0x5AA4
			b sc_out
sc_0x50A5:
			mov r1, #0x50A5
			mov r2, #0x5AA5
			b sc_out
sc_0x50A6:
			mov r1, #0x50A6
			mov r2, #0x5AA6
			b sc_out
sc_0x50A7:
			mov r1, #0x50A7
			mov r2, #0x5AA7
			b sc_out
sc_0x50A8:
			mov r1, #0x50A8
			mov r2, #0x5AA8
			b sc_out
sc_0x50A9:
			mov r1, #0x50A9
			mov r2, #0x5AA9
			b sc_out
sc_0x50AA:
			mov r1, #0x50AA
			mov r2, #0x5AAA
			b sc_out
sc_0x50AB:
			mov r1, #0x50AB
			mov r2, #0x5AAB
			b sc_out
sc_0x50AC:
			mov r1, #0x50AC
			mov r2, #0x5AAC
			b sc_out
sc_0x50AD:
			mov r1, #0x50AD
			mov r2, #0x5AAD
			b sc_out
sc_0x50AE:
			mov r1, #0x50AE
			mov r2, #0x5AAE
			b sc_out
sc_0x50AF:
			mov r1, #0x50AF
			mov r2, #0x5AAF
			b sc_out
sc_0x50B0:
			mov r1, #0x50B0
			mov r2, #0x5AB0
			b sc_out
sc_0x50B1:
			mov r1, #0x50B1
			mov r2, #0x5AB1
			b sc_out
sc_0x50B2:
			mov r1, #0x50B2
			mov r2, #0x5AB2
			b sc_out
sc_0x50B3:
			mov r1, #0x50B3
			mov r2, #0x5AB3
			b sc_out
sc_0x50B4:
			mov r1, #0x50B4
			mov r2, #0x5AB4
			b sc_out
sc_0x50B5:
			mov r1, #0x50B5
			mov r2, #0x5AB5
			b sc_out
sc_0x50B6:
			mov r1, #0x50B6
			mov r2, #0x5AB6
			b sc_out
sc_0x50B7:
			mov r1, #0x50B7
			mov r2, #0x5AB7
			b sc_out
sc_0x50B8:
			mov r1, #0x50B8
			mov r2, #0x5AB8
			b sc_out
sc_0x50B9:
			mov r1, #0x50B9
			mov r2, #0x5AB9
			b sc_out
sc_0x50BA:
			mov r1, #0x50BA
			mov r2, #0x5ABA
			b sc_out
sc_0x50BB:
			mov r1, #0x50BB
			mov r2, #0x5ABB
			b sc_out
sc_0x50BC:
			mov r1, #0x50BC
			mov r2, #0x5ABC
			b sc_out
sc_0x50BD:
			mov r1, #0x50BD
			mov r2, #0x5ABD
			b sc_out
sc_0x50BE:
			mov r1, #0x50BE
			mov r2, #0x5ABE
			b sc_out
sc_0x50BF:
			mov r1, #0x50BF
			mov r2, #0x5ABF
			b sc_out
sc_0x51A0:
			mov r1, #0x51A0
			mov r2, #0x5AA0
			b sc_out
sc_0x51A1:
			mov r1, #0x51A1
			mov r2, #0x5AA1
			b sc_out
sc_0x51A2:
			mov r1, #0x51A2
			mov r2, #0x5AA2
			b sc_out
sc_0x51A3:
			mov r1, #0x51A3
			mov r2, #0x5AA3
			b sc_out
sc_0x51A4:
			mov r1, #0x51A4
			mov r2, #0x5AA4
			b sc_out
sc_0x51A5:
			mov r1, #0x51A5
			mov r2, #0x5AA5
			b sc_out
sc_0x51A6:
			mov r1, #0x51A6
			mov r2, #0x5AA6
			b sc_out
sc_0x51A7:
			mov r1, #0x51A7
			mov r2, #0x5AA7
			b sc_out
sc_0x51A8:
			mov r1, #0x51A8
			mov r2, #0x5AA8
			b sc_out
sc_0x51A9:
			mov r1, #0x51A9
			mov r2, #0x5AA9
			b sc_out
sc_0x51AA:
			mov r1, #0x51AA
			mov r2, #0x5AAA
			b sc_out
sc_0x51AB:
			mov r1, #0x51AB
			mov r2, #0x5AAB
			b sc_out
sc_0x51AC:
			mov r1, #0x51AC
			mov r2, #0x5AAC
			b sc_out
sc_0x51AD:
			mov r1, #0x51AD
			mov r2, #0x5AAD
			b sc_out
sc_0x51AE:
			mov r1, #0x51AE
			mov r2, #0x5AAE
			b sc_out
sc_0x51AF:
			mov r1, #0x51AF
			mov r2, #0x5AAF
			b sc_out
sc_0x51B0:
			mov r1, #0x51B0
			mov r2, #0x5AB0
			b sc_out
sc_0x51B1:
			mov r1, #0x51B1
			mov r2, #0x5AB1
			b sc_out
sc_0x51B2:
			mov r1, #0x51B2
			mov r2, #0x5AB2
			b sc_out
sc_0x51B3:
			mov r1, #0x51B3
			mov r2, #0x5AB3
			b sc_out
sc_0x51B4:
			mov r1, #0x51B4
			mov r2, #0x5AB4
			b sc_out
sc_0x51B5:
			mov r1, #0x51B5
			mov r2, #0x5AB5
			b sc_out
sc_0x51B6:
			mov r1, #0x51B6
			mov r2, #0x5AB6
			b sc_out
sc_0x51B7:
			mov r1, #0x51B7
			mov r2, #0x5AB7
			b sc_out
sc_0x51B8:
			mov r1, #0x51B8
			mov r2, #0x5AB8
			b sc_out
sc_0x51B9:
			mov r1, #0x51B9
			mov r2, #0x5AB9
			b sc_out
sc_0x51BA:
			mov r1, #0x51BA
			mov r2, #0x5ABA
			b sc_out
sc_0x51BB:
			mov r1, #0x51BB
			mov r2, #0x5ABB
			b sc_out
sc_0x51BC:
			mov r1, #0x51BC
			mov r2, #0x5ABC
			b sc_out
sc_0x51BD:
			mov r1, #0x51BD
			mov r2, #0x5ABD
			b sc_out
sc_0x51BE:
			mov r1, #0x51BE
			mov r2, #0x5ABE
			b sc_out
sc_0x51BF:
			mov r1, #0x51BF
			mov r2, #0x5ABF
			b sc_out
sc_0x52A0:
			mov r1, #0x52A0
			mov r2, #0x5AA0
			b sc_out
sc_0x52A1:
			mov r1, #0x52A1
			mov r2, #0x5AA1
			b sc_out
sc_0x52A2:
			mov r1, #0x52A2
			mov r2, #0x5AA2
			b sc_out
sc_0x52A3:
			mov r1, #0x52A3
			mov r2, #0x5AA3
			b sc_out
sc_0x52A4:
			mov r1, #0x52A4
			mov r2, #0x5AA4
			b sc_out
sc_0x52A5:
			mov r1, #0x52A5
			mov r2, #0x5AA5
			b sc_out
sc_0x52A6:
			mov r1, #0x52A6
			mov r2, #0x5AA6
			b sc_out
sc_0x52A7:
			mov r1, #0x52A7
			mov r2, #0x5AA7
			b sc_out
sc_0x52A8:
			mov r1, #0x52A8
			mov r2, #0x5AA8
			b sc_out
sc_0x52A9:
			mov r1, #0x52A9
			mov r2, #0x5AA9
			b sc_out
sc_0x52AA:
			mov r1, #0x52AA
			mov r2, #0x5AAA
			b sc_out
sc_0x52AB:
			mov r1, #0x52AB
			mov r2, #0x5AAB
			b sc_out
sc_0x52AC:
			mov r1, #0x52AC
			mov r2, #0x5AAC
			b sc_out
sc_0x52AD:
			mov r1, #0x52AD
			mov r2, #0x5AAD
			b sc_out
sc_0x52AE:
			mov r1, #0x52AE
			mov r2, #0x5AAE
			b sc_out
sc_0x52AF:
			mov r1, #0x52AF
			mov r2, #0x5AAF
			b sc_out
sc_0x52B0:
			mov r1, #0x52B0
			mov r2, #0x5AB0
			b sc_out
sc_0x52B1:
			mov r1, #0x52B1
			mov r2, #0x5AB1
			b sc_out
sc_0x52B2:
			mov r1, #0x52B2
			mov r2, #0x5AB2
			b sc_out
sc_0x52B3:
			mov r1, #0x52B3
			mov r2, #0x5AB3
			b sc_out
sc_0x52B4:
			mov r1, #0x52B4
			mov r2, #0x5AB4
			b sc_out
sc_0x52B5:
			mov r1, #0x52B5
			mov r2, #0x5AB5
			b sc_out
sc_0x52B6:
			mov r1, #0x52B6
			mov r2, #0x5AB6
			b sc_out
sc_0x52B7:
			mov r1, #0x52B7
			mov r2, #0x5AB7
			b sc_out
sc_0x52B8:
			mov r1, #0x52B8
			mov r2, #0x5AB8
			b sc_out
sc_0x52B9:
			mov r1, #0x52B9
			mov r2, #0x5AB9
			b sc_out
sc_0x52BA:
			mov r1, #0x52BA
			mov r2, #0x5ABA
			b sc_out
sc_0x52BB:
			mov r1, #0x52BB
			mov r2, #0x5ABB
			b sc_out
sc_0x52BC:
			mov r1, #0x52BC
			mov r2, #0x5ABC
			b sc_out
sc_0x52BD:
			mov r1, #0x52BD
			mov r2, #0x5ABD
			b sc_out
sc_0x52BE:
			mov r1, #0x52BE
			mov r2, #0x5ABE
			b sc_out
sc_0x52BF:
			mov r1, #0x52BF
			mov r2, #0x5ABF
			b sc_out
sc_0x53A0:
			mov r1, #0x53A0
			mov r2, #0x5AA0
			b sc_out
sc_0x53A1:
			mov r1, #0x53A1
			mov r2, #0x5AA1
			b sc_out
sc_0x53A2:
			mov r1, #0x53A2
			mov r2, #0x5AA2
			b sc_out
sc_0x53A3:
			mov r1, #0x53A3
			mov r2, #0x5AA3
			b sc_out
sc_0x53A4:
			mov r1, #0x53A4
			mov r2, #0x5AA4
			b sc_out
sc_0x53A5:
			mov r1, #0x53A5
			mov r2, #0x5AA5
			b sc_out
sc_0x53A6:
			mov r1, #0x53A6
			mov r2, #0x5AA6
			b sc_out
sc_0x53A7:
			mov r1, #0x53A7
			mov r2, #0x5AA7
			b sc_out
sc_0x53A8:
			mov r1, #0x53A8
			mov r2, #0x5AA8
			b sc_out
sc_0x53A9:
			mov r1, #0x53A9
			mov r2, #0x5AA9
			b sc_out
sc_0x53AA:
			mov r1, #0x53AA
			mov r2, #0x5AAA
			b sc_out
sc_0x53AB:
			mov r1, #0x53AB
			mov r2, #0x5AAB
			b sc_out
sc_0x53AC:
			mov r1, #0x53AC
			mov r2, #0x5AAC
			b sc_out
sc_0x53AD:
			mov r1, #0x53AD
			mov r2, #0x5AAD
			b sc_out
sc_0x53AE:
			mov r1, #0x53AE
			mov r2, #0x5AAE
			b sc_out
sc_0x53AF:
			mov r1, #0x53AF
			mov r2, #0x5AAF
			b sc_out
sc_0x53B0:
			mov r1, #0x53B0
			mov r2, #0x5AB0
			b sc_out
sc_0x53B1:
			mov r1, #0x53B1
			mov r2, #0x5AB1
			b sc_out
sc_0x53B2:
			mov r1, #0x53B2
			mov r2, #0x5AB2
			b sc_out
sc_0x53B3:
			mov r1, #0x53B3
			mov r2, #0x5AB3
			b sc_out
sc_0x53B4:
			mov r1, #0x53B4
			mov r2, #0x5AB4
			b sc_out
sc_0x53B5:
			mov r1, #0x53B5
			mov r2, #0x5AB5
			b sc_out
sc_0x53B6:
			mov r1, #0x53B6
			mov r2, #0x5AB6
			b sc_out
sc_0x53B7:
			mov r1, #0x53B7
			mov r2, #0x5AB7
			b sc_out
sc_0x53B8:
			mov r1, #0x53B8
			mov r2, #0x5AB8
			b sc_out
sc_0x53B9:
			mov r1, #0x53B9
			mov r2, #0x5AB9
			b sc_out
sc_0x53BA:
			mov r1, #0x53BA
			mov r2, #0x5ABA
			b sc_out
sc_0x53BB:
			mov r1, #0x53BB
			mov r2, #0x5ABB
			b sc_out
sc_0x53BC:
			mov r1, #0x53BC
			mov r2, #0x5ABC
			b sc_out
sc_0x53BD:
			mov r1, #0x53BD
			mov r2, #0x5ABD
			b sc_out
sc_0x53BE:
			mov r1, #0x53BE
			mov r2, #0x5ABE
			b sc_out
sc_0x53BF:
			mov r1, #0x53BF
			mov r2, #0x5ABF
			b sc_out
sc_0x54A0:
			mov r1, #0x54A0
			mov r2, #0x5AA0
			b sc_out
sc_0x54A1:
			mov r1, #0x54A1
			mov r2, #0x5AA1
			b sc_out
sc_0x54A2:
			mov r1, #0x54A2
			mov r2, #0x5AA2
			b sc_out
sc_0x54A3:
			mov r1, #0x54A3
			mov r2, #0x5AA3
			b sc_out
sc_0x54A4:
			mov r1, #0x54A4
			mov r2, #0x5AA4
			b sc_out
sc_0x54A5:
			mov r1, #0x54A5
			mov r2, #0x5AA5
			b sc_out
sc_0x54A6:
			mov r1, #0x54A6
			mov r2, #0x5AA6
			b sc_out
sc_0x54A7:
			mov r1, #0x54A7
			mov r2, #0x5AA7
			b sc_out
sc_0x54A8:
			mov r1, #0x54A8
			mov r2, #0x5AA8
			b sc_out
sc_0x54A9:
			mov r1, #0x54A9
			mov r2, #0x5AA9
			b sc_out
sc_0x54AA:
			mov r1, #0x54AA
			mov r2, #0x5AAA
			b sc_out
sc_0x54AB:
			mov r1, #0x54AB
			mov r2, #0x5AAB
			b sc_out
sc_0x54AC:
			mov r1, #0x54AC
			mov r2, #0x5AAC
			b sc_out
sc_0x54AD:
			mov r1, #0x54AD
			mov r2, #0x5AAD
			b sc_out
sc_0x54AE:
			mov r1, #0x54AE
			mov r2, #0x5AAE
			b sc_out
sc_0x54AF:
			mov r1, #0x54AF
			mov r2, #0x5AAF
			b sc_out
sc_0x54B0:
			mov r1, #0x54B0
			mov r2, #0x5AB0
			b sc_out
sc_0x54B1:
			mov r1, #0x54B1
			mov r2, #0x5AB1
			b sc_out
sc_0x54B2:
			mov r1, #0x54B2
			mov r2, #0x5AB2
			b sc_out
sc_0x54B3:
			mov r1, #0x54B3
			mov r2, #0x5AB3
			b sc_out
sc_0x54B4:
			mov r1, #0x54B4
			mov r2, #0x5AB4
			b sc_out
sc_0x54B5:
			mov r1, #0x54B5
			mov r2, #0x5AB5
			b sc_out
sc_0x54B6:
			mov r1, #0x54B6
			mov r2, #0x5AB6
			b sc_out
sc_0x54B7:
			mov r1, #0x54B7
			mov r2, #0x5AB7
			b sc_out
sc_0x54B8:
			mov r1, #0x54B8
			mov r2, #0x5AB8
			b sc_out
sc_0x54B9:
			mov r1, #0x54B9
			mov r2, #0x5AB9
			b sc_out
sc_0x54BA:
			mov r1, #0x54BA
			mov r2, #0x5ABA
			b sc_out
sc_0x54BB:
			mov r1, #0x54BB
			mov r2, #0x5ABB
			b sc_out
sc_0x54BC:
			mov r1, #0x54BC
			mov r2, #0x5ABC
			b sc_out
sc_0x54BD:
			mov r1, #0x54BD
			mov r2, #0x5ABD
			b sc_out
sc_0x54BE:
			mov r1, #0x54BE
			mov r2, #0x5ABE
			b sc_out
sc_0x54BF:
			mov r1, #0x54BF
			mov r2, #0x5ABF
			b sc_out
sc_0x55A0:
			mov r1, #0x55A0
			mov r2, #0x5AA0
			b sc_out
sc_0x55A1:
			mov r1, #0x55A1
			mov r2, #0x5AA1
			b sc_out
sc_0x55A2:
			mov r1, #0x55A2
			mov r2, #0x5AA2
			b sc_out
sc_0x55A3:
			mov r1, #0x55A3
			mov r2, #0x5AA3
			b sc_out
sc_0x55A4:
			mov r1, #0x55A4
			mov r2, #0x5AA4
			b sc_out
sc_0x55A5:
			mov r1, #0x55A5
			mov r2, #0x5AA5
			b sc_out
sc_0x55A6:
			mov r1, #0x55A6
			mov r2, #0x5AA6
			b sc_out
sc_0x55A7:
			mov r1, #0x55A7
			mov r2, #0x5AA7
			b sc_out
sc_0x55A8:
			mov r1, #0x55A8
			mov r2, #0x5AA8
			b sc_out
sc_0x55A9:
			mov r1, #0x55A9
			mov r2, #0x5AA9
			b sc_out
sc_0x55AA:
			mov r1, #0x55AA
			mov r2, #0x5AAA
			b sc_out
sc_0x55AB:
			mov r1, #0x55AB
			mov r2, #0x5AAB
			b sc_out
sc_0x55AC:
			mov r1, #0x55AC
			mov r2, #0x5AAC
			b sc_out
sc_0x55AD:
			mov r1, #0x55AD
			mov r2, #0x5AAD
			b sc_out
sc_0x55AE:
			mov r1, #0x55AE
			mov r2, #0x5AAE
			b sc_out
sc_0x55AF:
			mov r1, #0x55AF
			mov r2, #0x5AAF
			b sc_out
sc_0x55B0:
			mov r1, #0x55B0
			mov r2, #0x5AB0
			b sc_out
sc_0x55B1:
			mov r1, #0x55B1
			mov r2, #0x5AB1
			b sc_out
sc_0x55B2:
			mov r1, #0x55B2
			mov r2, #0x5AB2
			b sc_out
sc_0x55B3:
			mov r1, #0x55B3
			mov r2, #0x5AB3
			b sc_out
sc_0x55B4:
			mov r1, #0x55B4
			mov r2, #0x5AB4
			b sc_out
sc_0x55B5:
			mov r1, #0x55B5
			mov r2, #0x5AB5
			b sc_out
sc_0x55B6:
			mov r1, #0x55B6
			mov r2, #0x5AB6
			b sc_out
sc_0x55B7:
			mov r1, #0x55B7
			mov r2, #0x5AB7
			b sc_out
sc_0x55B8:
			mov r1, #0x55B8
			mov r2, #0x5AB8
			b sc_out
sc_0x55B9:
			mov r1, #0x55B9
			mov r2, #0x5AB9
			b sc_out
sc_0x55BA:
			mov r1, #0x55BA
			mov r2, #0x5ABA
			b sc_out
sc_0x55BB:
			mov r1, #0x55BB
			mov r2, #0x5ABB
			b sc_out
sc_0x55BC:
			mov r1, #0x55BC
			mov r2, #0x5ABC
			b sc_out
sc_0x55BD:
			mov r1, #0x55BD
			mov r2, #0x5ABD
			b sc_out
sc_0x55BE:
			mov r1, #0x55BE
			mov r2, #0x5ABE
			b sc_out
sc_0x55BF:
			mov r1, #0x55BF
			mov r2, #0x5ABF
			b sc_out
sc_0x56A0:
			mov r1, #0x56A0
			mov r2, #0x5AA0
			b sc_out
sc_0x56A1:
			mov r1, #0x56A1
			mov r2, #0x5AA1
			b sc_out
sc_0x56A2:
			mov r1, #0x56A2
			mov r2, #0x5AA2
			b sc_out
sc_0x56A3:
			mov r1, #0x56A3
			mov r2, #0x5AA3
			b sc_out
sc_0x56A4:
			mov r1, #0x56A4
			mov r2, #0x5AA4
			b sc_out
sc_0x56A5:
			mov r1, #0x56A5
			mov r2, #0x5AA5
			b sc_out
sc_0x56A6:
			mov r1, #0x56A6
			mov r2, #0x5AA6
			b sc_out
sc_0x56A7:
			mov r1, #0x56A7
			mov r2, #0x5AA7
			b sc_out
sc_0x56A8:
			mov r1, #0x56A8
			mov r2, #0x5AA8
			b sc_out
sc_0x56A9:
			mov r1, #0x56A9
			mov r2, #0x5AA9
			b sc_out
sc_0x56AA:
			mov r1, #0x56AA
			mov r2, #0x5AAA
			b sc_out
sc_0x56AB:
			mov r1, #0x56AB
			mov r2, #0x5AAB
			b sc_out
sc_0x56AC:
			mov r1, #0x56AC
			mov r2, #0x5AAC
			b sc_out
sc_0x56AD:
			mov r1, #0x56AD
			mov r2, #0x5AAD
			b sc_out
sc_0x56AE:
			mov r1, #0x56AE
			mov r2, #0x5AAE
			b sc_out
sc_0x56AF:
			mov r1, #0x56AF
			mov r2, #0x5AAF
			b sc_out
sc_0x56B0:
			mov r1, #0x56B0
			mov r2, #0x5AB0
			b sc_out
sc_0x56B1:
			mov r1, #0x56B1
			mov r2, #0x5AB1
			b sc_out
sc_0x56B2:
			mov r1, #0x56B2
			mov r2, #0x5AB2
			b sc_out
sc_0x56B3:
			mov r1, #0x56B3
			mov r2, #0x5AB3
			b sc_out
sc_0x56B4:
			mov r1, #0x56B4
			mov r2, #0x5AB4
			b sc_out
sc_0x56B5:
			mov r1, #0x56B5
			mov r2, #0x5AB5
			b sc_out
sc_0x56B6:
			mov r1, #0x56B6
			mov r2, #0x5AB6
			b sc_out
sc_0x56B7:
			mov r1, #0x56B7
			mov r2, #0x5AB7
			b sc_out
sc_0x56B8:
			mov r1, #0x56B8
			mov r2, #0x5AB8
			b sc_out
sc_0x56B9:
			mov r1, #0x56B9
			mov r2, #0x5AB9
			b sc_out
sc_0x56BA:
			mov r1, #0x56BA
			mov r2, #0x5ABA
			b sc_out
sc_0x56BB:
			mov r1, #0x56BB
			mov r2, #0x5ABB
			b sc_out
sc_0x56BC:
			mov r1, #0x56BC
			mov r2, #0x5ABC
			b sc_out
sc_0x56BD:
			mov r1, #0x56BD
			mov r2, #0x5ABD
			b sc_out
sc_0x56BE:
			mov r1, #0x56BE
			mov r2, #0x5ABE
			b sc_out
sc_0x56BF:
			mov r1, #0x56BF
			mov r2, #0x5ABF
			b sc_out
sc_0x57A0:
			mov r1, #0x57A0
			mov r2, #0x5AA0
			b sc_out
sc_0x57A1:
			mov r1, #0x57A1
			mov r2, #0x5AA1
			b sc_out
sc_0x57A2:
			mov r1, #0x57A2
			mov r2, #0x5AA2
			b sc_out
sc_0x57A3:
			mov r1, #0x57A3
			mov r2, #0x5AA3
			b sc_out
sc_0x57A4:
			mov r1, #0x57A4
			mov r2, #0x5AA4
			b sc_out
sc_0x57A5:
			mov r1, #0x57A5
			mov r2, #0x5AA5
			b sc_out
sc_0x57A6:
			mov r1, #0x57A6
			mov r2, #0x5AA6
			b sc_out
sc_0x57A7:
			mov r1, #0x57A7
			mov r2, #0x5AA7
			b sc_out
sc_0x57A8:
			mov r1, #0x57A8
			mov r2, #0x5AA8
			b sc_out
sc_0x57A9:
			mov r1, #0x57A9
			mov r2, #0x5AA9
			b sc_out
sc_0x57AA:
			mov r1, #0x57AA
			mov r2, #0x5AAA
			b sc_out
sc_0x57AB:
			mov r1, #0x57AB
			mov r2, #0x5AAB
			b sc_out
sc_0x57AC:
			mov r1, #0x57AC
			mov r2, #0x5AAC
			b sc_out
sc_0x57AD:
			mov r1, #0x57AD
			mov r2, #0x5AAD
			b sc_out
sc_0x57AE:
			mov r1, #0x57AE
			mov r2, #0x5AAE
			b sc_out
sc_0x57AF:
			mov r1, #0x57AF
			mov r2, #0x5AAF
			b sc_out
sc_0x57B0:
			mov r1, #0x57B0
			mov r2, #0x5AB0
			b sc_out
sc_0x57B1:
			mov r1, #0x57B1
			mov r2, #0x5AB1
			b sc_out
sc_0x57B2:
			mov r1, #0x57B2
			mov r2, #0x5AB2
			b sc_out
sc_0x57B3:
			mov r1, #0x57B3
			mov r2, #0x5AB3
			b sc_out
sc_0x57B4:
			mov r1, #0x57B4
			mov r2, #0x5AB4
			b sc_out
sc_0x57B5:
			mov r1, #0x57B5
			mov r2, #0x5AB5
			b sc_out
sc_0x57B6:
			mov r1, #0x57B6
			mov r2, #0x5AB6
			b sc_out
sc_0x57B7:
			mov r1, #0x57B7
			mov r2, #0x5AB7
			b sc_out
sc_0x57B8:
			mov r1, #0x57B8
			mov r2, #0x5AB8
			b sc_out
sc_0x57B9:
			mov r1, #0x57B9
			mov r2, #0x5AB9
			b sc_out
sc_0x57BA:
			mov r1, #0x57BA
			mov r2, #0x5ABA
			b sc_out
sc_0x57BB:
			mov r1, #0x57BB
			mov r2, #0x5ABB
			b sc_out
sc_0x57BC:
			mov r1, #0x57BC
			mov r2, #0x5ABC
			b sc_out
sc_0x57BD:
			mov r1, #0x57BD
			mov r2, #0x5ABD
			b sc_out
sc_0x57BE:
			mov r1, #0x57BE
			mov r2, #0x5ABE
			b sc_out
sc_0x57BF:
			mov r1, #0x57BF
			mov r2, #0x5ABF
			b sc_out
sc_0x50C0:
			mov r1, #0x50C0
			mov r2, #0x5AC0
			b sc_out
sc_0x50C1:
			mov r1, #0x50C1
			mov r2, #0x5AC1
			b sc_out
sc_0x50C2:
			mov r1, #0x50C2
			mov r2, #0x5AC2
			b sc_out
sc_0x50C3:
			mov r1, #0x50C3
			mov r2, #0x5AC3
			b sc_out
sc_0x50C4:
			mov r1, #0x50C4
			mov r2, #0x5AC4
			b sc_out
sc_0x50C5:
			mov r1, #0x50C5
			mov r2, #0x5AC5
			b sc_out
sc_0x50C6:
			mov r1, #0x50C6
			mov r2, #0x5AC6
			b sc_out
sc_0x50C7:
			mov r1, #0x50C7
			mov r2, #0x5AC7
			b sc_out
sc_0x50C8:
			mov r1, #0x50C8
			mov r2, #0x5AC8
			b sc_out
sc_0x50C9:
			mov r1, #0x50C9
			mov r2, #0x5AC9
			b sc_out
sc_0x50CA:
			mov r1, #0x50CA
			mov r2, #0x5ACA
			b sc_out
sc_0x50CB:
			mov r1, #0x50CB
			mov r2, #0x5ACB
			b sc_out
sc_0x50CC:
			mov r1, #0x50CC
			mov r2, #0x5ACC
			b sc_out
sc_0x50CD:
			mov r1, #0x50CD
			mov r2, #0x5ACD
			b sc_out
sc_0x50CE:
			mov r1, #0x50CE
			mov r2, #0x5ACE
			b sc_out
sc_0x50CF:
			mov r1, #0x50CF
			mov r2, #0x5ACF
			b sc_out
sc_0x50D0:
			mov r1, #0x50D0
			mov r2, #0x5AD0
			b sc_out
sc_0x50D1:
			mov r1, #0x50D1
			mov r2, #0x5AD1
			b sc_out
sc_0x50D2:
			mov r1, #0x50D2
			mov r2, #0x5AD2
			b sc_out
sc_0x50D3:
			mov r1, #0x50D3
			mov r2, #0x5AD3
			b sc_out
sc_0x50D4:
			mov r1, #0x50D4
			mov r2, #0x5AD4
			b sc_out
sc_0x50D5:
			mov r1, #0x50D5
			mov r2, #0x5AD5
			b sc_out
sc_0x50D6:
			mov r1, #0x50D6
			mov r2, #0x5AD6
			b sc_out
sc_0x50D7:
			mov r1, #0x50D7
			mov r2, #0x5AD7
			b sc_out
sc_0x50D8:
			mov r1, #0x50D8
			mov r2, #0x5AD8
			b sc_out
sc_0x50D9:
			mov r1, #0x50D9
			mov r2, #0x5AD9
			b sc_out
sc_0x50DA:
			mov r1, #0x50DA
			mov r2, #0x5ADA
			b sc_out
sc_0x50DB:
			mov r1, #0x50DB
			mov r2, #0x5ADB
			b sc_out
sc_0x50DC:
			mov r1, #0x50DC
			mov r2, #0x5ADC
			b sc_out
sc_0x50DD:
			mov r1, #0x50DD
			mov r2, #0x5ADD
			b sc_out
sc_0x50DE:
			mov r1, #0x50DE
			mov r2, #0x5ADE
			b sc_out
sc_0x50DF:
			mov r1, #0x50DF
			mov r2, #0x5ADF
			b sc_out
sc_0x51C0:
			mov r1, #0x51C0
			mov r2, #0x5AC0
			b sc_out
sc_0x51C1:
			mov r1, #0x51C1
			mov r2, #0x5AC1
			b sc_out
sc_0x51C2:
			mov r1, #0x51C2
			mov r2, #0x5AC2
			b sc_out
sc_0x51C3:
			mov r1, #0x51C3
			mov r2, #0x5AC3
			b sc_out
sc_0x51C4:
			mov r1, #0x51C4
			mov r2, #0x5AC4
			b sc_out
sc_0x51C5:
			mov r1, #0x51C5
			mov r2, #0x5AC5
			b sc_out
sc_0x51C6:
			mov r1, #0x51C6
			mov r2, #0x5AC6
			b sc_out
sc_0x51C7:
			mov r1, #0x51C7
			mov r2, #0x5AC7
			b sc_out
sc_0x51C8:
			mov r1, #0x51C8
			mov r2, #0x5AC8
			b sc_out
sc_0x51C9:
			mov r1, #0x51C9
			mov r2, #0x5AC9
			b sc_out
sc_0x51CA:
			mov r1, #0x51CA
			mov r2, #0x5ACA
			b sc_out
sc_0x51CB:
			mov r1, #0x51CB
			mov r2, #0x5ACB
			b sc_out
sc_0x51CC:
			mov r1, #0x51CC
			mov r2, #0x5ACC
			b sc_out
sc_0x51CD:
			mov r1, #0x51CD
			mov r2, #0x5ACD
			b sc_out
sc_0x51CE:
			mov r1, #0x51CE
			mov r2, #0x5ACE
			b sc_out
sc_0x51CF:
			mov r1, #0x51CF
			mov r2, #0x5ACF
			b sc_out
sc_0x51D0:
			mov r1, #0x51D0
			mov r2, #0x5AD0
			b sc_out
sc_0x51D1:
			mov r1, #0x51D1
			mov r2, #0x5AD1
			b sc_out
sc_0x51D2:
			mov r1, #0x51D2
			mov r2, #0x5AD2
			b sc_out
sc_0x51D3:
			mov r1, #0x51D3
			mov r2, #0x5AD3
			b sc_out
sc_0x51D4:
			mov r1, #0x51D4
			mov r2, #0x5AD4
			b sc_out
sc_0x51D5:
			mov r1, #0x51D5
			mov r2, #0x5AD5
			b sc_out
sc_0x51D6:
			mov r1, #0x51D6
			mov r2, #0x5AD6
			b sc_out
sc_0x51D7:
			mov r1, #0x51D7
			mov r2, #0x5AD7
			b sc_out
sc_0x51D8:
			mov r1, #0x51D8
			mov r2, #0x5AD8
			b sc_out
sc_0x51D9:
			mov r1, #0x51D9
			mov r2, #0x5AD9
			b sc_out
sc_0x51DA:
			mov r1, #0x51DA
			mov r2, #0x5ADA
			b sc_out
sc_0x51DB:
			mov r1, #0x51DB
			mov r2, #0x5ADB
			b sc_out
sc_0x51DC:
			mov r1, #0x51DC
			mov r2, #0x5ADC
			b sc_out
sc_0x51DD:
			mov r1, #0x51DD
			mov r2, #0x5ADD
			b sc_out
sc_0x51DE:
			mov r1, #0x51DE
			mov r2, #0x5ADE
			b sc_out
sc_0x51DF:
			mov r1, #0x51DF
			mov r2, #0x5ADF
			b sc_out
sc_0x52C0:
			mov r1, #0x52C0
			mov r2, #0x5AC0
			b sc_out
sc_0x52C1:
			mov r1, #0x52C1
			mov r2, #0x5AC1
			b sc_out
sc_0x52C2:
			mov r1, #0x52C2
			mov r2, #0x5AC2
			b sc_out
sc_0x52C3:
			mov r1, #0x52C3
			mov r2, #0x5AC3
			b sc_out
sc_0x52C4:
			mov r1, #0x52C4
			mov r2, #0x5AC4
			b sc_out
sc_0x52C5:
			mov r1, #0x52C5
			mov r2, #0x5AC5
			b sc_out
sc_0x52C6:
			mov r1, #0x52C6
			mov r2, #0x5AC6
			b sc_out
sc_0x52C7:
			mov r1, #0x52C7
			mov r2, #0x5AC7
			b sc_out
sc_0x52C8:
			mov r1, #0x52C8
			mov r2, #0x5AC8
			b sc_out
sc_0x52C9:
			mov r1, #0x52C9
			mov r2, #0x5AC9
			b sc_out
sc_0x52CA:
			mov r1, #0x52CA
			mov r2, #0x5ACA
			b sc_out
sc_0x52CB:
			mov r1, #0x52CB
			mov r2, #0x5ACB
			b sc_out
sc_0x52CC:
			mov r1, #0x52CC
			mov r2, #0x5ACC
			b sc_out
sc_0x52CD:
			mov r1, #0x52CD
			mov r2, #0x5ACD
			b sc_out
sc_0x52CE:
			mov r1, #0x52CE
			mov r2, #0x5ACE
			b sc_out
sc_0x52CF:
			mov r1, #0x52CF
			mov r2, #0x5ACF
			b sc_out
sc_0x52D0:
			mov r1, #0x52D0
			mov r2, #0x5AD0
			b sc_out
sc_0x52D1:
			mov r1, #0x52D1
			mov r2, #0x5AD1
			b sc_out
sc_0x52D2:
			mov r1, #0x52D2
			mov r2, #0x5AD2
			b sc_out
sc_0x52D3:
			mov r1, #0x52D3
			mov r2, #0x5AD3
			b sc_out
sc_0x52D4:
			mov r1, #0x52D4
			mov r2, #0x5AD4
			b sc_out
sc_0x52D5:
			mov r1, #0x52D5
			mov r2, #0x5AD5
			b sc_out
sc_0x52D6:
			mov r1, #0x52D6
			mov r2, #0x5AD6
			b sc_out
sc_0x52D7:
			mov r1, #0x52D7
			mov r2, #0x5AD7
			b sc_out
sc_0x52D8:
			mov r1, #0x52D8
			mov r2, #0x5AD8
			b sc_out
sc_0x52D9:
			mov r1, #0x52D9
			mov r2, #0x5AD9
			b sc_out
sc_0x52DA:
			mov r1, #0x52DA
			mov r2, #0x5ADA
			b sc_out
sc_0x52DB:
			mov r1, #0x52DB
			mov r2, #0x5ADB
			b sc_out
sc_0x52DC:
			mov r1, #0x52DC
			mov r2, #0x5ADC
			b sc_out
sc_0x52DD:
			mov r1, #0x52DD
			mov r2, #0x5ADD
			b sc_out
sc_0x52DE:
			mov r1, #0x52DE
			mov r2, #0x5ADE
			b sc_out
sc_0x52DF:
			mov r1, #0x52DF
			mov r2, #0x5ADF
			b sc_out
sc_0x53C0:
			mov r1, #0x53C0
			mov r2, #0x5AC0
			b sc_out
sc_0x53C1:
			mov r1, #0x53C1
			mov r2, #0x5AC1
			b sc_out
sc_0x53C2:
			mov r1, #0x53C2
			mov r2, #0x5AC2
			b sc_out
sc_0x53C3:
			mov r1, #0x53C3
			mov r2, #0x5AC3
			b sc_out
sc_0x53C4:
			mov r1, #0x53C4
			mov r2, #0x5AC4
			b sc_out
sc_0x53C5:
			mov r1, #0x53C5
			mov r2, #0x5AC5
			b sc_out
sc_0x53C6:
			mov r1, #0x53C6
			mov r2, #0x5AC6
			b sc_out
sc_0x53C7:
			mov r1, #0x53C7
			mov r2, #0x5AC7
			b sc_out
sc_0x53C8:
			mov r1, #0x53C8
			mov r2, #0x5AC8
			b sc_out
sc_0x53C9:
			mov r1, #0x53C9
			mov r2, #0x5AC9
			b sc_out
sc_0x53CA:
			mov r1, #0x53CA
			mov r2, #0x5ACA
			b sc_out
sc_0x53CB:
			mov r1, #0x53CB
			mov r2, #0x5ACB
			b sc_out
sc_0x53CC:
			mov r1, #0x53CC
			mov r2, #0x5ACC
			b sc_out
sc_0x53CD:
			mov r1, #0x53CD
			mov r2, #0x5ACD
			b sc_out
sc_0x53CE:
			mov r1, #0x53CE
			mov r2, #0x5ACE
			b sc_out
sc_0x53CF:
			mov r1, #0x53CF
			mov r2, #0x5ACF
			b sc_out
sc_0x53D0:
			mov r1, #0x53D0
			mov r2, #0x5AD0
			b sc_out
sc_0x53D1:
			mov r1, #0x53D1
			mov r2, #0x5AD1
			b sc_out
sc_0x53D2:
			mov r1, #0x53D2
			mov r2, #0x5AD2
			b sc_out
sc_0x53D3:
			mov r1, #0x53D3
			mov r2, #0x5AD3
			b sc_out
sc_0x53D4:
			mov r1, #0x53D4
			mov r2, #0x5AD4
			b sc_out
sc_0x53D5:
			mov r1, #0x53D5
			mov r2, #0x5AD5
			b sc_out
sc_0x53D6:
			mov r1, #0x53D6
			mov r2, #0x5AD6
			b sc_out
sc_0x53D7:
			mov r1, #0x53D7
			mov r2, #0x5AD7
			b sc_out
sc_0x53D8:
			mov r1, #0x53D8
			mov r2, #0x5AD8
			b sc_out
sc_0x53D9:
			mov r1, #0x53D9
			mov r2, #0x5AD9
			b sc_out
sc_0x53DA:
			mov r1, #0x53DA
			mov r2, #0x5ADA
			b sc_out
sc_0x53DB:
			mov r1, #0x53DB
			mov r2, #0x5ADB
			b sc_out
sc_0x53DC:
			mov r1, #0x53DC
			mov r2, #0x5ADC
			b sc_out
sc_0x53DD:
			mov r1, #0x53DD
			mov r2, #0x5ADD
			b sc_out
sc_0x53DE:
			mov r1, #0x53DE
			mov r2, #0x5ADE
			b sc_out
sc_0x53DF:
			mov r1, #0x53DF
			mov r2, #0x5ADF
			b sc_out
sc_0x54C0:
			mov r1, #0x54C0
			mov r2, #0x5AC0
			b sc_out
sc_0x54C1:
			mov r1, #0x54C1
			mov r2, #0x5AC1
			b sc_out
sc_0x54C2:
			mov r1, #0x54C2
			mov r2, #0x5AC2
			b sc_out
sc_0x54C3:
			mov r1, #0x54C3
			mov r2, #0x5AC3
			b sc_out
sc_0x54C4:
			mov r1, #0x54C4
			mov r2, #0x5AC4
			b sc_out
sc_0x54C5:
			mov r1, #0x54C5
			mov r2, #0x5AC5
			b sc_out
sc_0x54C6:
			mov r1, #0x54C6
			mov r2, #0x5AC6
			b sc_out
sc_0x54C7:
			mov r1, #0x54C7
			mov r2, #0x5AC7
			b sc_out
sc_0x54C8:
			mov r1, #0x54C8
			mov r2, #0x5AC8
			b sc_out
sc_0x54C9:
			mov r1, #0x54C9
			mov r2, #0x5AC9
			b sc_out
sc_0x54CA:
			mov r1, #0x54CA
			mov r2, #0x5ACA
			b sc_out
sc_0x54CB:
			mov r1, #0x54CB
			mov r2, #0x5ACB
			b sc_out
sc_0x54CC:
			mov r1, #0x54CC
			mov r2, #0x5ACC
			b sc_out
sc_0x54CD:
			mov r1, #0x54CD
			mov r2, #0x5ACD
			b sc_out
sc_0x54CE:
			mov r1, #0x54CE
			mov r2, #0x5ACE
			b sc_out
sc_0x54CF:
			mov r1, #0x54CF
			mov r2, #0x5ACF
			b sc_out
sc_0x54D0:
			mov r1, #0x54D0
			mov r2, #0x5AD0
			b sc_out
sc_0x54D1:
			mov r1, #0x54D1
			mov r2, #0x5AD1
			b sc_out
sc_0x54D2:
			mov r1, #0x54D2
			mov r2, #0x5AD2
			b sc_out
sc_0x54D3:
			mov r1, #0x54D3
			mov r2, #0x5AD3
			b sc_out
sc_0x54D4:
			mov r1, #0x54D4
			mov r2, #0x5AD4
			b sc_out
sc_0x54D5:
			mov r1, #0x54D5
			mov r2, #0x5AD5
			b sc_out
sc_0x54D6:
			mov r1, #0x54D6
			mov r2, #0x5AD6
			b sc_out
sc_0x54D7:
			mov r1, #0x54D7
			mov r2, #0x5AD7
			b sc_out
sc_0x54D8:
			mov r1, #0x54D8
			mov r2, #0x5AD8
			b sc_out
sc_0x54D9:
			mov r1, #0x54D9
			mov r2, #0x5AD9
			b sc_out
sc_0x54DA:
			mov r1, #0x54DA
			mov r2, #0x5ADA
			b sc_out
sc_0x54DB:
			mov r1, #0x54DB
			mov r2, #0x5ADB
			b sc_out
sc_0x54DC:
			mov r1, #0x54DC
			mov r2, #0x5ADC
			b sc_out
sc_0x54DD:
			mov r1, #0x54DD
			mov r2, #0x5ADD
			b sc_out
sc_0x54DE:
			mov r1, #0x54DE
			mov r2, #0x5ADE
			b sc_out
sc_0x54DF:
			mov r1, #0x54DF
			mov r2, #0x5ADF
			b sc_out
sc_0x55C0:
			mov r1, #0x55C0
			mov r2, #0x5AC0
			b sc_out
sc_0x55C1:
			mov r1, #0x55C1
			mov r2, #0x5AC1
			b sc_out
sc_0x55C2:
			mov r1, #0x55C2
			mov r2, #0x5AC2
			b sc_out
sc_0x55C3:
			mov r1, #0x55C3
			mov r2, #0x5AC3
			b sc_out
sc_0x55C4:
			mov r1, #0x55C4
			mov r2, #0x5AC4
			b sc_out
sc_0x55C5:
			mov r1, #0x55C5
			mov r2, #0x5AC5
			b sc_out
sc_0x55C6:
			mov r1, #0x55C6
			mov r2, #0x5AC6
			b sc_out
sc_0x55C7:
			mov r1, #0x55C7
			mov r2, #0x5AC7
			b sc_out
sc_0x55C8:
			mov r1, #0x55C8
			mov r2, #0x5AC8
			b sc_out
sc_0x55C9:
			mov r1, #0x55C9
			mov r2, #0x5AC9
			b sc_out
sc_0x55CA:
			mov r1, #0x55CA
			mov r2, #0x5ACA
			b sc_out
sc_0x55CB:
			mov r1, #0x55CB
			mov r2, #0x5ACB
			b sc_out
sc_0x55CC:
			mov r1, #0x55CC
			mov r2, #0x5ACC
			b sc_out
sc_0x55CD:
			mov r1, #0x55CD
			mov r2, #0x5ACD
			b sc_out
sc_0x55CE:
			mov r1, #0x55CE
			mov r2, #0x5ACE
			b sc_out
sc_0x55CF:
			mov r1, #0x55CF
			mov r2, #0x5ACF
			b sc_out
sc_0x55D0:
			mov r1, #0x55D0
			mov r2, #0x5AD0
			b sc_out
sc_0x55D1:
			mov r1, #0x55D1
			mov r2, #0x5AD1
			b sc_out
sc_0x55D2:
			mov r1, #0x55D2
			mov r2, #0x5AD2
			b sc_out
sc_0x55D3:
			mov r1, #0x55D3
			mov r2, #0x5AD3
			b sc_out
sc_0x55D4:
			mov r1, #0x55D4
			mov r2, #0x5AD4
			b sc_out
sc_0x55D5:
			mov r1, #0x55D5
			mov r2, #0x5AD5
			b sc_out
sc_0x55D6:
			mov r1, #0x55D6
			mov r2, #0x5AD6
			b sc_out
sc_0x55D7:
			mov r1, #0x55D7
			mov r2, #0x5AD7
			b sc_out
sc_0x55D8:
			mov r1, #0x55D8
			mov r2, #0x5AD8
			b sc_out
sc_0x55D9:
			mov r1, #0x55D9
			mov r2, #0x5AD9
			b sc_out
sc_0x55DA:
			mov r1, #0x55DA
			mov r2, #0x5ADA
			b sc_out
sc_0x55DB:
			mov r1, #0x55DB
			mov r2, #0x5ADB
			b sc_out
sc_0x55DC:
			mov r1, #0x55DC
			mov r2, #0x5ADC
			b sc_out
sc_0x55DD:
			mov r1, #0x55DD
			mov r2, #0x5ADD
			b sc_out
sc_0x55DE:
			mov r1, #0x55DE
			mov r2, #0x5ADE
			b sc_out
sc_0x55DF:
			mov r1, #0x55DF
			mov r2, #0x5ADF
			b sc_out
sc_0x56C0:
			mov r1, #0x56C0
			mov r2, #0x5AC0
			b sc_out
sc_0x56C1:
			mov r1, #0x56C1
			mov r2, #0x5AC1
			b sc_out
sc_0x56C2:
			mov r1, #0x56C2
			mov r2, #0x5AC2
			b sc_out
sc_0x56C3:
			mov r1, #0x56C3
			mov r2, #0x5AC3
			b sc_out
sc_0x56C4:
			mov r1, #0x56C4
			mov r2, #0x5AC4
			b sc_out
sc_0x56C5:
			mov r1, #0x56C5
			mov r2, #0x5AC5
			b sc_out
sc_0x56C6:
			mov r1, #0x56C6
			mov r2, #0x5AC6
			b sc_out
sc_0x56C7:
			mov r1, #0x56C7
			mov r2, #0x5AC7
			b sc_out
sc_0x56C8:
			mov r1, #0x56C8
			mov r2, #0x5AC8
			b sc_out
sc_0x56C9:
			mov r1, #0x56C9
			mov r2, #0x5AC9
			b sc_out
sc_0x56CA:
			mov r1, #0x56CA
			mov r2, #0x5ACA
			b sc_out
sc_0x56CB:
			mov r1, #0x56CB
			mov r2, #0x5ACB
			b sc_out
sc_0x56CC:
			mov r1, #0x56CC
			mov r2, #0x5ACC
			b sc_out
sc_0x56CD:
			mov r1, #0x56CD
			mov r2, #0x5ACD
			b sc_out
sc_0x56CE:
			mov r1, #0x56CE
			mov r2, #0x5ACE
			b sc_out
sc_0x56CF:
			mov r1, #0x56CF
			mov r2, #0x5ACF
			b sc_out
sc_0x56D0:
			mov r1, #0x56D0
			mov r2, #0x5AD0
			b sc_out
sc_0x56D1:
			mov r1, #0x56D1
			mov r2, #0x5AD1
			b sc_out
sc_0x56D2:
			mov r1, #0x56D2
			mov r2, #0x5AD2
			b sc_out
sc_0x56D3:
			mov r1, #0x56D3
			mov r2, #0x5AD3
			b sc_out
sc_0x56D4:
			mov r1, #0x56D4
			mov r2, #0x5AD4
			b sc_out
sc_0x56D5:
			mov r1, #0x56D5
			mov r2, #0x5AD5
			b sc_out
sc_0x56D6:
			mov r1, #0x56D6
			mov r2, #0x5AD6
			b sc_out
sc_0x56D7:
			mov r1, #0x56D7
			mov r2, #0x5AD7
			b sc_out
sc_0x56D8:
			mov r1, #0x56D8
			mov r2, #0x5AD8
			b sc_out
sc_0x56D9:
			mov r1, #0x56D9
			mov r2, #0x5AD9
			b sc_out
sc_0x56DA:
			mov r1, #0x56DA
			mov r2, #0x5ADA
			b sc_out
sc_0x56DB:
			mov r1, #0x56DB
			mov r2, #0x5ADB
			b sc_out
sc_0x56DC:
			mov r1, #0x56DC
			mov r2, #0x5ADC
			b sc_out
sc_0x56DD:
			mov r1, #0x56DD
			mov r2, #0x5ADD
			b sc_out
sc_0x56DE:
			mov r1, #0x56DE
			mov r2, #0x5ADE
			b sc_out
sc_0x56DF:
			mov r1, #0x56DF
			mov r2, #0x5ADF
			b sc_out
sc_0x57C0:
			mov r1, #0x57C0
			mov r2, #0x5AC0
			b sc_out
sc_0x57C1:
			mov r1, #0x57C1
			mov r2, #0x5AC1
			b sc_out
sc_0x57C2:
			mov r1, #0x57C2
			mov r2, #0x5AC2
			b sc_out
sc_0x57C3:
			mov r1, #0x57C3
			mov r2, #0x5AC3
			b sc_out
sc_0x57C4:
			mov r1, #0x57C4
			mov r2, #0x5AC4
			b sc_out
sc_0x57C5:
			mov r1, #0x57C5
			mov r2, #0x5AC5
			b sc_out
sc_0x57C6:
			mov r1, #0x57C6
			mov r2, #0x5AC6
			b sc_out
sc_0x57C7:
			mov r1, #0x57C7
			mov r2, #0x5AC7
			b sc_out
sc_0x57C8:
			mov r1, #0x57C8
			mov r2, #0x5AC8
			b sc_out
sc_0x57C9:
			mov r1, #0x57C9
			mov r2, #0x5AC9
			b sc_out
sc_0x57CA:
			mov r1, #0x57CA
			mov r2, #0x5ACA
			b sc_out
sc_0x57CB:
			mov r1, #0x57CB
			mov r2, #0x5ACB
			b sc_out
sc_0x57CC:
			mov r1, #0x57CC
			mov r2, #0x5ACC
			b sc_out
sc_0x57CD:
			mov r1, #0x57CD
			mov r2, #0x5ACD
			b sc_out
sc_0x57CE:
			mov r1, #0x57CE
			mov r2, #0x5ACE
			b sc_out
sc_0x57CF:
			mov r1, #0x57CF
			mov r2, #0x5ACF
			b sc_out
sc_0x57D0:
			mov r1, #0x57D0
			mov r2, #0x5AD0
			b sc_out
sc_0x57D1:
			mov r1, #0x57D1
			mov r2, #0x5AD1
			b sc_out
sc_0x57D2:
			mov r1, #0x57D2
			mov r2, #0x5AD2
			b sc_out
sc_0x57D3:
			mov r1, #0x57D3
			mov r2, #0x5AD3
			b sc_out
sc_0x57D4:
			mov r1, #0x57D4
			mov r2, #0x5AD4
			b sc_out
sc_0x57D5:
			mov r1, #0x57D5
			mov r2, #0x5AD5
			b sc_out
sc_0x57D6:
			mov r1, #0x57D6
			mov r2, #0x5AD6
			b sc_out
sc_0x57D7:
			mov r1, #0x57D7
			mov r2, #0x5AD7
			b sc_out
sc_0x57D8:
			mov r1, #0x57D8
			mov r2, #0x5AD8
			b sc_out
sc_0x57D9:
			mov r1, #0x57D9
			mov r2, #0x5AD9
			b sc_out
sc_0x57DA:
			mov r1, #0x57DA
			mov r2, #0x5ADA
			b sc_out
sc_0x57DB:
			mov r1, #0x57DB
			mov r2, #0x5ADB
			b sc_out
sc_0x57DC:
			mov r1, #0x57DC
			mov r2, #0x5ADC
			b sc_out
sc_0x57DD:
			mov r1, #0x57DD
			mov r2, #0x5ADD
			b sc_out
sc_0x57DE:
			mov r1, #0x57DE
			mov r2, #0x5ADE
			b sc_out
sc_0x57DF:
			mov r1, #0x57DF
			mov r2, #0x5ADF
			b sc_out
sc_0x50E0:
			mov r1, #0x50E0
			mov r2, #0x5AE0
			b sc_out
sc_0x50E1:
			mov r1, #0x50E1
			mov r2, #0x5AE1
			b sc_out
sc_0x50E2:
			mov r1, #0x50E2
			mov r2, #0x5AE2
			b sc_out
sc_0x50E3:
			mov r1, #0x50E3
			mov r2, #0x5AE3
			b sc_out
sc_0x50E4:
			mov r1, #0x50E4
			mov r2, #0x5AE4
			b sc_out
sc_0x50E5:
			mov r1, #0x50E5
			mov r2, #0x5AE5
			b sc_out
sc_0x50E6:
			mov r1, #0x50E6
			mov r2, #0x5AE6
			b sc_out
sc_0x50E7:
			mov r1, #0x50E7
			mov r2, #0x5AE7
			b sc_out
sc_0x50E8:
			mov r1, #0x50E8
			mov r2, #0x5AE8
			b sc_out
sc_0x50E9:
			mov r1, #0x50E9
			mov r2, #0x5AE9
			b sc_out
sc_0x50EA:
			mov r1, #0x50EA
			mov r2, #0x5AEA
			b sc_out
sc_0x50EB:
			mov r1, #0x50EB
			mov r2, #0x5AEB
			b sc_out
sc_0x50EC:
			mov r1, #0x50EC
			mov r2, #0x5AEC
			b sc_out
sc_0x50ED:
			mov r1, #0x50ED
			mov r2, #0x5AED
			b sc_out
sc_0x50EE:
			mov r1, #0x50EE
			mov r2, #0x5AEE
			b sc_out
sc_0x50EF:
			mov r1, #0x50EF
			mov r2, #0x5AEF
			b sc_out
sc_0x50F0:
			mov r1, #0x50F0
			mov r2, #0x5AF0
			b sc_out
sc_0x50F1:
			mov r1, #0x50F1
			mov r2, #0x5AF1
			b sc_out
sc_0x50F2:
			mov r1, #0x50F2
			mov r2, #0x5AF2
			b sc_out
sc_0x50F3:
			mov r1, #0x50F3
			mov r2, #0x5AF3
			b sc_out
sc_0x50F4:
			mov r1, #0x50F4
			mov r2, #0x5AF4
			b sc_out
sc_0x50F5:
			mov r1, #0x50F5
			mov r2, #0x5AF5
			b sc_out
sc_0x50F6:
			mov r1, #0x50F6
			mov r2, #0x5AF6
			b sc_out
sc_0x50F7:
			mov r1, #0x50F7
			mov r2, #0x5AF7
			b sc_out
sc_0x50F8:
			mov r1, #0x50F8
			mov r2, #0x5AF8
			b sc_out
sc_0x50F9:
			mov r1, #0x50F9
			mov r2, #0x5AF9
			b sc_out
sc_0x50FA:
			mov r1, #0x50FA
			mov r2, #0x5AFA
			b sc_out
sc_0x50FB:
			mov r1, #0x50FB
			mov r2, #0x5AFB
			b sc_out
sc_0x50FC:
			mov r1, #0x50FC
			mov r2, #0x5AFC
			b sc_out
sc_0x50FD:
			mov r1, #0x50FD
			mov r2, #0x5AFD
			b sc_out
sc_0x50FE:
			mov r1, #0x50FE
			mov r2, #0x5AFE
			b sc_out
sc_0x50FF:
			mov r1, #0x50FF
			mov r2, #0x5AFF
			b sc_out
sc_0x51E0:
			mov r1, #0x51E0
			mov r2, #0x5AE0
			b sc_out
sc_0x51E1:
			mov r1, #0x51E1
			mov r2, #0x5AE1
			b sc_out
sc_0x51E2:
			mov r1, #0x51E2
			mov r2, #0x5AE2
			b sc_out
sc_0x51E3:
			mov r1, #0x51E3
			mov r2, #0x5AE3
			b sc_out
sc_0x51E4:
			mov r1, #0x51E4
			mov r2, #0x5AE4
			b sc_out
sc_0x51E5:
			mov r1, #0x51E5
			mov r2, #0x5AE5
			b sc_out
sc_0x51E6:
			mov r1, #0x51E6
			mov r2, #0x5AE6
			b sc_out
sc_0x51E7:
			mov r1, #0x51E7
			mov r2, #0x5AE7
			b sc_out
sc_0x51E8:
			mov r1, #0x51E8
			mov r2, #0x5AE8
			b sc_out
sc_0x51E9:
			mov r1, #0x51E9
			mov r2, #0x5AE9
			b sc_out
sc_0x51EA:
			mov r1, #0x51EA
			mov r2, #0x5AEA
			b sc_out
sc_0x51EB:
			mov r1, #0x51EB
			mov r2, #0x5AEB
			b sc_out
sc_0x51EC:
			mov r1, #0x51EC
			mov r2, #0x5AEC
			b sc_out
sc_0x51ED:
			mov r1, #0x51ED
			mov r2, #0x5AED
			b sc_out
sc_0x51EE:
			mov r1, #0x51EE
			mov r2, #0x5AEE
			b sc_out
sc_0x51EF:
			mov r1, #0x51EF
			mov r2, #0x5AEF
			b sc_out
sc_0x51F0:
			mov r1, #0x51F0
			mov r2, #0x5AF0
			b sc_out
sc_0x51F1:
			mov r1, #0x51F1
			mov r2, #0x5AF1
			b sc_out
sc_0x51F2:
			mov r1, #0x51F2
			mov r2, #0x5AF2
			b sc_out
sc_0x51F3:
			mov r1, #0x51F3
			mov r2, #0x5AF3
			b sc_out
sc_0x51F4:
			mov r1, #0x51F4
			mov r2, #0x5AF4
			b sc_out
sc_0x51F5:
			mov r1, #0x51F5
			mov r2, #0x5AF5
			b sc_out
sc_0x51F6:
			mov r1, #0x51F6
			mov r2, #0x5AF6
			b sc_out
sc_0x51F7:
			mov r1, #0x51F7
			mov r2, #0x5AF7
			b sc_out
sc_0x51F8:
			mov r1, #0x51F8
			mov r2, #0x5AF8
			b sc_out
sc_0x51F9:
			mov r1, #0x51F9
			mov r2, #0x5AF9
			b sc_out
sc_0x51FA:
			mov r1, #0x51FA
			mov r2, #0x5AFA
			b sc_out
sc_0x51FB:
			mov r1, #0x51FB
			mov r2, #0x5AFB
			b sc_out
sc_0x51FC:
			mov r1, #0x51FC
			mov r2, #0x5AFC
			b sc_out
sc_0x51FD:
			mov r1, #0x51FD
			mov r2, #0x5AFD
			b sc_out
sc_0x51FE:
			mov r1, #0x51FE
			mov r2, #0x5AFE
			b sc_out
sc_0x51FF:
			mov r1, #0x51FF
			mov r2, #0x5AFF
			b sc_out
sc_0x52E0:
			mov r1, #0x52E0
			mov r2, #0x5AE0
			b sc_out
sc_0x52E1:
			mov r1, #0x52E1
			mov r2, #0x5AE1
			b sc_out
sc_0x52E2:
			mov r1, #0x52E2
			mov r2, #0x5AE2
			b sc_out
sc_0x52E3:
			mov r1, #0x52E3
			mov r2, #0x5AE3
			b sc_out
sc_0x52E4:
			mov r1, #0x52E4
			mov r2, #0x5AE4
			b sc_out
sc_0x52E5:
			mov r1, #0x52E5
			mov r2, #0x5AE5
			b sc_out
sc_0x52E6:
			mov r1, #0x52E6
			mov r2, #0x5AE6
			b sc_out
sc_0x52E7:
			mov r1, #0x52E7
			mov r2, #0x5AE7
			b sc_out
sc_0x52E8:
			mov r1, #0x52E8
			mov r2, #0x5AE8
			b sc_out
sc_0x52E9:
			mov r1, #0x52E9
			mov r2, #0x5AE9
			b sc_out
sc_0x52EA:
			mov r1, #0x52EA
			mov r2, #0x5AEA
			b sc_out
sc_0x52EB:
			mov r1, #0x52EB
			mov r2, #0x5AEB
			b sc_out
sc_0x52EC:
			mov r1, #0x52EC
			mov r2, #0x5AEC
			b sc_out
sc_0x52ED:
			mov r1, #0x52ED
			mov r2, #0x5AED
			b sc_out
sc_0x52EE:
			mov r1, #0x52EE
			mov r2, #0x5AEE
			b sc_out
sc_0x52EF:
			mov r1, #0x52EF
			mov r2, #0x5AEF
			b sc_out
sc_0x52F0:
			mov r1, #0x52F0
			mov r2, #0x5AF0
			b sc_out
sc_0x52F1:
			mov r1, #0x52F1
			mov r2, #0x5AF1
			b sc_out
sc_0x52F2:
			mov r1, #0x52F2
			mov r2, #0x5AF2
			b sc_out
sc_0x52F3:
			mov r1, #0x52F3
			mov r2, #0x5AF3
			b sc_out
sc_0x52F4:
			mov r1, #0x52F4
			mov r2, #0x5AF4
			b sc_out
sc_0x52F5:
			mov r1, #0x52F5
			mov r2, #0x5AF5
			b sc_out
sc_0x52F6:
			mov r1, #0x52F6
			mov r2, #0x5AF6
			b sc_out
sc_0x52F7:
			mov r1, #0x52F7
			mov r2, #0x5AF7
			b sc_out
sc_0x52F8:
			mov r1, #0x52F8
			mov r2, #0x5AF8
			b sc_out
sc_0x52F9:
			mov r1, #0x52F9
			mov r2, #0x5AF9
			b sc_out
sc_0x52FA:
			mov r1, #0x52FA
			mov r2, #0x5AFA
			b sc_out
sc_0x52FB:
			mov r1, #0x52FB
			mov r2, #0x5AFB
			b sc_out
sc_0x52FC:
			mov r1, #0x52FC
			mov r2, #0x5AFC
			b sc_out
sc_0x52FD:
			mov r1, #0x52FD
			mov r2, #0x5AFD
			b sc_out
sc_0x52FE:
			mov r1, #0x52FE
			mov r2, #0x5AFE
			b sc_out
sc_0x52FF:
			mov r1, #0x52FF
			mov r2, #0x5AFF
			b sc_out
sc_0x53E0:
			mov r1, #0x53E0
			mov r2, #0x5AE0
			b sc_out
sc_0x53E1:
			mov r1, #0x53E1
			mov r2, #0x5AE1
			b sc_out
sc_0x53E2:
			mov r1, #0x53E2
			mov r2, #0x5AE2
			b sc_out
sc_0x53E3:
			mov r1, #0x53E3
			mov r2, #0x5AE3
			b sc_out
sc_0x53E4:
			mov r1, #0x53E4
			mov r2, #0x5AE4
			b sc_out
sc_0x53E5:
			mov r1, #0x53E5
			mov r2, #0x5AE5
			b sc_out
sc_0x53E6:
			mov r1, #0x53E6
			mov r2, #0x5AE6
			b sc_out
sc_0x53E7:
			mov r1, #0x53E7
			mov r2, #0x5AE7
			b sc_out
sc_0x53E8:
			mov r1, #0x53E8
			mov r2, #0x5AE8
			b sc_out
sc_0x53E9:
			mov r1, #0x53E9
			mov r2, #0x5AE9
			b sc_out
sc_0x53EA:
			mov r1, #0x53EA
			mov r2, #0x5AEA
			b sc_out
sc_0x53EB:
			mov r1, #0x53EB
			mov r2, #0x5AEB
			b sc_out
sc_0x53EC:
			mov r1, #0x53EC
			mov r2, #0x5AEC
			b sc_out
sc_0x53ED:
			mov r1, #0x53ED
			mov r2, #0x5AED
			b sc_out
sc_0x53EE:
			mov r1, #0x53EE
			mov r2, #0x5AEE
			b sc_out
sc_0x53EF:
			mov r1, #0x53EF
			mov r2, #0x5AEF
			b sc_out
sc_0x53F0:
			mov r1, #0x53F0
			mov r2, #0x5AF0
			b sc_out
sc_0x53F1:
			mov r1, #0x53F1
			mov r2, #0x5AF1
			b sc_out
sc_0x53F2:
			mov r1, #0x53F2
			mov r2, #0x5AF2
			b sc_out
sc_0x53F3:
			mov r1, #0x53F3
			mov r2, #0x5AF3
			b sc_out
sc_0x53F4:
			mov r1, #0x53F4
			mov r2, #0x5AF4
			b sc_out
sc_0x53F5:
			mov r1, #0x53F5
			mov r2, #0x5AF5
			b sc_out
sc_0x53F6:
			mov r1, #0x53F6
			mov r2, #0x5AF6
			b sc_out
sc_0x53F7:
			mov r1, #0x53F7
			mov r2, #0x5AF7
			b sc_out
sc_0x53F8:
			mov r1, #0x53F8
			mov r2, #0x5AF8
			b sc_out
sc_0x53F9:
			mov r1, #0x53F9
			mov r2, #0x5AF9
			b sc_out
sc_0x53FA:
			mov r1, #0x53FA
			mov r2, #0x5AFA
			b sc_out
sc_0x53FB:
			mov r1, #0x53FB
			mov r2, #0x5AFB
			b sc_out
sc_0x53FC:
			mov r1, #0x53FC
			mov r2, #0x5AFC
			b sc_out
sc_0x53FD:
			mov r1, #0x53FD
			mov r2, #0x5AFD
			b sc_out
sc_0x53FE:
			mov r1, #0x53FE
			mov r2, #0x5AFE
			b sc_out
sc_0x53FF:
			mov r1, #0x53FF
			mov r2, #0x5AFF
			b sc_out
sc_0x54E0:
			mov r1, #0x54E0
			mov r2, #0x5AE0
			b sc_out
sc_0x54E1:
			mov r1, #0x54E1
			mov r2, #0x5AE1
			b sc_out
sc_0x54E2:
			mov r1, #0x54E2
			mov r2, #0x5AE2
			b sc_out
sc_0x54E3:
			mov r1, #0x54E3
			mov r2, #0x5AE3
			b sc_out
sc_0x54E4:
			mov r1, #0x54E4
			mov r2, #0x5AE4
			b sc_out
sc_0x54E5:
			mov r1, #0x54E5
			mov r2, #0x5AE5
			b sc_out
sc_0x54E6:
			mov r1, #0x54E6
			mov r2, #0x5AE6
			b sc_out
sc_0x54E7:
			mov r1, #0x54E7
			mov r2, #0x5AE7
			b sc_out
sc_0x54E8:
			mov r1, #0x54E8
			mov r2, #0x5AE8
			b sc_out
sc_0x54E9:
			mov r1, #0x54E9
			mov r2, #0x5AE9
			b sc_out
sc_0x54EA:
			mov r1, #0x54EA
			mov r2, #0x5AEA
			b sc_out
sc_0x54EB:
			mov r1, #0x54EB
			mov r2, #0x5AEB
			b sc_out
sc_0x54EC:
			mov r1, #0x54EC
			mov r2, #0x5AEC
			b sc_out
sc_0x54ED:
			mov r1, #0x54ED
			mov r2, #0x5AED
			b sc_out
sc_0x54EE:
			mov r1, #0x54EE
			mov r2, #0x5AEE
			b sc_out
sc_0x54EF:
			mov r1, #0x54EF
			mov r2, #0x5AEF
			b sc_out
sc_0x54F0:
			mov r1, #0x54F0
			mov r2, #0x5AF0
			b sc_out
sc_0x54F1:
			mov r1, #0x54F1
			mov r2, #0x5AF1
			b sc_out
sc_0x54F2:
			mov r1, #0x54F2
			mov r2, #0x5AF2
			b sc_out
sc_0x54F3:
			mov r1, #0x54F3
			mov r2, #0x5AF3
			b sc_out
sc_0x54F4:
			mov r1, #0x54F4
			mov r2, #0x5AF4
			b sc_out
sc_0x54F5:
			mov r1, #0x54F5
			mov r2, #0x5AF5
			b sc_out
sc_0x54F6:
			mov r1, #0x54F6
			mov r2, #0x5AF6
			b sc_out
sc_0x54F7:
			mov r1, #0x54F7
			mov r2, #0x5AF7
			b sc_out
sc_0x54F8:
			mov r1, #0x54F8
			mov r2, #0x5AF8
			b sc_out
sc_0x54F9:
			mov r1, #0x54F9
			mov r2, #0x5AF9
			b sc_out
sc_0x54FA:
			mov r1, #0x54FA
			mov r2, #0x5AFA
			b sc_out
sc_0x54FB:
			mov r1, #0x54FB
			mov r2, #0x5AFB
			b sc_out
sc_0x54FC:
			mov r1, #0x54FC
			mov r2, #0x5AFC
			b sc_out
sc_0x54FD:
			mov r1, #0x54FD
			mov r2, #0x5AFD
			b sc_out
sc_0x54FE:
			mov r1, #0x54FE
			mov r2, #0x5AFE
			b sc_out
sc_0x54FF:
			mov r1, #0x54FF
			mov r2, #0x5AFF
			b sc_out
sc_0x55E0:
			mov r1, #0x55E0
			mov r2, #0x5AE0
			b sc_out
sc_0x55E1:
			mov r1, #0x55E1
			mov r2, #0x5AE1
			b sc_out
sc_0x55E2:
			mov r1, #0x55E2
			mov r2, #0x5AE2
			b sc_out
sc_0x55E3:
			mov r1, #0x55E3
			mov r2, #0x5AE3
			b sc_out
sc_0x55E4:
			mov r1, #0x55E4
			mov r2, #0x5AE4
			b sc_out
sc_0x55E5:
			mov r1, #0x55E5
			mov r2, #0x5AE5
			b sc_out
sc_0x55E6:
			mov r1, #0x55E6
			mov r2, #0x5AE6
			b sc_out
sc_0x55E7:
			mov r1, #0x55E7
			mov r2, #0x5AE7
			b sc_out
sc_0x55E8:
			mov r1, #0x55E8
			mov r2, #0x5AE8
			b sc_out
sc_0x55E9:
			mov r1, #0x55E9
			mov r2, #0x5AE9
			b sc_out
sc_0x55EA:
			mov r1, #0x55EA
			mov r2, #0x5AEA
			b sc_out
sc_0x55EB:
			mov r1, #0x55EB
			mov r2, #0x5AEB
			b sc_out
sc_0x55EC:
			mov r1, #0x55EC
			mov r2, #0x5AEC
			b sc_out
sc_0x55ED:
			mov r1, #0x55ED
			mov r2, #0x5AED
			b sc_out
sc_0x55EE:
			mov r1, #0x55EE
			mov r2, #0x5AEE
			b sc_out
sc_0x55EF:
			mov r1, #0x55EF
			mov r2, #0x5AEF
			b sc_out
sc_0x55F0:
			mov r1, #0x55F0
			mov r2, #0x5AF0
			b sc_out
sc_0x55F1:
			mov r1, #0x55F1
			mov r2, #0x5AF1
			b sc_out
sc_0x55F2:
			mov r1, #0x55F2
			mov r2, #0x5AF2
			b sc_out
sc_0x55F3:
			mov r1, #0x55F3
			mov r2, #0x5AF3
			b sc_out
sc_0x55F4:
			mov r1, #0x55F4
			mov r2, #0x5AF4
			b sc_out
sc_0x55F5:
			mov r1, #0x55F5
			mov r2, #0x5AF5
			b sc_out
sc_0x55F6:
			mov r1, #0x55F6
			mov r2, #0x5AF6
			b sc_out
sc_0x55F7:
			mov r1, #0x55F7
			mov r2, #0x5AF7
			b sc_out
sc_0x55F8:
			mov r1, #0x55F8
			mov r2, #0x5AF8
			b sc_out
sc_0x55F9:
			mov r1, #0x55F9
			mov r2, #0x5AF9
			b sc_out
sc_0x55FA:
			mov r1, #0x55FA
			mov r2, #0x5AFA
			b sc_out
sc_0x55FB:
			mov r1, #0x55FB
			mov r2, #0x5AFB
			b sc_out
sc_0x55FC:
			mov r1, #0x55FC
			mov r2, #0x5AFC
			b sc_out
sc_0x55FD:
			mov r1, #0x55FD
			mov r2, #0x5AFD
			b sc_out
sc_0x55FE:
			mov r1, #0x55FE
			mov r2, #0x5AFE
			b sc_out
sc_0x55FF:
			mov r1, #0x55FF
			mov r2, #0x5AFF
			b sc_out
sc_0x56E0:
			mov r1, #0x56E0
			mov r2, #0x5AE0
			b sc_out
sc_0x56E1:
			mov r1, #0x56E1
			mov r2, #0x5AE1
			b sc_out
sc_0x56E2:
			mov r1, #0x56E2
			mov r2, #0x5AE2
			b sc_out
sc_0x56E3:
			mov r1, #0x56E3
			mov r2, #0x5AE3
			b sc_out
sc_0x56E4:
			mov r1, #0x56E4
			mov r2, #0x5AE4
			b sc_out
sc_0x56E5:
			mov r1, #0x56E5
			mov r2, #0x5AE5
			b sc_out
sc_0x56E6:
			mov r1, #0x56E6
			mov r2, #0x5AE6
			b sc_out
sc_0x56E7:
			mov r1, #0x56E7
			mov r2, #0x5AE7
			b sc_out
sc_0x56E8:
			mov r1, #0x56E8
			mov r2, #0x5AE8
			b sc_out
sc_0x56E9:
			mov r1, #0x56E9
			mov r2, #0x5AE9
			b sc_out
sc_0x56EA:
			mov r1, #0x56EA
			mov r2, #0x5AEA
			b sc_out
sc_0x56EB:
			mov r1, #0x56EB
			mov r2, #0x5AEB
			b sc_out
sc_0x56EC:
			mov r1, #0x56EC
			mov r2, #0x5AEC
			b sc_out
sc_0x56ED:
			mov r1, #0x56ED
			mov r2, #0x5AED
			b sc_out
sc_0x56EE:
			mov r1, #0x56EE
			mov r2, #0x5AEE
			b sc_out
sc_0x56EF:
			mov r1, #0x56EF
			mov r2, #0x5AEF
			b sc_out
sc_0x56F0:
			mov r1, #0x56F0
			mov r2, #0x5AF0
			b sc_out
sc_0x56F1:
			mov r1, #0x56F1
			mov r2, #0x5AF1
			b sc_out
sc_0x56F2:
			mov r1, #0x56F2
			mov r2, #0x5AF2
			b sc_out
sc_0x56F3:
			mov r1, #0x56F3
			mov r2, #0x5AF3
			b sc_out
sc_0x56F4:
			mov r1, #0x56F4
			mov r2, #0x5AF4
			b sc_out
sc_0x56F5:
			mov r1, #0x56F5
			mov r2, #0x5AF5
			b sc_out
sc_0x56F6:
			mov r1, #0x56F6
			mov r2, #0x5AF6
			b sc_out
sc_0x56F7:
			mov r1, #0x56F7
			mov r2, #0x5AF7
			b sc_out
sc_0x56F8:
			mov r1, #0x56F8
			mov r2, #0x5AF8
			b sc_out
sc_0x56F9:
			mov r1, #0x56F9
			mov r2, #0x5AF9
			b sc_out
sc_0x56FA:
			mov r1, #0x56FA
			mov r2, #0x5AFA
			b sc_out
sc_0x56FB:
			mov r1, #0x56FB
			mov r2, #0x5AFB
			b sc_out
sc_0x56FC:
			mov r1, #0x56FC
			mov r2, #0x5AFC
			b sc_out
sc_0x56FD:
			mov r1, #0x56FD
			mov r2, #0x5AFD
			b sc_out
sc_0x56FE:
			mov r1, #0x56FE
			mov r2, #0x5AFE
			b sc_out
sc_0x56FF:
			mov r1, #0x56FF
			mov r2, #0x5AFF
			b sc_out
sc_0x57E0:
			mov r1, #0x57E0
			mov r2, #0x5AE0
			b sc_out
sc_0x57E1:
			mov r1, #0x57E1
			mov r2, #0x5AE1
			b sc_out
sc_0x57E2:
			mov r1, #0x57E2
			mov r2, #0x5AE2
			b sc_out
sc_0x57E3:
			mov r1, #0x57E3
			mov r2, #0x5AE3
			b sc_out
sc_0x57E4:
			mov r1, #0x57E4
			mov r2, #0x5AE4
			b sc_out
sc_0x57E5:
			mov r1, #0x57E5
			mov r2, #0x5AE5
			b sc_out
sc_0x57E6:
			mov r1, #0x57E6
			mov r2, #0x5AE6
			b sc_out
sc_0x57E7:
			mov r1, #0x57E7
			mov r2, #0x5AE7
			b sc_out
sc_0x57E8:
			mov r1, #0x57E8
			mov r2, #0x5AE8
			b sc_out
sc_0x57E9:
			mov r1, #0x57E9
			mov r2, #0x5AE9
			b sc_out
sc_0x57EA:
			mov r1, #0x57EA
			mov r2, #0x5AEA
			b sc_out
sc_0x57EB:
			mov r1, #0x57EB
			mov r2, #0x5AEB
			b sc_out
sc_0x57EC:
			mov r1, #0x57EC
			mov r2, #0x5AEC
			b sc_out
sc_0x57ED:
			mov r1, #0x57ED
			mov r2, #0x5AED
			b sc_out
sc_0x57EE:
			mov r1, #0x57EE
			mov r2, #0x5AEE
			b sc_out
sc_0x57EF:
			mov r1, #0x57EF
			mov r2, #0x5AEF
			b sc_out
sc_0x57F0:
			mov r1, #0x57F0
			mov r2, #0x5AF0
			b sc_out
sc_0x57F1:
			mov r1, #0x57F1
			mov r2, #0x5AF1
			b sc_out
sc_0x57F2:
			mov r1, #0x57F2
			mov r2, #0x5AF2
			b sc_out
sc_0x57F3:
			mov r1, #0x57F3
			mov r2, #0x5AF3
			b sc_out
sc_0x57F4:
			mov r1, #0x57F4
			mov r2, #0x5AF4
			b sc_out
sc_0x57F5:
			mov r1, #0x57F5
			mov r2, #0x5AF5
			b sc_out
sc_0x57F6:
			mov r1, #0x57F6
			mov r2, #0x5AF6
			b sc_out
sc_0x57F7:
			mov r1, #0x57F7
			mov r2, #0x5AF7
			b sc_out
sc_0x57F8:
			mov r1, #0x57F8
			mov r2, #0x5AF8
			b sc_out
sc_0x57F9:
			mov r1, #0x57F9
			mov r2, #0x5AF9
			b sc_out
sc_0x57FA:
			mov r1, #0x57FA
			mov r2, #0x5AFA
			b sc_out
sc_0x57FB:
			mov r1, #0x57FB
			mov r2, #0x5AFB
			b sc_out
sc_0x57FC:
			mov r1, #0x57FC
			mov r2, #0x5AFC
			b sc_out
sc_0x57FD:
			mov r1, #0x57FD
			mov r2, #0x5AFD
			b sc_out
sc_0x57FE:
			mov r1, #0x57FE
			mov r2, #0x5AFE
			b sc_out
sc_0x57FF:
			mov r1, #0x57FF
			mov r2, #0x5AFF
			b sc_out


sc_out: //display screen
			ldrb r1, [r5, r1]//pixel
			ldrb r2, [r5, r2]//attribute
			tst r2, #0x80
			beq sc_no_flash
			tst r3, #0x100000
			bne sc_no_flash
			eor r1, r1, #0xff
sc_no_flash:
			and r2, r2, #0x7f
			add r2, r1, r2, lsl #8
			add r1, r6, r2, lsl #4

			mov r2, r7
			add r2, r2, r4, lsl #4

sc_out_trc:
			ldr r0, [r11, #0x0000]
			tst r0, #0x820
			beq sc_out_trc
			mov r0, #0xffff
			str r0, [r11, #0x0008]

			str r1, [r11, #0x0030]
			str r2, [r11, #0x0034]
			str r8, [r11, #0x0028]

count:
			add r3, #1
			add r4, #1
			cmp r4, #6144
			bne loop1
			mov r4, #0
			b loop

reg_init: //initialization of registers with addresses of memory and peripherals
			ldr r3, =counter_start
			ldr r4, =counter_start
			ldr r5, =memory
			ldr r6, =screen_data
			ldr r7, =screen1_buf
			ldr r8, =0x00022e81//dma en
			ldr r9, =disable
			ldr r10, =enable
			ldr r11, =DMA2_BASE
			ldr r12, =TIM13_BASE
			//ldr r12, =TIM11_BB_SR_UIF

			str r8, [r11, #0x0028] //first transmit for set flag TCIF (transmit complete)
			b loop
