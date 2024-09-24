;; 7. **Test Conflicting Blocktypes**: Define a block with conflicting blocktypes and ensure nested instructions keep branching incorrectly, inducing indefinite looping in improper state reset scenarios.

(assert_invalid
  (module (func $conflicting-blocktypes
    (block (result f32) 
      (block (result i32) 
        (br 1 (f32.const 1.0))
        (i32.const 0)
      ) 
      (f32.const 0.0)
    )
  ))
  "type mismatch"
)