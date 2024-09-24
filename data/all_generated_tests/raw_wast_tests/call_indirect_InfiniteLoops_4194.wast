;; 3. **Test Description**: Create a function with a loop having multiple nested levels and include a `call_indirect` in the deepest loop. Use `br` and `br_if` to break out of the nested loops based on return values from the `call_indirect`. This tests if misinterpretation of nested conditions and returns from indirect calls can trigger infinite looping behavior.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      (local.get 0)
    )
    (func $nested-loops
      (loop $outer
        (loop $inner
          (call_indirect (type $sig) (i32.const 0) (i32.const 10))
          (br_if $outer (i32.const 0))
          (br $inner)
        )
      )
    )
  )
  "type mismatch"
)