module MyModule
  class MyClass
  end
end

# bad
module MyModule
  class Foo < MyClass
  end
end

# good
module MyModule
  class Foo < MyModule::MyClass
  end
end
