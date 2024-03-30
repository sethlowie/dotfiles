local setup, startup = pcall(require, "startup")
if not setup then
	return
end

startup.setup({
	theme = "evil",
})
