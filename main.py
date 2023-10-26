import mysql.connector

# Connect to database
db = mysql.connector.connect(
  host="bballanalytics.cywydwdmjlkd.us-east-1.rds.amazonaws.com", 
  user="admin",
  password="bball123",
  database="baseball_db"
)

cursor = db.cursor()

# Execute first view to get player info
query = "SELECT * FROM player_info"
cursor.execute(query)

print("Player info:")
for (player_id, name, position) in cursor:
  print(f"{name} plays {position}")

# Execute second view to get batter stats  
query = "SELECT * FROM batter_stats"
cursor.execute(query)

print("\nBatter stats:")
for (batter_id, at_bats, hits, homeruns, avg) in cursor:
  print(f"{name}: AB={at_bats}, H={hits}, HR={homeruns}, AVG={avg}")

# Close database connection  
db.close()