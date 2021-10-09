augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.', '::']
augroup end

imap <silent> <c-Space> <Plug>(completion_trigger)

