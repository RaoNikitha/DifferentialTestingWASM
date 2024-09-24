;; 6. **Test Description**: An exported function containing an `if` instruction that modifies module-level memory, and an imported function that checks this memory state.    **Constraint**: Validates that memory state changes propagate correctly across module boundaries within control flow constructs.    **Goal**: Finds issues in memory synchronization and integrity across imports/exports within `if` blocks.

(assert_invalid
  (module
    (memory 1)
    (func (export "main") (param i32) (result i32)
      (if (result i32) (local.get 0) 
        (then 
          (i32.const 42) 
          (i32.store) 
          (i32.const 1)
        ) 
        (else 
          (i32.const 0)
        )
      )
    )
    (func (import "env" "check_memory") (param i32) (result i32))
  )
  "type mismatch"
)