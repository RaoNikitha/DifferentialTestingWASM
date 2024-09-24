;; 8. **Test: Recursive Function with Conditional Loop Exit**    - **Description:** Create a recursive function where the exit condition of the recursion is governed by a `br_if` in a loop. Ensure stack frames are correctly managed across recursive calls.    - **Constraint Check:** Validates that recursive function calls with `br_if` do not lead to stack mismanagement or improper function returns.

(assert_invalid
  (module
    (func $recursive-loop (param $x i32) (result i32)
      (i32.add
        (loop $loop
          (block
            (br_if $loop (i32.eqz (local.get $x)))
            (br 1 (call $recursive-loop (i32.add (local.get $x) (i32.const -1))))
          )
        )
        (i32.const 1)
      )
    )
    (start $recursive-loop)
  )
  "type mismatch"
)