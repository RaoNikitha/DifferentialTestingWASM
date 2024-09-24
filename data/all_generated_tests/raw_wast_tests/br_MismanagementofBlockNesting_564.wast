;; 5. Construct a series of nested `block` and `loop` instructions with various operand types on the stack, followed by a `br` table instruction that should target one of the nested blocks with specific operands. This test checks if operand types are correctly managed when branches occur in nested contexts.

(assert_invalid
  (module
    (func $nested-blocks-loops (result i32)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (loop (result i32)
            (i32.const 3)
            (br_table 0 1 2)
          )
        )
      )
    )
  )
  "type mismatch"
)