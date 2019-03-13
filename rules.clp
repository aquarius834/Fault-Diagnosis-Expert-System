; ***************************
; * 1. BIT 规则
; ***************************

; * 2. ZZ系统
; ***{1} LD系统
; ******[1] S+C波段LD
; *********(1) DBF机柜

(defrule diagnose-1
	(logical
		(object-1 (bit-value 1 | 2))
	)
=>
	(assert
		(fault
			(id 10001)
			(name "DBF Ji Gui Fault")
			(component "11111")
			(cause "11111")
			(consequence "11111")
		)
	)
)

; * 2. ZZ系统
; ***{1} LD系统
; ******[1] S+C波段LD
; *********(2) LD控制机柜

(defrule diagnose-2
	(logical
		(object-2 (bit-value 1 | 2))
	)
=>
	(assert
		(fault
			(id 10002)
			(name "LD Kong Zhi Ji Gui Fault")
			(component "22222")
			(cause "22222")
			(consequence "22222")
		)
	)
)

; ***************************
; * 2. 复杂系统规则
; ***************************

; * 2. ZZ系统
; ***{3} 远程舰空DD系统

(defrule set-message-10-cache 
	(messag-10
		(recv-flag yes)
		(time-stamp ?time)
	)
	?message <- (messag-10-cache (recv-flag no))
=>
	(modify ?message
		(recv-flag yes)
		(time-stamp ?time)
	)
	(printout t "Fire Rule set-message-10-cache" crlf)
)

(defrule clear-message-10-cache
	(messag-10 (recv-flag no))
	?message <- (messag-10-cache (recv-flag yes) (time-stamp ?time-1))
	(current-time (value ?time-2))
	(test (>= (- ?time-2 ?time-1) 15))
=>
	(modify ?message
		(recv-flag no)
		(time-stamp 0)
	)
	(printout t "Fire Rule clear-message-10-cache" crlf)
)

(defrule set-message-CC-cache 
	(messag-CC
		(recv-flag yes)
		(time-stamp ?time)
		(state-flag ?flag)
	)
	?message <- (messag-CC-cache (recv-flag no))
=>
	(modify ?message
		(recv-flag yes)
		(time-stamp ?time)
		(state-flag ?flag)
	)
	(printout t "Fire Rule set-message-CC-cache" crlf)
)

(defrule clear-message-CC-cache
	(messag-CC (recv-flag no))
	?message <- (messag-CC-cache (recv-flag yes) (time-stamp ?time-1))
	(current-time (value ?time-2))
	(test (>= (- ?time-2 ?time-1) 15))
=>
	(modify ?message
		(recv-flag no)
		(time-stamp 0)
		(state-flag 0)
	)
	(printout t "Fire Rule clear-message-CC-cache" crlf)
)

(defrule diagnose-3
	(not (fault (id 10003)))
	(messag-10-cache
		(recv-flag yes)
		(time-stamp ?time-1)
	)
	(messag-CC-cache (recv-flag no))
	(current-time (value ?time-2))
	(test (> (- ?time-2 ?time-1) 10))
=>
	(assert
		(fault
			(id 10003)
			(name "Yuan-Cheng-Jian-Kong-DD Fault 1")
			(component "33333")
			(cause "33333")
			(consequence "33333")
		)
	)
	(printout t "Fire Rule diagnose-3" crlf)
)

(defrule recover-3
	(messag-10-cache
		(recv-flag yes)
		(time-stamp ?time-1)
	)
	(messag-CC-cache
		(recv-flag yes)
		(time-stamp ?time-2)
		(state-flag 1)
	)
	(test
		(and
			(<= (- ?time-2 ?time-1) 10)
			(> ?time-2 ?time-1)
		)
	)
	?fault <- (fault (id 10003))
=>
	(retract ?fault)
	(printout t "Fire Rule recover-3" crlf)
)

(defrule diagnose-4
	(not (fault (id 10004)))
	(messag-10-cache
		(recv-flag yes)
		(time-stamp ?time-1)
	)
	(messag-CC-cache
		(recv-flag yes)
		(time-stamp ?time-2)
		(state-flag ~1)
	)
	(test
		(and
			(<= (- ?time-2 ?time-1) 10)
			(> ?time-2 ?time-1)
		)
	)
=>
	(assert
		(fault
			(id 10004)
			(name "Yuan-Cheng-Jian-Kong-DD Fault 2")
			(component "44444")
			(cause "44444")
			(consequence "44444")
		)
	)
	(printout t "Fire Rule diagnose-4" crlf)
)

(defrule recover-4
	(messag-10-cache
		(recv-flag yes)
		(time-stamp ?time-1)
	)
	(messag-CC-cache
		(recv-flag yes)
		(time-stamp ?time-2)
		(state-flag 1)
	)
	(test
		(and
			(<= (- ?time-2 ?time-1) 10)
			(> ?time-2 ?time-1)
		)
	)
	?fault <- (fault (id 10004))
=>
	(retract ?fault)
	(printout t "Fire Rule recover-4" crlf)
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

; ***************************
; * 4. 调试规则
; ***************************

(defrule update-time
	?fact-1 <- (update-time)
	?fact-2 <- (current-time(value ?time))
=>
	(retract ?fact-1)
	(bind ?current-time (+ ?time 1))
	(modify ?fact-2 (value ?current-time))
	(printout t "Current Time : " ?current-time crlf)
)

(defrule receive-message-10
	?fact-1 <- (receive-message-10)
	(current-time(value ?time))
	?fact-2 <- (messag-10 (recv-flag no))
=>
	(modify ?fact-2
		(recv-flag yes)
		(time-stamp ?time)
	)
	(retract ?fact-1)
	(printout t "Receive Message-10" crlf)
)

(defrule clear-message-10
	?fact-1 <- (clear-message-10)
	(current-time(value ?time))
	?fact-2 <- (messag-10 (recv-flag yes))
=>
	(modify ?fact-2 
		(recv-flag no)
		(time-stamp ?time)
	)
	(retract ?fact-1)
	(printout t "Clear Message-10" crlf)
)

(defrule receive-message-CC-normal
	?fact-1 <- (receive-message-CC-normal)
	(current-time(value ?time))
	?fact-2 <- (messag-CC (recv-flag no))
=>
	(modify ?fact-2
		(recv-flag yes)
		(time-stamp ?time)
		(state-flag 1)
	)
	(retract ?fact-1)
	(printout t "Receive Message-CC-Normal" crlf)
)

(defrule receive-message-CC-unknown
	?fact-1 <- (receive-message-CC-unknown)
	(current-time(value ?time))
	?fact-2 <- (messag-CC (recv-flag no))
=>
	(modify ?fact-2
		(recv-flag yes)
		(time-stamp ?time)
		(state-flag 2)
	)
	(retract ?fact-1)
	(printout t "Receive Message-CC-Unknown" crlf)
)

(defrule clear-message-CC
	?fact-1 <- (clear-message-CC)
	(current-time(value ?time))
	?fact-2 <- (messag-CC (recv-flag yes))
=>
	(modify ?fact-2
		(recv-flag no)
		(time-stamp ?time)
		(state-flag 0)
	)
	(retract ?fact-1)
	(printout t "Clear Message-CC" crlf)
)