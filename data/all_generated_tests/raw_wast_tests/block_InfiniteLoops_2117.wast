;; 8. **Test 8: Loop with Multiple Operand Pops**    - A `block` with a loop that pops multiple values from the stack, uses these values in `br_if` conditions, and re-pushes them if not exiting.    - Ensures proper operand management through multiple pop operations and branch conditions, preventing infinite loops.

(assert_invalid
  (module (func $loop-with-multiple-operand-pops (result i32)
    (block (result i32)
      (i32.const 1)
      (i32.const 2)
      (loop (result i32)
        (i32.const 3)
        (br_if 1 (i32.const 0))
        (i32.const 4)
        (br 0)
      )
    )
  ))
  "type mismatch"
)