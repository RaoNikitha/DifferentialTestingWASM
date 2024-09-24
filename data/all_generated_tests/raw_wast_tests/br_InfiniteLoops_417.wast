;; 8. **Test Description 8:**    - A nested loop structure where `br` is used incorrectly to simulate a `continue` but targets an invalid loop label, causing the outer loop to restart endlessly.    - **Constraint: Enforced Structured Control**    - **Relation to Infinite Loop:** Control violation causes improper loop continuation.

(assert_invalid
  (module
    (func $type-nested-loop-invalid-br
      (loop $outer
        (loop $inner
          (br 2)  ;; Invalid label targeting
        )
      )
    )
  )
  "unknown label"
)