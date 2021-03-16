module Tutorial4 where

import Data.List (nub)
import Data.Char
import Test.QuickCheck
import Network.HTTP (simpleHTTP,getRequest,getResponseBody)

-- <type decls>

type Link = String
type Name = String
type Email = String
type HTML = String
type URL = String

-- </type decls>
-- <sample data>

testURL     = "http://homepages.inf.ed.ac.uk/wadler/testpage.html"

testHTML :: String
testHTML =    "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n"
           ++ "<html>\n"
           ++ "<head>\n"
           ++ "<title>FP: Tutorial 4</title>\n"
           ++ "</head>\n"
           ++ "<body>\n"
           ++ "<h1>A Boring test page</h1>\n"
           ++ "<h2>for tutorial 4</h2>\n"
           ++ "<a href=\"https://course.inf.ed.ac.uk/inf1a\">Inf1A Learn</a><br>\n"
           ++ "<b>Lecturer:</b> <a href=\"mailto:wadler@inf.ed.ac.uk\">Philip Wadler</a><br>\n"
           ++ "<b>TA:</b> <a href=\"mailto:cchirita@exseed.ed.ac.uk\">Claudia-Elena Chirita</a>\n"
           ++ "</body>\n"
           ++ "</html>\n\n"

testLinks :: [Link]
testLinks =  ["https://course.inf.ed.ac.uk/inf1a\">Inf1A Learn",
              "mailto:wadler@inf.ed.ac.uk\">Philip Wadler",
              "mailto:cchirita@exseed.ed.ac.uk\">Claudia-Elena Chirita"]

testAddrBook :: [(Name,Email)]
testAddrBook = [ ("Philip Wadler","wadler@inf.ed.ac.uk")
               , ("Claudia-Elena Chirita","cchirita@exseed.ed.ac.uk")]

-- </sample data>
-- <system interaction>

getURL :: String -> IO String
getURL url = simpleHTTP (getRequest url) >>= getResponseBody

emailsFromURL :: URL -> IO ()
emailsFromURL url =
  do html <- getURL url
     let emails = (emailsFromHTML html)
     putStr (ppAddrBook emails)

emailsByNameFromURL :: URL -> Name -> IO ()
emailsByNameFromURL url name =
  do html <- getURL url
     let emails = (emailsByNameFromHTML html name)
     putStr (ppAddrBook emails)

-- </system interaction>
-- <exercises>

-- 1.
sameString :: String -> String -> Bool
sameString = undefined


-- 2.
prefix :: String -> String -> Bool
prefix = undefined

prop_prefix_pos :: String -> Int -> Property
prop_prefix_pos str n = n >= 0 ==> prefix substr (map toUpper str)
  where
    substr = take n str

prop_prefix_neg :: String -> Int -> Property
prop_prefix_neg str n = 0 <= n && n < length str ==> (not $ prefix str substr)
  where
    substr = take n str
        
-- 3.
contains :: String -> String -> Bool
contains = undefined

prop_contains :: String -> Int -> Int -> Property
prop_contains = undefined


-- 4.
takeUntil :: String -> String -> String
takeUntil = undefined

dropUntil :: String -> String -> String
dropUntil = undefined


-- 5.
split :: String -> String -> [String]
split = undefined

reconstruct :: String -> [String] -> String
reconstruct = undefined

prop_split :: String -> String -> Property
prop_split sep str = not (null sep) ==> reconstruct sep (split sep str) `sameString` str

-- 6.
linksFromHTML :: HTML -> [Link]
linksFromHTML = undefined

testLinksFromHTML :: Bool
testLinksFromHTML  =  linksFromHTML testHTML == testLinks


-- 7.
takeEmails :: [Link] -> [Link]
takeEmails = undefined


-- 8.
link2pair :: Link -> (Name, Email)
link2pair = undefined


-- 9.
emailsFromHTML :: HTML -> [(Name,Email)]
emailsFromHTML = undefined

testEmailsFromHTML :: Bool
testEmailsFromHTML  =  emailsFromHTML testHTML == testAddrBook


-- Optional Material

-- 10.
findEmail :: Name -> [(Name, Email)] -> [(Name, Email)]
findEmail = undefined


-- 11.
emailsByNameFromHTML :: HTML -> Name -> [(Name,Email)]
emailsByNameFromHTML = undefined


ppAddrBook :: [(Name, Email)] -> String
ppAddrBook addr = unlines [ name ++ ": " ++ email | (name,email) <- addr ]
