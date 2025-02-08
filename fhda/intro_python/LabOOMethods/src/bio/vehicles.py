"""
A Garage Full of Classy Vehicles
by Barron Stone with edits by Dr. Weusijana
"""

import pygame
import os
import time


# Constants
DEBUG = True

# Initiating Pygame
pygame.init()
# Initiating Pygame Mixer
pygame.mixer.init()

# Changing Directory for fetching sounds
os.chdir("./sounds")

if DEBUG:
    # Fetching sounds
    sounds = os.listdir()
    # Printing avaible sounds for debugging purposes
    for track in sounds:
        print(track)


class Vehicle:  # Base Vehicle class

    def __init__(self, color, manuf):
        self.color = color
        self.manuf = manuf
        self.gas = 4  # a full tank of gas
        self.drive_sound = "345557__inspectorj__car-engine-exterior-b.wav"

    def drive(self):
        if self.gas > 0:
            self.gas -= 1
            print('The {} {} goes VROOOM!'.format(self.color, self.manuf))
            self.play(self.drive_sound)
        else:
            print('The {} {} sputters out of gas.'.format(
                self.color, self.manuf)
            )

    def play(self, sound):
        # Loading selected sound
        pygame.mixer.music.load(sound)
        # Playing selected sound
        pygame.mixer.music.play()
        # Sleep so sound can be heard before the program might quit
        time.sleep(2)


class Car(Vehicle):  # Inherits from Vehicle class

    # turn the radio on
    def radio(self):
        print("Rockin' Tunes!")

    # open the window
    def window(self):
        print('Ahhh... fresh air!')


class Motorcycle(Vehicle):  # Inherits from Vehicle class

    # put on motocycle helmet
    def helmet(self):
        print('Nice and safe!')


class ECar(Car):  # Inherits from Car class
    def __init__(self, color, manuf):
        super().__init__(color, manuf)
        self.drive_sound = "240381__dividedby-one__ssh-hush.mp3"
        self.gas = 0  # never uses gas

    # an eco-friendly drive method
    def drive(self):
        print('The {} {} goes ssshhhhh!'.format(self.color, self.manuf))
        self.play(self.drive_sound)

    def window(self):
        super().window() # Use super(), not self as that would be recursion
        print("Also: No fumes and it's quieter.")


def main():
    my_gcar = Car('white', 'Ford')
    my_gcar.window()
    my_gcar.radio()
    my_gcar.drive()
    print("{}/4 of my gas is left.".format(my_gcar.gas))

    my_ecar = ECar('red', 'Nissan')
    my_ecar.window()
    my_ecar.radio()
    my_ecar.drive()
    # access the lingering gas tank
    print(my_ecar.gas, "gas!")


if __name__ == "__main__":
    main()
