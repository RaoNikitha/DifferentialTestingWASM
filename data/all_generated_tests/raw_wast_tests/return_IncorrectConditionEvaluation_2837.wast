;; 6. Create a function with local variables influencing a `br_if` condition, followed by a `return`. Check if erroneous condition evaluation in the `br_if` alters the correct use of `return`, leading to wrong exits.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (local.set 0 (i32.const 1))
      (br_if 0 (i32.eqz (local.get 0)))
      (return (i32.const 42))
      (i32.const 0)
    )
  )
  "type mismatch"
)