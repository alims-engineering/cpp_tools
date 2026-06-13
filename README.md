
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

### Method 2: Git Clone
#### Linux
Clone the repository:

```bash
git clone https://github.com/alims-engineering/cpp_tools.git "/AAA_Alims_Core/cpp_tools"
```

Then add the following line to your CMakeLists.txt:

```cmake
add_subdirectory("/AAA_Alims_Core/cpp_tools")
```

#### Windows
Clone the repository:

```bash
git clone https://github.com/alims-engineering/cpp_tools.git "C:/AAA_Alims_Core/cpp_tools"
```

Then add the following line to your CMakeLists.txt:

```cmake
add_subdirectory("C:/AAA_Alims_Core/cpp_tools")
```


- [docs/raw_eng/README.md](docs/raw_eng/README.md)
