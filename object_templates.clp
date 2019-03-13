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

; ***{1} LD系统

; ******[1] S+C波段LD

; *********(1) DBF机柜

(deftemplate object-1
	(slot id)
	(slot name)
	(slot bit-value)
)

; *********(2) LD控制机柜

(deftemplate object-2
	(slot id)
	(slot name)
	(slot bit-value)
)

; ***{2} 本指系统

; ***{3} 远程舰空DD系统

(deftemplate messag-10
	(slot recv-flag)
	(slot time-stamp)
)

(deftemplate messag-CC
	(slot recv-flag)
	(slot time-stamp)
	(slot state-flag)
)

(deftemplate current-time
	(slot value)
)

(deftemplate messag-10-cache
	(slot recv-flag)
	(slot time-stamp)
)

(deftemplate messag-CC-cache
	(slot recv-flag)
	(slot time-stamp)
	(slot state-flag)
)