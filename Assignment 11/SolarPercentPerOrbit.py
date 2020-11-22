# -*- coding: utf-8 -*-
"""
Created on Sun Nov 22 22:12:31 2020

@author: Niels
"""

import matplotlib.pyplot as plt
import numpy as np



Re = 1;
R = np.linspace(1,10,1000)

SPPO = (1/np.pi)*np.arccos(np.sqrt(np.power(R,2)-np.power(Re,2))/R)


f = plt.figure()

plt.plot(R,SPPO)
plt.xlim(1,np.max(R))
plt.grid(True, 'both')
plt.title('SPPO vs Distance from planet orbit')
plt.xlabel('$R/r_p$')
plt.ylabel('Solar Power Per Orbit')
plt.savefig('SPPOvsDistance.eps', format='eps')

f = plt.figure()

R = np.linspace(1,10,1000)

batCap = 0.110; #Battery Capacity in KWh/Kg
batMass = 10; #Mass of battery in Kg

plt.plot(R,batCap*batMass/SPPO)
plt.xlim(1,np.max(R))
plt.grid(True, 'both')
plt.title('Average Power Allowed by batteries [KWh]')
plt.xlabel('$R/r_p$')
plt.ylabel('Solar Power Per Orbit')
plt.savefig('AveragePower.eps', format='eps')