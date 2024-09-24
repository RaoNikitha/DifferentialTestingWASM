;; 5. **Test 5: Conditional Function Call with Incorrect Signature in Branch**    - **Description**: Create an `if` instruction where one block calls a function whose signature does not match the expected block type output, but another block corrects this mismatch.    - **Constraint Checked**: Function signature matching and stack state alignment post function call within branching scenarios.    - **Relation to Stack Corruption**: Mismatch in function call signatures within branches can lead to incorrect stack assumptions, resulting in corruption.

(assert_invalid
  (module (func $type-function-call-signature-mismatch
    (func $incorrect_sig (result i64) (i32.const 42))
    (func $correct_sig (result i32) (i32.const 42))
    (if (result i32) (i32.const 1)
      (then (call $incorrect_sig))
      (else (call $correct_sig))
    )
  ))
  "type mismatch"
)