;; - Test 1: Create a loop with a `br_if` condition that always evaluates to false because of erroneous context in `Wizard Engine`, triggering an infinite loop.

(assert_invalid
  (module (func $infinite-loop
    (loop (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 1))  ; Branch condition that always evaluates to true
    )
  ))
  "type mismatch"
)