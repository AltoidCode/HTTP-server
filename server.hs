import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types (status200)

main :: IO ()
main = run 8000 app

app :: Application
app req respond = respond $ responseLBS status200 [("Content-Type", "text/plain")] "Simple server in haskell"
