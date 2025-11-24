# Lab 4

Overleaf Assignment Link [here](https://www.overleaf.com/read/xwftfjrkwcqx#de76e1)

### Steps 1-3
For steps 1-3, you can use the MATLAB or Python starter code provided. First, make your own copy personal copy of the Lab 4 repo with the `Use This Template` button. Then, for MATLAB users, you will need to `git clone` this repository onto your personal computer via: If using Python, you have the option of cloning on your personal machine or on eceprog. If using eceprog, please run the `git clone` command from your home directory.


### Step 4


#### Instructions for non-eceprog users

If you are not using eceprog, you will need to download the UR description package to the `ws4/src` folder.
```bash
cd ~/ece569-fall2025/Lab4/ws4/src
git clone https://github.com/UniversalRobots/Universal_Robots_ROS2_Description.git
cd Universal_Robots_ROS2_Description
```
Then checkout the `humble` or `jazzy` branch, depending on which version of ROS you are using. For example:
```bash
git checkout origin/jazzy 
```

#### Instructions for all users

For all students, you will need to first edit `ws4/src/msee22_description/urdf/msee22.urdf.xacro` if you use humble (for jazzy, you can ignore this step). Follow the instructions on lines 89 and 95.

Then, build all packages. If you get an error, look for the Lab 4 update thread on Piazza - there might be a solution already posted there to your particular problem.
```bash
cd ~/ece569-fall2025/Lab4/ws4/
colcon build --symlink-install
source install/setup.bash
```

Now, check if you can view the robot on the table.
```bash
ros2 launch msee22_description view_room.launch.py
```

Next, check if the `py_joint_pub` package is working:
```bash
ros2 launch msee22_description move_robot.launch.py
```


In the `ws4/src/py_joint_pub/py_joint_pub/joint_publisher_csv.py` file, change line 18 to your filename. 
Also, copy and paste your `<username>.csv` file into the `ws4/src/py_joint_pub/py_joint_pub/resource` folder.
A good way to get your CSV file into eceprog is to upload the file to github, and then run `git pull` on eceprog to download the changes back onto eceprog. Then, you can move the `.csv` file to the `resource` folder. It is also possible to use `scp` (secure copy) to transfer the file from your personal computer to eceprog, similar to an ssh tunnel. There are instructions online if you choose to go down this path.

Once your have added your csv file to the `resource` folder, build and source your workspace. Then, run 
```bash
ros2 launch msee22_description move_robot.launch.py
```
and enable the tool0 trail, and take a screenshot of the trajectory for your lab report.

When you are done verifying that your trajectory is successful, upload the CSV file to the Lab4-CSV assignment on Brightspace with the filename `<your purdue username>.csv`. For example, `ldihel.csv`.

### Bonus

For the bonus trajectory, also verify that the joint angles in your `<your purdue username>_bonus.csv` file produces acceptable results before submitting to the Lab4-CSV-bonus assignment on Brightspace.
