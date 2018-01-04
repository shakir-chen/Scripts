#Python


## I. OS Operation

## II. Subprocess
```
from subprocess import call, popen
call("ls -l",shell=True)
```

## III. Print format
print '{:20} {:10} {:5}'.format("data_rate_optical","10","Gbps")
<https://pyformat.info/>

## IV. Howdoi
1. howdoi install
sudo pip install howdoi
Error ------
Command "/usr/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-1vfwsy/lxml/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-w_8zPR-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-1vfwsy/lxml
apt-get install python-lxml

<http://stackoverflow.com/questions/6504810/how-to-install-lxml-on-ubuntu>

## V. Blogs
The Hitchhiker's Guide to Python <http://docs.python-guide.org/en/latest/>
----Reading Grate Codes (http://docs.python-guide.org/en/latest/writing/reading/)
----Howdoi, Flask,Diamond,Werkzeug,Requests,Tablib
The Hack<https://thehackerguidetopython.com/>


## VI. Database
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

### 3. Perserve Numpy Arrays on disk
hdf5
<https://stackoverflow.com/questions/9619199/best-way-to-preserve-numpy-arrays-on-disk>


<https://stackoverflow.com/questions/20928136/input-and-output-numpy-arrays-to-h5py>



## VII. FileIO
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

## VIII. GUI
Python GUI
<https://wiki.python.org/moin/GuiProgramming>

tulip
<http://pythonhosted.org/tulip-python/creatingvisualizations.html>

## IX. Tutorial
+ Tkinter
+ wxPython
+ PyGTK
+ pyQT

<https://josephrex.me/getting-started-with-gui-development-in-python/>


## X. Image

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

Examples

1. Really cool examples
<https://stackoverflow.com/questions/10917495/matplotlib-imshow-in-3d-plot>


## XI. Matrix
reverse a list : array[::-1]
<http://stackoverflow.com/questions/3940128/how-can-i-reverse-a-list-in-python>
append two lists a,b : a+b (array can't!!)
                       np.append(n_p[ii][::-1] , p_n[ii])

## XII. Numerical Solver
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

## XIII. Crawler

### Requests

<http://docs.python-requests.org/en/latest/user/quickstart/>
BeautifulSoup
<https://stackoverflow.com/questions/38162090/the-python-requests-module-cannot-detect-certain-html-link-tags>
### Spider

#### 1. Fill input of types and press submit

```
from BeautifulSoup import BeautifulSoup
import urllib

post_params = {
    param1 : val1,
    param2 : val2,
    param3 : val3
        }
post_args = urllib.urlencode(post_params)

url = 'http://www.website.com/'
fp = urllib.urlopen(url, post_args)
soup = BeautifulSoup(fp)
```

<https://stackoverflow.com/questions/13166395/fill-input-of-type-text-and-press-submit-using-python>

#### 2. Selenium open Firefox with extensions

##### i. Failed: Shows No Such File or Dirctory
```
from selenium import webdriver

profile = webdriver.FirefoxProfile()
profile.add_extension('path_to_extension')
profile.set_preference("extensions.adblockplus.currentVersion", "2.4")

driver = webdriver.Firefox(firefox_profile=profile)
```
<http://www.testingexcellence.com/webdriver-tutorial-open-browser-extensions/>
<https://stackoverflow.com/questions/27586254/python-selenium-browser-with-extensions>

##### ii.




## XV. Data Structure
```
Class
    __init__
    __repr__        representation of python object, unambiguous
    __str__
    __call__
```

## XIV. Video and Audio
```
sudo apt-get install vlc browser-plugin-vlc
sudo pip3.5 install python-vlc
```

## XVI. photo or sound record
microphone sound signal (python bindings)
<!-- pyaudio -->            # wave
<https://stackoverflow.com/questions/35344649/reading-input-sound-signal-using-python>

iphone camera to ros node
<http://riematrix.github.io/iphone-as-ros-camera-node/>
mini-webcam => stream of videos to WLAN
on ubuntu create virtual camera:

epoccam (cannot use)

### Compile
+ bytecode : *.pyc ===> uncomple6 can easily read the source code (not safe)
sudo pip install uncomly6
<https://github.com/Mysterie/uncompyle2>

+ pyinstaller, py2exe
pyinstaller is really nice
<http://effbot.org/zone/python-compile.htm>


### 1. Tree

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

2.  python function, pay attention to argument passing (which is not value passing)

    ```
    myshore=[]
    nextstate_onboard(myshore,[1,2])        # 1st: myshore=[]
    nextstate_onboard(myshore,[1,2])        # 2nd: myshore=[1,2]        # very ridiculous

    def nextstate_onboard(shore,comingboat):
        shore.extend(comingboat)
        ...
    ```
    but here, myshore is a list, which use reference passing here


3. SyntaxError: non-default argument follows default argument
    ```
    def fun1(a="who is you", b="True", x, y):
    ...     print a,b,x,y
    ```
    solution: change to
    ```
    def fun1(x,y,a="who is you", b="True"):
    ...     print a,b,x,y


### with-as
<http://effbot.org/zone/python-with-statement.htm>


### yeild

# Math
## functools.partial
function package

## scipy.optimize

## scipy.integrate


### ERROR =============

1. use matplotlib import pyplot: no _tkinter

matplotlib.use("AGG")
<https://stackoverflow.com/questions/4930524/how-can-i-set-the-backend-in-matplotlib-in-python>

.config/matplotlib/matplotlibrc
<http://matplotlib.org/users/customizing.html#the-matplotlibrc-file>
```
backend : Agg
```
<https://stackoverflow.com/questions/4931376/generating-matplotlib-graphs-without-a-running-x-server/4935945#4935945>

2. centos install pip: cannot access http server
```
yum install openssl openssl-dev -y
reinstall python3.6
python3.6 get-pip.py
```

