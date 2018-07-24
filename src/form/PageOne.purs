module App.Form.PageOne where

import Prelude

import Halogen as H
import Halogen.HTML.Properties as HP
import Halogen.HTML as HH
import App.State (Query, PageOne)

showGrid :: Array (Array Int) -> H.ComponentHTML Query
showGrid grid = HH.div [ HP.class_ $ H.ClassName "grid" ] ( map showRow grid )

showRow :: Array Int -> H.ComponentHTML Query
showRow row = HH.div [ HP.class_ $ H.ClassName "row" ] ( map showItem row )

showItem :: Int -> H.ComponentHTML Query
showItem item = HH.div [ HP.class_ $ H.ClassName "item" ] [ HH.text $ show item ]

renderPageOne :: PageOne -> H.ComponentHTML Query
renderPageOne state =
    HH.div_
      [ HH.h3_
          [ HH.text "Page One" ]
      , HH.div_
          [ showGrid state.grid ]
      ]
