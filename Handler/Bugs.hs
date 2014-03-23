module Handler.Bugs
    ( getBugsR
    , postBugsR
    )
where

import Import

-- to use Html into forms
import Yesod.Form.Nic (YesodNic, nicHtmlField)
instance YesodNic App

entryForm :: Form Bug
entryForm = renderDivs $ Bug
    <$> areq   textField "Title" Nothing
    <*> areq   nicHtmlField "Content" Nothing

-- The view showing the list of bugs
getBugsR :: Handler Html
getBugsR = do
    -- Get the list of articles inside the database.
    bugs <- runDB $ selectList [] [Desc BugTitle]
    -- We'll need the two "objects": articleWidget and enctype
    -- to construct the form (see templates/articles.hamlet).
    (bugWidget, enctype) <- generateFormPost entryForm
    defaultLayout $ do
      $(widgetFile "bugs")

postBugsR :: Handler Html
postBugsR = do
    ((res,bugWidget),enctype) <- runFormPost entryForm
    case res of
         FormSuccess bug -> do
            bugId <- runDB $ insert bug
            setMessage $ toHtml $ (bugTitle bug) <> " created"
            redirect $ BugR bugId
         _ -> defaultLayout $ do
                setTitle "Please correct your entry form"
                $(widgetFile "bugAddError")
