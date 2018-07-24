module App.State where

import Prelude (($))
import Data.Enum (toEnum)

import Data.Date (Date, exactDate, Month(..), Day)

type PageOne = { firstName   :: String
               , lastName    :: String
               , dateOfBirth :: Date
               }

data Query a = ToggleState a 
             | ChangeName String a
             | ChangeDate String a
             | Reset a

type State = { on :: Boolean
             , name :: String 
             , pageOne :: PageOne
             }

date :: Date
date = exactDate $ Year 2018 $ March 4

pageOne :: PageOne
pageOne = { firstName: ""
          , lastName: ""
          , dateOfBirth: date
          }

initialState :: State
initialState = 
    { on: false
    , name: "Horse"
    , pageOne: pageOne
    }