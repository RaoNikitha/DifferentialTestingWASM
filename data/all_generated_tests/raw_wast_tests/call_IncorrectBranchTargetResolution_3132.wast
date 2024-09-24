;; 1. **Test Description**:    - Create a function `F1` that takes multiple parameters and has a complex function type signature.    - Within `F1`, invoke another function `F2` using the `call` instruction, ensuring `F2` has different input parameters and return types.    - Use multiple nested blocks with branch instructions before and after the `call` to test if branch targets resolve correctly around the `call`.    - **Constraint Checked**: Correct preservation of stack state and function type verification during nested branching.    - **Incorrect Branch Target Resolution**: Ensure that incorrect resolution causes the control flow to jump to an unintended target block, resulting in a mismatched parameter type or missing `call` execution.

(assert_invalid
  (module
    (func $F2 (param i64) (result i32) (i32.const 0))
    (type $sig1 (func (param i32 i32 i32) (result i64)))
    (type $sig2 (func (param i64) (result i32)))
    (func $F1 (param i32 i32 i32) (result i64)
      (block $B1
        (block $B2
          (br_if $B1 (i32.const 0))
          (call $F2 (i32.const 0))
        )
        (br $B2)
      )
    )
  )
  "type mismatch"
)