;; - **Test 9: Unreachable Inside Switch-Like Conditional Pattern**   ```   Mimic a switch-case-like pattern using multiple `if`-conditions with `br_if` and end with an `unreachable`. Correct behavior depends on evaluating each condition accurately and performing appropriate branching, thus spotlighting any implementation faults in condition evaluation.   ``` -

(assert_invalid
  (module
    (func $unreachable-inside-switch-like (param i32) (result i32)
      (block $exit
        (block $case3
          (block $case2
            (block $case1
              (br_table $case1 $case2 $case3 3 (local.get 0))
            )
            (br $exit)
          )
          (unreachable)
        )
      )
      (i32.const 42)
    )
  )
  "type mismatch"
)