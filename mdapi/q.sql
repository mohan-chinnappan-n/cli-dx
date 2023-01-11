SELECT COUNT(*) AS CNT   FROM CSV("results.csv", {headers:true}) WHERE Priority < 3
