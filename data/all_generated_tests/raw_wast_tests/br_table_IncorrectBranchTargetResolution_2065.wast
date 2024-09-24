;; 5. **Test Description:** Construct a `br_table` with a mix of valid and invalid label references and confirm that the valid ones are correctly targeted and the invalid ones revert to the default label.    - **Constraint Checked:** Ensures invalid labels cause the default label to be used without deviation.    - **Relation to Incorrect Branch Target Resolution:** Invalid label references must not result in jumping to unintended code locations.

(assert_invalid
  (module (func
    (block $default
      (block $label0)
      (block $label1)
      (block $label2)
      (br_table $label0 $label1 0x10000001 $default (i32.const 2))
    )
  ))
  "unknown label"
)