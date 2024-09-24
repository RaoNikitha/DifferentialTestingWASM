;; Test 4: Place `nop` before and after a `br` instruction inside a loop. Ensure the `nop` instructions do not affect loop dynamics or cause infinite execution.

 ;; (module 
  (func $loop-nop (loop $label (nop) (br $label) (nop) (br 0) (nop)))
)