from setuptools import find_packages, setup
from glob import glob
package_name = 'py_joint_pub'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name, glob('resource/*.csv')), # include all csv files
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Logan Dihel',
    maintainer_email='ldihel@purdue.edu',
    description='ros node to publish joint states to the ur3e robot',
    license='Apache-2.0',
    entry_points={
        'console_scripts': [
            'csv = py_joint_pub.joint_publisher_csv:main',
        ],
    },
)
