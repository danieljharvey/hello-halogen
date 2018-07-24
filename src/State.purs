module App.State where

data Query a = ToggleState a 
             | ChangeName String a
             | Reset a

type State = { on :: Boolean
             , name :: String 
             , pageOne :: PageOne
             }

type PageOne = { firstName   :: String
               , lastName    :: String
               }

