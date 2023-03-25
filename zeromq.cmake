if (TARGET libzmq)
else()
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED true)

    include(FetchContent)

    #windows compatibility
    set(WITH_LIBSODIUM false CACHE BOOL "set to off to windows compatibility")

    FetchContent_Declare(
        zmq
        GIT_REPOSITORY https://github.com/zeromq/libzmq.git
        GIT_TAG        v4.3.4
    )
    FetchContent_MakeAvailable(zmq)


    install(TARGETS libzmq EXPORT ${PROJECT_NAME})

    install(
        EXPORT ${PROJECT_NAME}
        DESTINATION "${CMAKE_INSTALL_DATADIR}/libzmq"
    )

    if (UNIX)
        set_target_properties( libzmq
            PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
        )
    else (WINDOWS)
        set_target_properties( libzmq
            PROPERTIES
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        )
    endif()

endif()
