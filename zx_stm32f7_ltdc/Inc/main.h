/**
  ******************************************************************************
  * File Name          : main.hpp
  * Description        : This file contains the common defines of the application
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2018 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H
  /* Includes ------------------------------------------------------------------*/

/* Includes ------------------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/

#define zx80_A8_kb_Pin GPIO_PIN_8
#define zx80_A8_kb_GPIO_Port GPIOF
#define zx80_A9_kb_Pin GPIO_PIN_9
#define zx80_A9_kb_GPIO_Port GPIOF
#define zx80_A10_kb_Pin GPIO_PIN_10
#define zx80_A10_kb_GPIO_Port GPIOF
#define zx80_A11_kb_Pin GPIO_PIN_11
#define zx80_A11_kb_GPIO_Port GPIOF
#define zx80_A12_kb_Pin GPIO_PIN_12
#define zx80_A12_kb_GPIO_Port GPIOF
#define zx80_A13_kb_Pin GPIO_PIN_13
#define zx80_A13_kb_GPIO_Port GPIOF
#define kbzx80_A14_kb_Pin GPIO_PIN_14
#define kbzx80_A14_kb_GPIO_Port GPIOF
#define zx80_A15_kb_Pin GPIO_PIN_15
#define zx80_A15_kb_GPIO_Port GPIOF
#define z80_D0_kb_Pin GPIO_PIN_0
#define z80_D0_kb_GPIO_Port GPIOG
#define z80_D1_kb_Pin GPIO_PIN_1
#define z80_D1_kb_GPIO_Port GPIOG
#define LED_red_Pin GPIO_PIN_14
#define LED_red_GPIO_Port GPIOB
#define z80_D2_kb_Pin GPIO_PIN_2
#define z80_D2_kb_GPIO_Port GPIOG
#define z80_D3_kb_Pin GPIO_PIN_3
#define z80_D3_kb_GPIO_Port GPIOG
#define z80_D4_kb_Pin GPIO_PIN_4
#define z80_D4_kb_GPIO_Port GPIOG
#define z80_D5_Pin GPIO_PIN_5
#define z80_D5_GPIO_Port GPIOG
#define z80_D6_rec_in_Pin GPIO_PIN_6
#define z80_D6_rec_in_GPIO_Port GPIOG
#define z80_D7_Pin GPIO_PIN_7
#define z80_D7_GPIO_Port GPIOG
#define z80_D3_rec_out_Pin GPIO_PIN_3
#define z80_D3_rec_out_GPIO_Port GPIOD
#define z80_D4_beeper_Pin GPIO_PIN_4
#define z80_D4_beeper_GPIO_Port GPIOD
#define LED_blue_Pin GPIO_PIN_7
#define LED_blue_GPIO_Port GPIOB

/* ########################## Assert Selection ############################## */
/**
  * @brief Uncomment the line below to expanse the "assert_param" macro in the 
  *        HAL drivers code
  */
/* #define USE_FULL_ASSERT    1U */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
 extern "C" {
#endif
void _Error_Handler(char *, int);

#define Error_Handler() _Error_Handler(__FILE__, __LINE__)
#ifdef __cplusplus
}
#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

#endif /* __MAIN_H */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
