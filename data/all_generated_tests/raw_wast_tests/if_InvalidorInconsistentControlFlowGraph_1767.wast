;; 8. **Nested `if` Blocks with Unconditional Traps (`unreachable`)**:    - Include `unreachable` instructions within nested `if` instructions, ensuring the CFG properly identifies and handles unconditional termination points within the nested structure.    - *Constraint*: Properly handle and validate unreachable instructions to avoid invalid CFG entries.    - *Relation to CFG*: Tests CFG’s error handling and propagation of unconditional traps.

(assert_invalid
  (module (func $nested-if-unreachable (result i32)
    (if (result i32)
      (i32.const 0)
      (then 
        (if (result i32)
          (i32.const 1)
          (then (unreachable))
          (else (i32.const 2))
        )
      )
      (else (i32.const 3))
    )
  ))
  "unreachable must return"
)