# database-indexes

script to fill DB with 40m users
[data.sql](scripts%2Fdata.sql)

## Compare performance of selections by date with different index types

queries | without index InnoDB engine | BTREE index InnoDB engine | HASH index MEMORY engine
--------------------------------------------------- |-----------------------------|---------------------------| --- 
SELECT * FROM users WHERE birthday = '1991-06-12'; | 16.14 sec	                  | 1.24 sec |	1.71 sec
SELECT * FROM users WHERE birthday = '1994-06-12' AND firstname LIKE 'User2%'; | 	15.73 sec                  | 	1.63 sec                   |	1.80 sec
SELECT * FROM users WHERE birthday > '2023-10-30'; | 	19.95 sec                  | 	4.45 sec                   | 	4.05 sec                   
SELECT * FROM users WHERE MONTH(birthday) = 8; | 	25.07 sec                  | 	27.81 sec                  | 	15.62 sec                  
SELECT * FROM users WHERE YEAR(birthday) = 2003; | 	21.18 sec                  | 	23.34 sec                  | 	13.77 sec                  
SELECT * FROM users WHERE birthday LIKE "%-01"; | 	23.60 sec                  | 	21.60 sec                  | 	13.20 sec                  
SELECT * FROM users WHERE birthday LIKE "1980-%"; | 	21.67 sec                  | 	22.09 sec                  | 	9.29 sec                   
SELECT * FROM users WHERE (birthday BETWEEN '2000-01-01' AND '2000-09-29'); | 	43.28 sec                  | 	39.25 sec                  | 	27.12 sec                  
SELECT MAX(birthday) FROM users; | 	12.15 sec                  | 	0.03 sec                   | 	9.63 sec                   
SELECT * FROM users ORDER BY birthday DESC LIMIT 5; | 	18.78 sec                  | 	0.02 sec                   | 	11.35 sec                  
SELECT * FROM users ORDER BY birthday LIMIT 5; | 	19.49 sec                  | 	0.08 sec                   | 	8.93 sec                   


## Compare Insert speed difference with different *innodb_flush_log_at_trx_commit*


### Command for testing:

```bash
$ siege -b -c30 -t15s "http://localhost:8080/users POST"
```

mode | ops per second   
--- |------
0 | 474.28         
1 | 386.22         
2 | 409.58         

ops per second value is an average from several tries
