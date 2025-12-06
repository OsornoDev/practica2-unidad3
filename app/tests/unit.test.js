const { health } = require("../src/index");

test("Health responde correctamente", () => {
    const res = health();
    expect(res.status).toBe("ok");
});
