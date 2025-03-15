"""
An interactive audio player that plays sound files in the music folder.

Code modifed by: Caden Pun, Zaid Madanat
"""

# Importing Required Modules & libraries
from tkinter import *
from tkinter.ttk import *
import pygame
import os

DEBUG = True


class MusicPlayer:
    """One object of this class represents a tkinter GUI application that plays
    audio files."""

    def __init__(self, root):
        """Creates a tkinter GUI application that plays audio files."""
        self.root = root
        self.root.title("Music Player")
        self.root.geometry("1000x200+200+200")
        pygame.init()
        pygame.mixer.init()
        # TODO: Make the self.track and self.status StringVar objects
        self.track = StringVar()
        self.status = StringVar()

        # Creating trackframe for songtrack label & trackstatus label
        trackframe = LabelFrame(self.root, text="Song Track", relief=GROOVE)
        trackframe.place(x=0, y=0, width=600, height=100)
        # TODO Below make the self.track the textvariable for songtrack and
        # the self.status the textvariable for trackstatus
        songtrack = Label(trackframe, textvariable=self.track).grid(
            row=0, column=0, padx=10, pady=5)
        trackstatus = Label(trackframe, textvariable=self.status).grid(
            row=0, column=1, padx=10, pady=5)

        # Creating buttonframe
        buttonframe = LabelFrame(
            self.root, text="Control Panel", relief=GROOVE)
        # Inserting song control Buttons
        buttonframe.place(x=0, y=100, width=600, height=100)
        Button(buttonframe, text="Play", command=self.playsong).grid(
            row=0, column=0, padx=10, pady=5)
        Button(buttonframe, text="Pause", command=self.pausesong
               ).grid(row=0, column=1, padx=10, pady=5)
        Button(buttonframe, text="Unpause", command=self.unpausesong
               ).grid(row=0, column=2, padx=10, pady=5)
        Button(buttonframe, text="Stop", command=self.stopsong).grid(
            row=0, column=3, padx=10, pady=5)
        Button(buttonframe, text="Refresh From Folder",
               command=self.refresh).grid(row=1, column=3, padx=10, pady=5)

        # Creating songsframe
        songsframe = LabelFrame(self.root, text="Song Playlist", relief=GROOVE)
        songsframe.place(x=600, y=0, width=400, height=150)
        scrol_y = Scrollbar(songsframe, orient=VERTICAL)
        self.playlist = Listbox(songsframe, yscrollcommand=scrol_y.set,
                                selectbackground="gold",
                                selectmode=SINGLE, relief=GROOVE)
        # Applying Scrollbar to playlist Listbox
        scrol_y.pack(side=RIGHT, fill=Y)
        scrol_y.config(command=self.playlist.yview)
        self.playlist.pack(fill=BOTH)

        # Adding playlist search controls
        searchframe = LabelFrame(self.root, relief=GROOVE)
        searchframe.place(x=600, y=145, width=400, height=50)
        self.inputVar = StringVar()
        search_input = Entry(searchframe, width=30, textvariable=self.inputVar)
        # TODO: Make the self.inputVar StringVar object
        # TODO Below make the self.inputVar the textvariable for search_input
        search_input.grid(row=1, column=1, padx=1, pady=1)
        Button(searchframe, text="Search",
               command=self.search).grid(row=1, column=2, padx=1, pady=1)

        # TEAM LAB: EVENTS
        # binds Return event to our Entry widget so we can search without clicking the button
        search_input.bind('<Return>', lambda event: self.search())

        # Changing directory for fetching songs
        os.chdir("./music")
        # Inserting songs into playlist
        self.refresh()

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

        TODO: Remove from the self.playlist ListBox any filename that does not
        partially match the characters from the self.inputVar of the
        search_input Entry widget. Catch any possible exceptions.
        """
        try:
            result = self.inputVar.get().casefold()
            playlist = self.playlist.get(0, END)
            filter = tuple(
                song for song in playlist if result in song.casefold())
            self.playlist.delete(0, END)

            if not filter:
                raise Exception("No songs were found!")
            for song in filter:
                self.playlist.insert(END, song)
        except Exception as e:
            print(e)

    def playsong(self):
        """
        TODO:
        Displays selected song and its playing status and plays the song.
        """
        song = self.playlist.get(self.playlist.curselection())
        pygame.mixer.music.load(song)
        pygame.mixer.music.play()
        self.track.set(song)
        self.status.set('-Playing')

    def stopsong(self):
        """TODO: Displays stopped status and stops the song."""
        pygame.mixer.music.stop()
        self.status.set('-Stopped')

    def pausesong(self):
        """TODO: Displays the paused status and pauses the song."""
        if not self.status.get() == '-Stopped':  # Can't pause if stopped
            pygame.mixer.music.pause()
            self.status.set("-Paused")

    def unpausesong(self):
        """TODO: Displays the playing status and unpauses the song."""
        if not self.status.get() == '-Stopped':  # Can't unpause if stopped
            pygame.mixer.music.unpause()
            self.status.set('-Playing')

    def refresh(self):
        """
        TODO:
        Clears the current playlist and fills it with all valid sound files
        from the music folder. All exception messages are appended to the
        status in their default string form.
        See the .pdf reference files for how to insert items into a tkinter
        Listbox.
        """

        # TODO: First clear the search_input Entry widget via self.inputVar
        self.inputVar.set('')
        self.playlist.delete(0, END)

        # TODO: Ignore files whose names that start with "."
        # and those that are not .mp3, .ogg, or .wav files
        templist = list(os.listdir())
        filter = [x for x in templist if not x.startswith(
            '.') and x.endswith(('.mp3', '.ogg', '.wav'))]
        for song in filter:
            self.playlist.insert(END, song)


def main():
    """Create main window and start a MusicPlayer application on it."""
    # Creating TK root window
    root = Tk()
    # Passing root to the MusicPlayer constructor
    app = MusicPlayer(root)
    # Start the main GUI loop
    root.mainloop()


if __name__ == "__main__":
    main()
