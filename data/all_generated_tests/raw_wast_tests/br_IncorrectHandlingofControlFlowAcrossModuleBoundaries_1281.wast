;; 2. **Test Description:** Design a WASM function that uses `br` to exit a deeply nested `block` and then immediately calls an exported function from another module that also contains control structures.    **Specific Constraint:** This checks if the operand stack is properly managed and unwound before the transition.    **Relation to Control Flow Boundaries:** The aim is to catch errors in stack unwinding and label scope when control flow moves to a different module.

(assert_invalid
  (module 
    (import "mod" "func" (func $external (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 2)
          )
        )
      )
      (call $external)
    )
  )
  "type mismatch"
)