(deffacts objects-initial-state

; ***************************
; * 2. ZZ系统
; ***************************

; ***{1} LD系统

; ******[1] S+C波段LD

; *********(1) DBF机柜

	(object-1
		(id 60001)
		(name DBF-Ji-Gui)
		(bit-value 0)
	)

; *********(2) LD控制机柜

	(object-2
		(id 60002)
		(name LD-Kong-Zhi-Ji-Gui)
		(bit-value 0)
	)

; ***{2} 本指系统

; ***{3} 远程舰空DD系统

	(messag-10
		(recv-flag no)
		(time-stamp 0)
	)

	(messag-CC
		(recv-flag no)
		(time-stamp 0)
		(state-flag 0)
	)

	(current-time
		(value 0)
	)

	(messag-10-cache
		(recv-flag no)
		(time-stamp 0)
	)

	(messag-CC-cache
		(recv-flag no)
		(time-stamp 0)
		(state-flag 0)
	)
)