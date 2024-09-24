;; 7. **Mix of Constant and Dynamic Indices in `br_table`**:    - Implement a test where `br_table` within an `if` block uses a mix of constant and dynamically calculated indices. Verification should ensure that state initialization and resets consistently handle the combination, avoiding undefined behavior.

(assert_invalid
  (module 
    (func $mixed-br-table 
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then 
            (br_table 0 (i32.const 0)) 
            (i32.const 1)
          )
          (else 
            (br_table 1 (i32.const 0)) 
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)