vim.filetype.add({
	pattern = {
		[".*/%.kube/config"] = "yaml",
	},
	extension = {
		mdx = "markdown",
	},
})
