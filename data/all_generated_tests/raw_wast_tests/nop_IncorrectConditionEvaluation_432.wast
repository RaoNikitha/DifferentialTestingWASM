;; Test 3: Include `nop` instructions in a loop body with a `br_if` statement inside the loop. Verify if the loop correctly continues based on the condition.

 ;; (module
  (func (loop 
    (nop)
    (br_if 1 (i32.const 0))
    (i32.const 1)
    (br 0)
  ))
)