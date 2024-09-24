;; 9. **Test Description 9:** Create a loop with a `br_if` branch exiting if a computed array index is within bounds (`index < array.length`). Incorrect computation or comparison within condition can lead to unexpected flow.    - **Constraint Checked:** Array bounds check within branching condition.    - **Differential Behavior:** Wizard Engine might exit early or fail to exit based on incorrect index comparison.

(assert_invalid
  (module
    (func $test-loop-br_if-array-bounds (result i32)
      (local $index i32) (local $length i32)
      (local.set $length (i32.const 10))
      (block (result i32)
        (loop (result i32)
          (local.set $index (i32.add (local.get $index) (i32.const 1)))
          (br_if 1 (i32.ge_u (local.get $index) (local.get $length)))
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)