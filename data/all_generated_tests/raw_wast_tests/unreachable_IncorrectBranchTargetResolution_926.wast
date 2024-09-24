;; 7. **Test Description:** Use `unreachable` before a `br` in nested conditionals where the `br` refers to an outermost loop, testing if the resolution picks up the intended loop label.    *Constraint Checked:* Resolution of outer loop labels within deeply nested conditional code.    *Relation to Incorrect Branch Target Resolution:* Checks for correct label address amidst multiple layers of conditional statements.

(assert_invalid
  (module
    (func $type-br-in-nested-conditionals-after-unreachable
      (loop (result i32)
        (block (block (i32.const 0) (br_if 1 (unreachable))))
      )
    )
  )
  "type mismatch"
)