;; 5. Develop a function containing a combination of `br_if` and `return`, ensuring that `br_if` conditions are correctly managed before calling `return`. If the condition evaluation is flawed, branches may be taken or skipped incorrectly, disrupting the function’s exit path.

(assert_invalid
  (module
    (func $test_br_if_return (result i32)
      (i32.const 0)
      (block (br_if 0 (i32.const 1) (return)))
      (i32.const 2)
    )
  )
  "type mismatch"
)