# Routing-Control
Robotics Routing Planning and Control

|time| name  |  
|--|--|  
| 1997 | DWA |  
| 1998 | RRT | 


----
## Robot Review

**路径规划主要算法发展**
![](https://github.com/MRwangmaomao/Routing-Control/blob/master/pic/3f6f93b4d8fb73d95a4755ac0a852789_hd.png)

 
 















 
1. 1986年Khatib提出了人工势场的概念，许多比较经典的机器人是基于人工势场来完成的，通过人工势场与确定度栅格结合，Borenstein和Koren提出了虚拟力场法[1](Virtual Force Field,VFF)，VFF是一种基于人工势场的移动机器人实时避障算法，其可以控制机器人在避障期间快读、连续和平滑的移动，并且不需要在障碍物前停止移动，该方法根据栅格的确信度对机器人进行导航控制，以机器人重心为中心，对一个固定范围内的栅格确信度值进行计算，障碍物对机器人产生斥力，力的大小与栅格的确信度值成正比，与栅格到机器人的距离成反比，目标点对机器人产生引力，引力与目标点到机器人的距离成正比。通过计算活动窗口内所有栅格对机器人的斥力和目标点对机器人引力的合力，对机器人完成导航控制。

2. 1997年Fox等[4]提出了基于速度空间的DWA算法，可以实现机器人的自主避障和导航，该方法从可执行速度组合中选取一组最优的作为速度指令传递给执行单元，由于选取的速度在满足机器人运动学和动力学的范围内，所以可以实现高速度下的导航和避障功能。

3. 2003年Minguez等[3]提出了基于几何结构的ND导航算法，该算法是根据机器人探测器探测的环境实时信息，基于一系列决策准则来获取机器人下一步的控制命令。接近图算法的基本思想是实时地把周围环境信息分为5类，通过把当前环境信息进行判断和归类，不同类型的环境信息对应不同的决策，可以更高级的层次对环境信息进行提取和诠释。

4. 1998年LaValle和Kuffner等[2]提出了快速扩展随机树(Rapidly-exploring Random Tree,RRT)，该算法是一种基于随机采样的单查询路径规划算法，可以直接解决考虑非完整约束的运动规划问题而不会产生维度灾难问题。RRT方法通过向随机目标扩展树枝上最近邻点的方法迅速搜索整个空间。由于RRT算法的广泛应用，许多研究人员针对其缺点也进行了改进，比如原RRT算法向未知区域扩展的趋势较大，同时也带来了路径代价过大的问题，目标偏好RRT(Goal-Biasing-RRT)算法和双向RRT(Bi-RRT)算法提出用以解决这类问题。Multi-RRT算法结合RRT算法与多查询PRM算法的优点产生多个子树而进行连接。Local-tree-RRT算法针对RRT算法在狭窄通道中难以迅速通过的问题提出局部树的方法，可以帮助机器人迅速连接狭窄通道两侧，解决狭窄通道路径规划领域的棘手问题。

5. 随着神经网络和深度强化学习的发展，研究者开始尝试将神经网络结合其他技术开发出新的跟踪控制方法。Pfeiffer M等于2016年采用CNN解析激光信息，然后利用A*算法作为标记信息，进行监督学习。这种方法强烈依赖于标记算法，主要适应于平面的规划。最近几年采用深度强化学习进行路径规划取得了不错的进展，Mnih[6]于2016年提出了基于深度强化学习的人类水平的控制。

 
-------
## Refrence
[1]Borenstein J , Koren Y . Real-time obstacle avoidance for fast mobile robots[J]. IEEE Transactions on Systems, Man, and Cybernetics, 2002, 19(5):1179-1187.

[2]	LaValle S M. Rapidly-Exploring Random Trees: A New Tool for Path Planning[J].1998.

[3]	Minguez J , Montano L . Nearness diagram (ND) navigation: collision avoidance in troublesome scenarios.[J]. IEEE Transactions on Robotics & Automation, 2003, 20(1):45-59.
[4]	Fox D , Burgard W , Thrun S . The Dynamic Window Approach to Collision Avoidance[J]. IEEE Robotics & Automation Magazine, 1997, 4(1):23-33.

[5]	Pfeiffer M, Schaeuble M, Nieto J, et al. From Perception to Decision: A Data-driven Approach to End-to-end Motion Planning for Autonomous Ground Robots[J]. 2016.

[6]	Human-level control through deep reinforcement learning[J]. Nature, 2015, 518(7540):529-533.
 


