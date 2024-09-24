;; 8. Design a `br_table` inside a nested `if` within a loop, where the operand leads to branching to a label that interrupts the loop and continues outside the `if` block. This checks for correct control flow management in nested conditional and looping structures.

(assert_invalid
  (module (func $nested_if_loop
    (loop
      (if (i32.const 1)
        (then
          (block $l1
            (block $l2
              (br_table $l1 $l2 (i32.const 2))
            )
          )
        )
      )
    )
  ))
  "unknown label"
)