# -*- coding: utf-8 -*-
"""
Created on Sun Nov 22 22:12:31 2020

@author: Niels
"""

import matplotlib.pyplot as plt
import numpy as np



Re = 1;
R = np.linspace(1,10,1000)

SPPO = 1-(1/np.pi)*np.arccos(np.sqrt(np.power(R,2)-np.power(Re,2))/R)


f = plt.figure()

plt.plot(R,SPPO*100)
plt.xlim(1,np.max(R))
plt.ylim(50,100)
plt.grid(True, 'both')
plt.title('SPPO vs Distance from planet orbit')
plt.xlabel('$R/r_p$')
plt.ylabel('Percent of Ideal Power Per Orbit')
plt.savefig('SPPOvsDistance.eps', format='eps')
plt.rc('font', size=12)


fig, ax1 = plt.subplots()
R = np.linspace(1,3,1000)
batCap = 0.110; #Battery Capacity in KWh/Kg
batMass = 10; #Mass of battery in Kg
ax1.plot(R,batCap*batMass/(1-SPPO))
plt.xlim(1,np.max(R))
ax1.grid(True, 'both')
plt.title('Average Power Allowed by batteries')
plt.xlabel('$R/r_{p}$')
plt.ylabel('Average Power[KWh/orbit]')
plt.savefig('AveragePower.eps', format='eps')
plt.rc('font', size=12)


ax2 = ax1.twinx() 

ax2.plot(R,1/(1-SPPO))
ax2.