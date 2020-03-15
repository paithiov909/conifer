require("../js/elasticlunr.bundle.js");

const sentences =  ["夢はジュエル",　"誰もひとつずつ",　"胸に抱きしめて", "いけすかない", "いけしゃあしゃあ"];
sentences.map((el, idx) => {
	global.elasticlunr.addDoc({
		"id": idx,
		"body": el
	});
});

describe("test", () => {
    describe("-1.search", () => {
        it("夢?", () => {
			const r = global.elasticlunr.search("夢", {
				fields: {
					body: {　boost: 1　},
				},
				bool: "OR"
			});
			console.log(r);
            expect(r[0]["ref"]).toBe("0");
        });
        it("いけ?", () => {
			const r = global.elasticlunr.search("いけ", {
				fields: {
					body: {　boost: 1　},
				},
				expand: true,
				bool: "OR"
			});
			console.log(r);
            expect(r.length).toBe(2);
        });
	});
});
