const watcher = Deno.watchFs("/home/yxqsnz/.config/bspwm/")
const system = (command) => 
	Deno.run({ cmd: command.split(" ") });
await (async () => {
	for await (const event of watcher) {
		if (event.kind == 'modify') {
			await system("bspc wm -r");
		}
	}
})()
