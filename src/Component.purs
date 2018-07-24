module Component where

import Prelude

import Data.Maybe (Maybe(..))

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
          
data Query a = ToggleState a 
             | ChangeName String a
             | Reset a

type State = { on :: Boolean, name :: String }

component :: forall m. H.Component HH.HTML Query Unit Void m
component =
  H.component
    { initialState: const initialState
    , render
    , eval
    , receiver: const Nothing
    }
  where

  initialState :: State
  initialState = { on: false, name: "Horse" }

  render :: State -> H.ComponentHTML Query
  render state =
    HH.div_
      [ HH.h1_
          [ HH.text $ "Hello " <> state.name ]
      , HH.p_
          [ HH.text "Why not toggle this button:" ]
      , HH.input
          [ HP.value state.name, HE.onValueInput (HE.input ChangeName) ] 
      , HH.button
          [ HE.onClick (HE.input_ ToggleState) ]
          [ HH.text
              if not state.on
              then "Don't push me"
              else "I said don't push me!"
          ]
      , HH.button
          [ HE.onClick (HE.input_ Reset) ]
          [ HH.text "Reset" ]
      ]

  eval :: Query ~> H.ComponentDSL State Query Void m
  eval = case _ of
    ToggleState next -> do
      _ <- H.modify (\state -> state { on = not state.on })
      pure next
    ChangeName name next -> do
      _ <- H.modify (\state -> state { name = name })
      pure next
    Reset next -> do
      _ <- H.modify $ const initialState
      pure next
