require('dd-trace').init();
const express = require('express');
const app = express();

app.get("/hello", async (req, res) => {
  console.log("in /hello");
  res.status(200).json();
});

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`Application is now ready, listening to: ${port} randomId: ${Math.random()}`));