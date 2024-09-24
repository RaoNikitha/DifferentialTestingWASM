;; 10. Execute a call within a `try-catch` block where the function’s return type is inconsistent with the caught exception value type expected by the `catch` block.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      (local.get 0)
    )
    (func $type-mismatch-in-try-catch
      (try
        (do
          (call $f (i32.const 0))
        )
        (catch (param f32))
      )
    )
  )
  "type mismatch"
)