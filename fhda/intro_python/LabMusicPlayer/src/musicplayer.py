"""
An interactive command line program that plays sound files in the music folder.

Code modifed by: Caden Pun, Zaid Madanat
"""
import pygame
import os

DEBUG = False


class MusicPlayer():
    """One object of this class represents a running music player
    command line program."""

    def __init__(self):
        """Constructor for a MusicPlayer object.
        Sets up the Pygame Mixer so it can play files in the ./music folder
        and then runs the main interactive loop."""
        # Initiating Pygame
        pygame.init()
        # Initiating Pygame Mixer
        pygame.mixer.init()
        # Declaring status member variable
        self.status = ""
        # Declaring playlist member variable
        self.playlist = []

        # Changing directory for fetching songs
        os.chdir("./music")

        # Refeshing the playlist
        self.refreshlist()

        # Running the main interaction loop
        self.main()

    def refreshlist(self):
        """Refreshes the playlist of files, ignoring files whose names start
        with a period because those are typically hidden operating system files
        or file system meta-data files."""
        # TODO: Fetch song filenames for the self.playlist
        # using the os.listdir method
        self.playlist = os.listdir()

        templist = list(self.playlist)
        # TODO: Use a list comprehension to:
        # set self.playlist to a list of filenames that do not start with "."
        # from the templist
        self.playlist = [
            filename for filename in templist if not filename.startswith('.')]

    def playsong(self, playlistIndex):
        """Plays the file in the playlist whose index is playlistIndex.
        playlistIndex: int"""
        # TODO: Update self.status to be "Playing filename" by
        # getting the filename from self.playlist using playlistIndex
        filename = self.playlist[playlistIndex]
        self.status = "Playing " + filename

        # TODO: Load the selected song by
        # getting the filename from self.playlist using playlistIndex
        pygame.mixer.music.load(filename)
        # Playing selected song
        pygame.mixer.music.play()
        # Displaying status
        print(self.status)

    def stopsong(self):
        """Stops any currently playing song."""
        # Updating status
        self.status = "-Stopped"
        # Stopping the current song
        pygame.mixer.music.stop()
        # Displaying status
        print(self.status)

    def printlist(self):
        """TODO: Print the playlist along with its zero-index."""
        for id, track in enumerate(self.playlist):
            print(f'{id}' + " " + track)

    def search(self):
        """
        TODO: Explain below in this docstring what an algorithm is.
        Then explain how your search algorithm is implemented in this method.
        Use a least two full sentences of U.S. English.

        WHAT AN ALGORITHM IS:
        An algorithm is a step-by-step procedure that maps inputs to desired outputs.
        An algorithm has a finite amount of step.
        An algorithm has well-defined instructions that are easy to understand.
        An algorithm can be applied to a wide variety of problems.
        An algorithm does not run forever; it eventually terminates/exits.

        HOW SEARCH ALGORITHM IS IMPLEMENTED:
        Allows a user to search the playlist with an input string. 
        Search is not case-sensitive, and temporarily appends all results to the playlist.
        This method leverages the linear search algorithm because the playlist's order does not help us.
        """
        # First refresh the list
        self.refreshlist()
        print()
        self.printlist()

        print("Type the characters you want to search for")
        print("and then hit your return key:")
        # TODO: Complete this search method, you must catch exceptions
        searchStr = input('').strip().casefold()
        print("Searching..." + f'{searchStr}' + '\n')
        songs = []
        try:
            for song in self.playlist:
                if searchStr in song.casefold():
                    songs.append(song)
            if not songs:
                raise Exception("No songs were found!")
            self.playlist = songs
        except Exception as e:
            print(e)

    def main(self):
        """TODO: Prompt user and play songs based on typed input."""
        print("Welcome to Music Player!\n")
        # TODO: You are required to use a while loop, input, self.printlist,
        # self.refreshlist, and self.playsong.
        # See: https://docs.python.org/3/library/functions.html#input
        # TODO: You are required to prevent any user input errors
        # (see the README.md file's TODO comments). To do that
        # you are expected to use the built-in len function,
        # and the str methods strip, casefold, and isnumeric.
        # Do NOT catch exceptions.

        command = ''
        while not command == 'q':
            self.printlist()
            print("Type the song number to play it,")
            print("or r to refresh the list, ")
            print("or s to search the list, ")
            print("or q to quit:")
            raw_command = input("")
            command = raw_command.strip().casefold()
            print(raw_command)

            if command == "r":
                self.refreshlist()
            elif command == "s":
                self.search()
            elif command.isnumeric():
                num = int(command)
                if num < len(self.playlist):
                    self.playsong(num)

            if not command == 'q':
                print()

        self.stopsong()


def main():
    """Create a MusicPlayer object which will immediately run its own
    command line interaction loop."""
    # It is fine that player is created but never used any further
    player = MusicPlayer()


if __name__ == "__main__":
    main()

"""
Welcome to Music Player!

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list, 
or s to search the list, 
or q to quit:
five
five

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
5
5
Playing Fadeinandfadeout.mp3

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
16
16

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
R
R

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
s
s

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the characters you want to search for
and then hit your return key:
hello
Searching...hello

0 Grand Baba - Hello.mp3
1 Hello.ogg
2 Hello.wav
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
0
0
Playing Grand Baba - Hello.mp3

0 Grand Baba - Hello.mp3
1 Hello.ogg
2 Hello.wav
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
r
r

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
1
1
Playing BooleanOperators.mp3

0 AutomaticMixing2.mp3
1 BooleanOperators.mp3
2 Comments.mp3
3 DJ Shiftee People Power Remix - 350RadioWaves.mp3
4 DJ Shiftee vs. Grand Baba - People Power Remix.mp3
5 Fadeinandfadeout.mp3
6 Grand Baba - Hello.mp3
7 Grand Baba - Hip-Hop.mp3
8 Hello.ogg
9 Hello.wav
10 HIPHOP_MUTED_GUITAR_Sorted.mp3
11 Incrementing.mp3
12 IntroScript.mp3
13 People Power (Extended Version w_ Arabic) - 350RadioWaves.mp3
14 RhythmicRamps.mp3
15 TotalAtlantaSongofSummer.mp3
Type the song number to play it,
or r to refresh the list,
or s to search the list,
or q to quit:
q
q
-Stopped
"""
