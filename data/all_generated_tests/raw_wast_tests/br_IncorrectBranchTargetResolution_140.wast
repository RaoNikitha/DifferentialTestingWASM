;; 1. Test a nested loop structure where an inner loop's `br` targets an outer loop incorrectly, checking if the `val_stack` heights and expected types are managed appropriately.

(assert_invalid
  (module
    (func $nested-loop-br
      (loop $outer  ;; outer loop
        (loop $inner  ;; inner loop
          (br 1)  ;; incorrect branch to outer loop
        )
      )
    )
  )
  "type mismatch"
)