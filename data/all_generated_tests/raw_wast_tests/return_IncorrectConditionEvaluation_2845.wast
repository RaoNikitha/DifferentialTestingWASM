;; 4. Test a function containing a `br_if` instruction with a complex condition, followed by a `return`. Confirm that the `br_if` respects the actual condition, and the `return` correctly exits the function if the branch is not taken.

(assert_invalid
  (module
    (func $type-br_if-complex-condition-then-return (param i32) (result i32)
      (i32.const 1)
      (i32.const 2)
      (br_if 0 (i32.eq (get_local 0) (i32.const 0)))
      (return (i32.const 3)) 
    )
  )
  "type mismatch"
)