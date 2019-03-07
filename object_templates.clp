; ***************************
; * 0. 故障
; ***************************

(deftemplate fault
	(slot id)
	(slot name)
	(slot component)
	(slot cause)
	(slot consequence)
)

; ***************************
; * 2. ZZ系统
; ***************************

; ***(1) LD系统

; ******1) S+C波段LD

; *********((1)) DBF机柜

(deftemplate object-1
	(slot id)
	(slot name)
	(slot bit-value)
)

; *********((2)) LD控制机柜

(deftemplate object-2
	(slot id)
	(slot name)
	(slot bit-value)
)