onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_hready_controller/DUT/clk
add wave -noupdate /tb_hready_controller/DUT/n_rst
add wave -noupdate /tb_hready_controller/DUT/state
add wave -noupdate -divider inputs
add wave -noupdate /tb_hready_controller/DUT/hsel
add wave -noupdate /tb_hready_controller/DUT/hwrite
add wave -noupdate /tb_hready_controller/DUT/haddr
add wave -noupdate /tb_hready_controller/DUT/hsize
add wave -noupdate -divider outputs
add wave -noupdate /tb_hready_controller/DUT/hready
add wave -noupdate /tb_hready_controller/DUT/hresp
add wave -noupdate /tb_hready_controller/DUT/regadd
add wave -noupdate /tb_hready_controller/DUT/write_tx
add wave -noupdate /tb_hready_controller/DUT/store_tx_data
add wave -noupdate /tb_hready_controller/DUT/get_rx_data
add wave -noupdate /tb_hready_controller/test_info
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {89526 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {178500 ps}
