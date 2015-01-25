onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /SRAM_testbench/ReadRegister
add wave -noupdate /SRAM_testbench/WriteRegister
add wave -noupdate /SRAM_testbench/WriteData
add wave -noupdate /SRAM_testbench/WriteEnable
add wave -noupdate /SRAM_testbench/ReadData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {113 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {1004 ps}
