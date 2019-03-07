; ***************************
; * 1. BIT 规则
; ***************************

; ***(1) DBF机柜

(defrule diagnose-1-1
	(logical
		(object-1 (bit-value 1))
	)
=>
	(assert
		(fault
			(id 100011)
			(name "DBF Ji Gui Fault")
			(component "11111")
			(cause "22222")
			(consequence "33333")
		)
	)
)

(defrule diagnose-1-2
	(logical
		(object-1 (bit-value 2))
	)
=>
	(assert
		(fault
			(id 100012)
			(name "DBF Ji Gui Unknown")
			(component "44444")
			(cause "55555")
			(consequence "66666")
		)
	)
)

; ***(2) LD控制机柜

(defrule diagnose-2-1
	(logical
		(object-2 (bit-value 1))
	)
=>
	(assert
		(fault
			(id 100021)
			(name "LD Kong Zhi Ji Gui Fault")
			(component "11111")
			(cause "22222")
			(consequence "33333")
		)
	)
)

(defrule diagnose-2-2
	(logical
		(object-2 (bit-value 2))
	)
=>
	(assert
		(fault
			(id 100022)
			(name "LD Kong Zhi Ji Gui Unknown")
			(component "44444")
			(cause "55555")
			(consequence "66666")
		)
	)
)

; ***************************
; * 3. 查询故障状态
; ***************************

(defrule check-fault-state
	(check-fault)
	(fault (id ?id) (name ?name) (component ?component) (cause ?cause) (consequence ?consequence))
=>
	(printout t "fault id : " ?id " / fault component : " ?component " / cause : " ?cause " / consequence : " ?consequence crlf)
)