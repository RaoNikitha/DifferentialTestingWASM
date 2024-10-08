;; Test 4: Construct a loop where the condition for `br_if` is generated by a complex calculation involving elements on the operand stack, requiring accurate operand management to avoid infinite looping.

(assert_invalid
  (module
    (func $complex-loop (result i32)
      (local $condition i32)
      (i32.const 0)
      (set_local $condition)
      (loop (result i32)
        (i32.const 1)
        (tee_local $condition)
        (i32.add)
        (br_if 0 (get_local $condition))
      )
    )
  )
  "type mismatch"
)