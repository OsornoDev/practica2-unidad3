const axios = require("axios");

test("La API responde", async () => {
    const res = await axios.get("http://localhost:3000/");
    expect(res.status).toBe(200);
});
