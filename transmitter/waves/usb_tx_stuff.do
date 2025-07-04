onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /tb_usb_tx_stuff/clk
add wave -noupdate /tb_usb_tx_stuff/clk_div
add wave -noupdate /tb_usb_tx_stuff/n_rst
add wave -noupdate /tb_usb_tx_stuff/tx_packet_data
add wave -noupdate /tb_usb_tx_stuff/buffer_occupancy
add wave -noupdate /tb_usb_tx_stuff/tx_packet
add wave -noupdate -divider Outputs
add wave -noupdate -color Cyan /tb_usb_tx_stuff/dp_out
add wave -noupdate -color Cyan /tb_usb_tx_stuff/dm_out
add wave -noupdate -color Gold /tb_usb_tx_stuff/get_tx_packet_data
add wave -noupdate -color Gold /tb_usb_tx_stuff/tx_error
add wave -noupdate -color Gold /tb_usb_tx_stuff/tx_transfer_active
add wave -noupdate -color {Medium Orchid} /tb_usb_tx_stuff/test_case
add wave -noupdate -divider {Internal Signal}
add wave -noupdate /tb_usb_tx_stuff/DUT/encoder_module/shift_strobe
add wave -noupdate -radix binary /tb_usb_tx_stuff/DUT/fsm_ctrl/data_to_send
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2100798 ps} 0}
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
WaveRestoreZoom {1881139 ps} {2363483 ps}
