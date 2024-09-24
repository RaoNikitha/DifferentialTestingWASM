;; 4. A test where a `br_table` instruction inside a block uses a table of labels including multiple target blocks at different nesting levels. This checks for correct resolution of multiple branch targets and the proper unwinding of the operand stack.

(assert_invalid
  (module
    (func $nested-blocks-br-table (param i32) (result i32)
      (block $outer (result i32)
        (block $middle (result i32)
          (block $inner (result i32)
            (br_table $inner $middle $outer (local.get 0))
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)