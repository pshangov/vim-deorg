" Vim syntax file
" Language: Org-mode
" Maintainer: Peter Shangov
" Latest Revision: 10 January 2021

" DONE: Phase I
"
" Syntax: links, tags, dates - DONE
" Cycling: todo, priorities - DONE
" Headings: insert new, promote/demote level - DONE
" Folding: tab - DONE
"
" Phase II
"
" Markup: bold, italics, underline - DONE
" Lists: ordered, unordered, descriptions - DONE
" checkboxes
" drawers and properties
"
" Phase III
"
" clean view: only last star visible
" progress tracking

" if exists("b:current_syntax")
"   finish
" endif

let b:current_syntax = "deorg"

"""""""""""""""""
" SYNTAX GROUPS "
"""""""""""""""""

""" Text

syntax match orgText '^[^\*].*$'

""" Headings

syntax match orgHeadingLevel1 '^\*\{1}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel2 '^\*\{2}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel3 '^\*\{3}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel4 '^\*\{4}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel5 '^\*\{5}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel6 '^\*\{6}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel7 '^\*\{7}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel8 '^\*\{8}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek
syntax match orgHeadingLevel9 '^\*\{9}\s.*$' contains=orgKeywordTodo,orgKeywordProgress,orgBreak,orgPinned,orgKeywordDone,orgPriority,orgTags,orgTimestamp,orgTimestampInactive,orgHoldWeek

""" TODO and DONE

syntax match orgKeywordTodo '====\|TODO' contained
syntax match orgKeywordProgress '>>>>\|||||\|WAIT' contained
syntax match orgKeywordDone 'DONE\|xxxx' contained

""" Separator

syntax match orgHoldWeek '#MON\|#TUE\|#WED\|#THU\|#FRI\|#SAT\|#SUN' contained

""" Separator

syntax match orgBreak '####\s.*$' contained

""" Pinned

syntax match orgPinned '!!!!\s.*$' contained

""" Priority

syntax match orgPriority '\[#[ABC].*\]' contained

""" Links

syntax region orgLink matchgroup=orgLinkLabel start='\[\[' end='\]\]' concealends keepend oneline containedin=ALL
syntax region orgLink matchgroup=orgLinkLabel start='\[\{2}[^][]*\]\[' end='\]\{2}' concealends keepend oneline containedin=ALL

""" Bullet lists

syntax match orgBulletList '^\s\+[-#+*]\s\+' containedin=orgText
syntax match orgNumberList '^\s\+\d\{1,2\}[.)]\s\+' containedin=orgText
syntax match orgLetterList '^\s\+[a-z]\{1,2\}[.)]\s\+' containedin=orgText

""" Formatting

syntax region orgBold matchgroup=orgBoldText start='\s\*\<'hs=s+1 end='\>\*' concealends containedin=ALL
syntax region orgItalic matchgroup=orgItalicText start='\s\/\<'hs=s+1 end='\>\/' concealends containedin=ALL
syntax region orgUnderline matchgroup=orgUnderlineText start='\s\<_'hs=s+1 end='_\>' concealends containedin=ALL

""" Tags

syntax match orgTags '\(\:\w\+\)\+\:' contained
" syntax match orgTags '\(\:\w\+\)\+\:\s*$' contained

""" Timestamps

"<2003-09-16>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d>\)/
"<16-09-2003>
syntax match orgTimestamp /\(<\d\d-\d\d-\d\d\d\d>\)/
"<2003/09/16>
syntax match orgTimestamp /\(<\d\d\d\d\/\d\d\/\d\d>\)/
"<16/09/2003>
syntax match orgTimestamp /\(<\d\d\d\d\/\d\d\/\d\d>\)/

"<2003-09-16 Sáb>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d \k\k\k>\)/
"<2003-09-16 Tue 12:00>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d>\)/
"<2003-09-16 Tue 12:00-12:30>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d-\d\d:\d\d>\)/
"<Mon, 16 Sep 2003>
syntax match orgTimestamp /\(<\k\k\k, \d\d \k\k\k \d\d\d\d>\)/

