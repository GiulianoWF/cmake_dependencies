# Cmake easy dependencies

## Installing
In order to use this repository, copy the file 'dependency_dowloader.cmake' to your Cmake project, then:
```cmake
include(dependency_dowloader.cmake)
```

## Using
To download a dependency available in this repository just call the function:
```cmake
download_dependency(zeromq)
```
