const express = require("express");

let app = express();
app.use(express.static("../Vpekdas.github.io/dist/"));

app.listen(8080);