"<2003-09-16 Tue>--<2003-09-16 Tue>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d \k\k\k>--<\d\d\d\d-\d\d-\d\d \k\k\k>\)/
"<2003-09-16 Tue 12:00>--<2003-09-16 Tue 12:00>
syntax match orgTimestamp /\(<\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d>--<\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d>\)/

"<2003-09-16>
syntax match orgTimestamp /\(\[\d\d\d\d-\d\d-\d\d\]\)/
"<16-09-2003>
syntax match orgTimestamp /\(\[\d\d-\d\d-\d\d\d\d\]\)/
"<2003/09/16>
syntax match orgTimestamp /\(\[\d\d\d\d\/\d\d\/\d\d\]\)/
"<16/09/2003>
syntax match orgTimestamp /\(\[\d\d\d\d\/\d\d\/\d\d\]\)/

"[2003-09-16 Tue]
syntax match orgTimestampInactive /\(\[\d\d\d\d-\d\d-\d\d \k\k\k\]\)/
"[2003-09-16 Tue 12:00]
syntax match orgTimestampInactive /\(\[\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d\]\)/

"[2003-09-16 Tue]--[2003-09-16 Tue]
syntax match orgTimestampInactive /\(\[\d\d\d\d-\d\d-\d\d \k\k\k\]--\[\d\d\d\d-\d\d-\d\d \k\k\k\]\)/
"[2003-09-16 Tue 12:00]--[2003-09-16 Tue 12:00]
syntax match orgTimestampInactive /\(\[\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d\]--\[\d\d\d\d-\d\d-\d\d \k\k\k \d\d:\d\d\]\)/

""""""""""""""""
" HIGHLIGHTING "
""""""""""""""""

" mellow collors: aqua, orgage, blue, yellow, purple
" sharp collors: white, green, blue, red

highlight link orgHeadingLevel1 GruvboxGreen 
highlight link orgHeadingLevel2 GruvboxFg0
highlight link orgHeadingLevel3 GruvboxPurple
highlight link orgHeadingLevel4 GruvboxGreen
highlight link orgHeadingLevel5 GruvboxFg0 
highlight link orgHeadingLevel6 GruvboxPurple
highlight link orgHeadingLevel7 GruvboxGreen
highlight link orgHeadingLevel8 GruvboxFg0
highlight link orgHeadingLevel9 GruvboxPurple
" highlight link orgHeadingLevel123 GruvboxRed

highlight link orgKeywordTodo GruvboxOrangeBold
highlight link orgKeywordProgress GruvboxYellowBold
highlight link orgKeywordDone GruvboxAquaBold

highlight link orgBreak Comment
highlight link orgHoldWeek Comment
highlight link orgPinned GruvboxRedBold

highlight link orgText GruvboxFg3

highlight link orgPriority GruvboxGreenBold
highlight link orgLink Underlined
highlight link orgLinkLabel Underlined
highlight link orgTags GruvboxBg4

highlight link orgBulletList GruvboxYellowBold
highlight link orgNumberList GruvboxYellowBold
highlight link orgLetterList GruvboxYellowBold

highlight link orgTimestamp Todo
highlight link orgTimestampInactive Comment

highlight orgBold gui=bold
highlight orgBoldText gui=bold
highlight orgItalic gui=italic
highlight orgItalicText gui=italic
highlight orgUnderline gui=underline
highlight orgUnderlineText gui=underline

" highlight link orgHeadingLevel1 String 
" highlight link orgHeadingLevel2 Normal
" highlight link orgHeadingLevel3 Type
" highlight link orgHeadingLevel4 Constant
" highlight link orgHeadingLevel5 Identifier 
" highlight link orgHeadingLevel6 PreProc
" highlight link orgHeadingLevel7 Tag 
" highlight link orgHeadingLevel8 Statement

" highlight link orgKeywordTodo GruvboxRedSign
" highlight link orgKeywordDone GruvboxGreenSign

" TabLineSel - green on grey
" TabLineFill - grey on grey
" CursorColumn - white on grey
"
" DiffDelete
" DiffAdd
" DiffText
"
" Pmenu
" PmenuSel
" PmenuSbar
" PmenuThumb

