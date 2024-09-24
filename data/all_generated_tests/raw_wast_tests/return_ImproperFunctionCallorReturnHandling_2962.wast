;; 1. Validate that returning from a function with mismatched stack types causes a type mismatch in WebAssembly but might silently fail or cause an incorrect return in Wizard Engine. This tests proper stack unwinding and type consistency.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-block (result i32)
      (block
        (i32.const 0) 
        (return)
      )
    )
  )
  "type mismatch"
)