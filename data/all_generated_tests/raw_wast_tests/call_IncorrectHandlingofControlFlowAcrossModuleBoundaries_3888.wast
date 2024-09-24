;; 7. **Test Description**:    - **Scenario**: Import a function that modifies global variables and then call it; subsequently, call another function that reads the globals.    - **Constraint**: Verify the correct handling of global state across module boundaries and function calls.    - **Differential Check**: Confirm both implementations correctly manage global state modifications and access after calls.

(assert_invalid
  (module
    (import "env" "modify_globals" (func $modify_globals (param i32) (result i32)))
    (global $g0 (mut i32) (i32.const 0))
    (global $g1 (mut i32) (i32.const 0))
    (func $read_globals (result i32)
      global.get $g0
      global.get $g1
      i32.add)
    (func (export "test")
      (call $modify_globals (i32.const 10))
      (drop (call $read_globals)))
  )
  "type mismatch"
)