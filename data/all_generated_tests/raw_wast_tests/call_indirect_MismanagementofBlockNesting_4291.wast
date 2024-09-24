;; Create a sequence of nested blocks, each containing a `call_indirect` instruction, and use `br_table` to escape from multiple levels of depth. Verify that both implementations correctly validate function types, operand stack, and table indices, preventing mismanagement of nested block exits.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $nested-blocks
      (block $outer
        (block $inner
          (call_indirect (type 0) (i32.const 0) (i32.const 42))
          (br_table $outer $inner (i32.const 1))
        )
      )
    )
  )
  "unknown function"
)