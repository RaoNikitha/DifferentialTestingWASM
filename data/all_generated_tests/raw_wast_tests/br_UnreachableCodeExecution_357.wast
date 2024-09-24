;; 8. **Test Description:**    - **Test Scenario:** Place an `unreachable` instruction inside a complex sequence of conditional blocks with multiple `br` instructions to different labels.    - **Specific Constraint:** Validate the consistency and correctness of branch behavior in conditional constructs.    - **Relation to Unreachable Code Execution:** Ensure that none of the `br` instructions cause execution to erroneously reach the `unreachable` instruction.

(assert_invalid
  (module
    (func $complex-branching 
      (block $outer (result i32)
        (block $middle
          (block $inner
            (br_if 0 (i32.const 1)) 
            (br_if 1 (i32.const 0)) 
            (br 2)
            unreachable
          )
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)