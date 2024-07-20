# test_hello_world.py
def test_hello_world():
    assert "Hello, World!" in open("hello_world.py").read()
