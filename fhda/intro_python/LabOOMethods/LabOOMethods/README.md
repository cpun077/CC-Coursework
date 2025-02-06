# Bio Package

This is the Bio package for Team Lab: Object-Oriented methods. You can use
[Github-flavored Markdown](https://guides.github.com/features/mastering-markdown/)
to write your content.

How to make your own modules and packages:
https://packaging.python.org/tutorials/packaging-projects/
Use setup.cfg (static), and skip the last 2 steps on uploading and installing.

You must install pygame so the sounds can be played. See:
https://www.pygame.org/wiki/GettingStarted

All sound files must be in the src/bio/sounds folder.

To run the example vehicles demo code:

```
cd src
python3 bio/vehicles.py
```

To run the assignment mammals demo code:

```
cd src
python3 bio/mammals.py
```

Package import and usage example:

```
cd src
python3
>>> from bio import mammals
pygame 2.0.1 (SDL 2.0.14, Python 3.9.7)
Hello from the pygame community. https://www.pygame.org/contribute.html
>>> alex = mammals.Elephant("Alex")
>>> alex.make_noise()
>>> simba = mammals.Lion("Simba")
>>> simba.make_noise()
```

To run tests of mammals:

```
cd src
python3 testmammals.py
```
