import sys, duckdb

con = duckdb.connect("data/olist.duckdb", read_only=True)
for stmt in open(sys.argv[1], encoding="utf-8").read().split(";"):
    if stmt.strip():
        print(con.sql(stmt))