require('decorated_yank').setup({
  domains = {
    github = {
      url = "github.com",
      blob = "/blob/",
      line_format = "#L%s-L%s",
    },
    splunk = {
      url = "cd.splunkdev.com",
      blob = "/-/blob/",
      line_format = "#L%s-%s",
    }
  }
})
