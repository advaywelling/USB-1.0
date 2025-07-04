onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_rx/clk
add wave -noupdate /tb_usb_rx/CLK_DIV
add wave -noupdate -divider 12MHz
add wave -noupdate /tb_usb_rx/DUT/timer/shift_strobe
add wave -noupdate -divider Decoder
add wave -noupdate /tb_usb_rx/DUT/dp_in
add wave -noupdate /tb_usb_rx/DUT/dm_in
add wave -noupdate /tb_usb_rx/DUT/d_orig
add wave -noupdate /tb_usb_rx/DUT/error
add wave -noupdate -divider Byte
add wave -noupdate /tb_usb_rx/DUT/rcu/valid_byte
add wave -noupdate /tb_usb_rx/DUT/rcu/prev_prev_prev_valid
add wave -noupdate /tb_usb_rx/DUT/input_data
add wave -noupdate /tb_usb_rx/DUT/rcu/byte_reg
add wave -noupdate /tb_usb_rx/DUT/timer/count1
add wave -noupdate /tb_usb_rx/DUT/timer/count2
add wave -noupdate -divider Packet
add wave -noupdate /tb_usb_rx/DUT/rcu/state
add wave -noupdate /tb_usb_rx/DUT/rx_transfer_active
add wave -noupdate /tb_usb_rx/DUT/rcu/rx_packet
add wave -noupdate /tb_usb_rx/DUT/rcu/flush
add wave -noupdate /tb_usb_rx/DUT/rcu/rx_packet_data
add wave -noupdate /tb_usb_rx/DUT/rcu/rx_store_packet_data
add wave -noupdate /tb_usb_rx/DUT/rcu/rx_data_ready
add wave -noupdate /tb_usb_rx/DUT/rcu/end_packet
add wave -noupdate /tb_usb_rx/DUT/rcu/rx_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3245000 ps} 0}
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
WaveRestoreZoom {2694433 ps} {5516535 ps}