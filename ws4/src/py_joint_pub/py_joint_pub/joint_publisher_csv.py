import rclpy
from rclpy.node import Node
from sensor_msgs.msg import JointState
import pandas as pd
import pkg_resources
import numpy as np
import os

class JointPublisherCSV(Node):

    def __init__(self):
        super().__init__('joint_publisher_csv')
        self.publisher_ = self.create_publisher(JointState, 'joint_states', 10)
        timer_period = 1/500 # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.i = 0
        
        filename = 'ldihel.csv' # change this line of code. The provided CSV file (ldihel.csv) is incomplete
        csv_file = pkg_resources.resource_filename('py_joint_pub', f'../resource/{filename}')
        self.df = pd.read_csv(csv_file)
        self.df_length = len(self.df)

    def timer_callback(self):
        
        msg = JointState()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.name = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint',
                    'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
        
        msg.position = self.df.iloc[self.i, 1:-1].tolist()
        
        msg.velocity = []
        msg.effort = []
        
        self.publisher_.publish(msg)
        
        self.i += 1
        self.i %= self.df_length # loop back to the beginning of the csv file


def main(args=None):
    rclpy.init(args=args)

    node = JointPublisherCSV()

    rclpy.spin(node)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()