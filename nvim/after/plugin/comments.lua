local status, comment = pcall(require, 'Comment')
if not status then 
  return
end

comment.setup(
{
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = ';;',
    },
    opleader = {
      line = ';',
    },
    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
