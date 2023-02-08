local icons = require("config.icons")
local sign = require("config.signs").sign

sign({name = 'GitGutterLineAdded', text = icons.git_add})
sign({name = 'GitGutterLineModified', text = icons.git_modify})
sign({name = 'GitGutterLineRemoved', text = icons.git_remove})

--GitGutterLineRemovedFirstLine
--GitGutterLineRemovedAboveAndBelow
--GitGutterLineModifiedRemoved