"""""""""""""""""""""
" FILETYPE SETTINGS "
"""""""""""""""""""""

setlocal conceallevel=2
" setlocal concealcursor=nc

"""""""""""""
" FUNCTIONS "
"""""""""""""

" use Shift+Left and Shift+Right to cycle TODO states

let s:todoStates = ["TODO"]
let s:progressStates = [">>>>", "||||", "WAIT"]
let s:doneStates = ["DONE", "====", "xxxx"]

let s:priorities = ['A', 'B', 'C']

let s:allStates = s:todoStates + s:progressStates + s:doneStates
let s:allStatesWithWs = map(copy(s:allStates), 'v:val . "\\s"')
let s:starsRegex = '^\(\*\+\s\+\)'
let s:todoRegex = s:starsRegex . '\(' . join(s:allStatesWithWs, '\|') . '\)\?'
let s:prioritiesRegex = s:todoRegex . '\(\[#\(' . join(s:priorities, '\|') . '\)\]\s\)\?'

function! s:IsHeading(line)
    let result = match(a:line, s:starsRegex)
    return result == -1 ? 0 : 1
endfunction

""" States

function! s:GetTODOState(heading)
    let result = matchlist(a:heading, s:todoRegex)
    if len(result)
        return trim(result[2])
    endif
endfunction

function! s:ReplaceTODOState(heading, state)
    let whitespace = empty(a:state) ? '' : ' '
    let result = substitute(a:heading, s:todoRegex, '\1' . a:state . whitespace, "")
    return result
endfunction

function! s:GetNextTodoState(state, dir)
    let cycleStates = [""] + s:allStates 
    let currentIndex = index(cycleStates, a:state)
    let lastIndex = len(cycleStates) - 1

    if a:dir == 'next'
        let nextIndex = currentIndex == lastIndex ? 0 : currentIndex + 1
    elseif a:dir == 'prev'
        let nextIndex = currentIndex == 0 ? lastIndex : currentIndex - 1
    endif

    return cycleStates[nextIndex]
endfunction

function! s:CycleTODOState(dir)
    let heading = getline(line("."))

    if !s:IsHeading(heading)
        return
    endif

    let currentTODOState = s:GetTODOState(heading)
    let nextTODOState = s:GetNextTodoState(currentTODOState, a:dir)
    let newHeading = s:ReplaceTODOState(heading, nextTODOState)
    call setline(".", newHeading)
endfunction

""" Priorities

function! s:GetPriority(heading)
    let result = matchlist(a:heading, s:prioritiesRegex)
    if len(result)
        return trim(result[4])
    endif
endfunction

function! s:ReplacePriority(heading, priority)
    let replacement = empty(a:priority) ? '' : '[#' . a:priority . '] '
    let result = substitute(a:heading, s:prioritiesRegex, '\1\2' . replacement, "")
    return result
endfunction

function! s:GetNextPriority(priority, dir)
    let cyclePriorities = [""] + s:priorities 
    let currentIndex = index(cyclePriorities, a:priority)
    let lastIndex = len(cyclePriorities) - 1

    if a:dir == 'next'
        let nextIndex = currentIndex == lastIndex ? 0 : currentIndex + 1
    elseif a:dir == 'prev'
        let nextIndex = currentIndex == 0 ? lastIndex : currentIndex - 1
    endif

    return cyclePriorities[nextIndex]
endfunction

function! s:CyclePriority(dir)
    let heading = getline(line("."))

    if !s:IsHeading(heading)
        return
    endif

    let currentPriority = s:GetPriority(heading)
    let nextPriority = s:GetNextPriority(currentPriority, a:dir)
    let newHeading = s:ReplacePriority(heading, nextPriority)
    call setline(".", newHeading)
endfunction

