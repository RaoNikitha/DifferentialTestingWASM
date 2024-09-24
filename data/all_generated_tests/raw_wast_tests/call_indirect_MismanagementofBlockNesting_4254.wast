;; 3. **Test Description**: A `call_indirect` instruction placed inside a block which is itself nested within several other blocks and loops. This verifies correct operand removal and placement on the stack in deeply nested contexts without losing track of the function's parent structure.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $nested-blocks-loops
      (block
        (loop
          (block
            (loop
              (call_indirect (type 0) (i32.const 0))
              (i32.const 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)