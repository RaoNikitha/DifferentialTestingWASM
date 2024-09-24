;; 7. Use `unreachable` within a switch-case statement (using multiple `br_table` instructions) and verify that the control flow exits the case containing `unreachable` without influencing other cases.    - **Constraint:** The `unreachable` should correctly trap without affecting other branches of the switch-case.    - **CFG Check:** Validate correct trap handling within complex branching structures like `br_table`.

(assert_invalid
  (module
    (func $test-unreachable-in-br_table
      (block $case1
        (block $case2
          (block $case3
            (i32.const 0)
            (br_table $case1 $case2 $case3)
            (unreachable)
            (br 0) ;; This should not be reached
          )
        )
      )
    )
  )
  "unreachable trap missed"
)