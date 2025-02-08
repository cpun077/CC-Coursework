import unittest
from bio import mammals


class TestElephant(unittest.TestCase):
    """
    One object of this class is a tester of the bio.mammals.Elephant class.
    """

    def test__init__and__str__(self):
        """
        Tests that the __init__ constructor method does not produce an error
        and that the resulting Elephant object's __str__ output is correct.
        """
        self.assertEqual
        (
            mammals.Elephant('Foo').__str__(), "The 🐘 named Foo"
        )

    def test_make_noise(self):
        """
        Tests that the make_noise method does not produce error messages.
        You should be able to hear the noise.
        """
        self.assertEqual
        (
            mammals.Elephant('Foo').make_noise(), None
        )


class TestLion(unittest.TestCase):
    """
    One object of this class is a tester of the bio.mammals.Lion class.
    """

    def test__init__and__str__(self):
        """
        Tests that the __init__ constructor method does not produce an error
        and that the resulting Lion object's __str__ output is correct.
        """
        self.assertEqual(
            mammals.Lion('Foo').__str__(), "The 🦁 named Foo"
        )

    def test_make_noise(self):
        """
        Tests that the make_noise method does not produce error messages.
        You should be able to hear the noise.
        """
        self.assertEqual(
            mammals.Lion('Foo').make_noise(), None
        )


if __name__ == '__main__':
    unittest.main()
