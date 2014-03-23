module Handler.Bug where

import Import

getBugR :: BugId -> Handler Html
getBugR bugId = do
    bug <- runDB $ get404 bugId
    defaultLayout $ do
        setTitle $ toHtml $ bugTitle bug
        $(widgetFile "bug")
