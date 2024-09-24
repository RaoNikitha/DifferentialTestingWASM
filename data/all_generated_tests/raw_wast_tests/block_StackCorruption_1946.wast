;; 7. Formulate a test using a deeply nested `block` structure, where each `block` manipulates multiple stack items before employing `br` instructions to affect the control flow. This intense stack manipulation will highlight any potential stack corruption stemming from mismanaged label indices.

(assert_invalid
  (module (func $deeply_nested_blocks
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 42)
            (i32.const 1)
            (i32.add)
            (br 0)
            (i32.const 0)
          )
          (br 0)
          (i32.const 0)
        )
        (br 0)
        (i32.const 0)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)