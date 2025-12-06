const express = require("express");
const app = express();

// Root endpoint
app.get("/", (req, res) => {
  res.send("Hello from Private EC2 API");
});

// Health endpoint
app.get("/health", (req, res) => {
  res.status(200).send("ok");
});

// IMPORTANT: listen on 0.0.0.0, not 127.0.0.1
const PORT = 8080;
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});

