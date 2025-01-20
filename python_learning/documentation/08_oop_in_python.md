Sure! Let's dive into **Chapter 08: Object-Oriented Programming (OOP) in Python**.

### **08_oop_in_python.md**

---

## **Chapter 08: Object-Oriented Programming (OOP) in Python**

### **Overview**
Object-Oriented Programming (OOP) is a programming paradigm that organizes code into objects. An object represents a real-world entity or a concept, and it contains data (attributes) and methods (functions) to manipulate that data. Python supports OOP, and understanding it is crucial for writing efficient and reusable code.

In this chapter, we'll cover:
1. **Classes and Objects**
2. **Methods and Attributes**
3. **Inheritance and Polymorphism**
4. **Encapsulation and Abstraction**
5. **Special Methods**

---

### **1. Classes and Objects**

A class is a blueprint for creating objects. An object is an instance of a class.

#### **Syntax to Define a Class**:
```python
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year

    def display_info(self):
        print(f"{self.year} {self.make} {self.model}")
```

- **Explanation**: The `__init__()` method is a constructor that gets called when an object is created. It initializes the attributes of the class.
- **Creating an Object**:
```python
car1 = Car("Toyota", "Corolla", 2020)
car1.display_info()  # Output: 2020 Toyota Corolla
```

- **Attributes**: Variables that belong to a class. They are defined inside the `__init__()` method using `self`.
- **Methods**: Functions that belong to a class. They define the behaviors or actions that the class can perform.

---

### **2. Methods and Attributes**

In Python, methods (functions inside classes) and attributes (variables inside classes) are defined using the `self` keyword.

#### **Example with Methods and Attributes**:
```python
class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)

# Creating an object of the Rectangle class
rect1 = Rectangle(5, 10)
print(f"Area: {rect1.area()}")        # Output: Area: 50
print(f"Perimeter: {rect1.perimeter()}")  # Output: Perimeter: 30
```

- **Instance Variables**: Attributes that belong to an instance (object).
- **Instance Methods**: Methods that belong to an instance and can modify the instance’s state.

---

### **3. Inheritance and Polymorphism**

#### **Inheritance**:
Inheritance allows a class to inherit attributes and methods from another class, enabling code reuse.

- **Syntax**:
```python
class Animal:
    def sound(self):
        print("Some sound")

class Dog(Animal):
    def sound(self):
        print("Bark")
```

- **Creating an object of the subclass**:
```python
dog = Dog()
dog.sound()  # Output: Bark
```

- **Explanation**: The `Dog` class inherits from the `Animal` class but overrides the `sound()` method, demonstrating polymorphism.

#### **Polymorphism**:
Polymorphism allows a method to have different behaviors based on the object calling it. In the example above, the `sound()` method is overridden in the `Dog` class.

---

### **4. Encapsulation and Abstraction**

#### **Encapsulation**:
Encapsulation refers to the bundling of data and the methods that operate on that data within a single unit, or class. It also involves restricting access to certain components, ensuring that the object’s state is protected.

- **Private Attributes**: Prefixing an attribute with `__` makes it private.
```python
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.__salary = salary

    def get_salary(self):
        return self.__salary

emp = Employee("John", 50000)
print(emp.get_salary())  # Output: 50000
# print(emp.__salary)  # AttributeError: 'Employee' object has no attribute '__salary'
```

- **Getters and Setters**: Methods to access and modify private attributes.

#### **Abstraction**:
Abstraction involves hiding the complex implementation details and exposing only the necessary functionality.

- **Example using Abstract Base Classes (ABC)**:
```python
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * self.radius ** 2

circle = Circle(5)
print(f"Area of Circle: {circle.area()}")  # Output: Area of Circle: 78.5
```

- **Explanation**: The `Shape` class is abstract, meaning it cannot be instantiated directly. The `area()` method is an abstract method, so subclasses must implement it.

---

### **5. Special Methods**

Python classes also support special methods that are invoked for various operations like object creation, comparison, and representation.

- **`__init__()`**: Constructor method for initialization.
- **`__str__()`**: Used to define the string representation of an object.
  
  ```python
  class Car:
      def __init__(self, make, model, year):
          self.make = make
          self.model = model
          self.year = year

      def __str__(self):
          return f"{self.year} {self.make} {self.model}"

  car = Car("Honda", "Civic", 2022)
  print(car)  # Output: 2022 Honda Civic
  ```

- **`__repr__()`**: For unambiguous string representation of an object (often used for debugging).
  
  ```python
  class Point:
      def __init__(self, x, y):
          self.x = x
          self.y = y

      def __repr__(self):
          return f"Point({self.x}, {self.y})"

  p = Point(2, 3)
  print(p)  # Output: Point(2, 3)
  ```

- **`__eq__()`**: Allows you to compare objects.
  
  ```python
  class Rectangle:
      def __init__(self, width, height):
          self.width = width
          self.height = height

      def __eq__(self, other):
          return self.width == other.width and self.height == other.height

rect1 = Rectangle(5, 10)
rect2 = Rectangle(5, 10)
print(rect1 == rect2)  # Output: True
```

---

### **Conclusion**

In this chapter, we covered the fundamental concepts of Object-Oriented Programming (OOP) in Python, including classes, objects, methods, attributes, inheritance, polymorphism, encapsulation, abstraction, and special methods. These concepts are foundational for writing clean, reusable, and maintainable code.

You can now create and manipulate objects in Python, design class hierarchies using inheritance, and hide unnecessary implementation details using encapsulation and abstraction.

---

Feel free to continue by practicing these concepts with more examples. Let me know if you'd like to dive deeper into any particular topic or if you'd like to proceed with the next chapter!