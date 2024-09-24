;; Test 5: Test a loop with a "br" instruction inside a function called within the loop. Validate if the loop exits correctly when the "br" condition is met, ensuring proper handling of the function's stack frame and avoiding infinite looping.

(assert_invalid
  (module
    (func $test-loop
      (loop (br_if 0 (i32.const 0))
            (call 0)))
    (func $br_called
      (br 0))
  )
  "type mismatch"
)