;; - **Test 4**:    Create a loop that breaks under a condition based on the value on the operand stack but ensure changes in the stack are not influencing the loop exit condition properly.     Constraint: Operand stack-based `br_if` misinterpretation.     Relation: Infinite loop verification due to operand stack mishandling.

(assert_invalid
  (module
    (func $infinite-loop (param i32) (result i32)
      (local i32)
      loop (result i32)
        local.get 0
        i32.const 1
        i32.sub
        local.tee 1
        i32.const 0
        i32.eq
        br_if 1
        br 0
      end
    )
  )
  "type mismatch"
)