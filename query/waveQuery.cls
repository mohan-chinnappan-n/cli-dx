String query = 'q = load "0Fb3h0000008s9kCAA/0Fc3h0000026QBWCA2"; q = foreach q generate fruit as \'fruit\', qty as \'qty\'; q = limit q 2000;';     
ConnectApi.LiteralJson result =  ConnectApi.Wave.executeQuery(query);
String response = result.json;
System.debug(response);
