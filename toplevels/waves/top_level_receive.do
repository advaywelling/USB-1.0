onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_level/clk
add wave -noupdate /tb_top_level/n_rst
add wave -noupdate /tb_top_level/d_mode
add wave -noupdate -color Gold /tb_top_level/testinfo
add wave -noupdate -divider ahb
add wave -noupdate -color {Slate Blue} /tb_top_level/hsel
add wave -noupdate -color {Slate Blue} /tb_top_level/haddr
add wave -noupdate -color {Slate Blue} /tb_top_level/hsize
add wave -noupdate -color {Slate Blue} /tb_top_level/hburst
add wave -noupdate -color {Slate Blue} /tb_top_level/htrans
add wave -noupdate -color {Slate Blue} /tb_top_level/hwrite
add wave -noupdate -color {Slate Blue} /tb_top_level/hwdata
add wave -noupdate -color {Slate Blue} /tb_top_level/hrdata
add wave -noupdate -color {Slate Blue} /tb_top_level/hresp
add wave -noupdate -color {Slate Blue} /tb_top_level/hready
add wave -noupdate /tb_top_level/clk_div
add wave -noupdate -divider rx
add wave -noupdate -color Cyan /tb_top_level/dp_in
add wave -noupdate -color Cyan /tb_top_level/dm_in
add wave -noupdate /tb_top_level/prev_d
add wave -noupdate -radix binary /tb_top_level/DUT/rx/valid_byte
add wave -noupdate /tb_top_level/DUT/rx/rcu/state
add wave -noupdate /tb_top_level/DUT/ahb/rx_packet
add wave -noupdate /tb_top_level/DUT/rx/rx_packet_data
add wave -noupdate /tb_top_level/DUT/rx/rx_transfer_active
add wave -noupdate /tb_top_level/DUT/rx/rx_data_ready
add wave -noupdate /tb_top_level/DUT/rx/rx_error
add wave -noupdate /tb_top_level/DUT/rx/input_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {74845650 ps} 0}
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
WaveRestoreZoom {0 ps} {116728500 ps}
