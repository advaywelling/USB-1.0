onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_level/clk
add wave -noupdate /tb_top_level/clk_div
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33239 ps} 0}
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
WaveRestoreZoom {0 ps} {420 ns}
