;; 1. **Test Description 1**:    - **Test**: Loop containing a `br_if` instruction that relies on a condition comparing two equal integers.    - **Constraint**: Check whether the branch is correctly taken only if the integers are equal.    - **Reason**: The differences in condition evaluation may cause the branch to always be taken, regardless of the condition.

(assert_invalid
  (module
    (func $loop_with_br_if
      (local $x i32)
      (local $y i32)
      (loop $loop_label
        (local.set $x (i32.const 5))
        (local.set $y (i32.const 5))
        (br_if $loop_label (i32.eq (local.get $x) (local.get $y)))
      )
    )
  )
  "invalid type"
)