-- Haskell

{-
    These are my notes from learning Haskell at lunch time while following http://learnyouahaskell.com
    So this can be considered a very condensed version of that resource.

    You can compile this code by installing ghc and running 

    $ > ghc play.hs
    $ > ./play
-}

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

{- Pattern Matching

    Pattern matching is almost like a mix between overloading and a switch case statement
    for example, lets write a function that takes in a integer and then returns the integer 
    unless its the number 2 in which case it will return -1
-}

replaceTwos :: (Integral a) => a -> a
replaceTwos 2 = -1
replaceTwos x = x

{- Guards

    Pattern matching is a way to make sure a value conforms to some schema, guards tell wether 
    some property of a value is true or false, very similar to an if statement. We are going to 
    write a function that tells you how bad your PR is given the number of files involved.

    Where the conditions in pattern match to a particular value each condition in a guard is an
    expression based on the current input that resolves to a value

    The "Otherwise" condition is just syntactic sugar as otherwise under the hood is defined as True
-}

prTell :: (Integral a) => a -> String
prTell fileCount
    | fileCount <= 5 = "Wow, so granular great work, you are my hero"
    | fileCount > 5 && fileCount <= 25 = "A solid peice of work"
    | otherwise = "You have brought shame to your family name and the punishment is death"

-- Another example, a custom implementation of the max function

customMax :: (Integral a) => a -> a -> a
customMax x y
    | x > y = x
    | otherwise = y

{- Bindings with "Where" 

    We can sometimes prevent ourselves from repeating ourselves in guards by using a where.
    Where clauses can be extended to have multiple declarations in them.
    Where clause declaration names are confined to the parent scope they are not global
-}

dumbFunc :: (Integral a) => a -> a -> String
dumbFunc x y
    | sumVals < minimum = "The result is less than 10"
    | sumVals < maximum = "The result is less than 20"
    where   sumVals = x + y
            minimum = 10
            maximum = 20

{- Let Bindings

    let <bindings> in <expression>

    the difference between 'let' and 'where' is that let..in clauses are expressions in themselves whereas where is a
    complete construct, also let bindings cannot be used across guards, this mean basically that we can inline let...in

-}

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea 
{-

    And inlined;

    4 * (let a = 9 in a + 1) + 2 

    We can even inline a let into a comprehension just like a predicate but haskell is smart enough not to try and use it
    as a filter, for example
-}

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] 

{-  Case Expressions

    Earlier I showed pattern matching on function arguments, this is just syntactic sugar over case expressions
    so the two are very similar

    the general syntax follows

    case expression of  pattern -> result
                        pattern -> result
                        pattern -> result
                        pattern -> result

    Lets write two functions, one pattern matching and an equivelant that uses the case expression

-}

iHateTheLetterA :: (Char a) => a -> a
iHateTheLetterA 'a' = 'I'
iHateTheLetterA x = x

{- And now case -}

iHateLetterAToo :: (Char a) => a -> a
iHateLetterAToo letter = case letter of 'a' -> 'I'
                                        (x) -> x

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
    print "Pattern Matching"
    print (replaceTwos 2)



