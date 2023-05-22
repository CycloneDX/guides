--- Return a block element causing a empty paragraph in the given format.
local function emptyparagraph(format)
  if format == 'docx' then
    local emptyparagraph = '<w:p><w:r></w:r></w:p>'
    return pandoc.RawBlock('openxml', emptyparagraph)
  elseif format:match 'html.*' then
    return pandoc.RawBlock('html', '<div style=""></div>')
  else
    -- fall back to insert a form feed character
    return pandoc.Para{pandoc.Str '\f'}
  end
end

-- Filter function called on each RawBlock element.
function RawBlock (el)
  -- check that the block is TeX or LaTeX and contains only \emptyparagraph
  if el.text:match '\\emptyparagraph' then
    -- use format-specific emptyparagraph marker. FORMAT is set by pandoc to
    -- the targeted output format.
    return emptyparagraph(FORMAT)
  end
  -- otherwise, leave the block unchanged
  return nil
end
