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
        self.playlist = [x for x in templist if not x.startswith('.')]

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

        An algorithm is a step-by-step procedure that maps inputs to correct outputs. 
        An algorithm has a finite set of well-defined instructions that solves a variety of problems.

        Allows a user to search the playlist with an input string. 
        Search is not case-sensitive, and prints out all songs that contain the string.
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
        print("Searching..." + f'{searchStr} \n')
        songs = []
        try:
            for song in self.playlist: 
                if searchStr in song.casefold(): 
                    songs.append(song)
            if not songs:
                raise Exception("No songs were found!")
        except Exception as e:
            print(e)
            return False

        command = ''
        while  command != 'q':
            for id, track in enumerate(songs):
                print(f'{id}' + " " + track)
            print("Type the song number to play it,")
            print("or r to refresh the list, ")
            print("or s to search the list, ")
            print("or q to quit:")
            command = input("").strip().casefold()

            if command == "r":
                return False
            elif command == "s":
                if self.search():
                    self.stopsong()
                    return False
                print('')
            elif command.isnumeric():
                num = int(command)
                self.playsong(num)
                print("")

        return True

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
        while  command != 'q':
            self.printlist()
            print("Type the song number to play it,")
            print("or r to refresh the list, ")
            print("or s to search the list, ")
            print("or q to quit:")
            command = input("").strip().casefold()

            if command == "r":
                self.refreshlist()
                print("")
            elif command == "s":
                if self.search():
                    self.stopsong()
                    return
                print("")
            elif command.isnumeric():
                num = int(command)
                if num < len(self.playlist):
                    self.playsong(num)
                print("")

        self.stopsong()


def main():
    """Create a MusicPlayer object which will immediately run its own
    command line interaction loop."""
    # It is fine that player is created but never used any further
    player = MusicPlayer()


if __name__ == "__main__":
    main()
