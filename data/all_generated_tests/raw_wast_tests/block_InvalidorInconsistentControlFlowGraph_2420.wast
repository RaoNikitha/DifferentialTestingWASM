;; 1. Test a deeply nested block structure with cyclic control flow, ensuring that the innermost block contains a `br` instruction targeting an outermost block. This tests the handling of deeply nested contexts and ensures adequate context extension and label indexing.

(assert_invalid
  (module (func $deeply-nested-block-cyclic-br-targeting-outermost
    (block (result i32) 
      (block 
        (block 
          (block 
            (br 3 (i32.const 42))
          )
        )
      )
    )
  ))
  "type mismatch"
)