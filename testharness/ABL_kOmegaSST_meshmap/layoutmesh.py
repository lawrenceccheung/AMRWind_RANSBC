import numpy as np
import matplotlib.pyplot as plt
#import mpmath

hblend  = lambda xi, xiT, W: 0.5*(1+np.tanh((xi-xiT)/W))
dhblend = lambda xi, xiT, W: 0.5/W*(np.cosh((xi-xiT)/W))**-2

xgeom   = lambda xi, delta0, r: delta0*(1-r**(xi+1))/(1-r)/r - delta0/r
dxgeom  = lambda xi, delta0, r: delta0/r/(r-1)*np.log(r)*r**(xi-1)

xconst  = lambda xi, slope, xi0, L: slope*(xi - xi0) + L 
dxconst = lambda xi, slope, xi0, L: slope

xiinverse = lambda x, delta0, r: np.log(1.0 - (x-delta0/r)*r*(1.0-r)/delta0)/np.log(r)

xideltamax = lambda deltamax, delta0, r: np.log(deltamax/delta0*r*r)/np.log(r)

def xcoord(xi, delta0, r, L, W):
    # Get the match xi
    xiL  = int(xiinverse(L, delta0, r))
    Lmatch = xgeom(xiL, delta0, r)
    # Get the slope
    dxiL = xgeom(xiL, delta0, r) - xgeom(xiL-1, delta0, r)
    
    #print('match = ',xiL)
    #print('slope = ',dxiL)
    #W  = 0.1
    h  = hblend(xi, xiL, W)
    xg = xgeom(xi, delta0, r)
    xc = xconst(xi, dxiL, xiL, Lmatch)
    #print(xc)
    return xg*(1.0-h) + h*xc

def dxcoord(xi, delta0, r, L, W):
    # Get the match xi
    xiL  = int(xiinverse(L, delta0, r))
    Lmatch = xgeom(xiL, delta0, r)
    # Get the slope
    dxiL = xgeom(xiL, delta0, r) - xgeom(xiL-1, delta0, r)

    #W  = 0.1
    h  = hblend(xi, xiL, W)
    dh = dhblend(xi, xiL, W)
    xg = xgeom(xi, delta0, r)
    dxg= dxgeom(xi, delta0, r)

    xc = xconst(xi, dxiL, xiL, Lmatch)
    dxc= dxconst(xi, dxiL, xiL, Lmatch)
    #print('Lmatch = '+repr(Lmatch))
    #print('xiL = '+repr(xiL))
    #print('dh = '+repr(dh))
    #print('log(r) = '+repr(np.log(r)))
    #print('numer = '+repr(((L-delta0/r)*r*(1.0-r)/delta0)))
    #print('slope = '+repr(dxc))
    return dxg*(1.0-h) + xg*(-dh) + dh*xc + h*dxc

def xcoord_deltamax(xi, delta0, r, deltamax):
    # Get the match xi
    xiL  = math.floor(xideltamax(deltamax, delta0, r))-1
    Lmatch = xgeom(xiL, delta0, r)
    # Get the slope
    dxiL = xgeom(xiL, delta0, r) - xgeom(xiL-1, delta0, r)
    
    #print('match = ',xiL)
    #print('slope = ',dxiL)
    W  = 0.05
    h  = hblend(xi, xiL, W)
    xg = xgeom(xi, delta0, r)
    xc = xconst(xi, dxiL, xiL, Lmatch)
    #print(xc)
    return xg*(1.0-h) + h*xc


def printgrid(xivec, coordfunc, dcoordfunc, *args):
    print('%-4s %12s %12s %8s %s'%('xi','real x','dx','cellsize','stretching'))
    for i, xi in enumerate(xivec):
        x = coordfunc(xi, *args)
        dx= dcoordfunc(xi, *args)
        cellsize = 0.0 if i==0 else x - coordfunc(xivec[i-1], *args)
        sratio   = 0.0 if i<2  else cellsize/(coordfunc(xivec[i-1], *args)-coordfunc(xivec[i-2], *args))
        print('%-4i %12.8f %12.8f %8.4f %8.4f'%(xi, x, dx, cellsize, sratio))

Nxi    = 20
xi     = np.linspace(0,Nxi-1,Nxi)
delta0 = 0.1
r      = 1.1
xmatch = 0.21
W      = 0.05
deltamax = 0.25


printgrid(xi, xcoord, dxcoord, delta0, r, xmatch, W)

