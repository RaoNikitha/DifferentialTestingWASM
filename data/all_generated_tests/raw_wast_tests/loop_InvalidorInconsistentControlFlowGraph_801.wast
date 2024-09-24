;; 2. **Test Context Extension Error**:    - Use a deeply nested `loop` within several `block` and `if` instructions and ensure branch instructions are pointing incorrectly to outer loops without appropriately extended context.    - **Constraint**: Context must be properly extended with labels.    - **CFG Impact**: Mismanaged label indices can create invalid CFG paths, leading to inconsistent executions.

(assert_invalid
  (module
    (func $nested-loop-label-error
      (block $outer
        (loop $inner (block $inner_block 
          (if (i32.const 1) 
            (then (br 2))  ;; Incorrectly targets the $outer block instead of $inner_block due to mismanaged label
          )
        ))
      )
    )
    "label index out of bounds"
  )
)