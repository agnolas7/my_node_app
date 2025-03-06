const express = require("express");
const bcrypt = require("bcrypt");
const mysql = require("mysql");
const path = require("path");
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "auth.html"));
});

app.get("/dashboard", (req, res) => {
  db.query("SELECT * FROM users", (err, results) => {
    if (err) {
      res
        .status(500)
        .json({ success: false, message: "Database query failed" });
      return;
    }
    res.json(results);
  });
});

// Create a MySQL connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "my_node_app",
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL database:", err);
    return;
  }
  console.log("Connected to MySQL database");

  db.query(
    `CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) PRIMARY KEY,
    password_encrypted TEXT,
    password_unencrypted TEXT
  )`,
    (err, result) => {
      if (err) {
        console.error("Error creating table:", err);
        return;
      }
      console.log("Table created or already exists");
    }
  );
});

app.post("/signup", async (req, res) => {
  const { username, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);

  db.query(
    `INSERT INTO users (username, password_encrypted, password_unencrypted) VALUES (?, ?, ?)`,
    [username, hashedPassword, password],
    (err, result) => {
      if (err) {
        res.json({
          success: false,
          message: "Error: Username already exists!",
        });
      } else {
        res.json({
          success: true,
          message: "Sign-up successful! User data saved.",
        });
      }
    }
  );
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;

  db.query(
    `SELECT * FROM users WHERE username = ?`,
    [username],
    async (err, results) => {
      if (err || results.length === 0) {
        res.json({ success: false, message: "User not found!" });
        return;
      }

      const user = results[0];
      const isValidEncrypted = await bcrypt.compare(
        password,
        user.password_encrypted
      );
      const isValidUnencrypted = password === user.password_unencrypted;

      if (isValidEncrypted || isValidUnencrypted) {
        res.json({ success: true, message: "Login successful!" });
      } else {
        res.json({ success: false, message: "Invalid credentials!" });
      }
    }
  );
});

app.listen(3000, () => console.log("Server running on port 3000"));
