;; Test Description 9: Have a function with a large number of local variables and test nested calls manipulating these locals. Check for consistent stack depths before and after the call instructions. Discrepancies might point to stack corruption in handling local variables.

(assert_invalid
  (module
    (func $large-locals (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
          (call 1 (local.get 0) (local.get 1) (local.get 2) (local.get 3) (local.get 4) (local.get 5) (local.get 6) (local.get 7) (local.get 8) (local.get 9))
          (call 2 (local.get 10) (local.get 11) (local.get 12) (local.get 13) (local.get 14) (local.get 15) (local.get 16) (local.get 17) (local.get 18) (local.get 19))
          (call 3 (local.get 20) (local.get 21) (local.get 22) (local.get 23) (local.get 24) (local.get 25) (local.get 26) (local.get 27) (local.get 28) (local.get 29))
          (call 4 (local.get 30) (local.get 31) (local.get 32) (local.get 33) (local.get 34) (local.get 35) (local.get 36) (local.get 37) (local.get 38) (local.get 39))
    )
    (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32))
    (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32))
    (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32))
    (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32))
  )
  "type mismatch"
)