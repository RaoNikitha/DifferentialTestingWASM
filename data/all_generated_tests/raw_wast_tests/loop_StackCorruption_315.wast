;; - Test 6: Design a complex sequence that utilizes `loop`, `block`, and `if` within other loops, involving nested conditional branching and indirect branching (`br_table`). Detect improper stack handling when control returns from deeply nested branches.

(assert_invalid
  (module
    (func $complex-nested (block (loop (block (if (i32.const 1) (then (br_table 0 1 2)))) (block (if (i32.const 0) (then (br 3)) (else (br 2))) (loop (i32.const 0))) (br 1))))
  )
  "type mismatch"
)