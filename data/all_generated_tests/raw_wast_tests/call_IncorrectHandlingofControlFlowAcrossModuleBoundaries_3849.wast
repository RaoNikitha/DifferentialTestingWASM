;; 8. Define a function in one module that conditionally calls different imported functions based on certain inputs. Test if the correct function indices are referenced and that the conditional logic correctly manages transitions between the calling and called modules without causing stack or control flow corruption.

(assert_invalid
  (module
    (import "env" "f1" (func $f1 (param i32)))
    (import "env" "f2" (func $f2 (param i64)))
    (type (func (param i32)))
    (func (param i32)
      (if (local.get 0)
        (then (call $f1 (local.get 0)))
        (else (call $f2 (i64.extend_i32_s (local.get 0))))
      )
    )
  )
  "type mismatch"
)