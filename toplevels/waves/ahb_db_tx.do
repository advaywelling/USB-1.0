onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_db_tx/clk
add wave -noupdate /tb_ahb_db_tx/n_rst
add wave -noupdate -color Gold /tb_ahb_db_tx/testinfo
add wave -noupdate /tb_ahb_db_tx/d_mode
add wave -noupdate -divider ahb
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hsel
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/haddr
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hsize
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/htrans
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hwrite
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hwdata
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hrdata
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hresp
add wave -noupdate -color {Slate Blue} /tb_ahb_db_tx/hready
add wave -noupdate -divider txout
add wave -noupdate -color Cyan /tb_ahb_db_tx/dp_out
add wave -noupdate -color Cyan /tb_ahb_db_tx/dm_out
add wave -noupdate /tb_ahb_db_tx/DUT/transmitter/tx_transfer_active
add wave -noupdate /tb_ahb_db_tx/DUT/transmitter/shift_strobe
add wave -noupdate -radix binary /tb_ahb_db_tx/DUT/transmitter/data_to_send
add wave -noupdate /tb_ahb_db_tx/DUT/ahb/tx_packet
add wave -noupdate -color {Medium Orchid} -subitemconfig {{/tb_ahb_db_tx/DUT/ahb/mem[15]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[14]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[13]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[12]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[11]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[10]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[9]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[8]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[7]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[6]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[5]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[4]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[3]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[2]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[1]} {-color {Medium Orchid}} {/tb_ahb_db_tx/DUT/ahb/mem[0]} {-color {Medium Orchid}}} /tb_ahb_db_tx/DUT/ahb/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1785063 ps} 0}
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
WaveRestoreZoom {1501066 ps} {1899173 ps}
