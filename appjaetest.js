const express = require("express");
const child_process = require("child_process");

const app = express();
app.use(express.json());

// ❌ Command injection (intentional)
app.post("/run", (req, res) => {
  const cmd = req.body.cmd;
  child_process.exec(cmd, (err, stdout) => {
    if (err) {
      return res.status(500).send(err.message);
    }
    res.send(stdout);
  });
});

app.listen(3000, () => {
  console.log("App listening on port 3000");
});