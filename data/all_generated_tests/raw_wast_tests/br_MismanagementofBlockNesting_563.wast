;; 4. Design a test case where a `br` targets a `loop` nested inside an `if` block, itself nested in another `loop`. Use conditions that trigger the branch and assert that the control jumps correctly to the beginning of the intended loop without errors in nested label interpretation.

(assert_invalid
  (module
    (func $br_in_nested_loop (param i32) (result i32)
      (loop $outer
        (if (i32.const 1)
          (then
            (loop $inner
              (if (i32.eqz (local.get 0))
                (then (br 1))
              )
            )
          )
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)