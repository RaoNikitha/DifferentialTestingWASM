;; 5. **Stack Alignment Post-Return**:    - Import a function that performs significant stack operations before returning, and ensure the calling module's stack aligns correctly post-return with no residual stack elements.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $stack-alignment-post-return (result i32)
      (i32.const 10)
      (i32.const 20)
      (call $externalFunc)
      (return)
    )
  )
  "type mismatch"
)