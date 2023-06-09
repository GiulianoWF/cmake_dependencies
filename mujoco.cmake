if (TARGET mujoco::mujoco)
else()

    include(FetchContent)

    FetchContent_Declare(
        mujoco
        GIT_REPOSITORY https://github.com/deepmind/mujoco.git
        GIT_TAG 2.3.2 #main
    )

    FetchContent_GetProperties(mujoco)
    if(NOT mujoco_POPULATED)
        FetchContent_Populate(mujoco)
        set(MUJOCO_BUILD_EXAMPLES OFF)
        set(MUJOCO_BUILD_TESTS OFF)
        set(MUJOCO_TEST_PYTHON_UTIL OFF)
        # set(MUJOCO_BUILD_SIMULATE OFF)
        # Prevent targets from being added to the ALL build. As a result only dependencies referenced
        # in other targets will be built. INSTALL target will not be built for example.
        add_subdirectory(${mujoco_SOURCE_DIR} ${mujoco_BINARY_DIR} ) # EXCLUDE_FROM_ALL)
    endif()

    set_target_properties( simulate
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        OUTPUT_NAME "simulation"
    )

    if (UNIX)
        set_target_properties( mujoco
            PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib"
        )
    else (WINDOWS)
        set_target_properties( mujoco
            PROPERTIES
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin"
        )
    endif()

endif()
