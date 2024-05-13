class Animal {
  void makeSound() {
    print('What is your name?');
  }
}

class Dog extends Animal {

  //Update or change some things
  @override
  void makeSound() {
    print('My name is Dog');
  }

  void main() {
    Dog dog = Dog();
    dog.makeSound();
  }
}