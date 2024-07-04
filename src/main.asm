norom

incsrc "defines.asm"
incsrc "hijacks.asm"

 %org($03, bank3_free_space)
     incsrc "print_info_while_paused.asm"