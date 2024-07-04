@include

print_technodrome_info:
    lda !text_printing_timer
    beq first_character
    cmp #$01
    beq second_character
    cmp #$02
    beq third_character
    cmp #$03
    beq fourth_character

done_printing_info:
    lda $92
    pha 
    ; load empty tile
    lda #$0f
    jmp print_stuff_for_pause_menu

second_character:
    lda #$24
    pha 
    lda !global_timer_on_start_press
    and #$0f
    jmp convert_character

first_character:
    lda #$23
    pha 
    lda !global_timer_on_start_press
    lsr #4
    jmp convert_character

fourth_character:
    lda #$27
    pha 
    lda !alignment_counter
    and #$0f
    jmp convert_character

third_character:
    lda #$26
    pha 
    jsr get_alignment_counter_first_digit
    ; doing the last lsr here because not enough space in bank 7 lmao
    lsr 
    jmp convert_character


warnpc $bfd8

%org($07, bank7_free_space2)
    convert_character:
        bne .not_loading_0
        lda #$0a
        jmp print_stuff_for_pause_menu


        .not_loading_0
        cmp #$0a
        bcc .done
        clc
        adc #$06

        .done
            jmp print_stuff_for_pause_menu

    get_alignment_counter_first_digit:
        lda !alignment_counter
        lsr #3
        rts

warnpc $ffd8

