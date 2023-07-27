class FileFinder:
    """A class to find files"""

    def __init__(self, patterns):
        self.patterns = patterns

    def __str__(self):
        return self.patterns

def test_sum():
    assert sum([1, 2, 3]) == 6, "Should be 6"

def main():
    print("Hello")

if __name__ == "__main__":
    test_sum()
    print("Everything passed")
