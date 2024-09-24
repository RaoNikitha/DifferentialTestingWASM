;; 2. **Deeply Nested Loops with Arity Mismatch:**    - Create a deeply nested `loop` structure where the `br_table` targets labels with varying lengths of operand types, checking for stack overflow or underflow due to improper operand consumption.

(assert_invalid
  (module
    (func $deeply-nested-loops-with-arity-mismatch (param i32) (result i32)
      (local $0 i32)
      (loop (result i32) 
        (loop (result i32 i32)
          (loop (result i32 i32 i32)
            (block (result i32)
              (br_table 0 1 2 (local.get $0))
            )
            (i32.const 10)
          )
          (i32.add)
        )
        (i32.add)
      )
    )
  )
  "type mismatch"
)