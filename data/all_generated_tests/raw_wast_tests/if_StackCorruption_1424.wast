;; 5. **Test Name: Nested If Chains**    - **Description**: Design nested `if` blocks where outer conditions control the flow to inner conditions, focusing on the net stack change after multiple nested evaluations to ensure consistent state management.      ```wasm      (i32.const 1) (if (result i32)         (i32.const 2) (if (result i32) (i32.const 3) (else (nop)) end)       (else (nop)) end)      ```    - **Reasoning**: Examines how nested `if` conditions handle stack states transitioning between multiple layers of nesting.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 2)
        (if (result i32)
          (i32.const 3)
          (else (nop))
        end)
        (else (nop))
      end)
    )
  )
  "type mismatch"
)