onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /tb_tx_timer/clk
add wave -noupdate /tb_tx_timer/n_rst
add wave -noupdate /tb_tx_timer/timer_en
add wave -noupdate /tb_tx_timer/timer_clr
add wave -noupdate -divider Output
add wave -noupdate /tb_tx_timer/byte_done
add wave -noupdate /tb_tx_timer/shift_strobe
add wave -noupdate -divider {Bit Pd Counter}
add wave -noupdate /tb_tx_timer/DUT/bit_pd/count_out
add wave -noupdate -divider {Bit Counter}
add wave -noupdate /tb_tx_timer/DUT/bit_counter/count_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {167 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
