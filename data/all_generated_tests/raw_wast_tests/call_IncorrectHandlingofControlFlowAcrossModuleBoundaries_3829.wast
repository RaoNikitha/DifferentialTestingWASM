;; 8. **Function Export and Import with Global State**:    - **Description**: Use functions that modify a global state imported from one module to another and check if the state changes are correctly reflected across the boundary.    - **Constraint**: Global state changes need to be reflected across modules.    - **Relation**: Ensures that global state is consistently modified and accessed across module boundaries.

(assert_invalid
  (module
    (import "env" "globalState" (global $globalState (mut i32)))
    (func $modify (param i32)
      global.get $globalState
      local.get 0
      i32.add
      global.set $globalState
    )
    (func $read (result i32)
      global.get $globalState
    )
    (func (call $modify (i32.const 10)) (call $read))
    (global $globalState (mut i32) (i32.const 0))
  )
  "type mismatch"
)