"inserting {} 
inoremap { {<CR>}<Esc>ko

" common java autocompletes
iabbrev sop System.out.println(
iabbrev mn public static void main(String[] args)<cr>{
iabbrev pcs public class
iabbrev tcom <T extends Comparator<T>>

set foldmethod=syntax

" for enabling goto file
set include=^#\s*import
set includeexpr=substitute(v:fname,'\\.','/','g')

" for going to file using class instance
nnoremap gc gdb<c-w>f
