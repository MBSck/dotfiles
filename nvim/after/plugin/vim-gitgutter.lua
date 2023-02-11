local icons = require("config.icons")
local sign = require("config.signs").sign

-- TODO: Change the colors so they are not all white
sign({
    name = 'GitGutterLineAdded', text = icons.git.add,
    linehl = 'None', texthl = GitGutterAdd, numhl = ''
})
sign({
    name = 'GitGutterLineModified', text = icons.git.modify,
    linehl = 'None', texthl = GitGutterChange, numhl = ''
})
sign({
    name = 'GitGutterLineRemoved', text = icons.git.remove,
    linehl = 'None', texthl = GitGutterDelete, numhl = ''
})
-- TODO: Make icons for the following as well
sign({
    name = 'GitGutterLineRemovedFirstLine', text = icons.git.remove,
    linehl = 'None', texthl = GitGutterDelete, numhl = ''
})
sign({
    name = 'GitGutterLineRemovedAboveAndBelow', text = icons.git.remove,
    linehl = 'None', texthl = GitGutterDelete, numhl = ''
})
sign({
    name = 'GitGutterLineModifiedRemoved', text = icons.git.remove,
    linehl = 'None', texthl = GitGutterDelete, numhl = ''
})

--sign GitGutterLineAdded text=+  linehl=NONE texthl=GitGutterAdd numhl=NONE
--sign GitGutterLineModified text=~  linehl=NONE texthl=GitGutterChange numhl=NONE
--sign GitGutterLineRemoved text=_  linehl=NONE texthl=GitGutterDelete numhl=NONE
--sign GitGutterLineRemovedFirstLine text=‾  linehl=NONE texthl=GitGutterDelete numhl=NONE
--sign GitGutterLineRemovedAboveAndBelow text=_¯ linehl=NONE texthl=GitGutterDelete numhl=NONE
--sign GitGutterLineModifiedRemoved text=~_ linehl=NONE texthl=GitGutterChangeDelete numhl=NONE