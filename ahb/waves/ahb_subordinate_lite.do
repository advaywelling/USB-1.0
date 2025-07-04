onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_subordinate_lite/DUT/clk
add wave -noupdate /tb_ahb_subordinate_lite/DUT/n_rst
add wave -noupdate /tb_ahb_subordinate_lite/DUT/d_mode
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/testinfo
add wave -noupdate -divider ahb
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hsel
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/haddr
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hsize
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/htrans
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hwrite
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hwdata
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hrdata
add wave -noupdate /tb_ahb_subordinate_lite/DUT/next_hrdata
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hresp
add wave -noupdate -color {Slate Blue} /tb_ahb_subordinate_lite/DUT/hready
add wave -noupdate -divider registers
add wave -noupdate /tb_ahb_subordinate_lite/DUT/hrcu/state
add wave -noupdate -color Cyan -subitemconfig {{/tb_ahb_subordinate_lite/DUT/mem[15]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[14]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[13]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[12]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[11]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[10]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[9]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[8]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[7]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[6]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[5]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[4]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[3]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[2]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[1]} {-color Cyan -height 16} {/tb_ahb_subordinate_lite/DUT/mem[0]} {-color Cyan -height 16}} /tb_ahb_subordinate_lite/DUT/mem
add wave -noupdate -color White /tb_ahb_subordinate_lite/DUT/next_mem
add wave -noupdate -divider receiver
add wave -noupdate /tb_ahb_subordinate_lite/DUT/rx_packet
add wave -noupdate /tb_ahb_subordinate_lite/DUT/rx_data_ready
add wave -noupdate /tb_ahb_subordinate_lite/DUT/rx_transfer_active
add wave -noupdate /tb_ahb_subordinate_lite/DUT/rx_error
add wave -noupdate -divider transmitter
add wave -noupdate -color {Medium Orchid} /tb_ahb_subordinate_lite/DUT/tx_packet
add wave -noupdate -color {Medium Orchid} /tb_ahb_subordinate_lite/DUT/tx_transfer_active
add wave -noupdate -color {Medium Orchid} /tb_ahb_subordinate_lite/DUT/tx_error
add wave -noupdate -divider {data buffer}
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/rx_data
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/get_rx_data
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/store_tx_data
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/tx_data
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/buffer_occupancy
add wave -noupdate -color Gold /tb_ahb_subordinate_lite/DUT/clear
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {344095 ps} 0}
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
WaveRestoreZoom {0 ps} {441 ns}
