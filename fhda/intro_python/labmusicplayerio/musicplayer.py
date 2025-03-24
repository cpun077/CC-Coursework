# Importing Required Modules & libraries
from tkinter import *
from tkinter.ttk import *
import pygame
import os

DEBUG = True


class MusicPlayer:
    """One object of this class represents a tkinter GUI application that plays
    audio files and can write and read a .m3u playlist."""

    def __init__(self, root):
        """TODO: Creates a tkinter GUI application that plays audio files and
        can write and read a .m3u playlist."""
        self.playlistfilename = 'playlist.m3u'
        self.root = root
        self.root.title("Music Player")
        self.root.geometry("1000x200+200+200")
        pygame.init()
        pygame.mixer.init()
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
        # TODO: Insert playlist control Buttons
        Button(buttonframe, text="Load Playlist", command=self.loadplaylist).grid(
            row=1, column=0, padx=10, pady=5)
        Button(buttonframe, text="Save Playlist", command=self.saveplaylist).grid(
            row=1, column=1, padx=10, pady=5)
        Button(buttonframe, text="Remove Song", command=self.removesong).grid(
            row=1, column=2, padx=10, pady=5)
        Button(buttonframe, text="Refresh from Folder", command=self.refresh).grid(
            row=1, column=3, padx=10, pady=5)

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
        search_input = Entry(searchframe, width=30)
        self.inputVar = StringVar()
        # TODO Below make the self.inputVar the textvariable for search_input
        search_input.config(textvariable=self.inputVar)

        search_input.grid(row=1, column=1, padx=1, pady=1)
        # TODO: bind Return key to call self.search
        Button(searchframe, text="Search",
               command=self.search).grid(row=1, column=2, padx=1, pady=1)
        search_input.bind('<Return>', lambda event: self.search())

        # Changing directory for fetching songs
        os.chdir("./music")
        # Inserting songs into playlist
        self.refresh()

    def search(self, *args):
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

        Remove from the self.playlist ListBox any filename that does not
        partially match the characters from the self.inputVar of the
        search_input Entry widget.
        """
        try:
            result = self.inputVar.get().casefold()
            playlist = self.playlist.get(0, END)
            filter = tuple(
                song for song in playlist if result in song.casefold())
            self.playlist.delete(0, END)

            if not filter:
                raise Exception("No songs were found!")
            list(map(lambda song: self.playlist.insert(END, song), filter))
        except Exception as e:
            print(e)

    def playsong(self):
        """Displays selected song and its playing status and plays the song."""
        self.track.set(self.playlist.get(ACTIVE))
        self.status.set("-Playing")
        pygame.mixer.music.load(self.playlist.get(ACTIVE))
        pygame.mixer.music.play()

    def stopsong(self):
        """Displays stopped status and stops the song."""
        self.status.set("-Stopped")
        pygame.mixer.music.stop()

    def pausesong(self):
        """Displays the paused status and pauses the song."""
        self.status.set("-Paused")
        pygame.mixer.music.pause()

    def unpausesong(self):
        """Displays the playing status and unpauses the song."""
        self.status.set("-Playing")
        pygame.mixer.music.unpause()

    def removesong(self):
        """Deletes the active song from the playlist."""
        self.playlist.delete(ACTIVE)

    def loadplaylist(self):
        """
        TODO: Clears the current playlist and loads a previously saved playlist
        from the music folder. A user friendly message is appended to the status
        if a FileNotFoundError is caught(see the demo video).
        All other exception messages are
        appended to the status in their default string form.
        Ignore the lines that start with #.
        """

        # TODO: First clear the search_input Entry widget via self.inputVar
        try:
            templist = open(self.playlistfilename, 'r')
            self.inputVar.set('')
            self.playlist.delete(0, END)
            filter = [song.strip()
                      for song in templist if not song.startswith('#')]
            list(map(lambda song: self.playlist.insert(END, song), filter))
        except FileNotFoundError:
            self.status.set(
                f'-Playing file {self.playlistfilename} was not found.')
        except Exception as e:
            self.status.set(e)

    def saveplaylist(self):
        """TODO: Save the current playlist to the playlist file in the music
        folder. All exception messages are appended to the status in their
        default string form.
        Make sure the first line of the file is only:
        #EXTM3U
        """
        try:
            playlistfile = open(self.playlistfilename, 'w')
            playlistfile.write('#EXTM3U\n')
            playlistArr = list(self.playlist.get(0, END))
            playlistfile.write('\n'.join(playlistArr))
            playlistfile.close()
        except Exception as e:
            self.status.set(e)

    def refresh(self):
        """
        TODO:
        Clears the current playlist and fills it with all valid sound files
        from the music folder. All exception messages are appended to the status
        in their default string form.
        See the .pdf reference files for how to insert items into a tkinter
        Listbox."""

        # First clear the search_input Entry widget via self.inputVar
        try:
            self.inputVar.set('')
            self.playlist.delete(0, END)
            templist = list(os.listdir())
            filter = [song for song in templist if not song.startswith(
                '.') and song.endswith(('.mp3', '.ogg', '.wav'))]
            list(map(lambda song: self.playlist.insert(END, song), filter))
        except Exception as e:
            self.status.set(e)


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
