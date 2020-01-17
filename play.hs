-- Haskell

-- Functions

-- Simple function
addMe x y = x + y

-- List comprehension, double any value greated than 10
simpleComprehension :: [Int] -> [Int]
-- comprehensions are in the format [ Function to be applied | Current value <- List, Predicate [, Predicate...] ]
simpleComprehension xs = [c * 2 | c <- xs, c > 10]

-- Typed function
replaceBWithA :: [Char] -> [Char]
replaceBWithA x = ['A' | v <- x]

-- Typed function with multiple params 
multiParams :: Int -> Int -> Int
multiParams x y = x + y

{- Generics & Type Classes

    A typeclass is like an interface, for example if we look at the type signature of the == function it is

        (Eq a) => a -> a -> Bool
    
    The => comes after the typeclass, now this describes a function that takes two values of the same type (a)
    and returns a boolean, but it predicates that a needs to be part of the Eq TYPE CLASS. 

    This typeclass simply defines things that can be checked for equality

    Here are some other typeclasses

    Eq      : types that support equality testing, all types support this, exoression is == 
    Ord     : types that have an order, all types except function support this, this means the type is comparable using < > <= >=
    Show    : types that can be presented as string, again this covers all types except functions, expression is show
    Read    : takes a string and returns a type, expression is read, read "[1,2,3,4]" :: [Int]
    Enum    : sequentially ordered types, can be used in ranges
    Bounded : members have a upper and lower boun
    Num     : numeric typeclass, the type can behave like a number, float, int, double etc
    Integral: Whole Numbers
    Floating: Floating numbers

    Having multiple typeclasses is done like so 

    fromIntegral :: (Num b, Integral a) => a -> b

-}

-- Main function, root of program
main = do
    -- Tuples

    -- Simple tuple
    let x = (1, 2)
    -- Mixed Tuple
    let y = ("aa", 3)
    -- Triples
    let z = (1, 2, 'a')

    -- constant declaration
    let x = 1
    print "replaceBWithA"
    print (replaceBWithA "AAAABBABABBABBAA")
    print "multiParams"
    print (multiParams 10 11)
    print "simpleComprehension"
    print (simpleComprehension [100, 50, 1, 9, 22])



