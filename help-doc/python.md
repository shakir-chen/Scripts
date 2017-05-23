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

## Database
### 1. json - pandas
#### 10min tutorial

#### add one line
```
df = DataFrame(columns=('lib', 'qty1', 'qty2'))
for i in range(5):
    df.loc[i] = [randint(-1,1) for n in range(3)]
print(df)
```

<!-- http://stackoverflow.com/questions/10715965/add-one-row-in-a-pandas-dataframe -->

### 2. sqlite - pandas

pandas
#### select prof["name"][ii] == "Andrew"
df.loc[df['column_name'] == some_value]
<http://stackoverflow.com/questions/17071871/select-rows-from-a-dataframe-based-on-values-in-a-column-in-pandas>

#### check NaN elements

pd.isnull(prof["name"][ii]) : type Name: papers, dtype:bool             ====>   dtype bool is not bool type of truth table; which also return index
```
101    True
Name: papers, dtype: bool
```

profii=int(prof.loc[prof['name']==retname].index.values) # better to use isnull, ii must be int number, instead of dtype-array

<!-- prof["name"][ii].empty -->


<http://stackoverflow.com/questions/36921951/truth-value-of-a-series-is-ambiguous-use-a-empty-a-bool-a-item-a-any-o>



## FileIO
```
f=[""]*3
for ii,domain in enumerate(dict):
    filename=domain+".txt"
    print(filename)
    f[ii]=open(filename,'w')        # create a new file in the directory

...
    f[ii].write(str)

Loop:
    f[ii].close()
```

## GUI
Python GUI
<https://wiki.python.org/moin/GuiProgramming>

tulip
<http://pythonhosted.org/tulip-python/creatingvisualizations.html>

## Tutorial
+ Tkinter
+ wxPython
+ PyGTK
+ pyQT

<https://josephrex.me/getting-started-with-gui-development-in-python/>


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
### 1. special-function: scipy.special
### 2. integration: scipy.integrate 
1. quad
2. dblquad
3. tplquad
4. nquad
5. fixed_quad   : gaussian quandrature
6. romberg      : romberg integration
7. trapz        : trapezoidal rule
8. cumtrapz     : trapezoidal rule to cumulatively compute integral
9. simps        : simpson's rule
10. romb         : romberg integration
11. polyint      : analytical polynomial integration
12. poly1d       : helper function polyint

### 3. ODE(ordinary differential equations): scipy.integrate.odeint

### 4. DFT/FFT : fftpack

### 5. Linear algebra

### 6. Non-linear equations
single equations of single variable -
brent method - scipy.optimize.brentq(f,a,b)

<http://www.physics.nyu.edu/pine/pymanual/html/chap9/chap9_scipy.html> => Really a good manual

a pair of nonlinear equations
<http://stackoverflow.com/questions/8739227/how-to-solve-a-pair-of-nonlinear-equations-using-python>
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