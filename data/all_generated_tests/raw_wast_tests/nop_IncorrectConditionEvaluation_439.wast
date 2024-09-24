;; Test 10: Surround a `br_if` condition with `nop` instructions within a `loop` structure where the condition depends on loop index or counters. Ensure that the loop control flow is as expected.

(assert_invalid
  (module
    (func $loop-with-br_if (param i32) (result i32)
      (loop $loop
        (nop)
        (br_if $loop (get_local 0))
        (nop))
      (i32.const 0)))
  "type mismatch"
)