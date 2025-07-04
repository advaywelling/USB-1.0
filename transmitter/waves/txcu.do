onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /tb_txcu/clk
add wave -noupdate /tb_txcu/n_rst
add wave -noupdate /tb_txcu/tx_packet_data
add wave -noupdate /tb_txcu/buffer_occupancy
add wave -noupdate /tb_txcu/tx_packet
add wave -noupdate /tb_txcu/byte_done
add wave -noupdate -divider Outputs
add wave -noupdate /tb_txcu/data_to_send
add wave -noupdate /tb_txcu/timer_en
add wave -noupdate /tb_txcu/timer_clr
add wave -noupdate /tb_txcu/load_en
add wave -noupdate /tb_txcu/send_eop
add wave -noupdate /tb_txcu/tx_transfer_active
add wave -noupdate /tb_txcu/get_tx_data
add wave -noupdate /tb_txcu/tx_error
add wave -noupdate -divider State
add wave -noupdate /tb_txcu/DUT/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
