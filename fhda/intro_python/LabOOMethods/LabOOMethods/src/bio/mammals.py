""" Print the characteristics of, and plays the sounds of, various mammals. """
"Modifed by Caden Pun"

import pygame
import os
import time


# Constants
DEBUG = True

# Initiating Pygame
pygame.init()
# Initiating Pygame mixer
pygame.mixer.init()

# Changing directory for fetching sounds
os.chdir("./sounds")

if DEBUG:
    # Fetching sounds
    sounds = os.listdir()
    # Printing available sounds for debugging purposes
    for track in sounds:
        print(track)


class Mammal:  # Base class
    """
    One object of this class represents a mammal animal that has a name and
    can make noise, however only subclasses of Mammal are expected to set the
    noise attribute to the filename of the noise that is in the ./sound folder.
    """

    species = "mammal"  # class variable shared by all instances

    def __init__(self, name):
        """Constructs a mammal with a name set from the name parameter."""
        # instance variable, unique to each instance,
        # being set to a default value
        self.noise = "201883__parcodeisuoni__silence.mp3"
        self.name = name  # instance variable unique to each instance

    def __str__(self):
        """
        Returns a str that includes the class name (__class__)
        and the mammal's name attribute.
        """
        return "The {} named {}".format(self.species, self.name)

    def make_noise(self):
        """
        TODO:
        Plays the sound associated with it's noise attribute.
        Software developers are expected to override this method and call this
        method (from here in the super class) in order to play self.noise.
        """
        self.__play(self.noise)

    def __play(self, sound):
        """
        Plays the sound from the file specified by the sound parameter.
        This internal class-private method should not be
        overriden! Instead subclasses should override the make_noise method.
        For info on private members of a class, see:
        https://docs.python.org/3/tutorial/classes.html?highlight=private#tut-private
        """
        # Loading selected sound
        pygame.mixer.music.load(sound)
        # Playing selected sound
        pygame.mixer.music.play()
        # Sleep so sound can be heard before the program might quit
        time.sleep(2)


class Elephant(Mammal):
    """
    One object of this class represents an elephant that has a name attribute
    and can make an elephant noise.
    """

    species = "🐘"  # class variable shared by all instances
    # If you don't see the emoji for an Elephant on the line above,
    # make sure this project's and file's encoding is UTF-8.

    def __init__(self, name):
        """
        TODO:
        Constructs an Elephant object with a name set from the name parameter
        by using the __init__ method of its superclass.
        It's noise attribute is also set to the filename of an elephant sound
        file.
        """
        super().__init__(name)
        self.noise = "139875__y89312__44.wav"

    """
    There is no need to write a make_noise method here because all Elephant 
    objects will inherit that method from the Mammal class.
    """


class Lion(Mammal):
    """
    One object of this class represents a lion that has a name attribute
    and can make a lion noise.
    """

    species = "🦁"  # class variable shared by all instances
    # If you don't see the emoji for a Lion on the line above,
    # make sure this project's and file's encoding is UTF-8.

    def __init__(self, name):
        """
        TODO:
        Constructs a Lion object with a name set from the name parameter by
        using the __init__ method of its superclass.
        It's noise attribute is also set to the filename of a lion sound file.
        """
        super().__init__(name)
        self.noise = "97380__soundbytez__african-lion.wav"

def main():
    """Create and use objects of all the derived classes."""
    elephant = Elephant("Alex")
    print('{} goes haraaaaumph!'.format(elephant))
    elephant.make_noise()
    lion = Lion("Simba")
    print('{} roars!'.format(lion))
    lion.make_noise()


if __name__ == "__main__":
    main()
