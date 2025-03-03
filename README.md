# robotic_arm
Let's build an iron man('s assistant)



# **Environment Setup**

## **1. Install and Configure XQuartz (macOS Only)**
If you are using **macOS**, you need to install and configure **XQuartz** to enable GUI applications inside Docker.

### **Install XQuartz**
1. Download and install **XQuartz** from [XQuartz official website](https://www.xquartz.org/).
2. Open XQuartz:
   ```bash
   open -a XQuartz
   ```
   Or manually open **XQuartz.app** from your Applications folder.

### **Enable Client Connections**
1. Open **XQuartz** → **Preferences** → **Security**.
2. ✅ **Enable** the option:  
   **"Allow connections from network clients"**.

### **Authorize Localhost (Allow GUI from Docker)**
Run this command in the **macOS Terminal**:
```bash
xhost +127.0.0.1
```
To verify, run:
```bash
xhost
```
Expected output:
```
INET:localhost
```

---

## **2. Build and Run the Docker Container**
### **Build the Docker Image**
```bash
docker build -t ros_humble .
```

### **Run the Container**
```bash
docker run -it --env-file=user.env.local ros_humble
```

---

# **Testing the Environment**

## **3. Install Test Package (`turtlesim`)**
Inside the container, run:
```bash
sudo apt-get update && sudo apt-get install ros-humble-turtlesim
```

### **Verify the Installation**
Run:
```bash
ros2 pkg executables turtlesim
```
Expected output:
```
turtlesim draw_square
turtlesim mimic
turtlesim turtle_teleop_key
turtlesim turtlesim_node
```
If you see this, **`turtlesim` is installed correctly** ✅.

---

## **4. Start `turtlesim` (GUI Test)**
Run:
```bash
ros2 run turtlesim turtlesim_node
```
✅ **If everything is set up correctly, a window will open showing a turtle!** 🐢🎉  

---

## **🛠 Troubleshooting**
| **Issue** | **Solution** |
|-----------|-------------|
| `Error: Can't open display:` | Make sure **XQuartz is running** and `xhost +127.0.0.1` is executed. |
| GUI apps not appearing | Run Docker with `-e DISPLAY=host.docker.internal:0`. |
| `turtlesim` window doesn't open | Check if `ros-humble-turtlesim` is installed correctly. |

---

# **✅ Summary**
1️⃣ **Set up XQuartz** (for macOS users).  
2️⃣ **Run `xhost +127.0.0.1`** to allow GUI connections.  
3️⃣ **Build & run the Docker container.**  
4️⃣ **Install & test `turtlesim` to verify ROS 2 GUI.**  

Now your ROS 2 environment is ready! 🚀🔥🐢

### Reference
https://github.com/osrf/docker_images/blob/20e3ba685bb353a3c00be9ba01c1b7a6823c9472/ros/humble/ubuntu/jammy/ros-base/Dockerfile