onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /tb_usb_tx/DUT/clk
add wave -noupdate /tb_usb_tx/clk_div
add wave -noupdate /tb_usb_tx/n_rst
add wave -noupdate /tb_usb_tx/tx_packet_data
add wave -noupdate /tb_usb_tx/buffer_occupancy
add wave -noupdate /tb_usb_tx/tx_packet
add wave -noupdate -divider Outputs
add wave -noupdate /tb_usb_tx/get_tx_packet_data
add wave -noupdate -color Gold /tb_usb_tx/dp_out
add wave -noupdate -color Gold /tb_usb_tx/dm_out
add wave -noupdate -color Gold /tb_usb_tx/tx_transfer_active
add wave -noupdate -color Gold /tb_usb_tx/tx_error
add wave -noupdate -divider {Internal Signals}
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/shift_strobe
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/bit_done
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/byte_done
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/load_en
add wave -noupdate -color {Medium Orchid} -radix binary /tb_usb_tx/DUT/data_to_send
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/fsm_ctrl/state
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/timer/count1
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/timer/count2
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/fsm_ctrl/send_eop
add wave -noupdate -color {Medium Orchid} /tb_usb_tx/DUT/encoder_module/serial_in
add wave -noupdate -color {Medium Spring Green} /tb_usb_tx/test_case
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5841430 ps} 0}
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
WaveRestoreZoom {0 ps} {29226750 ps}
