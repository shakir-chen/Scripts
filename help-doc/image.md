image processing
===

# convert
## 1. image resize
convert XXX.png -resize 200x100 myfigure.png
convert -resize 50% XXX.png myfigure.png


## 2. image append
convert 1.png 2.jpg +append 3.png           # horiz
convert 1.png 2.jpg -append 3.png           # vertical
