;; 10. Test a `switch` case structure where one of the cases is a `nop` followed by an `unreachable`. Ensure that the control flow navigates correctly based on the switch condition and only traps upon correct execution path hitting the `unreachable`.

(assert_invalid
  (module
    (func $switch (param i32) (result i32)
      (block $case1
        (block $case2
          (br_table $case1 $case2 (local.get 0))
        )
        (nop) 
        (unreachable)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)