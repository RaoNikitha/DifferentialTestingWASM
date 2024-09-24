;; 8. Test the interaction of `br_if` conditions with operands of varying types (integers and floats), within a `block`, verifying that the stack behavior matches expectations when the condition leads to branching.

(assert_invalid
  (module (func $type-br_if-mismatch (result i32)
    (block (result i32)
      (i32.const 7)
      (f32.const 3.14)
      (br_if 0 (i32.const 1))
      (i32.const 42)
    )
  ))
  "type mismatch"
)