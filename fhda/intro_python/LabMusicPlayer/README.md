# MusicPlayer Package

This is the package for Team Lab: Custom classes and data structures. You can use
[Github-flavored Markdown](https://guides.github.com/features/mastering-markdown/)
to write your content.

How to make your own modules and packages:
https://packaging.python.org/tutorials/packaging-projects/
Use setup.cfg (static), and skip the last 2 steps on uploading and installing.

You must install pygame so the sounds can be played. See:
https://www.pygame.org/wiki/GettingStarted

All sound files must be in the src/music folder.

To run the musicplayer when you are done:

```
cd src
python3 musicplayer.py
```

# TODO: Your program must work the SAME way as below (except you might have different music files). Do NOT delete the src/music/.config file, instead your team must ignore files like it inside the MusicPlayer.refreshlist method.

Package import and usage example:

```
cd src
python3
>>> import musicplayer
pygame 2.0.1 (SDL 2.0.14, Python 3.9.7)
Hello from the pygame community. https://www.pygame.org/contribute.html
>>> musicplayer.main()
Welcome to Music Player!

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,

or r to refresh the list,
or q to quit:
0
Playing Mixing.mp3

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
1
Playing hello.mp3

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
R

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
r

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:

some text

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
0.0

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
1.0

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
3.14

0 Mixing.mp3
1 hello.mp3
Type the song number to play it,
or r to refresh the list,
or q to quit:
Q
-Stopped
>>>
```
