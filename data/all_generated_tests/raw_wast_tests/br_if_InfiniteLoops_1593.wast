;; 4. Test a `br_if` inside a loop with an operand stack getting reset in every iteration. If `wizard_engine` mismanages stack reference, it could cause an infinite loop by ignoring the branch condition.

(assert_invalid
  (module
    (func $loop-br_if (result i32)
      (loop (result i32) 
        (block (result i32)
          (br_if 1 (i32.const 1) (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)