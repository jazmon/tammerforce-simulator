module Shared.Data exposing (..)

import Array
import Random exposing (Generator)

import Shared.Types exposing (..)
import App.Types exposing (..)


randomInteger : Int -> Generator Int
randomInteger maxInt = Random.int 0 maxInt

getRoundRandomFactor : Cmd Msg
getRoundRandomFactor = Random.generate
  (\ generatedRandomFactor -> ExecuteRound { randomFactor = generatedRandomFactor })
  (randomInteger 100
  )


getRandomCoderIndex :  Cmd Msg
getRandomCoderIndex = Random.generate
  (\ generatedRandomIndex -> AddCoder { coderIndex = generatedRandomIndex })
  (randomInteger (List.length coderNames)
  )

coderNames : List Coder
coderNames =
  [ (Coder 3 20 "Hessu Kypärä" "miro")
  , (Coder 2 10 "Ahto Simakuutio" "op")
  , (Coder 4 30 "Markku Markkula" "ippe")
  , (Coder 5 10 "Jorma Teräs" "eetu")
  ]


eventStash : List Event
eventStash =
  [ (Event "Coffee machine exploded" [
    (Option "Buy a new one!" "Not surprisignly people are happy. Coffee keeps this shitshow going!" -5 -5 0)
    , (Option "Drink water" "What is this shit. How can you deliver without black gold?" 0 10 0)
    ])

    , (Event "Coffee machine exploded" [
        (Option "Buy a new one!" "Not surprisignly people are happy. Coffee keeps this shitshow going!" -5 -5 0)
        , (Option "Drink water" "\"What is this shit. How can you deliver without black gold?\" puukko +10" 0 10 0)
        ])

    , (Event "Employees want bubble gum" [
        (Option "Let em have it" "\"Gum stuck on the carpet everywhere. Not good\"" -2 1 0)
        , (Option "Hard no" "Carpets of the office are clean but the teeth of employees are getting to bad state. Puukko +3" 0 3 0)
        ])

    , (Event "Riku looks like he's about to open his hair" [
        (Option "Fine by me" "Afterwork imminent! Prepare your quality microbrewed beers!" -5 -15 0)
        , (Option "Not yet, dagnabbit" "Ebit but Syvä depe" 4 5 0)
        ])

    , (Event "What kind of coffee should we brew next?" [
        (Option "A normal brew will do" "Ebit increases but your level of office is downgraded" 1 0 -1)
        , (Option "Black death 666" "HAIL CTHULTHU!" 2 -1 0)
        ])

    , (Event "Whoops, this feature will take twice as long as we planned" [
        (Option "Distract customer with cat videos" "\"Oooh look at them play!\"" -2 -2 0)
        , (Option "Work your ass off" "\"The hell undefined is not a function\"" 3 -2 0)
        ])

    , (Event "Inez afterwork went wild and team wants to create Wappu-application for students. What do you do?" [
        (Option "No raha uuni business, please bring me ebit" "\"Team was seriously disappointed on your lack of vision\"" 2 10 0)
        , (Option "What the hell lezzdothis before others get the same idea" "\"BLAZING SUCCESS! 5 new hires due to this marketing stunt!\"" 5 -15 0)
        ])

    , (Event "Tomi suggests a round of kokkipeli" [
        (Option "Hell yeah!" "Fun times were had" -1 -2 0)
        , (Option "Not now, I\'m doing serious EBIT" "Timo S approves" 2 2 0)
        ])

    , (Event "Alko webshop is not cooperating" [
        (Option "Fuck it, take taxi to nearest Alko. 3x2 bitches" "IT-BUBBLE!" -1 -1 0)
        , (Option "Buy some cheap bulk lager from M-Kauppa" "\"Didn\'t we make millions of profit last year...?\"" 1 2 0)
        ])

    , (Event "Seksi-Nikkola is going to take a dump" [
        (Option "Sure, go right ahead boy" "Office toilet is now completely stuck! And it stinks! The shit?" -1 -1 -4)
        , (Option "Suck it up" "\"Not sure why you would decline a dude having a shit but everything seems to be normal, if you ignore S-N\'s skin colour\"" 2 10 0)
        ])

    , (Event "Hey, let's do a Lahti-excursion!" [
        (Option "Bring on the lihamukis!" "We lost five developers on the trip but maybe it was worth it!" -6 -15 0)
        , (Option "Let\'s not go there, it\'s a mesta place." "\"All work no play makes Dick dull boy... but EBIT seems to be good\"" 2 -5 0)
        ])

    , (Event "It's 3:42AM, you're drunk as skunk and someone suggests a Toimistojatkot" [
        (Option "HEE-HAW BRING ON THE PARTY!" "Office is trashed but happines increased. " 0 -5 -4)
        , (Option "Maybe go home and get some sleep." "What an adult thing to do!" 1 2 0)
        ])

    , (Event "You're testing the customer's SMS push system." [
        (Option "Nakkimuki" "You flooded one million devices with \"Nakkimuki\" test message. Hilarity ensued, customer went ballistical" -3 -4 0)
        , (Option "This is a test message from Vincit" "This one is a test message from Vincit as well" -2 -2 0)
        ])

    , (Event "Solita is trying to poach our devs" [
        (Option "HAH, let \'em try" "Stay thirsty, my friends" 0 -4 0)
        , (Option "HAH, let \'em try" "Stay thirsty, my friends" 0 -4 0)
        ])

    , (Event "Customer runs out of budget" [
        (Option "Talk them into buying anyway" "\"OK, I guess we can fit this to someone else\'s budget\" Massive bonus-EBIt!" 15 -1 0)
        , (Option "Prepare for Timo\'s wrath" "\"There were serious overruns last month, so no Futubonus and Lagunitas IPA is changed to Karjala\"" -10 10 0)
        ])

    , (Event "Urgent fix needs to be deployed and staging environment is down" [
        (Option "We\'ll do it in production. It worked on my machine." "You hot-patched a live system and it went... WELL! " 5 -2 0)
        , (Option "We should wait for the staging server to come back to life" "While waiting, customer lost 2m of turnover. Angry emails have been received. Nakkimuki" -10 3 0)
        ])
  ]


getCoderByIndex : Int -> Coder
getCoderByIndex idx = Array.fromList coderNames |> Array.get idx  |> \prospect ->
  case prospect of
    Nothing ->
      (Coder 1 1 "Fallback Coder" "miro")

    Just val ->
      val
