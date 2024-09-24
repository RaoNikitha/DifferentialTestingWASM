;; 2. Execute a `loop` containing several `br_if` instructions with complex conditions and varying stack heights. Check if the stack correctly discards extra values not consumed by the `loop` instructions and validates proper operand stack management.

(assert_invalid
  (module
    (func $complex_loop_with_br_if
      (i32.const 10)
      (loop (result i32)
        (i32.const 20)
        (i32.add)
        (br_if 0 (i32.const 1))
        (br_if 0 (i32.const 0))
        (drop)
      )
    )
  )
  "type mismatch"
)