;; 5. **Dynamic Type Check in Indirect Call within a Try-Catch**:    - Description: Create a `try-catch` block where the `try` block expects an `i32` but the indirect call returns an `f64`. This mismatch should trigger the trap, activating the catch block.

(assert_invalid
  (module
    (type $sig (func (result f64)))
    (table funcref)
    (func $try_catch
      (try
        (do
          (call_indirect (type $sig) (i32.const 0))
        )
        (catch_all
          (local.get 0) ;; Dummy operation
        )
      )
    )
  )
  "type mismatch"
)