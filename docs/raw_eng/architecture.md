

# cpp-tools 文件夹架构介绍
```asgl
project/                                    # 顶层仓库根目录
├── README.md                               # 项目说明（如何构建、如何贡献、模块说明） # 必备
├── LICENSE                                 # 许可证文件（MIT/Apache 等）                   # 必备
├── CMakeLists.txt                          # 顶层 CMake：定义项目名、option、子目录、安装规则
├── cmake/                                  
├── docs/                                   # 项目文档（架构、设计决策、接口规范、贡献指南等） # 推荐
│   ├── raw/
│   └── chs/
├── include/                                # 对外统一头文件入口（公开 API）                   # 保持对外稳定 ABI
│   └── cpptools/                           # 把所有对外头按照项目/命名空间组织，避免全局冲突
│       ├── core/
│       │   ├── category_a/
│       │   └── category_b/
│       ├── framework/
│       │   ├── category_a/
│       │   └── category_b/
│       └── modules/
│           ├── category_a/
│           └── category_b/
├── src/                                        # 实现文件（对应 include 中的接口）               # 源码集中实现
│   └── cpptools/                           # 把所有对外头按照项目/命名空间组织，避免全局冲突
│       ├── core/
│       │   ├── category_a/
│       │   └── category_b/
│       ├── framework/
│       │   ├── category_a/
│       │   └── category_b/
│       └── modules/
│           ├── category_a/
│           └── category_b/
│        
├── tools/                                  # 开发或构建辅助工具（脚本、小程序）               # 自动化脚本
├── ci/                                     # CI 配置（GitHub Actions / GitLab CI / Jenkins）  # 推荐
│   └── github/
        └── build-and-test.yml

```
