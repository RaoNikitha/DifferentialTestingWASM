;; 4. Test Description: Use `unreachable` in the middle of a series of `get_local` and `set_local` instructions. Verify that local variables are not corrupted or yielding unexpected values after the trap.

(assert_invalid
  (module
    (func $test-unreachable-set-get-local 
      (local i32) 
      (set_local 0 (i32.const 42))
      (unreachable)
      (get_local 0)
    )
  )
  "type mismatch"
)