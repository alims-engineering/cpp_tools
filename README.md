
# cpp_tools

## Introduction

## Installation

### Method 1: FetchContent

Add the following content to your CMakeLists.txt:

```cmake
include(FetchContent)

FetchContent_Declare(
    cpp_tools
    GIT_REPOSITORY https://github.com/alims-engineering/cpp_tools.git
    GIT_TAG main
)

FetchContent_MakeAvailable(cpp_tools)
```
- [docs/raw_eng/README.md](docs/raw_eng/README.md)