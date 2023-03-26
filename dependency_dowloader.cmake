include(FetchContent)

function(download_dependency dep_name)

if (TARGET download_${dep_name})
else()
    FetchContent_Declare( download_${dep_name}
        URL "https://raw.githubusercontent.com/GiulianoWF/cmake_dependencies/main/${dep_name}.cmake"
        # URL_HASH SHA256=${hash}
        DOWNLOAD_NO_EXTRACT true
        TLS_VERIFY true
    )

    FetchContent_Populate( download_${dep_name}
        SOURCE_DIR "${CMAKE_BINARY_DIR}/downloaded"
        URL "https://raw.githubusercontent.com/GiulianoWF/cmake_dependencies/main/${dep_name}.cmake"
        DOWNLOAD_NO_EXTRACT true
    )

    include("${CMAKE_BINARY_DIR}/downloaded/${dep_name}.cmake")
endif()
endfunction(download_dependency)
