const express = require("express");
const app = express();

app.get("/", (req, res) => res.send("Hello from Private EC2 API"));
app.get("/health", (req, res) => res.send("ok"));

app.listen(8080, () => console.log("Server running on port 8080"));
