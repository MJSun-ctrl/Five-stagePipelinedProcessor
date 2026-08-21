# Five-stage Pipelined Processor

基于 Verilog HDL 实现的五级流水线处理器设计项目。

本项目围绕处理器微架构设计展开，实现并逐步优化一个支持流水线执行的 CPU，包括：

- 五级流水线处理器设计
- 流水线数据冒险检测与处理
- 动态分支预测机制
- 指令 Cache 存储系统设计

项目基于 Vivado 开发环境，在 FPGA 平台上完成设计、仿真与验证。


## Project Overview

现代处理器通过流水线技术提高指令吞吐率，将一条指令的执行过程划分为多个阶段，使多条指令能够同时处于不同执行阶段。

本项目实现经典五级流水线结构：

```
IF  →  ID  →  EX  →  MEM  →  WB
```

其中：

- IF（Instruction Fetch）：指令获取
- ID（Instruction Decode）：指令译码
- EX（Execute）：执行运算
- MEM（Memory Access）：访存访问
- WB（Write Back）：结果写回


在基础流水线 CPU 上，进一步实现：

- 数据相关处理
- 控制相关优化
- Cache 加速访问

形成一个较完整的处理器设计流程。


---

# Repository Structure

```
Five-stagePipelinedProcessor
│
├── lab1
│   └── Five-stage Pipeline Processor
│
├── lab2
│   └── Branch Prediction Extension
│
└── lab3
    └── Instruction Cache Design
```

---

# Development Environment

## Hardware Platform

- FPGA Development Board:
  - Artix-7 FPGA Platform


## Software Environment

- Vivado FPGA Development Suite
- Verilog HDL


---

# Main Features


## 1. Five-stage Pipeline Processor

### Pipeline Architecture

处理器采用经典五级流水线结构：

```
+-----+-----+-----+-----+-----+
| IF  | ID  | EX  | MEM | WB  |
+-----+-----+-----+-----+-----+
```

通过流水线寄存器连接各阶段，实现多条指令并行执行，提高处理器吞吐率。


主要设计模块包括：

- Instruction Fetch Unit
- Instruction Decode Unit
- Execution Unit
- Memory Access Unit
- Write Back Unit
- Pipeline Register


---

## 2. Pipeline Hazard Handling

流水线执行过程中，不同指令之间可能存在数据相关问题。

本项目针对数据冒险（Data Hazard）设计相应处理机制：

### Data Forwarding

通过数据旁路（Forwarding / Bypass）机制：

- 减少等待周期
- 提高流水线执行效率
- 降低 RAW 数据相关造成的影响


### Pipeline Stall

对于无法通过旁路解决的数据依赖：

- 检测流水线冲突
- 暂停流水线推进
- 等待数据准备完成


通过上述机制保证流水线执行结果正确。


---

# 3. Dynamic Branch Prediction

分支指令会导致流水线控制相关问题。

为了减少分支造成的流水线停顿，在流水线 CPU 基础上增加动态分支预测模块。


主要实现：

- Branch Target Buffer（BTB）
- Branch Prediction Buffer（BPB）
- 动态预测状态维护


通过预测分支方向和目标地址，使处理器能够提前进行指令获取，提高流水线利用率。


---

# 4. Instruction Cache

为了降低处理器访问存储器的延迟，实现指令 Cache 模块。


主要功能包括：

- Cache 地址解析
- Cache 命中判断
- Cache Miss 处理
- 数据填充
- CPU 与存储系统接口设计


Cache 采用组相联结构设计：

- 2 路 / 4 路组相联
- 每路 128 行
- 每行 32 Bytes


通过 Cache 缓存热点指令，提高指令访问效率。


---

# Design Highlights


## Processor Pipeline Design

实现从单周期处理器向流水线处理器的结构演进：

```
Single Cycle CPU

        ↓

Five-stage Pipeline CPU

        ↓

Pipeline Optimization

        ↓

Branch Prediction + Cache
```


## Hardware Design

项目涉及：

- 数据通路设计
- 控制逻辑设计
- 流水线寄存器设计
- 存储系统接口设计


## Performance Optimization

通过：

- Forwarding
- Stall Control
- Branch Prediction
- Instruction Cache

降低流水线停顿，提高处理器运行效率。


---

# Verification

项目通过 Vivado 仿真环境进行验证，包括：

- 指令执行正确性验证
- 流水线时序验证
- 数据冒险处理验证
- 分支预测功能验证
- Cache 访问流程验证


---

# Future Improvements

未来可以继续扩展：

- 增加 Data Cache
- 支持更多指令类型
- 优化分支预测算法
- 引入更复杂 Cache 替换策略
- 完善 FPGA 上板测试


---

# Acknowledgement

感谢相关课程实验平台以及开源 FPGA 工具链提供的学习环境。


---

# Author

Mingjian Sun
```
