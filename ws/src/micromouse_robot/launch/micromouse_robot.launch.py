from launch import LaunchDescription
import launch_ros.actions


def generate_launch_description():
    return LaunchDescription([
        launch_ros.actions.Node(
            namespace="micromouse",
            package='micromouse_robot',
            executable='micromouse_robot'
        ),
    ])
