onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label SW3 /recognize3_testbench/SW3
add wave -noupdate -label SW2 /recognize3_testbench/SW2
add wave -noupdate -label SW1 /recognize3_testbench/SW1
add wave -noupdate -label SW0 /recognize3_testbench/SW0
add wave -noupdate -label out /recognize3_testbench/LEDvalue
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
