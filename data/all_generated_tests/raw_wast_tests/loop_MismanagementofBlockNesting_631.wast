;; 2. **Multi-Level Loop Nesting with `br_table`**:    Design a three-level nested `loop` structure where a `br_table` instruction indirectly branches based on a dynamic operand. This type of test ensures that the `br_table` correctly interprets the depth of nested loops and branches to the appropriate loop level, verifying proper handling of label indexing.

(assert_invalid
  (module
    (func $multi_level_loop
      (loop $outer (result i32)
        i32.const 0
        (loop $middle (result i32)
          (loop $inner (result i32)
            i32.const 1
            i32.const 2
            i32.const 3
            br_table $inner $middle $outer
          )
        )
      )
    )
  )
  "type mismatch"
)