;; 6. Formulate a function with a mix of `call`, `return`, and `br` instructions that causes conditional early exits, and verify if WebAssembly’s context validation differs from the Wizard Engine’s method by potentially hiding bugs related to unreachable post-return blocks.

(assert_invalid
  (module
    (func $type-value-void-vs-num-in-conditional-exit (result i32)
      (block $outer (result i32)
        (if (i32.const 1)
          (then (return (i32.const 42)))
          (else (return (i32.const 7)))
        )
        (return (i32.const 0)) ;; Unreachable if branch correctly returns
      )
    )
  )
  "type mismatch"
)