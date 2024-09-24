;; 1. **Test Description 1**:    - Check a simple `loop` containing a `br_if` that should only branch back to the start of the loop when a counter is non-zero. This tests if the `br_if` condition is correctly evaluated to prevent infinite looping.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (local.set 0 (i32.const 10))
      (loop (result i32)
        (local.get 0)
        (i32.eqz)
        (br_if 1)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)