#Python


## OS Operation

##Subprocess
```
from subprocess import call, popen
call("ls -l",shell=True)
```

## Print format
print '{:20} {:10} {:5}'.format("data_rate_optical","10","Gbps")
<https://pyformat.info/>

## Howdoi
1. howdoi install
sudo pip install howdoi
Error ------
Command "/usr/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-1vfwsy/lxml/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-w_8zPR-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-1vfwsy/lxml
apt-get install python-lxml

<http://stackoverflow.com/questions/6504810/how-to-install-lxml-on-ubuntu>

## Blogs
The Hitchhiker's Guide to Python <http://docs.python-guide.org/en/latest/>
----Reading Grate Codes (http://docs.python-guide.org/en/latest/writing/reading/)
----Howdoi, Flask,Diamond,Werkzeug,Requests,Tablib
The Hack<https://thehackerguidetopython.com/>

## Image

### 1. 3D Plane
```python
# draw ax+by+cz+d=0

from subprocess import call
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

point  = np.array([0,0,0])
normal = np.array([1,-2,1])
# normal = np.array([1,0,0])        # could not draw
d = -np.sum(point*normal)              # dot product
# create x,y
xx, yy = np.meshgrid(range(30), range(30))

# calculate corresponding z
z = (-normal[0]*xx - normal[1]*yy - d)*1./normal[2]

# plot the surface
plt3d = plt.figure().gca(projection='3d')
# plt3d.plot_surface(xx,yy,z, color='yellow')

yy,zz = np.meshgrid(range(30), range(30))
xx=np.zeros([30,30])
plt3d.plot_surface(xx,yy,zz, color='yellow')
# plt.show()
plt.savefig('testplot.png')
call(["feh",'testplot.png'])
```

<http://stackoverflow.com/questions/19410733/how-to-draw-planes-from-a-set-of-linear-equations-in-python>

## Matrix
reverse a list : array[::-1]
<http://stackoverflow.com/questions/3940128/how-can-i-reverse-a-list-in-python>
append two lists a,b : a+b (array can't!!)
                       np.append(n_p[ii][::-1] , p_n[ii])

## Numerical Solver
ODE(ordinary differential equations): scipy.integrate

DFT/FFT

<http://www.physics.nyu.edu/pine/pymanual/html/chap9/chap9_scipy.html>


### Error

1. p.show() doesn't show figures

```
import matplotlib
matplotlib.matplotlib_fname()       # show matplotrc

import matplotlib.rcsetup as rcsetup
print(rcsetup.all_backends)     # show GTK, GTKAgg...

sudo vim /usr/local/lib/python3.5/dist-packages/matplotlib/mpl-data/matplotlibrc
```
<http://stackoverflow.com/questions/7534453/matplotlib-does-not-show-my-drawings-although-i-call-pyplot-show>

2. Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-n4rMaq/pygtk/
Because this could be only installed in windows for pygtk.
<http://stackoverflow.com/questions/35991403/python-pip-install-gives-command-python-setup-py-egg-info-failed-with-error-c>

```
$ workon plotting
$ pip uninstall matplotlib
$ git clone https://github.com/matplotlib/matplotlib.git
$ cd matplotlib
$ python setup.py install
```
No hurry to install, check available backends first : tkagg; agg; cairo is all available
then
```
sudo vim /usr/local/lib/python3.5/dist-packages/matplotlib/mpl-data/matplotlibrc        # change to tkagg
sudo apt-get install python3-tk     # follow the step, don't use pip-install
```

<http://stackoverflow.com/questions/22304215/gtk-backend-requires-pygtk-to-be-installed>
