const express = require("express");
const { health } = require("./index");

const app = express();

app.get("/", (req, res) => res.json(health()));

app.listen(3000, () => console.log("App ejecutándose en 3000"));
