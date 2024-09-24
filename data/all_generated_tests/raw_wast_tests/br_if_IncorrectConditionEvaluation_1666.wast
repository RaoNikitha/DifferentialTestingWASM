;; 7. Test repetitive `br_if` instructions within consecutive `loop` iterations to ensure the loop body properly continues when the conditions evaluate alternately between true and false. This will check for loop control integrity under varied condition evaluations.

(assert_invalid
  (module
    (func $repetitive-br_if-loop-test
      (loop $outer
        (loop $inner
          (i32.const 1)  ;; Condition for br_if, true (non-zero)
          (br_if 1)      ;; Should break out of $outer loop
          (i32.const 0)  ;; Condition for br_if, false (zero)
          (br_if 0)      ;; Should break out of $inner loop
          (br 0)         ;; This should not be reached
        )
      )
    )
  )
  "unreachable code"
)