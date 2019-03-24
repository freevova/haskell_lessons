-- Q39.1 Build a function buildRequestNOSSL that works exactly like buildRequest, only it doesn’t support SSL.

buildRequestNOSSL :: BC.ByteString -> BC.ByteString -> BC.ByteString -> BC.ByteString -> Request
buildRequestNOSSL token host method path  = setRequestMethod method
                                  $ setRequestHost host
                                  $ setRequestHeader "token" [token]
                                  $ setRequestSecure False
                                  $ setRequestPort 80
                                  $ setRequestPath path
                                  $ defaultRequest
