;; 10. **Test for Contextually Incorrect Label Propagation**: Create a module where an `if` instruction uses labels mismatched with the context stack, e.g., the labels used do not correctly match the input/output types expected in the label stack. This explores how each engine maintains label contexts and types across `if` blocks.

(assert_invalid
  (module
    (func $incorrect-label-propagation (result i32)
      (block (result i64)
        (i32.const 1)
        (if (result i32) (i32.const 0)
          (then (i64.const 42))
          (else)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)