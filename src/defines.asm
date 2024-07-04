@include

macro org(bank, offset)
    org $10+(<offset>%$4000)+($4000*<bank>)
    base <offset>
endmacro

; new ram
!technodrome_location_copy         = $1b0
!global_timer_on_start_press       = $1b1
!text_printing_timer               = $1b2
!alignment_counter                 = $1b3


; existing ram
!global_timer                       = $1e
!technodrome_location               = $55
!ppu_mask                           = $fe



; rom
bank7_free_space                    = $fee0
bank7_technodrome_assignment_hijack = $cb4b
bank3_text_printing_while_paused    = $af6b
bank3_free_space                    = $bf92
bank7_rng_routine_hijack            = $c397
bank7_pause_menu_hijack             = $cde8
bank7_free_space2                   = $ffc0
bank7_end_of_nmi                    = $c40d


; constants
!INPUT_right                              = $01
!INPUT_left                               = $02
!INPUT_down                               = $04
!INPUT_up                                 = $08
!INPUT_start                              = $10
!INPUT_select                             = $20
!INPUT_B                                  = $40
!INPUT_A                                  = $80