;; 8. **Test Description:** Arrange `unreachable` inside nested blocks with alternating `br` and `br_if` statements that jump to different block labels, checking correct branch destinations in complex contexts.    *Constraint Checked:* Correct behavior in alternating unconditional and conditional branches.    *Relation to Incorrect Branch Target Resolution:* Ensures that branches target the correct labels and not erroneously due to earlier context.

(assert_invalid
  (module (func $complex-nested-unreachable
    (block $label1
      (block $label2
        (block
          (br $label1)
          (unreachable)
        )
        (br_if 0 (i32.const 1))
      )
      (br $label2)
    )
  ))
  "type mismatch"
)