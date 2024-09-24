;; 3. **Negative Operand Value**:    Push a negative operand value onto the stack before executing the `br_table` instruction. This tests how the implementation handles invalid negative indices, ensuring it properly defaults to the default label.

(assert_invalid
  (module
    (func
      (block $default (loop (block (br_table 0 $default (i32.const -1)))))
    )
  )
  "unknown label"
)