# -*- coding: utf-8 -*-
"""
Created on Sun Nov 22 20:40:12 2020

@author: Niels
"""

import numpy as np
import matplotlib.pyplot as plt


plt.close('all')

R = np.logspace(0,1)

p_sun = 220;
p_RTG = 22;
p_battery = 10;



P_panel = p_sun/(np.square(R))


f = plt.figure()
plt.plot(R,P_panel)
plt.xlabel('Distance from Sun [AU]')
plt.ylabel('$W/kg$')
plt.plot(R,np.ones([R.size,1])*p_RTG)
plt.plot(R,np.ones([R.size,1])*p_battery)

plt.xlim(1,10)
plt.ylim(0,230)
plt.grid(True,'both')
plt.title('Watt per Kilo vs Distance from earth')
lgndNames = ['Test1','test2']
plt.legend(['Solar Panels','RTG','Batteries','Fuel Cell'])
plt.savefig('powerMassRatio.eps', format='eps')