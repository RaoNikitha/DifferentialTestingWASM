;; - Implement a `br_table` with mixed labels of `block`, `loop`, and `if` to examine if each specific label type is handled correctly according to its unique resumption point.

(assert_invalid
  (module (func $mixed-labels
    (block $label0
      (loop $label1
        (if (i32.const 1) (then
          (br_table $label0 $label1 (i32.const 1))
        ))
      )
    )
  ))
  "unknown label"
)