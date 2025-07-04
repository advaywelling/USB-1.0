onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rx_db/clk
add wave -noupdate /tb_rx_db/clk_div
add wave -noupdate -divider RX
add wave -noupdate /tb_rx_db/DUT/rx/dp_in
add wave -noupdate /tb_rx_db/DUT/rx/dm_in
add wave -noupdate /tb_rx_db/DUT/rx/d_orig
add wave -noupdate /tb_rx_db/rx_transfer_active
add wave -noupdate /tb_rx_db/rx_packet
add wave -noupdate /tb_rx_db/DUT/rx/flush
add wave -noupdate /tb_rx_db/DUT/rx/rx_packet_data
add wave -noupdate /tb_rx_db/DUT/rx/rx_store_packet_data
add wave -noupdate /tb_rx_db/DUT/rx/end_packet
add wave -noupdate /tb_rx_db/rx_error
add wave -noupdate /tb_rx_db/DUT/rx/rcu/state
add wave -noupdate /tb_rx_db/DUT/rx/input_data
add wave -noupdate /tb_rx_db/DUT/rx/byte_reg
add wave -noupdate -divider {Data Buffer}
add wave -noupdate /tb_rx_db/DUT/db/rx_data
add wave -noupdate /tb_rx_db/DUT/db/buffer_occupancy
add wave -noupdate /tb_rx_db/DUT/db/curr_reg
add wave -noupdate /tb_rx_db/buffer_occupancy
add wave -noupdate /tb_rx_db/DUT/db/curr_read_ptr
add wave -noupdate /tb_rx_db/DUT/db/curr_write_ptr
add wave -noupdate /tb_rx_db/DUT/db/next_occupancy
add wave -noupdate /tb_rx_db/clear
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45655193 ps} 0}
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
WaveRestoreZoom {44429272 ps} {45935350 ps}
