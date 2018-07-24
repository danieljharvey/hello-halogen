module App.State where

import Prelude
import Data.Array

data Query a = ToggleState a 
             | ChangeName String a
             | Reset a
  
type State = { on :: Boolean
             , name :: String 
             , pageOne :: PageOne
             }

type PageOne = { grid :: Array (Array Int) }

pageOne :: PageOne
pageOne = { grid: [ [1, 2, 3, 4, 5]
                  , [3, 4, 5, 6, 7]
                  , [8, 9, 9, 9, 9]
                  ]
          }

appState :: State
appState = { on: false, name: "Horse", pageOne: pageOne }
