;; 8. **Global State Alteration in Imported Function Call**:    - **Reasoning**: Test if global state changes within imported functions are correctly handled and visible in the calling module.    - **Description**: Define an imported function that modifies a global variable. Call this function and then check the global state in the calling module to ensure updates are correctly propagated.

(assert_invalid
  (module
    (import "env" "modify_global" (func $modify_global))
    (global $g (mut i32) (i32.const 0))
    (func (call $modify_global))
    (global (export "globalAfter") (mut i32) (i32.const 0))
    (func $check
      (global.set $g (i32.const 10))
      (call $modify_global)
      (global.get $g))
  )
  "global state modification not propagated"
)