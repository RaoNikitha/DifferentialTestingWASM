;; Test Description 5: Implement a function that has no return value but alters local stack variables extensively. This test checks if returning from such a function affects the overall stack state. Differences might indicate stack mismanagement or corruption upon return.

(assert_invalid
  (module
    (func $extensive-local-stack-usage (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      (local.set 0 (i32.const 1))
      (local.set 1 (i32.const 2))
      (local.set 2 (i32.const 3))
      (local.set 3 (i32.const 4))
      (local.set 4 (i32.const 5))
      (local.set 5 (i32.const 6))
      (local.set 6 (i32.const 7))
      (local.set 7 (i32.const 8))
      (local.set 8 (i32.const 9))
      (loop
        (call 1 (local.get 0))
      )
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)