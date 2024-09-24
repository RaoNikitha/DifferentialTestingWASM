;; 9. **Complex Control Flow with Multiple `br_table`**:    - Craft a test containing multiple `br_table` instructions within nested `if-else` blocks to evaluate how each implementation maintains state across multiple conditional branches. The goal is to find if the resetting mechanism in the wizard engine resets states inappropriately.

(assert_invalid
  (module
    (func $complex-br_table-in-if-else
      (block $outer
        (block $inner
          (i32.const 1)
          (if (result i32) 
            (i32.const 1)
            (then 
              (br_table 0 1 (i32.const 0))
              (i32.const 42)
            )
            (else 
              (br_table 1 0 (i32.const 1))
              (i32.const 37)
            )
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)