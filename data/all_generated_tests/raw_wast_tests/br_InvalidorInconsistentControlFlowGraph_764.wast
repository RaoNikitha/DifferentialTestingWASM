;; 5. **Type Mismatched Operand Test**: Set up a `block` with a specific output type and include a `br` instruction targeting this `block` with an operand type that does not match the block’s expected output type. This checks for the proper type enforcement of operands during forward branching.

(assert_invalid
  (module (func $type-mismatch-br-target
    (block (result i32)
      (i32.const 0)
      (br 0 (i64.const 42))
    )
  ))
  "type mismatch"
)