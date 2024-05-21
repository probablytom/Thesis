from functools import partial
class Person:
    def __init__(self, name: str):
        self.name = name
    
    def say_hello(self):
        print(f"Hello! I'm {self.name}.")


arthur = Person("Arthur Dent")
ford = Person("Ford Prefect")

# Prints "hello, I'm " + name of person for both Arthur and Ford.
arthur.say_hello()
ford.say_hello()

# Monkey-patch the `Person` class, changing `say_hello` for all instances.
def italian_hello(person: Person):
    print(f"Ciao! Sono {person.name}.")
Person.say_hello = italian_hello

# Arthur and Ford now both greet in Italian.
arthur.say_hello()
ford.say_hello()

# Monkey-patching can affect individual instances of classes too, rather than
# all instances of the class.
# Monkey-patch Ford's `say_hello` method, making their greeting Norwegian.
# (Python fills in say_hello's first argument automatically; this is replicated
# here using `functools.partial`. This is an implementation detail made
# necessary by Python and is unrelated to the concept of monkey-patching.)
def norwegian_hello(person: Person):
    print(f"Hei! Jeg er {person.name}.")
ford.say_hello = partial(norwegian_hello, ford)

# Arthur now greets in Italian, but Ford greets in Norwegian.
arthur.say_hello()
ford.say_hello()