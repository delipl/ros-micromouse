cmake_minimum_required(VERSION 3.8)
project(micromouse_robot)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(tf2 REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

add_executable(micromouse_robot
  src/rclcpp_range_sensor.cpp
  src/rclcpp_motors.cpp
  src/rclcpp_imu.cpp
  src/pid_controller.cpp
  src/robot.cpp

  src/micromouse_robot.cpp
  )

target_include_directories(
  micromouse_robot
  PUBLIC
  include
)

ament_target_dependencies(micromouse_robot rclcpp sensor_msgs nav_msgs tf2)

install(TARGETS
  micromouse_robot
  DESTINATION lib/${PROJECT_NAME})

install(DIRECTORY launch
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
