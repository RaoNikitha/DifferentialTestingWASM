;; 9. **Test 9: Convoluted Control Flow**    - Construct a complex control flow graph with conditional branches leading to potential invalid `call` instructions.    - **Specific Constraint**: Tests if the control flow correctly guards against invalid paths leading to function calls that might reach 'unreachable' if not handled.    - **Test Relation**: Ensures all control paths are valid, preventing unintended 'unreachable' instruction hit.

(assert_invalid
  (module
    (func $complex (param i32 i32 i32)
      (block $label1
        (block $label2
          (br_if $label2 (i32.eqz (local.get 0)))
          (br_if $label1 (i32.eqz (local.get 1)))
          (call 1 (local.get 2))
        )
        (unreachable)
      )
    )
    (func (param i32))
  )
  "type mismatch"
)