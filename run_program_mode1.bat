; time = 1
(assert (update-time))
(run)

; time = 2
(assert (update-time))
(run)

; time = 3
(assert (update-time))
(run)

; time = 4
(assert (update-time))
(run)

; time = 5
(assert (update-time))
(run)

(assert (receive-message-10))
(run)

; time = 6
(assert (update-time))
(run)

(assert (clear-message-10))
(run)

; time = 7
(assert (update-time))
(run)

; time = 8
(assert (update-time))
(run)

; time = 9
(assert (update-time))
(run)

; time = 10
(assert (update-time))
(run)

(assert (receive-message-CC-normal))
(run)

; time = 11
(assert (update-time))
(run)

(assert (clear-message-CC))
(run)

; time = 12
(assert (update-time))
(run)

; time = 13
(assert (update-time))
(run)

; time = 14
(assert (update-time))
(run)

; time = 15
(assert (update-time))
(run)

; time = 16
(assert (update-time))
(run)

; time = 17
(assert (update-time))
(run)

; time = 18
(assert (update-time))
(run)

; time = 19
(assert (update-time))
(run)

; time = 20
(assert (update-time))
(run)

; time = 21
(assert (update-time))
(run)

; time = 22
(assert (update-time))
(run)

; time = 23
(assert (update-time))
(run)

; time = 24
(assert (update-time))
(run)

; time = 25
(assert (update-time))
(run)

; time = 26
(assert (update-time))
(run)
