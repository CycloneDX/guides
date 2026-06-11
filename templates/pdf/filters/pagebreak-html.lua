--- Pandoc filter for the HTML/WeasyPrint pipeline.
---
--- 1. Page breaks. Guide sources mark page breaks with raw blocks of the form:
---      <div style="page-break-after: always; visibility: hidden">
---      \newpage
---      </div>
---    and vertical spacers with \emptyparagraph in the same wrapper.
---    GFM parses each wrapper as a single RawBlock; this filter replaces
---    the whole block.
---
--- 2. PDF images. Some figures are referenced as .pdf (not renderable by
---    WeasyPrint); remap to the sibling .svg export so figures stay vector.
---    (Convert with pdftocairo -svg + tools/composite_svg_masks.py.)
---
--- 3. URL line breaking. Long URLs should break only at hyphens, not after
---    "/" or "."; insert WORD JOINER after those characters in link text
---    to suppress the unwanted break opportunities.

function RawBlock (el)
  if el.text:match '\\newpage' then
    return pandoc.RawBlock('html', '<div class="page-break"></div>')
  elseif el.text:match '\\emptyparagraph' then
    return pandoc.RawBlock('html', '<p class="empty-para">&#160;</p>')
  elseif el.text:match '^<div style="page%-break' or el.text:match '^</div>' then
    -- stray wrapper fragments (when the marker div was split by blank lines)
    return {}
  end
  return nil
end

function Image (el)
  if el.src:match '%.pdf$' then
    el.src = el.src:gsub('%.pdf$', '.svg')
    return el
  end
  return nil
end

function OrderedList (el)
  -- preserve the "1)" marker style (lost in pandoc's HTML output)
  if el.listAttributes.delimiter == 'OneParen' then
    return pandoc.Div({el}, pandoc.Attr('', {'paren-list'}))
  end
  return nil
end

function Table (el)
  -- Tables that stack many lines inside cells (4+ line breaks) contain
  -- long unbreakable tokens; tag them so the stylesheet can allow
  -- last-resort word breaks and keep them within the page.
  local breaks = 0
  el:walk({
    LineBreak = function () breaks = breaks + 1 end,
    RawInline = function (r)
      if r.text:match '<%s*/?%s*br' then breaks = breaks + 1 end
    end,
  })
  if breaks >= 4 then
    return pandoc.Div({el}, pandoc.Attr('', {'dense-table'}))
  end
  return nil
end

function Link (el)
  -- Only adjust links whose visible text is itself a URL (e.g. the
  -- reference lists); leave ordinary link text (such as dotted property
  -- paths in tables) breakable.
  if not pandoc.utils.stringify(el.content):match '^https?://' then
    return nil
  end
  el.content = pandoc.walk_inline(pandoc.Span(el.content), {
    Str = function (s)
      if s.text:match '[/%.]' then
        return pandoc.Str(s.text:gsub('([/%.])', '%1\u{2060}'))
      end
      return nil
    end
  }).content
  return el
end
