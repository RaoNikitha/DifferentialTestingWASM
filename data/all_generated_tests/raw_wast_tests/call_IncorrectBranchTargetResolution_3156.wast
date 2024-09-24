;; Test 5: Implement a set of nested `if` statements within a module with internal calls to a function containing `br` instructions. Ensure branching behaves incorrectly by offering inputs that result in both nested branching paths.

(assert_invalid
  (module
    (func $branching-func
      (block (br 1))
      (i32.const 0)
    )
    (func $caller-func
      (if (i32.const 1)
        (then
          (if (i32.const 0)
            (then (call $branching-func))
          )
        )
      )
    )
  )
  "type mismatch"
)