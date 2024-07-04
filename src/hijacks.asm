@include


%org($07, bank7_technodrome_assignment_hijack)
        jsr copy_global_timer
        nop

; automatically open the pause menu
%org($07, bank7_pause_menu_hijack)
        lda #$01

%org($07, bank7_free_space)
copy_global_timer:
        ; restore hijacked instructions
        sta $55
        inc $34

        lda $45
        sta !alignment_counter

        lda !global_timer
        sta !global_timer_on_start_press

        rts 

print_stuff_for_pause_menu:
        ; character to write
        sta $0303,x

        ; ppu destination
        pla 
        sta $0302,x

        inc !text_printing_timer

        rts

warnpc $ffd8

%org($03, bank3_text_printing_while_paused)
        jsr print_technodrome_info
