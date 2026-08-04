# PIC32MZ2048ECH064
This MCU model is no longer supported by MCC generator. 

## Configuration:
- external EC 24MHz
- FreeRTOS v11.1.0

## System configuration:
- SYSCLK = 100MHz
- PBCLK1 = 50MHz
- PBCLK2 = 50MHz
- PBCLK3 = 50MHz
- PBCLK4 = 50MHz
- PBCLK5 = 50MHz
- PBCLK7 = 100MHz
- PBCLK8 = 50MHz
- USB Clock = 48MHz

## LED configuration:
| Name | Port | Pin |
|------|------|-----|
| LED1 | RF3  | 38  |
| LED2 | RF4  | 41  |
| LED3 | RF5  | 42  |

## SPI configuration for TFT 2.2" ILI9341:
| Name     | Port |
|----------|------|
| CS       | RD9  |
| RESET    | RD10 |
| DC       | RD11 |
| SDI/MOSI | RD0  |
| SCK      | RD1  |
| LED      | RD2  |
| SDO/MISO | RD3  |

## CAN1 configuration:
| Name | Port |
|------|------|
| TX   | RG8  |
| RX   | RG7  |