onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /tb_encoder/clk
add wave -noupdate /tb_encoder/n_rst
add wave -noupdate /tb_encoder/serial_in
add wave -noupdate /tb_encoder/shift_strobe
add wave -noupdate /tb_encoder/send_eop
add wave -noupdate -divider Outputs
add wave -noupdate -color Gold /tb_encoder/dp_out
add wave -noupdate -color Gold /tb_encoder/dm_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {168725 ps} 0}
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
WaveRestoreZoom {0 ps} {603750 ps}
