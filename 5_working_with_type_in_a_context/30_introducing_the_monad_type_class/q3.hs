-- Q30.3 Implement a bind function which is the same as (>>=) for Maybe:
--
--   bind :: Maybe a -> (a -> Maybe b) -> Maybe b

bind :: Maybe a -> (a -> Maybe b) -> Maybe b
bind Nothing _ = Nothing
bind (Just val) func = func val
