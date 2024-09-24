;; - Test 2: Design a function with multiple nested blocks and loops, calling another function with a branch instruction (`br 2`). Ensure the correct block, two levels up, is targeted upon completion.

(assert_invalid
  (module
    (func $nested-call (block (loop (block (br 2) (call 1 (i32.const 0))))))
    (func (param i32))
  )
  "type mismatch"
)