;; 3. Use a block with nested `br_if` instructions based on variable conditions where the conditions should never trigger the branch. Check if execution ends up outside the intended block scope, revealing incorrect condition evaluation.

(assert_invalid
  (module (func $nested-br_if (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 0)
        (br_if 0 (i32.const 1))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)