""" Headings

function! s:GetHeadingLevel(heading)
    let result = matchlist(a:heading, s:starsRegex)
    if len(result)
        return strlen(trim(result[1]))
    else
        return 0
    endif
endfunction

function! s:SetHeadingLevel(heading, level)
    let stars = repeat("*", a:level)
    let result = substitute(a:heading, s:starsRegex, stars . ' ', "")
    return result
endfunction

function! s:PromoteHeading(line, dir)
    let heading = getline(a:line)
    let currentLevel = s:GetHeadingLevel(heading)

    if !currentLevel | return | endif

    if a:dir == 'next'
        call setline(a:line, s:SetHeadingLevel(heading, currentLevel + 1))
    elseif a:dir == 'prev' && currentLevel > 1
        call setline(a:line, s:SetHeadingLevel(heading, currentLevel - 1))
    endif
endfunction

function! s:PromoteLineHeading(dir)
    call s:PromoteHeading(line("."), a:dir)
endfunction

function! s:PromoteNestedHeading(dir)
    let startLine = line(".")
    let lastLine = line("$")
    let nextLine = startLine + 1
    let startHeadingLevel = s:GetHeadingLevel(getline(startLine))


    if startHeadingLevel
        call s:PromoteHeading(startLine, a:dir)
    else
        return
    endif

    if nextLine > lastLine
        return
    else
        for line in range(nextLine, lastLine)
            if s:GetHeadingLevel(getline(line)) > startHeadingLevel
                call s:PromoteHeading(line, a:dir)
            else
                return
            endif
        endfor
    endif

endfunction

function! s:GetCurrentHeading(startLine)
    let firstLine = 1
    let lastLine = line("$")

    let headingLevel = 0
    let headingStartLine = 0
    let headingEndLine = 0
    let children = []
    let folds = []

    let currentLine = a:startLine

    " Find start of heading
    while currentLine >= firstLine
        let currentLevel = s:GetHeadingLevel(getline(currentLine))

        if currentLevel
            let headingStartLine = currentLine
            let headingLevel = currentLevel
            break
        endif

        call add(folds, foldclosed(currentLine))

        let currentLine = currentLine - 1
    endwhile

    if !headingLevel | return | endif

    " Find end of heading
    let currentLine = a:startLine + 1
    let nextLevel = headingLevel + 1

    while currentLine <= lastLine
        let currentLevel = s:GetHeadingLevel(getline(currentLine))

        if currentLevel
            if currentLevel <= headingLevel
                let headingEndLine = currentLine - 1
                break
            elseif currentLevel == nextLevel
                call add(children, currentLine)
            endif
        endif

        call add(folds, foldclosed(currentLine))
        let currentLine = currentLine + 1
    endwhile

    let headingEndLine = headingEndLine ? headingEndLine : lastLine

    let folds = filter(copy(folds), 'v:val != -1') " remove special value '-1'
    let folds = sort(filter(copy(folds), 'index(folds, v:val, v:key + 1) == -1'), "n") " remove duplicates

    return {'level': headingLevel, 'start': headingStartLine, 'end': headingEndLine, 'children': children, 'folds': folds}
endfunction

function! s:GetParentHeading(startLine)
    let currentHeading = s:GetCurrentHeading(a:startLine)
    let currentLevel = currentHeading.level

    if currentLevel <= 1
        return
    elseif a:startLine <= 1
        return
    endif

    let targetLevel = currentLevel - 1

    let currentLine = a:startLine - 1

    " Find start of heading
    while currentLine >= 1
        let currentLevel = s:GetHeadingLevel(getline(currentLine))

        if currentLevel == targetLevel
            return currentLine
        endif

        let currentLine = currentLine - 1
    endwhile

endfunction

function! s:CreateHeading(dir)
    let heading = s:GetCurrentHeading(line("."))
    if empty(heading) | return | endif

    if a:dir == "prev"
        let newLevel = heading.level > 1 ? heading.level - 1 : 1
    elseif a:dir == "next"
        let newLevel = heading.level + 1
    elseif a:dir == "same"
        let newLevel = heading.level
    endif

    call append(heading.end, repeat("*", newLevel) . " ")
    call cursor(heading.end + 1, 0)
    startinsert!
endfunction

"""""""""""
" FOLDING "
"""""""""""

function! GetMyOrgFoldText()
    " return getline(v:foldstart) . '...'
    return getline(v:foldstart)
endfunction

function! DebugOrgHeading()
    echo s:GetCurrentHeading(line("."))
endfunction

function! GetMyOrgFoldLevel()
    let heading = s:GetCurrentHeading(v:lnum)

    if !heading.level
        return 0
    elseif heading.start == heading.end
        return '>' . heading.level
    elseif v:lnum == heading.start
        return '>' . heading.level
    elseif v:lnum == heading.end
        return '<' . heading.level
    else
        return heading.level
    endif
endfunction

function! s:ToggleOrgFoldLevel(startLine)
    let heading = s:GetCurrentHeading(a:startLine)

    " not in a heading, nothing to fold
    if !heading.level
        return
    " single line heading, nothing to fold
    elseif heading.start == heading.end
        return
    " nothing is folded
    elseif empty(heading.folds)
        " if there are children, fold only them
        if !empty(heading.children)

            let foldedChildren = 0

            for i in range(0, len(heading.children) - 1)
                let childStartLine = heading.children[i]
                let nextChildStartLine = i == len(heading.children) - 1 ? 0 : heading.children[i + 1]
                let childEndLine = nextChildStartLine ? nextChildStartLine - 1 : heading.end

                if childStartLine != childEndLine
                    let foldedChildren = foldedChildren + 1
                    execute childStartLine . "," . childEndLine . "foldclose"
                endif
            endfor

            if !foldedChildren
                " single-line children only, fold everything instad
                execute heading.start . "," . heading.end . "foldclose"
            endif

        " if there are no children, just fold the heading
        else
            execute heading.start . "," . heading.end . "foldclose"
        endif
    " heading is open but there are closed children, fold everything
    elseif !empty(heading.folds) && foldclosed(heading.start) == -1
        execute heading.start . "," . heading.end . "foldclose"
    " everything is closed, open everything
    else
        execute heading.start . "," . heading.end . "foldopen!"
    endif
endfunction

function! s:ToggleOrgParentFoldLevel(startLine)
    let parentLine = s:GetParentHeading(a:startLine)

    if parentLine
        call s:ToggleOrgFoldLevel(parentLine)
    else
        return
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=GetMyOrgFoldLevel()
setlocal foldtext=GetMyOrgFoldText()

""""""""""""
" MAPPINGS "
""""""""""""

nmap <silent> <S-Right>    :call <SID>CycleTODOState('next')<CR>
nmap <silent> <S-Left>     :call <SID>CycleTODOState('prev')<CR>

nmap <silent> <S-Up>       :call <SID>CyclePriority('next')<CR>
nmap <silent> <S-Down>     :call <SID>CyclePriority('prev')<CR>

nmap <silent> <M-Right>    :call <SID>PromoteLineHeading('next')<CR>
nmap <silent> <M-Left>     :call <SID>PromoteLineHeading('prev')<CR>
imap <silent> <M-Right>    <Esc>:call <SID>PromoteLineHeading('next')<CR>la
imap <silent> <M-Left>     <Esc>:call <SID>PromoteLineHeading('prev')<CR>i
vmap <silent> <M-Right>    :call <SID>PromoteLineHeading('next')<CR>gv
vmap <silent> <M-Left>     :call <SID>PromoteLineHeading('prev')<CR>gv

nmap <silent> <M-S-Right>  :call <SID>PromoteNestedHeading('next')<CR>
nmap <silent> <M-S-Left>   :call <SID>PromoteNestedHeading('prev')<CR>

nmap <silent> <C-Enter>    :call <SID>CreateHeading('same')<CR>
nmap <silent> <C-S-Enter>  :call <SID>CreateHeading('prev')<CR>
nmap <silent> <C-M-Enter>  :call <SID>CreateHeading('next')<CR>

nmap <silent> <C-Q>        :call <SID>CreateHeading('same')<CR>
nmap <silent> <C-S-Return> :call <SID>CreateHeading('prev')<CR>
nmap <silent> <C-M-Return> :call <SID>CreateHeading('next')<CR>

nmap <silent> <Tab>        :call <SID>ToggleOrgFoldLevel(line("."))<CR>
nmap <silent> <S-Tab>      :call <SID>ToggleOrgParentFoldLevel(line("."))<CR>
